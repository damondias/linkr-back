import { db } from "../database/database.connection.js";

export async function queryLike(userId, postId) {

    return db.query(`INSERT INTO likes ("userId", "postId") VALUES ($1, $2);`, [userId, postId]);
}

export async function queryDislike(userId, postId) {

    return db.query(`DELETE FROM likes WHERE "userId"=$1 AND "postId"=$2;`, [userId, postId])

}

export async function queryGetLikes() {

    return db.query(`
        SELECT postId, COUNT(*)
        FROM likes
        GROUP BY postId 
    `)

}

export async function queryGetLiked(userId, postId) {

    return db.query(`
        SELECT postId, COUNT(*)
        FROM likes
        GROUP BY postId 
    `)

}

export async function queryGetUserLikes(userId, postId) {

    return db.query(`
        SELECT postId, COUNT(*)
        FROM likes
        GROUP BY postId 
    `)

}

