import { Router } from "express";
import validateAuth from "../middlewares/validateAuth";
import { comment, getComments } from "../controllers/comment.controllers";

const commentRouter = Router();

commentRouter.use(validateAuth);

commentRouter.get('/comments/:postId', getComments);
commentRouter.post('/comment', comment);

export default commentRouter;