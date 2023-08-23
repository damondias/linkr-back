import { db } from "../database/database.connection.js";

export async function queryGetComments (postId){

    return db.query(`
    SELECT comments.*, users.username AS name, users.image
    FROM comments 
    JOIN users ON comments."userId" = users.id
    WHERE "postId"=$1;
    ORDER BY comments.id DESC
    `, [postId])

}

export async function queryCountComments (postId){

    return db.query(`
        SELECT COUNT ("userId")
        FROM comments
        WHERE "postId" = $1 
    ;`, [postId])
}

export async function queryComment (userId, postId, text){

    return db.query(`INSERT INTO comments ("userId", "postId", "text") VALUES ($1, $2, $3);`, [userId, postId, text])

}