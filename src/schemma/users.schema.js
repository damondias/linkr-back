import joi from "joi"

export const UsersId = joi.object({
    id: joi.number().integer().required()
})

export const UsersName = joi.object({
    username:joi.string().required()
})