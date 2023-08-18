import { Router } from "express";
import { validateParamSchema } from "../middlewares/validation.middlewares.js";
import { UsersId, UsersName } from "../schemma/users.schema.js";
import { getUserById, getUserByName } from "../controllers/users.controllers.js";

const UsersRouter = Router()

UsersRouter.get("/user/:id",validateParamSchema(UsersId),getUserById)
UsersRouter.get("/users/find/:username",validateParamSchema(UsersName),getUserByName)

export default UsersRouter