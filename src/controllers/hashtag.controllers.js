import { getAllHashtags, getPostsHashTag } from "../repositories/hastag.repository.js"

export async function getHashtag(req,res){
    const {hashtag} = req.params

    try {
        const {rows} = await getPostsHashTag(hashtag)
        if(rows.length==0) return res.sendStatus(404)
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getTags(req,res){
    try {
        const {rows} = await getAllHashtags()
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}