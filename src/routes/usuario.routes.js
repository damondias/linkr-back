import { Router } from "express";
import { validateSchemma } from "../middlewares/validation.middlewares.js";
import { cadastro, login } from "../controllers/usuario.controllers.js";
import { cadastroSchema, loginSchemma } from "../schemma/usuario.schemma.js";

const usuarioRouter = Router();
usuarioRouter.post("/cadastro", validateSchemma(cadastroSchema), cadastro);
usuarioRouter.post("/login", validateSchemma(loginSchemma), login)

export default usuarioRouter;
