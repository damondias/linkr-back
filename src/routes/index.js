import { Router } from "express"
import usuarioRouter from "./usuario.routes.js"
import hashtagRouter from "./hashtag.routes.js"
import UsersRouter from "./users.routes.js"


const router = Router()
router.use(usuarioRouter)
router.use(hashtagRouter)
router.use(UsersRouter)


export default router
