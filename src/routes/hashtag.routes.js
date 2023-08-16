import { Router } from "express";
import { validateParamSchema } from "../middlewares/validation.middlewares.js";
import { hashtagSchema } from "../schemma/hashtag.schema.js";
import { getHashtag } from "../controllers/hashtag.controllers.js";

const hashtagRouter = Router();

hashtagRouter.get("/hashtag/:hashtag",validateParamSchema(hashtagSchema),getHashtag);

export default hashtagRouter;