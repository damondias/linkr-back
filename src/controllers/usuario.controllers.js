import { db } from "../database/database.connection.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

export async function cadastro(req, res) {
    const { email, password, username, image } = req.body;

    try {
        const emailValidate = await db.query('SELECT * FROM users WHERE email = $1;', [email]);
        if (emailValidate.rows.length !== 0) {
            return res.status(409).send("email inválido");
        }

        const bcryptpassword = bcrypt.hashSync(password, 10);

        const cadastro = await db.query(
            'INSERT INTO users (email, password, username, image) VALUES ($1, $2, $3, $4) RETURNING id;',
            [email, bcryptpassword, username, image]
        );

        console.log("Cadastro inserido com sucesso:", cadastro);


        // const cadastroId = cadastro.rows[0].id;

        // const usuario = await db.query(
        //     'INSERT INTO session (email, password) VALUES ($1, $2);',
        //     [ email, bcryptpassword]
        // );

        // console.log("Usuário inserido com sucesso:", usuario);


        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);
    }
}


export async function login(req, res){

    const {email, password} = req.body

    try{

        const verificadorLogin = await db.query(`SELECT * FROM sessions WHERE email = $1`, [email])

        if (verificadorLogin.rowCount === 0) {
            return res.sendStatus(401);
        }

        const user = verificadorLogin.rows[0];


        const passwordCorreta = await bcrypt.compare(password, user.password);

        if (!passwordCorreta) {
            return res.status(401).send("E-mail ou password inválido");
        }

        const token = uuid();

        const login = await db.query('INSERT INTO sessions (user_id, token) VALUES ($1, $2);', [user.id, token])

        res.status(200).send({token})

    } catch(err){
        res.status(500).send(err.message);

    }
}