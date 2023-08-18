--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hashtagpost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtagpost (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL
);


--
-- Name: hashtagpost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtagpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtagpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtagpost_id_seq OWNED BY public.hashtagpost.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    tag text NOT NULL
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    message text NOT NULL,
    url text NOT NULL,
    "urlTitle" text,
    "urlDescription" text,
    "urlImage" text
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    image text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtagpost id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtagpost ALTER COLUMN id SET DEFAULT nextval('public.hashtagpost_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtagpost; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'Primeira postagem do usuário 1', 'https://www.google.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (2, 1, 'Segunda postagem do usuário 1', 'https://www.facebook.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (3, 1, 'Terceira postagem do usuário 1', 'https://www.g1.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (4, 2, 'Primeira postagem do usuário 2', 'https://www.ge.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (5, 2, 'Segunda postagem do usuário 2', 'https://www.google.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (6, 2, 'Terceira postagem do usuário 2', 'https://www.facebook.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (7, 2, 'Primeira postagem do usuário 2', 'https://www.ge.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (8, 2, 'Segunda postagem do usuário 2', 'https://www.google.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (9, 2, 'Terceira postagem do usuário 2', 'https://www.facebook.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (10, 3, 'Primeira postagem do usuário 3', 'https://www.g1.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (11, 3, 'Segunda postagem do usuário 3', 'https://www.ge.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (12, 3, 'Terceira postagem do usuário 3', 'https://www.google.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (13, 3, 'Primeira postagem do usuário 3', 'https://www.g1.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (14, 3, 'Segunda postagem do usuário 3', 'https://www.ge.globo.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (15, 3, 'Terceira postagem do usuário 3', 'https://www.google.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (16, 1, 'Quarta postagem do usuário 1', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (17, 1, 'Quinta postagem do usuário 1', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (18, 2, 'Quarta postagem do usuário 2', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (19, 2, 'Quinta postagem do usuário 2', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (20, 3, 'Quarta postagem do usuário 3', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (21, 3, 'Quinta postagem do usuário 3', 'https://www.example.com', NULL, NULL, NULL);
INSERT INTO public.posts VALUES (22, 1, 'mais um post', 'https://www.g1.globo.com', 'globo', 'descrição da globo', 'imagem da globo');
INSERT INTO public.posts VALUES (23, 1, 'mais um post', 'https://www.g1.globo.com', 'globo', 'descrição da globo', 'imagem da globo');
INSERT INTO public.posts VALUES (24, 1, 'Site de videos daora', 'https://www.youtube.com/', '', 'Aproveite vídeos e músicas que você ama, envie e compartilhe conteúdo original com amigos, parentes e o mundo no YouTube.', '');
INSERT INTO public.posts VALUES (25, 1, 'Site de esportes', 'https://ge.globo.com/', 'ge.globo - É esporte sempre ', 'No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.', 'https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png');
INSERT INTO public.posts VALUES (26, 1, 'Site de noticias', 'https://g1.globo.com/', 'g1 - O portal de notícias da Globo', 'Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.', 'https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1');
INSERT INTO public.posts VALUES (27, 1, 'Gaules', 'https://www.twitch.tv/gaules', 'Gaules - Twitch', 'FAZE vs VirtusPro Gamers8 2023  - !Sorteio Siga @Gaules nas redes sociais.', '');
INSERT INTO public.posts VALUES (28, 1, 'Site de busca', 'https://www.google.com/', '', '', '/images/branding/googleg/1x/googleg_standard_color_128dp.png');
INSERT INTO public.posts VALUES (29, 1, 'site de buscas', 'https://www.google.com/', '', '', '/images/branding/googleg/1x/googleg_standard_color_128dp.png');
INSERT INTO public.posts VALUES (30, 1, 'Noticias', 'https://www.uol.com.br/', '', 'UOL, a maior empresa brasileira de conteúdo, serviços digitais e tecnologia com vários canais de jornalismo e diversas soluções para você ou seu negócio.', '');
INSERT INTO public.posts VALUES (31, 1, '', 'https://www.twitch.tv/gaules', 'Gaules - Twitch', 'FAZE vs VirtusPro Gamers8 2023  - !Sorteio Siga @Gaules nas redes sociais.', '');
INSERT INTO public.posts VALUES (32, 1, 'Site de noticias', 'https://g1.globo.com/', 'g1 - O portal de notícias da Globo', 'Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.', 'https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1');
INSERT INTO public.posts VALUES (33, 1, 'Site de noticias', 'https://g1.globo.com/', 'g1 - O portal de notícias da Globo', 'Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.', 'https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1');
INSERT INTO public.posts VALUES (34, 1, 'Site de esportes', 'https://ge.globo.com/', 'ge.globo - É esporte sempre ', 'No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.', 'https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'token_usuario1_sessao1', 1);
INSERT INTO public.sessions VALUES (2, 'token_usuario1_sessao2', 1);
INSERT INTO public.sessions VALUES (3, 'token_usuario2_sessao1', 2);
INSERT INTO public.sessions VALUES (4, 'token_usuario2_sessao2', 2);
INSERT INTO public.sessions VALUES (5, 'token_usuario3_sessao1', 3);
INSERT INTO public.sessions VALUES (6, 'token_usuario3_sessao2', 3);
INSERT INTO public.sessions VALUES (7, 'token_usuario4_sessao1', 4);
INSERT INTO public.sessions VALUES (8, 'token_usuario4_sessao2', 4);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'usuario1', 'usuario1@example.com', 'senha1', 'imagem1.jpg');
INSERT INTO public.users VALUES (2, 'usuario2', 'usuario2@example.com', 'senha2', 'imagem2.jpg');
INSERT INTO public.users VALUES (3, 'usuario3', 'usuario3@example.com', 'senha3', 'imagem3.jpg');
INSERT INTO public.users VALUES (4, 'usuario4', 'usuario4@example.com', 'senha4', 'https://pbs.twimg.com/media/DSA5rQzW4AEdlD7.jpg');


--
-- Name: hashtagpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtagpost_id_seq', 1, false);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 34, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: hashtagpost hashtagpost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT hashtagpost_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: hashtagpost hashtagpost_hashtagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT "hashtagpost_hashtagId_fkey" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id);


--
-- Name: hashtagpost hashtagpost_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT "hashtagpost_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

