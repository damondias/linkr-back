import Joi from "joi"


export const cadastroSchema = Joi.object({
    email: Joi.string().email().required(),
    senha: Joi.string().min(3).required(),
    username: Joi.string().required(),
    url: Joi.string()
});

export const loginSchemma = Joi.object({
    email: Joi.string().email().required(),
    senha: Joi.string().min(3).required()
})