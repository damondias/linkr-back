import { Router } from "express";
import validateAuth from "../middlewares/validateAuth.js";
import { validateSchemma } from "../middlewares/validation.middlewares.js";
import { postSchema } from "../schemma/posts.schemas.js";
import { createPost, getPosts } from "../controllers/posts.controllers.js";

const postRouter = Router();

postRouter.use(validateAuth) // rota autenticada

postRouter.post("/posts", validateSchemma(postSchema), createPost);
postRouter.get("/posts/:limit", getPosts)

export default postRouter;