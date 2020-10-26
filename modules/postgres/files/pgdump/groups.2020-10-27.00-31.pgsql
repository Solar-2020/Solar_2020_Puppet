--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: groups; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA groups;


ALTER SCHEMA groups OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = groups, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: group_links; Type: TABLE; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE TABLE group_links (
    group_id integer NOT NULL,
    link text NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    author integer NOT NULL
);


ALTER TABLE groups.group_links OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    url text NOT NULL,
    create_by integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL,
    status_id integer DEFAULT 1 NOT NULL,
    avatar_url text NOT NULL
);


ALTER TABLE groups.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: groups; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: groups; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_status; Type: TABLE; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE TABLE groups_status (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE groups.groups_status OWNER TO postgres;

--
-- Name: groups_status_id_seq; Type: SEQUENCE; Schema: groups; Owner: postgres
--

CREATE SEQUENCE groups_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups.groups_status_id_seq OWNER TO postgres;

--
-- Name: groups_status_id_seq; Type: SEQUENCE OWNED BY; Schema: groups; Owner: postgres
--

ALTER SEQUENCE groups_status_id_seq OWNED BY groups_status.id;


--
-- Name: roles; Type: TABLE; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE groups.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: groups; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: groups; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: users_groups; Type: TABLE; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE TABLE users_groups (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE groups.users_groups OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: groups; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: groups; Owner: postgres
--

ALTER TABLE ONLY groups_status ALTER COLUMN id SET DEFAULT nextval('groups_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: groups; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Data for Name: group_links; Type: TABLE DATA; Schema: groups; Owner: postgres
--

COPY group_links (group_id, link, created, author) FROM stdin;
30	HMgbzy3QhS	2020-10-24 19:39:22.592567	1
30	vRWgSfSjAd	2020-10-24 20:13:12.072703	1
30	rtSvhDJpri	2020-10-24 20:31:44.08043	1
30	UE4sXDWRNv	2020-10-24 21:48:11.346759	1
30	F2K4eB97Fu	2020-10-24 21:48:21.110631	1
30	kHXXqdfbyy	2020-10-24 21:48:21.737482	1
30	faY8IERU1Q	2020-10-25 16:03:28.866052	1
31	zfHro_1EKv	2020-10-25 16:03:32.97398	1
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: groups; Owner: postgres
--

COPY groups (id, title, description, url, create_by, create_at, status_id, avatar_url) FROM stdin;
1	Группа качков	Качаемся, пацаны	KachOk	1	2020-10-20 18:58:20.200721+03	1	
39	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	0	2020-10-25 15:25:18.828995+03	1	
40	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	0	2020-10-25 15:25:23.961987+03	1	
41	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	0	2020-10-25 15:25:29.746987+03	1	
42	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	0	2020-10-25 15:25:36.270836+03	1	
43	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	0	2020-10-25 15:25:41.917985+03	1	
3	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 18:09:16.756911+03	1	
4	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 18:30:04.824022+03	1	
5	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 18:34:12.882466+03	1	
44	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	200	2020-10-25 15:26:04.478982+03	1	
45	ded		ddd	0	2020-10-26 20:30:50.457864+03	1	
6	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 18:38:17.553516+03	1	
7	ddd	dddd	ddddd	1	2020-10-21 18:48:25.252851+03	1	http://develop.nl-mail.ru/storage/photos/00/00098ee006aa02dfc23937df043e018a.jpg
8	необычный	красивая группа	unfffff	1	2020-10-21 19:07:08.073579+03	1	http://develop.nl-mail.ru/storage/photos/2d/2d455a06c0cce060df9f7bbecc645e1f.png
9	fefe		fffffffffffffff	1	2020-10-21 19:08:36.767972+03	1	http://develop.nl-mail.ru/storage/photos/d6/d6d2c3f8f75788d35dd74183da9c025e.png
10	великая группа		ffffffg	1	2020-10-21 19:11:07.432339+03	1	http://develop.nl-mail.ru/storage/photos/b1/b13b2c02d7401b962debd54b9f0fb8a4.png
11	великая группа		ffffffg	1	2020-10-21 19:11:31.1309+03	1	http://develop.nl-mail.ru/storage/photos/b1/b13b2c02d7401b962debd54b9f0fb8a4.png
12	fff	fff	htfeefe	1	2020-10-21 19:11:54.841718+03	1	http://develop.nl-mail.ru/storage/photos/8c/8c8dbd143b5ac47f3c896651e70a781f.png
13	fefef		fefefe	1	2020-10-21 19:17:45.983348+03	1	http://develop.nl-mail.ru/storage/photos/64/643b0872c0f772d892c3ff51eafc0ea5.png
14	fefe		eeffff	1	2020-10-21 19:18:07.399519+03	1	http://develop.nl-mail.ru/storage/photos/f7/f7a750d29af6e8bd132d097d295d5ecf.png
15	фыв	asdsdf	qwert	1	2020-10-21 19:35:18.865011+03	1	http://develop.nl-mail.ru/storage/photos/ce/ce9a4fcfc51c494f7644fcede2f49f0e.jpg
16	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 20:33:35.078715+03	1	
17	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 20:33:48.357187+03	1	
18	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 20:57:12.737963+03	1	
19	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 20:57:13.932842+03	1	
20	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 20:57:21.278594+03	1	
21	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-21 22:10:05.630135+03	1	
22	ee	ede	wwedwedwdew	1	2020-10-21 22:56:17.743858+03	1	http://develop.nl-mail.ruundefined
23	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-24 01:42:51.77621+03	1	
24	dwdwedwe	wefwefe	wefwefwef	1	2020-10-24 02:08:51.318433+03	1	http://develop.nl-mail.ruundefined
25	dwedewde	qwwwqw	wedwdwe	1	2020-10-24 02:09:54.151874+03	1	http://develop.nl-mail.ru/storage/photos/cb/cb32c61d994ab6451361ebac5b6f211d.png
26	qwdwe	wefwef	wewe	1	2020-10-24 02:10:24.04062+03	1	http://develop.nl-mail.ru/storage/photos/cf/cfe77f6b13c58815f0f86467469f1477.png
27	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-24 12:59:05.161618+03	1	
28	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-24 13:05:12.735369+03	1	
29	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-24 13:33:59.026777+03	1	
30	Группа качков, попытка 2	Качаемся, пацаны	KachOk	1	2020-10-24 14:51:03.524589+03	1	
2	Группа качков, попытка 2	Качаемся и плачем, пацаны	KachOk	1	2020-10-20 19:06:09.438558+03	2	
31	wedew	wedwe	wedwe	1	2020-10-24 16:01:21.960081+03	1	http://develop.nl-mail.ru/storage/photos/4a/4a5f4825a3c4ec138cd0adb9ebe8481f.png
32	Группа качков, попытка 3	Качаемся, пацаны	KachOk	0	2020-10-24 21:18:03.944999+03	1	
33	Группа качков, попытка 3	Качаемся, пацаны	KachOk	0	2020-10-24 21:18:46.314579+03	1	
34	Группа качков, попытка 2edwe	Качаемся и плачем, пацаны	KachOk	100	2020-10-24 21:28:02.461487+03	1	
35	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	5	2020-10-24 21:35:53.674961+03	2	
36	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	5	2020-10-24 21:48:29.035672+03	1	
37	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	5	2020-10-24 21:48:29.954419+03	1	
38	Группа качков, попытка 3333	Качаемся, пацаны	KachOk	5	2020-10-24 21:48:31.071444+03	1	
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: groups; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 45, true);


--
-- Data for Name: groups_status; Type: TABLE DATA; Schema: groups; Owner: postgres
--

COPY groups_status (id, title) FROM stdin;
1	Создана
2	Удалена
\.


--
-- Name: groups_status_id_seq; Type: SEQUENCE SET; Schema: groups; Owner: postgres
--

SELECT pg_catalog.setval('groups_status_id_seq', 2, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: groups; Owner: postgres
--

COPY roles (id, title) FROM stdin;
1	Создатель
2	Админ
3	Участник
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: groups; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 3, true);


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: groups; Owner: postgres
--

COPY users_groups (user_id, group_id, role_id) FROM stdin;
1	1	1
1	2	1
1	3	1
1	4	1
1	5	1
1	6	1
1	7	1
1	8	1
1	9	1
1	10	1
1	11	1
1	12	1
1	13	1
1	14	1
1	15	1
1	16	1
1	17	1
1	18	1
1	19	1
1	20	1
1	21	1
1	22	1
1	23	1
1	24	1
1	25	1
1	26	1
1	27	1
1	28	1
1	29	1
1	30	1
0	45	1
1	31	1
5	29	3
5	30	6
5	28	3
7	30	3
9	30	3
8	30	3
4	30	3
0	32	1
0	33	1
100	34	1
5	35	1
5	36	1
5	37	1
5	38	1
8	35	3
9	35	3
10	35	3
12	35	3
14	35	3
13	35	3
15	35	3
0	39	1
0	40	1
0	41	1
0	42	1
0	43	1
200	44	1
13	30	3
15	30	3
18	30	3
\.


--
-- Name: groups_pk; Type: CONSTRAINT; Schema: groups; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pk PRIMARY KEY (id);


--
-- Name: groups_status_pk; Type: CONSTRAINT; Schema: groups; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups_status
    ADD CONSTRAINT groups_status_pk PRIMARY KEY (id);


--
-- Name: roles_pk; Type: CONSTRAINT; Schema: groups; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);


--
-- Name: users_line; Type: CONSTRAINT; Schema: groups; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT users_line UNIQUE (user_id, group_id);


--
-- Name: group_links_link_index; Type: INDEX; Schema: groups; Owner: postgres; Tablespace: 
--

CREATE INDEX group_links_link_index ON group_links USING btree (link);


--
-- Name: group_links_group_id_fkey; Type: FK CONSTRAINT; Schema: groups; Owner: postgres
--

ALTER TABLE ONLY group_links
    ADD CONSTRAINT group_links_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

