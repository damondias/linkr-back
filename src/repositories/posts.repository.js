import { db } from "../database/database.connection";

async function publishPost(userId, userMessage, url, urlTitle, urlDescription, urlImage) {
    return db.query(`   
        INSERT INTO
            posts ("userId", "userMessage", url, "urlTitle", "urlDescription", "urlImage")
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id
    `, [userId, userMessage, url, urlTitle, urlDescription, urlImage]);
}

function findPosts(limit) {
    return db.query(`
        SELECT 
            p.*,
            u.name,
            u.image AS "profilePic"
        FROM 
            posts p
        LEFT JOIN
            users u
                ON u.id = p."userId"
        ORDER BY
            p.time DESC LIMIT $1
    `, [limit]);
}


export const postsRepository ={
    publishPost,
    findPosts,
}

