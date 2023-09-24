--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: kategoris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoris (
    id bigint NOT NULL,
    kategori character varying(255)
);


ALTER TABLE public.kategoris OWNER TO postgres;

--
-- Name: kategoris_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategoris_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategoris_id_seq OWNER TO postgres;

--
-- Name: kategoris_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategoris_id_seq OWNED BY public.kategoris.id;


--
-- Name: produks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produks (
    id bigint NOT NULL,
    nama_produk character varying(255) NOT NULL,
    harga bigint NOT NULL,
    kategori_id bigint,
    status_id bigint
);


ALTER TABLE public.produks OWNER TO postgres;

--
-- Name: produks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produks_id_seq OWNER TO postgres;

--
-- Name: produks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produks_id_seq OWNED BY public.produks.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(300)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: satuans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satuans (
    id bigint NOT NULL,
    nama_satuan character varying(255)
);


ALTER TABLE public.satuans OWNER TO postgres;

--
-- Name: satuans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.satuans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satuans_id_seq OWNER TO postgres;

--
-- Name: satuans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.satuans_id_seq OWNED BY public.satuans.id;


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    nama_status character varying(255)
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statuses_id_seq OWNER TO postgres;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(300),
    username character varying(300),
    password character varying(300),
    role_id bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: kategoris id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoris ALTER COLUMN id SET DEFAULT nextval('public.kategoris_id_seq'::regclass);


--
-- Name: produks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produks ALTER COLUMN id SET DEFAULT nextval('public.produks_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: satuans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satuans ALTER COLUMN id SET DEFAULT nextval('public.satuans_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: kategoris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoris (id, kategori) FROM stdin;
1	L QUEENLY
2	L MTH AKSESORIS (IM)
3	L MTH TABUNG (LK)
4	SP MTH SPAREPART (LK)
5	CI MTH TINTA LAIN (IM)
6	S MTH STEMPEL (IM)
\.


--
-- Data for Name: produks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produks (id, nama_produk, harga, kategori_id, status_id) FROM stdin;
6	ALUMUNIUM FOIL ALL IN ONE BULAT 23mm IM	1000	2	1
7	ALUMUNIUM FOIL ALL IN ONE BULAT 30mm IM	1000	2	1
10	ALUMUNIUM FOIL ALL IN ONE SHEET 250mm IM	12500	2	2
5	ALCOHOL GEL POLISH CLEANSER GP-CLN01	12500	1	1
12	ALUMUNIUM FOIL HDPE/PE BULAT 23mm IM	12500	2	1
13	ALUMUNIUM FOIL HDPE/PE BULAT 30mm IM	1000	2	1
14	ALUMUNIUM FOIL HDPE/PE SHEET 250mm IM	13000	2	2
15	ALUMUNIUM FOIL PET SHEET 250mm IM	1000	2	2
16	ARM PENDEK MODEL U	13000	2	1
17	ARM SUPPORT KECIL	13000	3	2
18	ARM SUPPORT KOTAK PUTIH	13000	2	2
19	ARM SUPPORT PENDEK POLOS	13000	3	1
20	ARM SUPPORT S IM	1000	2	2
21	ARM SUPPORT T (IMPORT)	13000	2	1
22	ARM SUPPORT T - MODEL 1 ( LOKAL )	10000	3	1
23	BLACK LASER TONER FP-T3 (100gr)	13000	2	2
24	BODY PRINTER CANON IP2770	500	4	1
25	BODY PRINTER T13X	15000	4	1
26	BOTOL 1000ML BLUE KHUSUS UNTUK EPSON R1800/R800 - 4180 IM (T054920)	10000	5	1
27	BOTOL 1000ML CYAN KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4120 IM (T054220)	10000	5	2
28	BOTOL 1000ML GLOSS OPTIMIZER KHUSUS UNTUK EPSON R1800/R800/R1900/R2000/IX7000/MG6170 - 4100 IM (T054020)	1500	5	1
29	BOTOL 1000ML L.LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0599 IM	1500	5	2
30	BOTOL 1000ML LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0597 IM	1500	5	2
31	BOTOL 1000ML MAGENTA KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4140 IM (T054320)	1000	5	1
32	BOTOL 1000ML MATTE BLACK KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 3503 IM (T054820)	1500	5	2
33	BOTOL 1000ML ORANGE KHUSUS UNTUK EPSON R1900/R2000 IM - 4190 (T087920)	1500	5	1
34	BOTOL 1000ML RED KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4170 IM (T054720)	1000	5	2
35	BOTOL 1000ML YELLOW KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4160 IM (T054420)	1500	5	2
36	BOTOL KOTAK 100ML LK	1000	2	1
37	BOTOL 10ML IM	1000	6	2
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	admin
2	user
\.


--
-- Data for Name: satuans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.satuans (id, nama_satuan) FROM stdin;
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statuses (id, nama_status) FROM stdin;
1	bisa dijual
2	tidak bisa dijual
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, password, role_id) FROM stdin;
\.


--
-- Name: kategoris_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategoris_id_seq', 6, true);


--
-- Name: produks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produks_id_seq', 37, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: satuans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.satuans_id_seq', 1, false);


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: kategoris kategoris_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoris
    ADD CONSTRAINT kategoris_pkey PRIMARY KEY (id);


--
-- Name: produks produks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produks
    ADD CONSTRAINT produks_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: satuans satuans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satuans
    ADD CONSTRAINT satuans_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: produks fk_produks_kategori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produks
    ADD CONSTRAINT fk_produks_kategori FOREIGN KEY (kategori_id) REFERENCES public.kategoris(id);


--
-- Name: produks fk_produks_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produks
    ADD CONSTRAINT fk_produks_status FOREIGN KEY (status_id) REFERENCES public.statuses(id);


--
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

