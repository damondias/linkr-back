import { db } from "../database/database.connection.js";

export async function queryVerifyLike(userId, postId) {

    return db.query(`SELECT * FROM likes WHERE "userId"=$1 AND "postId"=$2;`, [userId, postId]);
}

export async function queryLike(userId, postId) {

    return db.query(`INSERT INTO likes ("userId", "postId") VALUES ($1, $2);`, [userId, postId]);
}

export async function queryDislike(userId, postId) {

    return db.query(`DELETE FROM likes WHERE "userId"=$1 AND "postId"=$2;`, [userId, postId])

}

export async function queryGetLikes(postId) {

    return db.query(`
        SELECT COUNT("userId")
        FROM likes
        WHERE "postId" = $1
    `, [postId])

}

export async function queryPostLikers(postId) {

    return db.query(`
        SELECT users.username, users.id
        FROM users
        JOIN likes ON likes."userId" = users.id
        WHERE likes."postId" = $1
    `, [postId])

}

export async function queryUserLikes(userId, postId) {

    return db.query(`
        SELECT * 
        FROM likes
        WHERE likes."postId" = $1
        AND likes."userId" = $2 
    ;`, [parseInt(postId), userId])

}