import { queryComment, queryCountComments, queryGetComments } from "../repositories/comment.repository"

export async function getComments (req, res){

    const { postId } = req.params;

    try{

        const comments = await queryGetComments(postId);
        const count = await queryCountComments(postId);

        res.send({count: count, comments: comments})

    }catch (err){
        res.status(500).send(err.message)
    }
}

export async function comment (req, res){

    const user = res.locals.user
    const userId = user.id

    const { postId, text } = req.body;

    try{

        await queryComment(userId, postId, text);

    }catch (err){
        res.status(500).send(err.message)
    }
}