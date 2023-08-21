import { createHashtag, getAllHashtags, getPostsHashTag, linkHashtagPost } from "../repositories/hastag.repository.js"

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

export async function makeHashtag(message,postId){
    const tagTable = {}
    try {
        const messageWords = message.split(" ")
        let tags = messageWords.filter(e=>e[0]=="#")
        tags = tags.map(e=>e.replace("#",""))
        const allTags = await getAllHashtags()
        allTags.rows.map(e=>tagTable[e.tag]=true)
        const newTags = tags.filter(e=>tagTable[e]!=true)
        newTags.map(async e=>{
            let resp = await createHashtag(e)
            await linkHashtagPost(resp.rows[0].id,postId)
        })
    } catch (err) {
        return err
    }
}