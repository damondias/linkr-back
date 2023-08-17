import urlMetadata from "url-metadata";
import { postsRepository } from "../repositories/posts.repository";

export async function createPost(req,res) {
    const { url, userMessage } = req.body;
    const user = res.locals.user;
    const userId = user.id;

    if (!url) return res.status(400).send({ message: "URL inexistente"});

    try {
        const metadata = await urlMetadata(url);

        const urlTitle = metadata?.title;
        const urlDescription = metadata?.description;
        const urlImage = metadata?.image;

        await postsRepository.publishPost( userId, userMessage, url, urlTitle, urlDescription, urlImage);
        res.sendStatus(201);    
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function getPosts(req, res){
    const { limit } = req.params;

    try {
        const {rowCount: existingPosts, rows: [posts] } = await postsRepository.findPosts(limit);
        if ( existingPosts === 0)  return res.sendStatus(404);

        res.status(200).send(posts);
        
    } catch (error) {
        res.status(500).send(error.message)
    }
}