import { queryComment, queryCountComments, queryGetComments, queryIsFollowing } from "../repositories/comment.repository.js"

export async function getComments (req, res){

    const user = res.locals.user
    const userId = user.id

    const { postId } = req.params;

    try{

        const comments = await queryGetComments(postId);
        const count = await queryCountComments(postId);
        const following = await queryIsFollowing (userId)

        res.send({countComment: count, comments: comments.rows, following: following})

    }catch (err){
        res.status(500).send(err.message)
    }
}

export async function comment (req, res){

    const user = res.locals.user
    const userId = user.id

    const { postId } = req.params

    const { text } = req.body;

    try{

        await queryComment(userId, postId, text);

        res.sendStatus(201)

    }catch (err){
        res.status(500).send(err.message)
    }
}