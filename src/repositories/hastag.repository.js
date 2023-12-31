import { db } from "../database/database.connection.js";

export async function getAllHashtags(){
    return db.query(`SELECT * from hashtags`)
}

export async function getPostsHashTag(hashtag, limit, offset){
    return db.query(`
    SELECT posts.* 
    FROM posts 
    JOIN hashtagPost ON posts.id = hashtagPost."postId"
    JOIN hashtags ON hashtagpost."hashtagId" = hashtags.id
    WHERE hashtags.tag = $1
    ORDER BY posts.id DESC
    LIMIT $2
    OFFSET $3
    `,[hashtag, limit, offset])
}

export async function createHashtag(hashtag){
    return db.query(`INSERT INTO hashtags (tag) VALUES ($1) RETURNING id`,[hashtag])
}

export async function linkHashtagPost(hashtagId,postId){
    return db.query(`INSERT INTO hashtagpost ("hashtagId","postId") VALUES ($1,$2)`,[hashtagId,postId])
}