--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: posts; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA posts;


ALTER SCHEMA posts OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = posts, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    text text NOT NULL,
    interview_id integer NOT NULL
);


ALTER TABLE posts.answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: currency; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE currency (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE posts.currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- Name: files; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    post_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE posts.files OWNER TO postgres;

--
-- Name: interview_types; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE interview_types (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE posts.interview_types OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE interview_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.interview_types_id_seq OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE interview_types_id_seq OWNED BY interview_types.id;


--
-- Name: interviews; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE interviews (
    id integer NOT NULL,
    text text NOT NULL,
    type integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE posts.interviews OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.interviews_id_seq OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE interviews_id_seq OWNED BY interviews.id;


--
-- Name: payments; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    cost integer NOT NULL,
    currency_id integer NOT NULL,
    post_id integer NOT NULL,
    requisite text DEFAULT ''::text NOT NULL
);


ALTER TABLE posts.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: photos; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE photos (
    post_id integer NOT NULL,
    photo_id integer NOT NULL
);


ALTER TABLE posts.photos OWNER TO postgres;

--
-- Name: posts; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    create_by integer NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL,
    publish_date timestamp with time zone NOT NULL,
    group_id integer NOT NULL,
    text text,
    status_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE posts.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: posts_status; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE posts_status (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE posts.posts_status OWNER TO postgres;

--
-- Name: posts_status_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE posts_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.posts_status_id_seq OWNER TO postgres;

--
-- Name: posts_status_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE posts_status_id_seq OWNED BY posts_status.id;


--
-- Name: users_answers; Type: TABLE; Schema: posts; Owner: postgres; Tablespace: 
--

CREATE TABLE users_answers (
    id integer NOT NULL,
    interview_id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE posts.users_answers OWNER TO postgres;

--
-- Name: users_answers_id_seq; Type: SEQUENCE; Schema: posts; Owner: postgres
--

CREATE SEQUENCE users_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts.users_answers_id_seq OWNER TO postgres;

--
-- Name: users_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: posts; Owner: postgres
--

ALTER SEQUENCE users_answers_id_seq OWNED BY users_answers.id;


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY interview_types ALTER COLUMN id SET DEFAULT nextval('interview_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY interviews ALTER COLUMN id SET DEFAULT nextval('interviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY posts_status ALTER COLUMN id SET DEFAULT nextval('posts_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: posts; Owner: postgres
--

ALTER TABLE ONLY users_answers ALTER COLUMN id SET DEFAULT nextval('users_answers_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY answers (id, text, interview_id) FROM stdin;
5	hello answer 1	8
6	hello answer 2	8
7	hello answer 1	9
8	hello answer 2	9
9	hello answer 1	10
10	hello answer 2	10
13	hello answer 1	12
14	hello answer 2	12
15	hello answer 1	13
16	hello answer 2	13
17	hello answer 1	14
18	hello answer 2	14
19	hello answer 1	15
20	hello answer 2	15
21	hello answer 1	16
22	hello answer 2	16
23	hello answer 1	17
24	hello answer 2	17
25	hello answer 1	18
26	hello answer 2	18
27	hello answer 1	19
28	hello answer 2	19
29	hello answer 1	20
30	hello answer 2	20
31	hello answer 1	21
32	hello answer 2	21
33	hello answer 1	22
34	hello answer 2	22
35	hello answer 1	23
36	hello answer 2	23
37	hello answer 1	24
38	hello answer 2	24
39	hello answer 1	25
40	hello answer 2	25
41	hello answer 1	26
42	hello answer 2	26
43	hello answer 1	27
44	hello answer 2	27
45	hello answer 1	28
46	hello answer 2	28
47	hello answer 1	29
48	hello answer 2	29
49	hello answer 1	30
50	hello answer 2	30
51	hello answer 1	31
52	hello answer 2	31
53	hello answer 1	32
54	hello answer 2	32
55	hello answer 1	33
56	hello answer 2	33
57	hello answer 1	34
58	hello answer 2	34
59	hello answer 1	35
60	hello answer 2	35
61	hello answer 1	36
62	hello answer 2	36
63	hello answer 1	37
64	hello answer 2	37
65	hello answer 1	38
66	hello answer 2	38
67	hello answer 1	39
68	hello answer 2	39
69	hello answer 1	40
70	hello answer 2	40
71	hello answer 1	41
72	hello answer 2	41
73	hello answer 1	42
74	hello answer 2	42
75	hello answer 1	43
76	hello answer 2	43
77	hello answer 1	45
78	hello answer 2	45
79	hello answer 1	46
80	hello answer 2	46
81	hello answer 1	47
82	hello answer 2	47
83	hello answer 1	50
84	hello answer 2	50
85	hello answer 1	51
86	hello answer 1	53
87	fuck	55
88	dont fuck	55
89	wede	56
90	wed	57
91	ewd	59
92	wed	59
93	dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd	70
94	вввв	97
95	ввваа	97
96	hello answer 1	98
97	hello answer 2	98
98	hello answer 1	99
99	hello answer 2	99
100	hello answer 1	100
101	hello answer 2	100
102	hello answer 1	101
103	hello answer 2	101
104	war1	102
105	kok2	102
106	да	108
107	нет	108
108	не знаю	108
109	да	111
110	нет	111
111	возможно	111
112	Var 1	115
113	Var 2	115
114	Var 3	116
115	Var 4	116
116	Var 3	117
117	Var 4	117
118	Var 3	118
119	Var 4	118
120	Var 3	120
121	Var 4	120
122	war1	121
123	kok2	121
124	war1	122
125	kok2	122
126	да	124
127	нет	124
128	возможно	124
129	war1	125
130	kok2	125
131	war1	126
132	kok2	126
133	war1	127
134	kok2	127
135	war1	128
136	kok2	128
137	war1	129
138	kok2	129
139	war1	130
140	kok2	130
141	war1	131
142	kok2	131
143	war1	134
144	kok2	134
145	war1	135
146	kok2	135
147	war1	136
148	kok2	136
149	wedew	137
150	dwede	137
151	var1	138
152	var2	138
153	var1	139
154	var2	139
155	war1de	140
156	kokwed2	140
157	var1	141
158	var2	141
159	war1	143
160	kok2	143
161	war1	144
162	kok2	144
163	war1	145
164	kok2	145
165	war1	147
166	kok2	147
167	war1	148
168	kok2	148
169	war1	149
170	kok2	149
171	war1	151
172	kok2	151
173	war1	152
174	kok2	152
175	war1	153
176	kok2	153
177	war1	154
178	kok2	154
179	war1	155
180	kok2	155
181	war1	156
182	kok2	156
183	war1	157
184	kok2	157
185	war1	158
186	kok2	158
187	war1	159
188	kok2	159
189	war1	160
190	kok2	160
191	war1	161
192	kok2	161
193	war1	162
194	kok2	162
195	war1	163
196	kok2	163
197	war1	164
198	kok2	164
199	war1	165
200	kok2	165
201	war1	166
202	kok2	166
203	war1dd	167
204	kok2	167
205	war1dd	168
206	kok2	168
207	war1dd	169
208	kok2	169
209	var1	170
210	var2	170
211	war1dd	171
212	kok2	171
213	war1dd	172
214	kok2	172
215	war1dd	173
216	kok2	173
217	war1dd	174
218	kok2	174
219	var1	175
220	var2	175
221	war1dd	176
222	kok2	176
223	war1dd	177
224	kok2	177
225	war1dd	178
226	kok2	178
227	war1dd	179
228	kok2	179
229	war1dd	180
230	kok2	180
231	Красный	186
232	Оранжевый	186
233	Зелёный	186
234	да	188
235	плохо	189
236	хорошо	189
237	Чёрное	190
238	Красное	190
239	Жёлтое	190
240	да	191
241	нет	191
242	да	193
243	нет	193
244	кисти	195
245	краски	195
246	масло	195
247	да	196
248	нет	196
249	сам скидывайся	196
250	war1dd	197
251	kok2	197
252	да	198
253	нет	198
254	да	199
255	нет	199
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('answers_id_seq', 255, true);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY currency (id, title) FROM stdin;
\.


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('currency_id_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY files (post_id, file_id) FROM stdin;
98	49
99	48
111	54
114	57
119	3
119	4
120	3
120	4
121	3
121	4
122	3
122	4
123	3
123	4
124	3
124	4
125	3
125	4
126	3
126	4
127	3
127	4
128	3
128	4
188	58
\.


--
-- Data for Name: interview_types; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY interview_types (id, text) FROM stdin;
\.


--
-- Name: interview_types_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('interview_types_id_seq', 1, false);


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY interviews (id, text, type, post_id) FROM stdin;
8	hello inteview	1	10
9	hello inteview	1	11
10	hello inteview	1	12
12	hello inteview	1	14
13	hello inteview	1	15
14	hello inteview	1	17
15	hello inteview	1	18
16	hello inteview	1	19
17	hello inteview	1	20
18	hello inteview	1	21
19	hello inteview	1	22
20	hello inteview	1	23
21	hello inteview	1	24
22	hello inteview	1	25
23	hello inteview	1	26
24	hello inteview	1	27
25	hello inteview	1	28
26	hello inteview	1	29
27	hello inteview	1	30
28	hello inteview	1	31
29	hello inteview	1	32
30	hello inteview	1	33
31	hello inteview	1	34
32	hello inteview	1	35
33	hello inteview	1	36
34	hello inteview	1	37
35	hello inteview	1	38
36	hello inteview	1	39
37	hello inteview	1	40
38	hello inteview	1	41
39	hello inteview	1	42
40	hello inteview	1	43
41	hello inteview	1	44
42	hello inteview	1	45
43	hello inteview	1	46
45	hello inteview	1	48
46	hello inteview	1	49
47	hello inteview	1	50
50		1	53
51		1	54
53		1	56
55	Fuck?	1	58
56	wedewe	1	59
57	wed	1	60
59	we	1	62
70		1	73
94		1	97
95	123	1	98
96		1	99
97	вввв	1	100
98	hello inteview	1	101
99	hello inteview	1	102
100	hello inteview	1	103
101	hello inteview	1	104
102	hello pop	1	105
103		1	106
104		1	107
105		1	108
106		1	109
107		1	110
108	Красиво живёте?	1	111
109		1	112
110		1	113
111	Хотите на море?	1	114
112		1	115
113		1	116
114		1	117
115	testtesttets	1	117
116	wefwefe	1	117
117	wefwefe	1	117
118	wefwefe	1	117
119		1	118
120	wefwefe	1	118
121	hello pop	1	0
122	hello pop	1	0
123		1	129
124	Красивый логотип?	1	130
125	hello pop	1	0
126	hello pop	1	0
127	hello pop	1	0
128	hello pop	1	0
129	hello pop	1	0
130	hello pop	1	0
131	hello pop	1	139
132	er	1	140
133		1	141
134	hferfer	1	142
135	hferfer	1	0
136	hferfer	1	0
137	wede	1	145
138	fuck	0	0
139	fuck2	0	0
140	eeeeee	1	146
141	fuck3	0	0
142		1	147
143	hello pop	1	148
144	hello pop	1	149
145	hello pop	1	150
146		1	151
147	hello pop	1	152
148	hello pop	1	153
149	hello pop	1	154
150		1	155
151	hello pop	1	162
152	hello pop	1	163
153	hello pop	1	165
154	hello pop	1	164
155	hello pop	1	166
156	hello pop	1	167
157	hello pop	1	168
158	hello pop	1	169
159	hello pop	1	170
161	hello pop	1	172
163	hello pop	1	174
160	hello pop	1	171
162	hello pop	1	173
164	hello pop	1	175
169	hello pop	1	123
170	fuck3	0	0
171	hello pop	1	179
172	hello pop	1	180
173	hello pop	1	123
174	hello pop	1	123
175	fuck3	0	0
176	hello pop	1	123
177	hello pop	1	123
178	hello pop	1	123
179	hello pop	1	182
180	hello pop	1	183
181		1	184
182		1	185
183		1	186
184		1	187
185		1	188
186	цвета для лого	2	189
187		1	190
188	Выбор	1	191
189	Как дела?	1	192
190	Какое море?	2	193
191	Вы можете взять мою собаку к себе на неделю?	1	194
192		1	195
193	новый опрос	1	196
194		1	197
195	Что купить?	2	198
196	Давайте скидываться с:	2	199
197	hello pop	1	123
198	Тестовый опрос	1	200
199	Очередной тестовый опрос	1	201
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('interviews_id_seq', 199, true);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY payments (id, cost, currency_id, post_id, requisite) FROM stdin;
3	300	1	10	
4	300	1	11	
5	300	1	12	
7	300	1	14	
8	300	1	15	
9	300	1	17	
10	300	1	18	
11	300	1	19	
12	300	1	20	
13	300	1	21	
14	300	1	22	
15	300	1	23	
16	300	1	24	
17	300	1	25	
18	300	1	26	
19	300	1	27	
20	300	1	28	
21	300	1	29	
22	300	1	30	
23	300	1	31	
24	300	1	32	
25	300	1	33	
26	300	1	34	
27	300	1	35	
28	300	1	36	
29	300	1	37	
30	300	1	38	
31	300	1	39	
32	300	1	40	
33	300	1	41	
34	300	1	42	
35	300	1	43	
36	300	1	44	
37	300	1	45	
38	300	1	46	
39	300	1	48	
40	300	1	49	
41	300	1	50	
42	300	1	53	
43	300	1	54	
44	300	1	56	
45	300	1	58	
46	300	1	59	
47	300	1	60	
48	300	1	62	
49	300	1	73	
50	300	1	97	
51	300	1	98	
52	300	1	99	
53	300	1	100	
54	300	1	101	
55	300	1	102	
56	300	1	103	
57	300	1	104	
58	500	2	105	
59	0	1	106	
60	0	1	107	
61	0	1	108	
62	1111	2	109	
63	0	1	110	
64	0	1	111	
65	0	1	112	
66	0	1	113	
67	2000	1	114	
68	1000	2	115	
69	0	1	116	
70	0	1	117	
71	0	1	118	
72	500	2	125	
73	500	2	128	
74	0	1	129	
75	50	1	130	
76	500	2	133	
77	500	2	135	
78	500	2	136	
79	500	2	137	
80	500	2	138	
81	500	2	139	
82	0	1	140	
83	0	1	141	
84	500	2	142	
85	500	2	143	
86	500	2	144	
87	0	1	145	
88	500	2	146	
89	0	1	147	
90	500	2	148	
91	500	2	149	
92	500	2	150	
93	0	1	151	
94	500	2	152	
95	500	2	153	
96	500	2	154	
97	0	1	155	
98	500	2	163	
99	500	2	165	
100	500	2	164	
101	500	2	169	
102	500	2	172	
103	500	2	176	
104	500	2	177	
105	500	2	178	
106	500	2	179	
107	500	2	180	
108	500	2	182	
109	500	2	183	
110	0	1	184	
111	0	1	185	
112	0	1	186	
113	0	1	187	
114	0	1	188	
115	0	1	189	
116	0	1	190	
117	0	1	191	
118	0	1	192	
119	0	1	193	
120	0	1	194	
121	200	1	195	89345678
122	0	1	196	
123	2000	2	197	8932323232
124	0	1	198	
125	2000	2	199	89167306488
126	0	1	200	
127	0	1	201	
\.


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('payments_id_seq', 127, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY photos (post_id, photo_id) FROM stdin;
98	107
99	106
106	110
111	112
114	114
114	115
116	145
116	146
119	9
119	10
120	9
120	10
121	9
121	10
122	9
122	10
123	9
123	10
124	9
124	10
125	9
125	10
126	9
126	10
127	9
127	10
128	9
128	10
129	147
130	149
189	165
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY posts (id, create_by, create_at, publish_date, group_id, text, status_id) FROM stdin;
105	1	2020-10-14 15:29:32.660416+03	2020-10-14 15:29:32.619394+03	1	LLLLLLLLop	2
163	1	2020-10-23 16:37:47.032979+03	2020-10-23 16:37:46.995202+03	1	LLLLLLLLop	2
107	1	2020-10-14 15:43:57.150029+03	2020-10-14 15:43:57.149823+03	1		2
108	1	2020-10-14 16:02:29.328604+03	2020-10-14 16:02:29.328324+03	1		2
109	1	2020-10-14 16:02:40.708463+03	2020-10-14 16:02:40.708294+03	1		2
110	1	2020-10-14 16:31:40.259897+03	2020-10-14 16:31:40.259589+03	1		2
111	1	2020-10-14 17:50:36.253299+03	2020-10-14 17:50:36.250019+03	1	Красиво жить не запретишь!	2
112	1	2020-10-14 18:00:04.79962+03	2020-10-14 18:00:04.799418+03	1	тест	2
113	1	2020-10-14 18:26:36.262342+03	2020-10-14 18:26:36.262147+03	1		2
114	1	2020-10-14 18:36:16.859426+03	2020-10-14 18:36:16.854896+03	1	Привет, мои хорошие, как дела? Что делаете?	2
115	1	2020-10-21 13:52:26.211508+03	2020-10-21 13:52:26.211351+03	1	Привет, мои дорогие и дешёвые!\nСегодня будем сбрасывать на сумочки	2
116	1	2020-10-21 13:53:25.029802+03	2020-10-21 13:53:25.026022+03	1		2
117	1	2020-10-21 16:16:07.310567+03	2020-10-21 16:16:07.310339+03	1	Пост для тестов ответов	2
118	1	2020-10-21 16:25:47.299632+03	2020-10-21 16:25:47.299457+03	1	Пост 2	2
119	1	2020-10-21 16:49:59.693176+03	2020-10-21 16:49:59.591399+03	1	LLLLLLLLop	1
120	1	2020-10-21 16:50:43.381326+03	2020-10-21 16:50:43.283962+03	1	LLLLLLLLop	1
121	1	2020-10-21 16:52:14.64294+03	2020-10-21 16:52:14.556268+03	1	LLLLLLLLop	1
122	1	2020-10-21 16:52:30.207739+03	2020-10-21 16:52:30.171851+03	1	LLLLLLLLop	1
123	1	2020-10-21 16:52:58.910495+03	2020-10-21 16:52:58.823177+03	1	LLLLLLLLop	1
124	1	2020-10-21 16:53:33.033823+03	2020-10-21 16:53:32.93412+03	1	LLLLLLLLop	1
125	1	2020-10-21 16:54:00.631417+03	2020-10-21 16:54:00.554554+03	1	LLLLLLLLop	2
126	1	2020-10-21 16:55:12.36904+03	2020-10-21 16:55:12.282965+03	1	LLLLLLLLop	1
127	1	2020-10-21 16:59:35.154198+03	2020-10-21 16:59:35.075758+03	1	LLLLLLLLop	1
128	1	2020-10-21 17:00:35.303854+03	2020-10-21 17:00:35.223172+03	1	LLLLLLLLop	2
129	1	2020-10-21 17:27:03.551752+03	2020-10-21 17:27:03.550092+03	1		2
130	1	2020-10-21 17:37:45.646497+03	2020-10-21 17:37:45.644781+03	1	Оцените лого!	2
131	1	2020-10-21 18:13:49.757573+03	2020-10-21 18:13:49.732516+03	1	LLLLLLLLop	1
132	1	2020-10-21 18:14:27.788985+03	2020-10-21 18:14:27.760461+03	1	LLLLLLLLop	1
133	1	2020-10-21 18:16:23.571067+03	2020-10-21 18:16:23.549706+03	1	LLLLLLLLop	2
134	1	2020-10-21 18:17:44.146897+03	2020-10-21 18:17:44.146609+03	1	LLLLLLLLop	1
135	1	2020-10-21 18:25:43.77932+03	2020-10-21 18:25:43.759743+03	1	LLLLLLLLop	2
136	1	2020-10-21 18:26:40.152478+03	2020-10-21 18:26:40.145403+03	1	LLLLLLLLop	2
137	1	2020-10-21 18:26:46.103371+03	2020-10-21 18:26:46.103522+03	1	LLLLLLLLop	2
138	1	2020-10-21 18:35:25.601217+03	2020-10-21 18:35:25.551202+03	1	222	2
139	1	2020-10-21 18:44:31.046363+03	2020-10-21 18:44:31.046161+03	1	222	2
140	1	2020-10-21 18:45:45.317131+03	2020-10-21 18:45:45.316963+03	1	ferfer	2
141	1	2020-10-21 18:46:18.524645+03	2020-10-21 18:46:18.52449+03	1	erfer	2
142	1	2020-10-21 18:46:39.060847+03	2020-10-21 18:46:39.060677+03	1	444444444	2
143	1	2020-10-21 18:48:18.62235+03	2020-10-21 18:48:18.598302+03	1	0000000	2
144	1	2020-10-21 18:49:39.330506+03	2020-10-21 18:49:39.328569+03	1	0000000	2
145	1	2020-10-21 18:50:46.780071+03	2020-10-21 18:50:46.779867+03	1	wedwedwedew	2
146	1	2020-10-21 18:57:57.416267+03	2020-10-21 18:57:57.397892+03	1	1111	2
147	1	2020-10-21 20:12:03.706898+03	2020-10-21 20:12:03.706604+03	1	edwe	2
148	1	2020-10-21 20:12:23.842224+03	2020-10-21 20:12:23.835806+03	1	LLLLLLLLop	2
149	1	2020-10-21 20:57:24.479646+03	2020-10-21 20:57:24.472407+03	1	LLLLLLLLop	2
150	1	2020-10-21 21:01:18.593646+03	2020-10-21 21:01:18.593268+03	1	LLLLLLLLop	2
151	1	2020-10-21 22:09:53.006255+03	2020-10-21 22:09:53.006073+03	1	ede	2
152	1	2020-10-21 22:10:08.044721+03	2020-10-21 22:10:08.044536+03	1	LLLLLLLLop	2
153	1	2020-10-21 22:53:45.690297+03	2020-10-21 22:53:45.690065+03	1	LLLLLLLLop	2
154	1	2020-10-21 22:53:48.927062+03	2020-10-21 22:53:48.926909+03	1	LLLLLLLLop	2
155	1	2020-10-22 13:54:28.671896+03	2020-10-22 13:54:28.671622+03	1		2
156	1	2020-10-23 15:24:12.15498+03	2020-10-23 15:24:12.145778+03	1	LLLLLLLLop	1
157	1	2020-10-23 16:30:07.073978+03	2020-10-23 16:30:07.030582+03	1	LLLLLLLLop	1
158	1	2020-10-23 16:32:03.717029+03	2020-10-23 16:32:03.705405+03	1	LLLLLLLLop	1
159	1	2020-10-23 16:33:31.367978+03	2020-10-23 16:33:31.352592+03	1	LLLLLLLLop	1
160	1	2020-10-23 16:35:30.290976+03	2020-10-23 16:35:30.28586+03	1	LLLLLLLLop	1
161	1	2020-10-23 16:36:16.683978+03	2020-10-23 16:36:16.67503+03	1	LLLLLLLLop	1
162	1	2020-10-23 16:36:55.367981+03	2020-10-23 16:36:55.358743+03	1	LLLLLLLLop	1
165	1	2020-10-23 16:59:08.547085+03	2020-10-23 16:59:08.481812+03	1	LLLLLLLLop	2
164	1	2020-10-23 16:59:08.547633+03	2020-10-23 16:59:08.481735+03	1	LLLLLLLLop	2
166	1	2020-10-23 17:00:28.367995+03	2020-10-23 17:00:28.35781+03	1	LLLLLLLLop	1
167	1	2020-10-23 17:01:36.054969+03	2020-10-23 17:01:36.017667+03	1	LLLLLLLLop	1
168	1	2020-10-23 17:02:15.378154+03	2020-10-23 17:02:15.340923+03	1	LLLLLLLLop	1
104	1	2020-10-14 15:17:53.094823+03	2020-10-14 15:17:53.072794+03	1	hello PPPPPPPP	2
169	1	2020-10-23 17:10:12.253973+03	2020-10-23 17:10:12.216721+03	1	LLLLLLLLop	2
170	1	2020-10-23 17:10:46.39289+03	2020-10-23 17:10:46.384662+03	1	LLLLLLLLop	1
171	1	2020-10-23 17:11:59.921978+03	2020-10-23 17:11:59.886439+03	1	LLLLLLLLop	1
172	1	2020-10-23 17:16:28.523019+03	2020-10-23 17:16:28.483325+03	1	LLLLLLLLop	2
173	1	2020-10-23 17:17:09.213345+03	2020-10-23 17:17:09.210464+03	1	LLLLLLLLop	1
174	1	2020-10-23 17:18:14.990827+03	2020-10-23 17:18:14.954371+03	1	LLLLLLLLop	1
175	1	2020-10-23 18:02:16.673994+03	2020-10-23 18:02:16.634128+03	1	LLLLLLLLop	1
176	1	2020-10-23 18:03:16.673988+03	2020-10-23 18:03:16.503877+03	1	Ohhhhh	2
177	1	2020-10-23 18:05:07.34098+03	2020-10-23 18:05:07.30296+03	1	Ohhhhh	2
178	1	2020-10-23 18:05:24.633971+03	2020-10-23 18:05:24.622491+03	1	Uhhhhh	2
179	1	2020-10-23 20:29:59.919786+03	2020-10-23 20:29:59.91959+03	1	Uhhhhh	2
180	1	2020-10-23 20:30:05.822495+03	2020-10-23 20:30:05.822338+03	1	Ohhhhh	2
181	1	2020-10-24 01:42:55.758951+03	2020-10-24 01:42:55.751099+03	1	Ohhhhh	1
182	1	2020-10-24 12:51:10.642448+03	2020-10-24 12:51:10.641709+03	1	Ohhhhh	2
183	1	2020-10-24 12:56:07.851531+03	2020-10-24 12:56:07.841399+03	1	Ohhhhh	2
184	1	2020-10-24 12:58:19.332506+03	2020-10-24 12:58:19.332337+03	1	ewfwe	2
185	1	2020-10-24 13:35:47.636233+03	2020-10-24 13:35:47.636028+03	1	ede	2
186	1	2020-10-24 13:43:16.176982+03	2020-10-24 13:43:16.176754+03	1		2
187	1	2020-10-24 16:01:04.105365+03	2020-10-24 16:01:04.105134+03	1	wed	2
188	1	2020-10-24 16:04:30.814032+03	2020-10-24 16:04:30.810628+03	1	ороор	2
189	1	2020-10-24 16:35:31.565984+03	2020-10-24 16:35:31.564041+03	1	Выбираем ЛУЧШИЕ цвета для лого	2
190	1	2020-10-24 16:41:57.705155+03	2020-10-24 16:41:57.705027+03	1		2
191	1	2020-10-24 18:13:47.013615+03	2020-10-24 18:13:47.013432+03	1		2
192	1	2020-10-24 18:20:36.313881+03	2020-10-24 18:20:36.313692+03	1		2
193	1	2020-10-24 18:25:51.005205+03	2020-10-24 18:25:50.987641+03	1	Хотели бы отдохнуть на море?	2
194	1	2020-10-24 18:29:49.797349+03	2020-10-24 18:29:49.797196+03	1	Уезжаю, некому оставить собаку!	2
195	1	2020-10-24 18:31:31.961384+03	2020-10-24 18:31:31.961216+03	1	Прекрасная погода для сбора денег	2
196	1	2020-10-24 18:46:51.476193+03	2020-10-24 18:46:51.475848+03	1		2
197	1	2020-10-24 18:48:40.123093+03	2020-10-24 18:48:40.122958+03	1		2
198	1	2020-10-24 18:54:08.450517+03	2020-10-24 18:54:08.450351+03	1		2
199	1	2020-10-24 19:01:01.039064+03	2020-10-24 19:01:01.038767+03	1	Скидываемся на отпуск?	2
200	1	2020-10-26 22:29:02.556829+03	2020-10-26 22:29:02.556588+03	1		2
201	1	2020-10-26 22:57:03.540986+03	2020-10-26 22:57:03.538398+03	1		2
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('posts_id_seq', 201, true);


--
-- Data for Name: posts_status; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY posts_status (id, title) FROM stdin;
1	Создаётся
2	Создан
\.


--
-- Name: posts_status_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('posts_status_id_seq', 1, true);


--
-- Data for Name: users_answers; Type: TABLE DATA; Schema: posts; Owner: postgres
--

COPY users_answers (id, interview_id, user_id, answer_id, post_id) FROM stdin;
1	8	1	5	10
2	8	1	5	10
3	140	1	0	146
4	8	1	5	10
5	8	1	5	10
6	8	1	5	10
7	8	1	5	10
8	8	1	5	10
9	8	1	5	10
10	8	1	5	10
11	3434	1	5	10
12	8	1	5	10
13	140	1	0	0
14	140	1	0	0
15	140	1	0	146
16	140	1	0	146
17	140	1	0	146
18	140	1	1	146
19	140	1	1	146
20	140	1	1	146
21	140	1	1	146
22	179	1	227	182
23	186	1	231	189
24	186	1	232	189
25	186	1	231	189
26	186	1	232	189
27	180	1	229	183
28	186	1	231	189
29	186	1	231	189
30	186	1	232	189
31	186	1	231	189
32	186	1	232	189
33	186	1	231	189
34	186	1	231	189
35	186	1	231	189
36	186	1	233	189
37	186	1	231	189
38	186	1	233	189
39	186	1	231	189
40	180	1	230	183
41	186	1	231	189
42	186	1	231	189
43	180	1	229	183
44	186	1	231	189
45	186	1	231	189
46	186	1	232	189
47	172	1	213	180
48	172	1	213	180
49	186	1	231	189
50	189	1	235	192
51	191	1	240	194
52	190	1	237	193
53	190	1	237	193
54	190	1	238	193
55	193	1	242	196
56	195	1	244	198
57	195	1	246	198
58	196	1	247	199
59	196	1	249	199
60	140	1	1	146
61	198	1	252	200
62	199	1	254	201
\.


--
-- Name: users_answers_id_seq; Type: SEQUENCE SET; Schema: posts; Owner: postgres
--

SELECT pg_catalog.setval('users_answers_id_seq', 62, true);


--
-- Name: answers_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pk PRIMARY KEY (id);


--
-- Name: currency_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- Name: interview_types_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interview_types
    ADD CONSTRAINT interview_types_pk PRIMARY KEY (id);


--
-- Name: interviews_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pk PRIMARY KEY (id);


--
-- Name: payments_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- Name: posts_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pk PRIMARY KEY (id);


--
-- Name: posts_status_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posts_status
    ADD CONSTRAINT posts_status_pk PRIMARY KEY (id);


--
-- Name: users_answers_pk; Type: CONSTRAINT; Schema: posts; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users_answers
    ADD CONSTRAINT users_answers_pk PRIMARY KEY (id);


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

