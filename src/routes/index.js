import { Router } from "express"
import usuarioRouter from "./usuario.routes.js"
import postRouter from "./posts.routes.js"
import hashtagRouter from "./hashtag.routes.js"
import UsersRouter from "./users.routes.js"
import likeRouter from "./likes.routes.js"
import commentRouter from "./comment.routes.js"


const router = Router()
router.use(usuarioRouter)
router.use(postRouter);
router.use(hashtagRouter)
router.use(UsersRouter)
router.use(likeRouter)
router.use(commentRouter)


export default router
