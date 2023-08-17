import { Router } from "express"
import usuarioRouter from "./usuario.routes.js"
import postRouter from "./posts.routes.js"


const router = Router()
router.use(usuarioRouter)
router.use(postRouter);



export default router
