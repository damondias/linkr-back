import joi from "joi";

export const postSchema = joi.object({
    url: joi.string().uri().required(),
    userMessage: joi.string().allow('').optional(),
});

