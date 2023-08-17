import { db } from "../database/database.connection.js";

async function publishPost(userId, userMessage, url, urlTitle, urlDescription, urlImage) {
    return db.query(`   
        INSERT INTO
            posts ("userId", "message", "url", "urlTitle", "urlDescription", "urlImage")
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id
    `, [userId, userMessage, url, urlTitle, urlDescription, urlImage]);
}

function findPosts(limit) {
    return db.query(`
        SELECT 
            p.*,
            u.username,
            u.image AS "profilePic"
        FROM 
            posts p
        LEFT JOIN
            users u
                ON u.id = p."userId"
        ORDER BY
            p.id DESC LIMIT $1
    `, [limit]);
}

export const postsRepository ={
    publishPost,
    findPosts,
    
}

