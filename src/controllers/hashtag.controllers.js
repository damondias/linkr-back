import { getHashTag } from "../repositories/hastag.repository.js"

export async function getHashtag(req,res){
    const {hashtag} = req.params

    try {
        const {rows} = await getHashTag(hashtag)
        if(rows==undefined) return res.sendStatus(404)
        res.status(200).send(rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}