import { db } from "../database/database.connection.js";

async function publishPost(userId, userMessage, url, urlTitle, urlDescription, urlImage) {
    return db.query(`   
        INSERT INTO
            posts ("userId", "message", "url", "urlTitle", "urlDescription", "urlImage")
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id
    `, [userId, userMessage, url, urlTitle, urlDescription, urlImage]);
}

function findPosts(limit,userId,offset) {
    return db.query(`
    SELECT posts.*, null AS "postId", null AS "repUserId", c.reposts, u.username, u.image AS "profilePic", f."followerId" FROM posts
    LEFT JOIN (SELECT "postId", COUNT("postId") AS "reposts" FROM repost
    GROUP BY "postId") AS c ON c."postId" = posts.id
    LEFT JOIN users AS u ON u.id = posts."userId"
	FULL JOIN followers AS f ON posts."userId" = f."followedId"
    UNION
    SELECT posts.id,posts."userId",posts.message,posts.url,posts."urlTitle",posts."urlDescription",posts."urlImage",
    repost."createdAt",repost."postId", repost."userId" AS "repUserId", c.reposts, u.username, u.image AS "profilePic", f."followerId" FROM posts
    JOIN repost ON repost."postId" = posts.id
    JOIN (select "postId", COUNT("postId") AS "reposts" FROM repost
    GROUP BY "postId") AS c ON c."postId" = posts.id
    LEFT JOIN users AS u ON u.id = posts."userId"
	FULL JOIN followers AS f ON repost."userId" = f."followedId"
	WHERE (posts."userId"=$2 AND (repost."userId"=null OR repost."userId"=$2)) OR f."followerId" = $2
    ORDER BY "createdAt" DESC,
    id DESC LIMIT $1 OFFSET $3
    `, [limit,userId,offset]);
}

async function deletePost(postId) {
    return db.query(`
        DELETE
        FROM
            posts
        WHERE
            id = $1
    `, [postId]);
}

async function deletePostLike(postId) {
    return db.query(`
        DELETE
        FROM
            likes
        WHERE
            "postId" = $1
    `, [postId]);
}

async function deletePostHash(postId) {
    return db.query(`
          DELETE
          FROM
              hashtagpost
          WHERE
              "postId" = $1
      `, [postId]);
  }          

async function editPost(postId, userId, userMessage) {
    return db.query(`   
    UPDATE posts
	    SET  message=$1 
	    WHERE posts.id = $2 AND "userId"=$3
    `, [userMessage, postId, userId]);
}

async function searchUserId(postId) {
    return db.query(`   
    SELECT 
	    posts."userId"
    FROM posts
	    WHERE posts.id=$1
    `, [postId]);
}

async function createRepost(postId,userId){
    return db.query(`
    INSERT INTO repost ("postId","userId")
    VALUES ($1,$2)
    `,[postId,userId]);
}

export const postsRepository ={
    publishPost,
    findPosts,
    deletePost,
    deletePostLike,
    deletePostHash,
    editPost,
    searchUserId,
    createRepost    
}

