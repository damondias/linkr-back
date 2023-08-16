import { Router } from "express";
import { validateParamSchema } from "../middlewares/validation.middlewares.js";
import { hashtagSchema } from "../schemma/hashtag.schema.js";
import { getHashtag, getTags } from "../controllers/hashtag.controllers.js";

const hashtagRouter = Router();

hashtagRouter.get("/hashtag/:hashtag",validateParamSchema(hashtagSchema),getHashtag);
hashtagRouter.get("/hashtag",getTags)

export default hashtagRouter;