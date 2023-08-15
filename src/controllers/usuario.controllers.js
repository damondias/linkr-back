import { db } from "../database/database.connection.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

export async function cadastro(req, res) {
    const { email, senha, username, url } = req.body;

    try {
        const emailValidate = await db.query('SELECT * FROM cadastro WHERE email = $1;', [email]);
        if (emailValidate.rows.length !== 0) {
            return res.status(409).send("email inválido");
        }

        const bcryptSenha = bcrypt.hashSync(senha, 10);

        const cadastro = await db.query(
            'INSERT INTO cadastro (email, senha, username, url) VALUES ($1, $2, $3, $4) RETURNING id;',
            [email, bcryptSenha, username, url]
        );

        console.log("Cadastro inserido com sucesso:", cadastro);


        // const cadastroId = cadastro.rows[0].id;

        const usuario = await db.query(
            'INSERT INTO login (email, senha) VALUES ($1, $2);',
            [ email, bcryptSenha]
        );

        console.log("Usuário inserido com sucesso:", usuario);


        res.sendStatus(201);
    } catch (err) {
        res.status(500).send(err.message);
    }
}


export async function login(req, res){

    const {email, senha} = req.body

    try{

        const verificadorLogin = await db.query(`SELECT * FROM login WHERE email = $1`, [email])

        if (verificadorLogin.rowCount === 0) {
            return res.sendStatus(401);
        }

        const user = verificadorLogin.rows[0];


        const senhaCorreta = await bcrypt.compare(senha, user.senha);

        if (!senhaCorreta) {
            return res.status(401).send("E-mail ou senha inválido");
        }

        const token = uuid();

        const login = await db.query('INSERT INTO tokens (user_id, token) VALUES ($1, $2);', [user.id, token])

        res.status(200).send({token})

    } catch(err){
        res.status(500).send(err.message);

    }
}