import { db } from "../database/database.connection.js";

export async function getAllHashtags(){
    return db.query(`SELECT * from hashtags`)
}

export async function getPostsHashTag(hashtag){
    return db.query(`SELECT posts.* FROM posts 
    JOIN hashtagPost ON posts.id = hashtagPost."postId"
    JOIN hashtags ON hashtagPost."postId" = hashtags.id
    WHERE hashtags.tag = $1`,[hashtag])
}