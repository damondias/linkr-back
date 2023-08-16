import { db } from "../database/database.connection.js";

export async function getHashTag(hashtag){
    return db.query(`SELECT posts.* FROM posts 
    JOIN hashtagPost ON posts.id = hashtagPost.postid
    JOIN hashtags ON hashtagPost.postid = hashtags.id
    WHERE hashtags.tag = $1`,[hashtag])
}