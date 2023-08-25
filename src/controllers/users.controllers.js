import { getUserIdByName, getUserPosts } from "../repositories/users.repository.js"

export async function getUserById(req,res){
    const {id} = req.params

    try {
        const {rows} = await getUserPosts(id)
        if(rows.length == 0) return res.status(404).send("User not found")
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getUserByName(req,res){
    const {username} = req.query
    let userName = username+"%"

    try {
        const {rows} = await getUserIdByName(userName)
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}