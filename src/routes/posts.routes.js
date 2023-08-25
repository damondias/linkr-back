import { Router } from "express";
import validateAuth from "../middlewares/validateAuth.js";
import { validateSchemma } from "../middlewares/validation.middlewares.js";
import { postSchema } from "../schemma/posts.schemas.js";
import { createPost, deletePost, editPost, getPosts, repostPost } from "../controllers/posts.controllers.js";

const postRouter = Router();

postRouter.use(validateAuth); // rota autenticada

postRouter.post("/posts", validateSchemma(postSchema), createPost);
postRouter.get("/posts/:limit", getPosts);
postRouter.put("/posts/update/:postId", validateSchemma(postSchema), editPost);
postRouter.delete("/post/delete/:postId", deletePost);
postRouter.post("/repost/:postId",repostPost)

export default postRouter;