--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: upload; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA upload;


ALTER SCHEMA upload OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = upload, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: files; Type: TABLE; Schema: upload; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    id integer NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE upload.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: upload; Owner: postgres
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: upload; Owner: postgres
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: photos; Type: TABLE; Schema: upload; Owner: postgres; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    user_id integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE upload.photos OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: upload; Owner: postgres
--

CREATE SEQUENCE photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE upload.photo_id_seq OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: upload; Owner: postgres
--

ALTER SEQUENCE photo_id_seq OWNED BY photos.id;


--
-- Name: id; Type: DEFAULT; Schema: upload; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: upload; Owner: postgres
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photo_id_seq'::regclass);


--
-- Data for Name: files; Type: TABLE DATA; Schema: upload; Owner: postgres
--

COPY files (id, title, url, user_id) FROM stdin;
33	vitya.m	/static/files/vi/9f040a7c57572c15b810a7ebcff5d3fc.m	1
34	untitled2.m	/storage/files/un/d174f2c7196ba1c5ea05132b9272dda7.m	1
35	TO_Shishova_referat (1).docx	/storage/files/TO/710d9449fe3ed12d47e3c73a79de2327.docx	1
36	test.txt	/storage/files/te/411ff5d453ba7f5f90a0cea840ed226c.txt	1
37	test.txt	/storage/files/te/d25ac40ede85e16048d856b473a3ef15.txt	1
38	test.txt	/storage/files/te/8ab5361a7be47a7041cafed53786eb5b.txt	1
39	test.txt	/storage/files/te/b633f6d907376c8d790e2ad0df394355.txt	1
40	test.txt	/storage/files/te/936bd4082d67c952a10fff8983f97446.txt	1
41	test.txt	/storage/files/te/13c01b265d15b32e775af5bf57267c9b.txt	1
42	test.txt	/storage/files/te/b94191746239b7e328726f04aec543a9.txt	1
43	TO_Shishova_ref_stat.docx	/storage/files/TO/2ac8429990775a1dcb863e0ec99d342d.docx	1
44	teor_org_Shishova_rk3.docx	/storage/files/te/7bb1227bbcf0dfb5260e4cadee916aa2.docx	1
45	TO_Shishova_ref_stat.docx	/storage/files/TO/ab060bb1945b726cd5b660fb16c380a8.docx	1
46	test.txt	/storage/files/te/240a1620ed1836ee9f571ce0e9f5c5ad.txt	1
47	test.txt	/storage/files/te/aa0b47ef2ca282e9bf2a300d217ada47.txt	1
48	teor_org_Shishova_rk3.docx	/storage/files/te/f534e47333774172007944db06b0627a.docx	1
49	1_Konteyner_-_realizatsia_steka.doc	/storage/files/1_/63f5c40b8d8df58b5f0250704b6e952a.doc	1
50	TO_Shishova_referat (1).docx	/storage/files/TO/72e71d7c96133bab9a10fee720111dd9.docx	1
51	TO_Shishova_referat.docx	/storage/files/TO/b390ecbb0908e6ab48a23f9a53a90394.docx	1
52	Shlikov_Shishova_SGN3-52.docx	/storage/files/Sh/49092224816ac544fbf5ee6eccbf96d4.docx	1
53	Teoria_organizatsii_Kitay.docx	/storage/files/Te/961ef81725e6b60257a4c70319bc867b.docx	1
54	teor_org_Shishova_rk3.docx	/storage/files/te/cfeb7151772ea4255290d246ffc04293.docx	1
55	test.txt	/storage/files/te/c6b18fadbd0a7c7d97067dea6a3a7df3.txt	1
56	test.txt	/storage/files/te/52154035f3dc9bf765efca29075ad22d.txt	1
57	Шишова_СГН3-52_ДЗ1.docx	/storage/files/Ш/0c7e24d0772509a31fd94ee5bde18d3f.docx	1
58	test.txt	/storage/files/te/5e85c6a6fa8f9b2004fb74c3a8ed8c9c.txt	1
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: upload; Owner: postgres
--

SELECT pg_catalog.setval('files_id_seq', 58, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: upload; Owner: postgres
--

SELECT pg_catalog.setval('photo_id_seq', 167, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: upload; Owner: postgres
--

COPY photos (id, title, url, user_id, create_at) FROM stdin;
150	photo-camera.png	/storage/photos/30/3018553b541ed209983baf69919356ac.png	1	2020-10-21 18:40:35.353512+03
151	369602a8b3bf8d6a80c31a67ecf44ff6.jpg	/storage/photos/00/00098ee006aa02dfc23937df043e018a.jpg	1	2020-10-21 18:48:20.032843+03
152	screen1.png	/storage/photos/2d/2d455a06c0cce060df9f7bbecc645e1f.png	1	2020-10-21 19:06:30.799196+03
153	tasks.png	/storage/photos/d6/d6d2c3f8f75788d35dd74183da9c025e.png	1	2020-10-21 19:08:32.475968+03
154	payment.png	/storage/photos/b1/b13b2c02d7401b962debd54b9f0fb8a4.png	1	2020-10-21 19:10:54.240319+03
155	tasks.png	/storage/photos/8c/8c8dbd143b5ac47f3c896651e70a781f.png	1	2020-10-21 19:11:43.628463+03
156	survey.png	/storage/photos/64/643b0872c0f772d892c3ff51eafc0ea5.png	1	2020-10-21 19:17:40.14873+03
157	photo-camera.png	/storage/photos/f7/f7a750d29af6e8bd132d097d295d5ecf.png	1	2020-10-21 19:17:53.152152+03
158	me.jpg	/storage/photos/ce/ce9a4fcfc51c494f7644fcede2f49f0e.jpg	1	2020-10-21 19:35:17.732008+03
166	Screenshot from 2020-10-22 14-32-00.png	/storage/photos/db/db4be23ed84120ed07348131bcaa3874.png	1	2020-10-25 17:31:23.217498+03
167	favicon-32x32.png	/storage/photos/80/801a64b99e2aa8336c1150a71c980a18.png	1	2020-10-26 20:31:09.309334+03
159	p1_demfer.png	/storage/photos/cb/cb32c61d994ab6451361ebac5b6f211d.png	1	2020-10-24 02:09:44.980694+03
160	p1_schema.png	/storage/photos/cf/cfe77f6b13c58815f0f86467469f1477.png	1	2020-10-24 02:10:17.268282+03
88	s2_1.jpg	/static/photos/41/41d4374daba55611721ea6a9ce04ef04.jpg	1	2020-10-13 21:16:14.735699+03
89	Untitled Diagram.png	/static/photos/ca/caeb05771033bc46e70e9405eb557ba6.png	1	2020-10-13 21:34:25.284888+03
90	question.png	/storage/photos/aa/aa4aae36c131fee4ae66c84fa3c364d7.png	1	2020-10-13 21:55:56.056389+03
91	plus.png	/storage/photos/91/91ed54a6ef3fd5be81a8bc9a6f3bc929.png	1	2020-10-13 21:57:07.916855+03
92	question.png	/storage/photos/e8/e81a9157f1131acaaf68ffd5b2c04844.png	1	2020-10-13 23:05:40.679735+03
93	0_picture (1).jpg	/storage/photos/c4/c45783e1049df6389b90c9acbb1473bd.jpg	1	2020-10-13 23:22:04.137361+03
94	Untitled Diagram (1).png	/storage/photos/ce/ce32b00b03c0cce77f9cce1f538ed7b4.png	1	2020-10-13 23:22:08.334036+03
95	0_picture.jpg	/storage/photos/17/17bebd32dcf201ad1cc6aaa82e9b67fb.jpg	1	2020-10-13 23:37:55.711969+03
96	screenshot.png	/storage/photos/43/4393717e124544ed0a331508b790ba36.png	1	2020-10-13 23:44:08.282282+03
97	nophoto.png	/storage/photos/5d/5d0f310607c467c39857125bfc59582b.png	1	2020-10-14 01:38:09.316525+03
98	screenshot.png	/storage/photos/55/5576fdccdc1d6927df4fdb00505f7631.png	1	2020-10-14 01:44:17.031745+03
99	bg.png	/storage/photos/dd/dd4cdd405e0f5ac72b3a0332de390724.png	1	2020-10-14 01:46:33.810324+03
100	0_picture.jpg	/storage/photos/5d/5d7196292a8eb924fa1c0b7eceb188da.jpg	1	2020-10-14 01:51:53.465618+03
101	Untitled Diagram.png	/storage/photos/27/27fa13b81b4285c58bd330b789e171bb.png	1	2020-10-14 01:59:09.679733+03
102	screenshot.png	/storage/photos/fc/fc94914234a45af1272da7ee67f43ecd.png	1	2020-10-14 02:44:27.524644+03
103	plus.png	/storage/photos/79/79ed265b0a8dd8f2cdb32c0d29640dbc.png	1	2020-10-14 12:25:03.607534+03
104	bg.png	/storage/photos/af/afa131b2b2bd434c1a91ada52491aee7.png	1	2020-10-14 12:25:18.655877+03
105	baseline_edit_black_48dp.png	/storage/photos/cb/cb87c10095d3fd5fa588b27de90c0aed.png	1	2020-10-14 12:25:23.351746+03
106	0_picture.jpg	/storage/photos/00/001046ec8942195abcefc5b3f1de041e.jpg	1	2020-10-14 13:12:17.76222+03
107	me.jpg	/storage/photos/eb/eb8f707a1e865122cbdf00d8a895dcfc.jpg	1	2020-10-14 13:18:40.287301+03
108	0_picture.jpg	/storage/photos/8c/8cfff32490413f028e7b199a8abf78f6.jpg	1	2020-10-14 14:04:31.054188+03
109	baseline_zoom_in_black_18dp.png	/storage/photos/93/9306602146840c079252783e045c974f.png	1	2020-10-14 14:08:38.282893+03
110	baseline_zoom_in_black_18dp.png	/storage/photos/d1/d148bff11441d7418b9b84f695bf5821.png	1	2020-10-14 15:43:16.131742+03
111	question.png	/storage/photos/db/db6b4bd9ac46c700006de6d05519e764.png	1	2020-10-14 16:25:55.139529+03
112	0_picture.jpg	/storage/photos/b3/b32e732108f9b17d3773f7066ddf0704.jpg	1	2020-10-14 17:50:07.285378+03
113	screenshot.png	/storage/photos/99/99ef8a9249e714beb795e96733f5e3dd.png	1	2020-10-14 18:01:03.414058+03
114	nophoto.png	/storage/photos/e5/e5e85a9870b845abfe743af015521781.png	1	2020-10-14 18:35:14.880206+03
115	0_picture.jpg	/storage/photos/36/369602a8b3bf8d6a80c31a67ecf44ff6.jpg	1	2020-10-14 18:35:21.588862+03
116	dilog.png	/storage/photos/04/042408ec101a6f7d4b589b2b6fc3cce9.png	1	2020-10-21 12:09:49.760375+03
117	baseline_zoom_in_black_18dp.png	/storage/photos/a1/a102f47eed74578990861c3d000e94d2.png	1	2020-10-21 12:27:23.349652+03
118	dilog.png	/storage/photos/f9/f9993014f5c7c88979eb7dd3691635ed.png	1	2020-10-21 12:30:12.585645+03
119	baseline_zoom_in_black_18dp.png	/storage/photos/ae/ae0127e8a3c784d51ec3780b5e5c88d3.png	1	2020-10-21 12:50:18.679353+03
120	question.png	/storage/photos/68/680d582d9118ee4b98593500b209d3b0.png	1	2020-10-21 12:51:49.102895+03
121	nophoto.png	/storage/photos/5a/5ac17509c8a24c2220fab80b7bdd086d.png	1	2020-10-21 12:54:05.852322+03
122	11111111.png	/storage/photos/87/8749d4720080c548f1b7500cc05d6681.png	1	2020-10-21 12:55:50.935897+03
123	baseline_zoom_in_black_18dp.png	/storage/photos/35/35b1464a6b89fc6eaa0c656413c1becd.png	1	2020-10-21 12:56:08.845852+03
124	0_picture.jpg	/storage/photos/cb/cb36f84eb3401029be0debeb154f2619.jpg	1	2020-10-21 12:57:21.237138+03
125	dilog.png	/storage/photos/47/47e32f26a5ed409ec1376d3991b2573a.png	1	2020-10-21 13:03:46.31362+03
126	0_picture.jpg	/storage/photos/6e/6e4daad755a799bc9a7ba10aa711f331.jpg	1	2020-10-21 13:08:47.479236+03
127	0_picture.jpg	/storage/photos/cb/cbe5a13b27c4fc79a8033162ad900aff.jpg	1	2020-10-21 13:11:44.628809+03
128	plus.png	/storage/photos/0a/0a2923f450630b9f0f242c9d7f5df21e.png	1	2020-10-21 13:14:30.24384+03
129	baseline_zoom_in_black_18dp.png	/storage/photos/75/755dcc9e4f9a5c356702e12181cf4bc4.png	1	2020-10-21 13:16:07.565955+03
130	baseline_zoom_in_black_18dp.png	/storage/photos/98/98f39b31e71140b3fa56568cef4bd8c2.png	1	2020-10-21 13:18:18.50357+03
131	question.png	/storage/photos/be/be817a05c138e2d4274964a914ccd494.png	1	2020-10-21 13:18:29.668188+03
132	nophoto.png	/storage/photos/b8/b859054bcc4dea75026a29d6d6ee40e0.png	1	2020-10-21 13:20:02.153792+03
133	dilog.png	/storage/photos/c4/c42fbf128b8b5ade018bbd1613211bd0.png	1	2020-10-21 13:20:40.812002+03
134	plus.png	/storage/photos/b6/b644f54dbdaed44ece02ffeadba77aa3.png	1	2020-10-21 13:22:03.353145+03
135	baseline_keyboard_arrow_right_black_18dp.png	/storage/photos/81/8181b04bbaae0b671e937ce37ce66fa1.png	1	2020-10-21 13:23:02.785215+03
136	plus.png	/storage/photos/42/428555bfbe544ac70351351ef738d604.png	1	2020-10-21 13:24:02.662086+03
137	bg.png	/storage/photos/f1/f1b368340a79acb0bc511787ef8a63e2.png	1	2020-10-21 13:25:35.676409+03
138	nophoto.png	/storage/photos/4b/4b091d5206a5f1e7c7d08d2f9d9fd69b.png	1	2020-10-21 13:27:10.025132+03
139	11111111.png	/storage/photos/1d/1d83a3fcae46045a9efb4cec8b6a366a.png	1	2020-10-21 13:30:59.014411+03
140	baseline_zoom_in_black_18dp.png	/storage/photos/95/95602ae9008d17d144abd0bbe224f47f.png	1	2020-10-21 13:32:04.675903+03
141	plus.png	/storage/photos/e4/e4f4527adaacb1ede730fc9b30d7ed81.png	1	2020-10-21 13:32:46.676384+03
142	dilog.png	/storage/photos/f1/f19f55925a6278522692193671ba2178.png	1	2020-10-21 13:35:31.462624+03
143	dilog.png	/storage/photos/2c/2c78b4958d69f0f28b29fb77a0b4b9ce.png	1	2020-10-21 13:37:06.699071+03
144	plus.png	/storage/photos/76/76915c9ec650b27103bc6b824cef8314.png	1	2020-10-21 13:44:11.577031+03
145	nophoto.png	/storage/photos/c4/c4e1cdb5abad2e08a47782c3b2db5f40.png	1	2020-10-21 13:53:19.940832+03
146	0_picture.jpg	/storage/photos/15/15ba899a7f99a1cdcc48c72d8ff9f69a.jpg	1	2020-10-21 13:53:24.103289+03
147	tasks.png	/storage/photos/ee/ee23e7bdc4359031f4086981999114f7.png	1	2020-10-21 17:27:01.630681+03
148	payment.png	/storage/photos/a8/a8a7bb4f45084a16b10ef58029f6e9a0.png	1	2020-10-21 17:30:54.458192+03
149	favicon-32x32.png	/storage/photos/36/36ac8299046a15e279e9ee48ebd359e9.png	1	2020-10-21 17:37:16.171513+03
161	p1_schema.png	/storage/photos/4a/4a5f4825a3c4ec138cd0adb9ebe8481f.png	1	2020-10-24 16:01:20.467292+03
162	Screenshot from 2020-09-27 13-56-40.png	/storage/photos/2e/2e841e3b5eb668f6c60bb1a722bb708e.png	1	2020-10-24 16:25:51.18481+03
163	favicon-32x32.png	/storage/photos/39/39d641a4a159e282e9076ae1bd327c1d.png	1	2020-10-24 16:25:56.862869+03
164	favicon-32x32.png	/storage/photos/44/44724e448061b4403bc3a1d215a28c7c.png	1	2020-10-24 16:32:10.479681+03
165	favicon-32x32.png	/storage/photos/ad/ad6389ecd45f7b757ab8b11d942a5e6f.png	1	2020-10-24 16:34:50.706237+03
\.


--
-- Name: files_pk; Type: CONSTRAINT; Schema: upload; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pk PRIMARY KEY (id);


--
-- Name: photo_pk; Type: CONSTRAINT; Schema: upload; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photo_pk PRIMARY KEY (id);


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

