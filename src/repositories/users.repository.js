import { db } from "../database/database.connection.js";

export async function getUserPosts(id){
    return db.query(`SELECT posts.*, users.username, users.image FROM users
        JOIN posts ON users.id = posts."userId"
        WHERE posts."userId" = $1
        ORDER BY posts.id DESC`,[id])
}

export async function getUserIdByName(username){
    return db.query(`SELECT users.image, users.username, users.id from users
        WHERE username ILIKE $1`,[username])
}