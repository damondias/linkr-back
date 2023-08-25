--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-1.pgdg22.04+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: damon
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO damon;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    "postId" integer,
    "userId" integer,
    text text
);


ALTER TABLE public.comments OWNER TO damon;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO damon;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    "followerId" integer,
    "followedId" integer
);


ALTER TABLE public.followers OWNER TO damon;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO damon;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: hashtagpost; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.hashtagpost (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL
);


ALTER TABLE public.hashtagpost OWNER TO damon;

--
-- Name: hashtagpost_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.hashtagpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtagpost_id_seq OWNER TO damon;

--
-- Name: hashtagpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.hashtagpost_id_seq OWNED BY public.hashtagpost.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    tag text NOT NULL
);


ALTER TABLE public.hashtags OWNER TO damon;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO damon;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL
);


ALTER TABLE public.likes OWNER TO damon;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO damon;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    message text NOT NULL,
    url text NOT NULL,
    "urlTitle" text,
    "urlDescription" text,
    "urlImage" text,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.posts OWNER TO damon;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO damon;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: repost; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.repost (
    id integer NOT NULL,
    "postId" integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.repost OWNER TO damon;

--
-- Name: repost_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.repost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repost_id_seq OWNER TO damon;

--
-- Name: repost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.repost_id_seq OWNED BY public.repost.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO damon;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO damon;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: damon
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    image text NOT NULL
);


ALTER TABLE public.users OWNER TO damon;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: damon
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO damon;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damon
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: hashtagpost id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtagpost ALTER COLUMN id SET DEFAULT nextval('public.hashtagpost_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: repost id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.repost ALTER COLUMN id SET DEFAULT nextval('public.repost_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.comments (id, "postId", "userId", text) FROM stdin;
1	35	9	Primeiro a comentar :)
2	70	9	E o Flamengo ta aonde???? KKKKKKKKKK
3	70	9	Dinizismo segue vivo
4	70	9	Que Legal!!!
5	72	9	Que Legal!!!
6	77	9	
7	77	16	Palmeiras Maior que todos
8	76	16	Fluzão trouxe o green ontem fácil
9	66	16	Gau Gau eh foda
10	70	16	O todo poderoso Olimpia tomou 2, Cano brocou como sempre
11	69	16	Simpsons eh mto bom, mas Springfield não chega aos pés da fenda do bikini
12	77	14	Um comentário especifico 
13	77	14	Um comentário especifico 
14	69	14	Eu mesmo estou comentando
15	69	14	Eu mesmo estou comentando
16	69	14	Eu mesmo estou comentando
17	69	14	Eu mesmo estou comentando
18	69	14	Eu mesmo estou comentando
19	69	14	Eu mesmo estou comentando
20	76	18	KKK, cade o Flamengo?
21	86	18	Vamo que vamo palmeiras
22	93	8	Meu fake
23	93	8	Meu fake
24	92	18	Vamo Flu
25	92	18	Vamo Flu
26	91	18	Gau maior de todos
27	82	18	?
28	79	18	?
29	90	18	Absurdo de daora
30	86	18	Mais uma semi, será que a final é contra o Flamengo?
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.followers (id, "followerId", "followedId") FROM stdin;
\.


--
-- Data for Name: hashtagpost; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.hashtagpost (id, "postId", "hashtagId") FROM stdin;
1	42	1
2	43	2
5	51	5
6	51	6
7	53	7
8	54	8
9	69	9
10	70	10
11	77	11
12	86	12
13	86	13
14	93	14
\.


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.hashtags (id, tag) FROM stdin;
1	Gaules
2	esportes
3	globo
4	noticias
5	Cazé
6	Futebol
7	Github
8	Referencia
9	Simpson
10	futebol
11	fluminense
12	Palmeiras
13	CadeOFlamengo
14	gaules
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.likes (id, "userId", "postId") FROM stdin;
134	18	86
136	18	93
63	8	36
65	9	47
67	9	42
68	8	37
69	9	51
71	10	54
72	7	35
75	9	69
76	9	70
78	16	77
79	16	69
80	14	77
81	18	77
31	7	36
88	18	79
43	9	37
46	8	35
108	18	82
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.posts (id, "userId", message, url, "urlTitle", "urlDescription", "urlImage", "createdAt") FROM stdin;
35	9	Site de esportes	https://ge.globo.com/	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-24 21:29:17.508262
36	9	Site de noticias	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-24 21:29:17.508262
37	9	Streamer	https://www.twitch.tv/gaules	Gaules - Twitch	Rerun: Reacts !!! - !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 21:29:17.508262
42	8	#Gaules	https://www.twitch.tv/gaules	Gaules - Twitch	TriboTour Dubai - !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 21:29:17.508262
43	8	#esportes	https://ge.globo.com/	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-24 21:29:17.508262
57	11	novo post	https://www.twitch.tv/gaules	Gaules - Twitch	Furia Academy vs LRV – CCT SA Online Series #10 - Group Stage- !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 22:45:21.183143
58	11	novo post	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-24 23:03:31.683403
47	8	#Gaules	https://www.twitch.tv/gaules	Gaules - Twitch	Rerun: Tribo Tour Pelo Mundo - !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 21:29:17.508262
48	8	#globo #noticias	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-24 21:29:17.508262
49	8	#Gaules	https://www.twitch.tv/gaules	Gaules - Twitch	Tribo Tour Mulas em Dubai Dia 2 - !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 21:29:17.508262
50	8	#globo #noticias	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-24 21:29:17.508262
51	8	#Cazé #Futebol	https://www.twitch.tv/casimito	casimito - Twitch	Lives todas as terças, quartas, quintas e domingos! Pode ter em outros dias também. Espero que se divirta! 		2023-08-24 21:29:17.508262
52	8		https://ge.globo.com/	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-24 21:29:17.508262
53	8	#Github Repos	https://github.com/damondias		damondias has 35 repositories available. Follow their code on GitHub.		2023-08-24 21:29:17.508262
59	8		https://ge.globo.com/	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-24 23:07:11.00839
64	11		https://ge.globo.com/	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-24 23:14:28.540663
66	11	Gaules	https://www.twitch.tv/gaules	Gaules - Twitch	Furia Academy vs LRV – CCT SA Online Series #10 - Group Stage- !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 23:19:39.893111
54	8	#Referencia Infinite Scroll	https://www.twitch.tv/gaules	Gaules - Twitch	Tribo Tour Dubai Dia 3 Vem ser Feliz - !Sorteio Siga @Gaules nas redes sociais.		2023-08-24 21:29:17.508262
55	10	#globo #noticias	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-24 21:29:17.508262
67	11		https://duckduckgo.com/		The Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs.		2023-08-24 23:33:20.826226
68	11	amazon	https://www.amazon.com.br/		Encontre o que precisa na Amazon. Ofertas em Livros, Kindle, Echo com Alexa, Fire TV, Eletrônicos, Bebidas, Casa, Beleza e mais. Frete GRÁTIS com Amazon Prime.		2023-08-24 23:40:52.504448
69	14	#Simpson	https://www.starplus.com/pt-br		Os melhores torneios do mundo ao vivo, produções originais, programas e eventos exclusivos.		2023-08-25 00:56:40.143221
70	11	#futebol	https://ge.globo.com/rj/futebol/libertadores/jogo/24-08-2023/fluminense-olimpia.ghtml	Fluminense 2 x 0 Olimpia | Taça Libertadores: melhores momentos	Saiba tudo sobre o jogo Fluminense 2 x 0 Olimpia (Taça Libertadores, Quartas de final). Veja no ge os melhores momentos e o placar do jogo, gols e lances da partida.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 05:24:32.763162
72	8		https://g1.globo.com/meio-ambiente/noticia/2023/08/24/concurso-elege-a-melhor-foto-de-fenomenos-meteorologicos-clique-de-raios-no-cristo-redentor-concorre.ghtml	Foto de raios no Cristo é finalista em concurso de imagens de fenômenos meteorológicos	Resultado será anunciado no dia 5 de outubro. Entre os finalistas está o brasileiro Fernando Braga, que flagrou uma tempestade de raios no Cristo Redentor.	https://s2-g1.glbimg.com/LVxAjOD9K_vj1snd1VZli7sNLWI=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/5/f/akVbpFRFG3yn717ZBKzg/votacao-foto.png	2023-08-25 06:21:11.578666
76	8		https://ge.globo.com/rj/futebol/libertadores/jogo/24-08-2023/fluminense-olimpia.ghtml	Fluminense 2 x 0 Olimpia | Taça Libertadores: melhores momentos	Saiba tudo sobre o jogo Fluminense 2 x 0 Olimpia (Taça Libertadores, Quartas de final). Veja no ge os melhores momentos e o placar do jogo, gols e lances da partida.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 06:31:46.622831
77	8	#fluminense	https://ge.globo.com/rj/futebol/libertadores/jogo/24-08-2023/fluminense-olimpia.ghtml	Fluminense 2 x 0 Olimpia | Taça Libertadores: melhores momentos	Saiba tudo sobre o jogo Fluminense 2 x 0 Olimpia (Taça Libertadores, Quartas de final). Veja no ge os melhores momentos e o placar do jogo, gols e lances da partida.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 06:36:25.821043
78	8	Cristo Redentor	https://g1.globo.com/meio-ambiente/noticia/2023/08/24/concurso-elege-a-melhor-foto-de-fenomenos-meteorologicos-clique-de-raios-no-cristo-redentor-concorre.ghtml	Foto de raios no Cristo é finalista em concurso de imagens de fenômenos meteorológicos	Resultado será anunciado no dia 5 de outubro. Entre os finalistas está o brasileiro Fernando Braga, que flagrou uma tempestade de raios no Cristo Redentor.	https://s2-g1.glbimg.com/LVxAjOD9K_vj1snd1VZli7sNLWI=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/5/f/akVbpFRFG3yn717ZBKzg/votacao-foto.png	2023-08-25 14:12:01.849125
79	8		https://ge.globo.com	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 14:14:26.651885
81	8	New post	https://ge.globo.com	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 15:05:51.026841
82	14		https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-25 15:17:00.786489
86	18	Se é loco, Fiz gol e os carai, jogamos mto time #Palmeiras #CadeOFlamengo	https://ge.globo.com/sp/futebol/libertadores/jogo/23-08-2023/deportivo-pereira-palmeiras.ghtml	Deportivo Pereira 0 x 4 Palmeiras | Taça Libertadores: melhores momentos	Saiba tudo sobre o jogo Deportivo Pereira 0 x 4 Palmeiras (Taça Libertadores, Quartas de final). Veja no ge os melhores momentos e o placar do jogo, gols e lances da partida.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 15:20:54.2322
90	8		https://g1.globo.com/meio-ambiente/noticia/2023/08/24/concurso-elege-a-melhor-foto-de-fenomenos-meteorologicos-clique-de-raios-no-cristo-redentor-concorre.ghtml	Foto de raios no Cristo é finalista em concurso de imagens de fenômenos meteorológicos	Resultado será anunciado no dia 5 de outubro. Entre os finalistas está o brasileiro Fernando Braga, que flagrou uma tempestade de raios no Cristo Redentor.	https://s2-g1.glbimg.com/LVxAjOD9K_vj1snd1VZli7sNLWI=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/5/f/akVbpFRFG3yn717ZBKzg/votacao-foto.png	2023-08-25 15:26:18.755694
91	14	#Gaules	https://g1.globo.com/	g1 - O portal de notícias da Globo	Últimas notícias do Brasil e do mundo, sobre política, economia, emprego, educação, saúde, meio ambiente, tecnologia, ciência, cultura e carros. Vídeos dos telejornais da TV Globo e da GloboNews.	https://s.glbimg.com/jo/g1/static/live/imagens/img_facebook.png?g1	2023-08-25 15:33:59.729634
92	8	#fluminense	https://ge.globo.com	ge.globo - É esporte sempre 	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	2023-08-25 15:36:48.328759
93	14	#gaules	https://www.twitch.tv/gaules	Gaules - Twitch	FURIA VS MONTE SEMIFINAL Pinnacle Cup V - !Sorteio Siga @Gaules nas redes sociais.		2023-08-25 16:05:51.263372
\.


--
-- Data for Name: repost; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.repost (id, "postId", "userId", "createdAt") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.sessions (id, token, "userId") FROM stdin;
9	01c76a0e-89d1-4e99-bb29-5eefbefd68cf	8
10	342b4469-65b7-4105-9aab-696ebbe2acb8	8
11	e2cbee8c-79b9-4e32-835f-c077c4ea49d9	8
12	70b2b97d-ae5d-4969-8382-a02e938682b5	9
13	49511e32-179c-4077-9026-15115d7ac541	9
14	1c7f1a6b-184a-4f7b-98f3-d5740ac39640	7
15	1c4df08a-d7e9-4567-9cd3-d559437f13bd	7
16	6f16efed-b153-4014-bc78-481e69196059	7
17	9d2cd84c-dd2e-488d-a589-d971d797d64d	8
18	997f8cf7-9aa2-46bd-ad8c-94b358c80a30	8
19	a31ce478-6bc9-4744-8c54-345616ae6e35	8
20	943bc5d1-6f31-46b8-acf5-fe331ba7aa0c	8
21	839752d3-013b-43f9-8a71-c977c24d182b	8
22	69adc890-61be-480e-8ef6-3c9169d62f8a	8
23	3a685760-c24d-40a2-b052-345a007c9adf	8
24	6a00b8b7-839c-4db2-98ad-7194bf53d7ff	8
25	4ae2fc56-ecc4-4a65-bf7c-b90f03120440	9
26	b3d7432b-5381-4d55-a018-4da9563a47a9	8
27	31d2c49e-18c7-41b7-947f-b22bafcfec2a	8
28	254abd72-ee55-4d07-b971-2f3d134ebe58	8
29	db1ad374-a35e-4cad-b601-f1c4097a089d	8
30	070bfaf8-31db-49d5-9558-7abd4804b590	8
31	167f72a1-db49-4c9f-b298-53a906a74bc4	8
32	c0d72c62-fa5e-4923-86d7-2e967bd2f364	8
33	83adc399-40ca-49eb-9bda-580895e38d0f	9
34	d01447b4-a01d-40c7-a92b-aa29d8fee36b	8
35	e49779f8-6b62-4c68-bfcd-83a1c34854f3	8
36	38ca4337-fcaf-460c-8ea8-0d71c75e02a2	8
37	3fd9b48c-de13-4033-949c-6a68ddf4e7df	7
38	7bcd1c2f-5bf4-4212-b431-6076d3e72554	7
39	e74d422f-19d0-465e-8cf9-ff214a0c9a63	7
40	910a6453-183d-4e61-9158-7a5ed99bbd4c	7
41	b614fb9d-31aa-404f-bbf3-6435626e12e9	8
42	292a1145-b3b6-4047-b2b3-c068f84b24ac	7
43	7097c71e-3a7d-4209-9aff-6370f5ba1f47	9
44	b3f7eae9-4944-4cb1-b26a-dfa3a1cbbfd3	9
45	5457e9be-b61e-41d8-8f77-49e64ed943a8	9
46	aafeb280-d5fa-4828-95f1-ea11dd2b07f4	9
47	f48b7b72-a5bb-4b7f-abe5-925ac0cdc895	7
48	6f4ef8bc-6db9-4cc5-9810-585932d50d8e	7
49	c585d70f-f98e-4cc1-8a63-4b9c558a8f9e	7
50	bdaddcd7-2e6d-4ee8-b85f-5d3098c8e1be	9
51	67c4ff0d-82cf-4c51-ac50-040d59332296	9
52	af0eaa51-9911-468d-84ac-1bce381fa4b0	9
53	cd0289e4-3cb7-4f0b-b0b0-b6eba04e0c19	9
54	c42bb8cb-5c72-4409-9987-1889cf4bc79b	9
55	1bfe002e-6055-486e-a7d5-8ec7dbff1f3c	9
56	a8d1a675-70e7-4439-99d0-41b2adb028d8	9
57	18215f24-7618-4374-b007-256474104d80	8
58	83f7e185-1c8b-4b27-b32e-ff36d9be135a	8
59	cdd994f9-352a-46d9-88bf-a1a58f6839bf	9
60	78d8a137-6dba-437f-85a4-32c1a6108b5d	7
61	d423a4c9-d306-4aef-a89a-6c4905145600	7
62	6db74ac0-2b0f-44ce-9066-f073c4df35d2	8
63	fa7a2a7b-64ea-4a8c-93ca-9050bc86e8db	8
64	55d21462-c17f-4bd5-98d7-2d78df866c01	7
65	f31f27d4-a5eb-4f40-ab52-b73a91db908c	9
66	7959ace4-98c0-47e3-a480-01a11a0fedd9	8
67	c752e2c1-7e17-4687-87e4-d099149e2453	9
68	30644554-ed14-4830-abd8-4ef5e04e67cc	8
69	dadfba6f-43f6-46a0-8ab6-2606c83a4d11	8
70	86af698d-bce0-434d-a773-48882d90615c	9
71	380ba1bb-c19d-426b-ba9b-56760cde5bff	8
72	f56e2aa9-06c7-4762-a560-47effa4301fd	8
73	a0a5f117-f6e8-4d46-8441-42c0c938cddc	8
74	10ee3a57-c7fd-4e5f-967b-d60ed97679ee	9
75	13035c51-1758-4acc-9139-e8ec638b1c0f	8
76	f7219c2c-582c-4179-a16f-db6cdab28b4b	8
77	c71b180f-6f9d-4cbd-99e6-f1c15f3a4945	8
78	0be08b52-eea8-410c-b846-706c76a6b8a6	8
79	6a7f429e-cc3b-4501-9d8c-112d14a237b9	8
80	73dfcee3-b796-44e4-b7a0-861f278cf9ad	8
81	096a6880-b218-4830-a5ad-1036a14fe456	8
82	cafd3cb8-d045-47c2-b3b9-f8eca1b9c75c	8
83	dc1e6ec7-b152-4196-9dbb-f7c05862e4fa	8
84	8ba75465-805a-4f5e-b296-8f6e76fefdf7	8
85	044116cf-0c0c-4d4c-b853-d4fbcebc646b	8
86	be073613-5ade-448e-b4ab-c2f53272a5ed	8
87	dbf5428c-669b-4d26-bb79-269ecc75d240	8
88	fdff775e-95ef-4c46-89a1-8a13714234c4	8
89	5878619c-4efd-4815-adec-30f9ed64cedf	8
90	e62d0505-c3b1-4c46-b2b9-62b6292e9353	8
91	1536a9ed-62da-4226-822e-8fd412f41232	8
92	b9bf277a-73b9-423c-a8a5-c028c6a93131	8
93	951426ab-ebca-41ab-af9c-23e500942508	8
94	77c9ccab-6b9f-4fad-b5c5-4148aafac8bc	8
95	d037b459-f692-4557-aed7-e621a10dec1e	8
96	49ad2b7f-46f5-4986-ae60-f79890020504	8
97	0deea692-6dfe-4f60-9b4e-892b4cba7d26	9
98	d5df1f9f-bbc2-4019-a1f4-2593ae6249a5	8
99	6a938406-ed96-40e7-b0d9-eb2382ef0ef9	8
100	5a97a4a0-f441-482a-b2a2-ed6b4a54e02f	9
101	6ac1b7d7-c58c-4cc7-88dc-4013b2bb77c5	8
102	1fb5630d-273a-48b3-a19f-569b12324492	8
103	002b91fa-aedb-4c53-9fa7-56c8efc14c28	8
104	c1f2b843-11b7-4916-90b6-f43ce427cb73	8
105	cbd0aa3a-af56-415d-9cdd-09ee0c5aaf39	8
106	69fa714f-0400-47e6-abe6-f1da720fa339	8
107	5adfd931-39ec-4d32-b717-dd9985f0c430	8
108	4c699604-948b-4e79-9aec-d1844f40cd38	9
109	770b881f-8e7f-4edb-993c-a874b4257f38	9
110	67a4a4c2-8b3c-4368-b9b3-8480c40d46e7	9
111	87c6f7be-58eb-4552-b9fc-28f6bef560d5	9
112	35a087e4-93cd-4d3d-a01c-397f7b09d42f	8
113	53b33c8b-c08e-4898-812a-e7cca9502192	9
114	1da6a07c-4f8c-4226-8f9c-5f41d6a29600	9
115	7ea0de59-c51b-4914-a397-f91c02fdf59b	9
116	65f17056-fca1-4860-9836-7ba473e13fae	9
117	e1d3036c-417d-4f35-9b43-4478e0a47abb	9
118	4eaf2fbe-32d1-4343-9946-afa5b201c82b	10
119	ca081d49-ccfe-4c85-8c39-2e6e2bd4a4fa	11
120	02ef0fae-9760-4333-b98e-3e3de2166b8a	8
121	f60e8833-0894-4e51-88e0-a6453433500c	8
122	0f358fea-de8b-4b6d-bd4d-1f344e5d696f	11
123	a28d93a3-c588-43a8-94a1-ac9935eb9ae0	9
124	969a3f77-ad3c-468f-a1f9-df0efecff37a	9
125	390537d8-fef9-49f2-8190-afa8f7665560	13
126	0334ffc6-a4a2-4280-bdd5-d60139f59377	13
127	8b6333af-69b0-4b44-8923-7568111bbc9e	14
128	d64cb2c0-fc9c-4548-bb0a-2164eae9b465	14
129	6e07ef08-63e9-4274-9e56-f3a6deb89a45	9
130	500defaf-c1c7-4396-8c4a-2bd609ac92b9	9
131	787d4605-68b1-47a4-8536-7d13ba3beca6	9
132	38f56778-bd86-454f-bbd6-5021fb9a9a64	9
133	e39a712c-61a4-4d43-8bb3-a3eecc1d782e	14
134	8d77b529-30d0-4b16-a16a-533af2b0ee28	9
135	6648e3dd-aa4f-49a9-8abc-de022c7e6e29	8
136	919fb36b-b3f2-4fc0-a441-d5de06036031	16
137	352f66e5-1c12-450c-b189-6b9e0a589fd9	16
138	2e0eef4a-55c1-463a-88d4-a8af16d996bd	16
139	5de0f24b-adb3-45ad-8fd0-8e1f19e36586	16
140	b33b151c-3fd3-47e2-a0e1-d3223f2c785a	16
141	6658b5b7-e112-43d5-9b42-c64ef5ed7c3c	14
142	f0ff08a7-5aeb-4387-acb3-09f96075ab91	18
143	2b131bf3-5f12-45a1-b297-96702c81ea65	18
144	6bf08d1a-c5a8-4131-a125-4011d185f652	18
145	62c6f214-d055-4a05-96e0-857098079b32	18
146	2d1c92cf-8d03-42cd-b03e-807c0b393c8e	18
147	7d14b738-430b-4a6b-ace0-5c597f0180bf	18
148	0341947d-055c-4f3c-98b5-fdceb536c1ae	14
149	3b114dd9-193c-4da0-98bc-510565148738	18
150	b0142424-af0d-47d0-bbcb-94f5ca45150a	18
151	8fda4f03-a93d-4ef0-b30b-773fd78aa327	18
152	7b68decc-7fd4-47e1-a904-60f992a779be	18
153	997b53d5-76cb-4cac-b4f8-a40520a5e1b1	14
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: damon
--

COPY public.users (id, username, email, password, image) FROM stdin;
5	teste	teste@teste.com	$2b$10$aeeA7.Yxt0kZ/AAHcIbe7uDXZ0DHH0EmVEZKx5d3jikfS9BPqLXb6	teste
6	teste	teste@gmail.com	$2b$10$LCdwLCSYsG3xzAAniGj0TOITAQJJ6QvAZEJfiFv7PhM1J2MpiprlC	teste
7	teste	teste2@gmail.com	$2b$10$Xmyeyr63LEqeK5u9/si2deQegwir76N9E4Rihukwz2blYGC9vJiNS	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png
8	user	user@email.com	$2b$10$rDauhZ8CgE1BPrGKcm9Yiuez8gtFeWDjTA5rSSQUS2odbzOzW9f3m	https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg
9	teste3	teste3@gmail.com	$2b$10$UtKnc.5DwEBZo0t0grNiHe5sEtF2JPwm2JQv7NnTQA179JHOnkzLC	https://static3.tcdn.com.br/img/img_prod/460977/teste_100485_1_cbc226c7d23a19c784fb4752ffe61337.png
10	user	user@outlook.com	$2b$10$1UxV.XrmyKZ/NbThZVpxMuMBAqtYdt5IZF4JKTlFvFRykh8KCx2WS	https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg
11	user.gmail	user@gmail.com	$2b$10$UOQh8wbeo9keepazt7aSVeDeU4d01GGzhyiHzL0cWe87yWNpBzBmW	https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg
12	damondias	damondias@email.com	$2b$10$tKatefcItTHfpl0p0icHMus5IQGG3TF2pPedf760SPpldpvUIirIW	https://images.tcdn.com.br/img/img_prod/697730/adesivo_lateral_vidro_caminhao_carro_decorativo_bart_simpson_5_1147485849_1_20201005081814.jpg
13	Front End	front@email.com	$2b$10$mGkDzSNpt5yMFTVmoQSsRuINK89k9b0B1x8UWggaWvejmdBQYAryW	https://images.tcdn.com.br/img/img_prod/697730/adesivo_lateral_vidro_caminhao_carro_decorativo_bart_simpson_5_1147485849_1_20201005081814.jpg
14	Bart Simpson	bart@email.com	$2b$10$4Pdt2yDc5s8tTdnb0ZWLP.pkBnCpl8ckA9WeiMAJiDmlsEnmGa8N6	https://images.tcdn.com.br/img/img_prod/697730/adesivo_lateral_vidro_caminhao_carro_decorativo_bart_simpson_5_1147485849_1_20201005081814.jpg
15	Bart Simpson	bart@email.com	$2b$10$6V.il/CLsv/q5mjBohymruE85uFm8cQeCGDDhb4B6G.N1Bea12Fqq	https://images.tcdn.com.br/img/img_prod/697730/adesivo_lateral_vidro_caminhao_carro_decorativo_bart_simpson_5_1147485849_1_20201005081814.jpg
16	Bob Esponja	bob@gmail.com	$2b$10$qvIEKRV4Ny.Y8s5PUrSGLOtKJo3GdrCrV1T7EMi3S49a.KGyhqDTu	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvMHD5Hc0rJLfLBQnQrwIKwVBPPv5cRSju2A&usqp=CAU
17	Rafael Veiga	veiga@gmail.com	$2b$10$oonLwCU6a.u1Nve1BIp28u2z/b8r5iPgvTsc1h6rk4Kp8LPHnwQtC	data:image/jpeg;base64,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
18	Rafael Veiga	veiga@email.com	$2b$10$y1zc52nJaVWLsGjZzkXMzOhLBwf5HogiSXOEK.kOWrS.fXvTxRQ5C	data:image/jpeg;base64,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
19	debs	debs@debs.com	$2b$10$6xVSaAOZCsJANAjahJ.HjOnxhyjclPcDk890jljfJRUXerUzqtNo.	https://lh3.googleusercontent.com/ogw/AGvuzYbv4HeQSsKOlDH-OdNbERJ7xvT8313_iG5A6ACg=s64-c-mo
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.comments_id_seq', 30, true);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.followers_id_seq', 1, false);


--
-- Name: hashtagpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.hashtagpost_id_seq', 14, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 14, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.likes_id_seq', 136, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.posts_id_seq', 93, true);


--
-- Name: repost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.repost_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.sessions_id_seq', 153, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: damon
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: hashtagpost hashtagpost_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT hashtagpost_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: repost repost_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.repost
    ADD CONSTRAINT repost_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: followers followers_followedId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT "followers_followedId_fkey" FOREIGN KEY ("followedId") REFERENCES public.users(id);


--
-- Name: followers followers_followerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT "followers_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES public.users(id);


--
-- Name: hashtagpost hashtagpost_hashtagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT "hashtagpost_hashtagId_fkey" FOREIGN KEY ("hashtagId") REFERENCES public.hashtags(id);


--
-- Name: hashtagpost hashtagpost_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.hashtagpost
    ADD CONSTRAINT "hashtagpost_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: repost repost_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.repost
    ADD CONSTRAINT "repost_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: repost repost_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.repost
    ADD CONSTRAINT "repost_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: damon
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO damon;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO damon;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO damon;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO damon;


--
-- PostgreSQL database dump complete
--

