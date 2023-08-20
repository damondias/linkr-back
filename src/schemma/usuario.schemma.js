import Joi from "joi"


export const cadastroSchema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(3).required(),
    username: Joi.string().required(),
    image: Joi.string()
});

export const loginSchemma = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(3).required()
})