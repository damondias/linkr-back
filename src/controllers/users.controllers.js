import { getUserIdByName, getUserPosts } from "../repositories/users.repository.js"

export async function getUserById(req,res){
    const {id} = req.params;

    const { limit } = req.query;
    const { offset } = req.query;

    try {
        const {rows} = await getUserPosts(id,limit, offset)
        if(rows.length == 0) return res.status(404).send("User not found")
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUserByName(req,res){
    const {username} = req.params
    let userName = username+"%"

    try {
        const {rows} = await getUserIdByName(userName)
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}