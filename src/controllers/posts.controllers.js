import fetch from 'node-fetch';
import urlMetadata from "url-metadata"
import { postsRepository } from "../repositories/posts.repository.js";
import { makeHashtag } from './hashtag.controllers.js';

export async function createPost(req,res) {
    const { url, userMessage } = req.body;
    const user = res.locals.user;
    const userId = user.id;

    try {
        const metadata = await urlMetadata(url, { fetch: fetch });

        const urlTitle = metadata?.title;
        const urlDescription = metadata?.description;
        const urlImage = metadata?.image;

        let resp = await postsRepository.publishPost( userId, userMessage, url, urlTitle, urlDescription, urlImage);
        await makeHashtag(userMessage,resp.rows[0].id)
        res.sendStatus(201);    
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function getPosts(req, res){
    const { limit } = req.params;
    const { offset } = req.query;

    try {
        const {rowCount: existingPosts, rows: posts } = await postsRepository.findPosts(limit,offset);
        if ( existingPosts === 0)  return res.sendStatus(404);

        res.status(200).send(posts);
        
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function deletePost(req, res) {
    const { postId } = req.params;

    try {
        await postsRepository.deletePostLike(postId);
        await postsRepository.deletePostHash(postId);
        await postsRepository.deletePost(postId);

        res.status(200).send("Post deleted");
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}

export async function editPost(req, res) {
    const { postId } = req.params;
    const { url, userMessage } = req.body;
    const { id: userId } = res.locals.user;

    try {
        const { rows: data } = await postsRepository.searchUserId(postId);
        if (data[0].userId !== userId) return res.sendStatus(401);

        const result = await postsRepository.editPost(postId, userId, userMessage);
        res.status(200).send(result);

        await postsRepository.deletePostHash(postId);
        await makeHashtag(userMessage,postId)

    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}