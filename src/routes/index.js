import { Router } from "express"
import usuarioRouter from "./usuario.routes.js"
import postRouter from "./posts.routes.js"
import hashtagRouter from "./hashtag.routes.js"


const router = Router()
router.use(usuarioRouter)
router.use(postRouter);
router.use(hashtagRouter)



export default router
