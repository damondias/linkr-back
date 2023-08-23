import { db } from "../database/database.connection.js";

export async function queryGetComments (postId){

    return db.query(`SELECT * FROM comments WHERE "postId"=$1;`, [postId])

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