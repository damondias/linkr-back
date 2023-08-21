import { Router } from "express";
import { getLikes, like } from "../controllers/like.controllers.js";
import validateAuth from "../middlewares/validateAuth.js";

const likeRouter = Router();

likeRouter.use(validateAuth) // rota autenticada

likeRouter.post("/like", like);
likeRouter.get("/likes/:postId", getLikes);

export default likeRouter;