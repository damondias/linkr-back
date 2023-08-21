import { queryDislike, queryGetLikes, queryUserLikes, queryLike, queryPostLikers } from "../repositories/like.repository.js";

export async function like(req, res) {

    const { userId, postId } = req.body;

    try {

        await queryLike(userId, postId);

        res.send(200);

    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function dislike(req, res) {

    const { userId, postId } = req.body;

    try {

        await queryDislike(userId, postId);

    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getLikes(req, res) {
    
    const user = res.locals.user
    const userId = user.userId

    const { postId } = req.params

    try {

        const likes = await queryGetLikes(postId);
        const postLikers = await queryPostLikers(postId);
        const userLikes = await queryUserLikes(postId, userId);

        if (likes.rowCount === 0){
            return res.send({
                count: 0,
                text: "Ningúem curtiu ainda!"
            })
        }

        if (likes.rowCount === 1){
            if (userLikes.rowCount === 0){
                return res.send({
                    count: 1,
                    text: `Somente ${postLikers.rows[0].username} curtiu!`
                })
            }else{
                return res.send({
                    count: 1,
                    text: `Somente você curtiu!`
                })
            }
        }

        if (likes.rowCount === 2){
            if (userLikes.rowCount === 0){
                return res.send({
                    count: 2,
                    text: `${postLikers.rows[0].username} e ${postLikers.rows[1].username} curtiram!`
                })
            }else{
                return res.send({
                    count: 2,
                    text: `Você e ${postLikers.rows[0].username} curtiram!`
                })
            }
        }

        if (likes.rowCount > 2){

            const others = likes.rows.length - 2;

            if (userLikes.rowCount === 0){
                return res.send({
                    count: likes.rows.length,
                    text: `${postLikers.rows[0].username}, ${postLikers.rows[1].username} outras ${others} pessoas`
                })
            }else{
                return res.send({
                    count: likes.rows.length,
                    text: `Você, ${postLikers.rows[0].username} e outras ${others} pessoas`
                })
            }
        }

    } catch (err) {
        res.status(500).send(err.message)
    }
}