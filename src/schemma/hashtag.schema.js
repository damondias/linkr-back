import joi from "joi"

export const hashtagSchema = joi.object({
    hashtag:joi.string().required()
})