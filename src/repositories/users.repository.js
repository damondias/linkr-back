import { db } from "../database/database.connection.js";

export async function getUserInfo(userId,id){
    return db.query(`
        SELECT users.image, users.username, users.id, case when f."followerId"=$1 then (true) else (false) end "follows"
        from users
        LEFT JOIN followers AS f ON f."followedId" = users.id
        WHERE users.id = $2
        ORDER BY follows desc
    `,[userId,id])
}

export async function getUserPosts(id){
    return db.query(`SELECT posts.*, users.username, users.image FROM users
        JOIN posts ON users.id = posts."userId"
        WHERE posts."userId" = $1
        ORDER BY posts.id DESC`,[id])
}

export async function getUserIdByName(username){
    return db.query(`SELECT users.image, users.username, users.id, f."followedId" from users
        LEFT JOIN followers AS f ON f."followedId" = users.id
        WHERE username ILIKE $1
        ORDER BY f."followerId" ASC LIMIT 10`,[username])
}