import { Router } from "express";
import validateAuth from "../middlewares/validateAuth.js";
import { comment, getComments } from "../controllers/comment.controllers.js";

const commentRouter = Router();

commentRouter.use(validateAuth);

commentRouter.get('/comments/:postId', getComments);
commentRouter.post('/comment/:postId', comment);

export default commentRouter;