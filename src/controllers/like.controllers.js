import { queryDislike, queryGetLiked, queryGetLikes, queryGetUserLikes, queryLike } from "../repositories/like.repository.js";

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

    try {

        const likes = await queryGetLikes();
        const liked = await queryGetLiked();
        const userLikes = await queryGetUserLikes()

        res.send(likes.rows);

    } catch (err) {
        res.status(500).send(err.message)
    }
}