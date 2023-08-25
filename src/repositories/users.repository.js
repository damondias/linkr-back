import { db } from "../database/database.connection.js";

export async function getUserPosts(id, limit, offset){
    return db.query(`SELECT posts.*, users.username, users.image FROM users
        JOIN posts ON users.id = posts."userId"
        WHERE posts."userId" = $1
        ORDER BY posts.id DESC
        LIMIT $2
        OFFSET $3
        `,[id,limit,offset])
}

export async function getUserIdByName(username){
    return db.query(`SELECT users.image, users.username, users.id from users
        WHERE username ILIKE $1`,[username])
}