import { Router } from "express"
import usuarioRouter from "./usuario.routes.js"
import hashtagRouter from "./hashtag.routes.js"


const router = Router()
router.use(usuarioRouter)
router.use(hashtagRouter)



export default router
