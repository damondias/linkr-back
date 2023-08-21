import { queryDislike, queryGetLikes, queryUserLikes, queryLike, queryPostLikers, queryVerifyLike } from "../repositories/like.repository.js";

export async function like(req, res) {

    const { userId, postId } = req.body;

    try {

        const verifyLike = await queryVerifyLike(userId, postId);

        if (verifyLike.rowCount === 0){
            await queryLike(userId, postId);
            res.sendStatus(200);
        }else{
            await queryDislike(userId, postId);
            res.sendStatus(200);
        }  

    } catch (err) {
        res.status(500).send(err.message);
    }
}

export async function getLikes(req, res) {
    
    const user = res.locals.user
    const userId = user.id

    const { postId } = req.params

    try {

        const likes = await queryGetLikes(postId);
        const postLikers = await queryPostLikers(postId);
        const userLikes = await queryUserLikes(userId);

        const id = [];

        for (let i = 0; i < userLikes.length; i++){
            id.push(userLikes[i].userId)
        }

        console.log(id)

        if (likes.rows[0].count === '0'){
            return res.send({
                count: 0,
                text: "Ningúem curtiu ainda!",
                user: userId
            })
        }

        if (likes.rows[0].count === '1'){
            if (id.includes(userId)){
                return res.send({
                    count: 1,
                    text: `Somente ${postLikers.rows[0].username} curtiu!`,
                    userLiked: null,
                    likes: postLikers.rows
                })
            }else{
                return res.send({
                    count: 1,
                    text: `Somente você curtiu!`,
                    userLiked: userLikes.rows,
                    likes: postLikers.rows
                })
            }
        }

        if (likes.rows[0].count === '2'){
            if (id.includes(userId)){
                return res.send({
                    count: 2,
                    text: `${postLikers.rows[0].username} e ${postLikers.rows[1].username} curtiram!`,
                    userLiked: null,
                    likes: postLikers.rows
                })
            }else{
                return res.send({
                    count: 2,
                    text: `Você e ${postLikers.rows[0].username} curtiram!`,
                    userLiked: userLikes.rows,
                    likes: postLikers.rows
                })
            }
        }

        if (likes.rows[0].count > '2'){

            const others = Number(likes.rows[0].count) - 2;

            if (id.includes(userId)){
                return res.send({
                    count: Number(likes.rows[0].count),
                    text: `${postLikers.rows[0].username}, ${postLikers.rows[1].username} outras ${others} pessoas`,
                    userLiked: null,
                    likes: postLikers.rows
                })
            }else{
                return res.send({
                    count: Number(likes.rows[0].count),
                    text: `Você, ${postLikers.rows[0].username} e outras ${others} pessoas`,
                    userLiked: userLikes.rows,
                    likes: postLikers.rows
                })
            }
        }

        res.send('erro')

    } catch (err) {
        res.status(500).send(err.message)
    }
}