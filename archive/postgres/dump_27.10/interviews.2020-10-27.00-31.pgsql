--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: interviews; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA interviews;


ALTER SCHEMA interviews OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = interviews, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: interviews; Owner: postgres; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    text text NOT NULL,
    interview_id integer NOT NULL
);


ALTER TABLE interviews.answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: interviews; Owner: postgres
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interviews.answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: interviews; Owner: postgres
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: interview_types; Type: TABLE; Schema: interviews; Owner: postgres; Tablespace: 
--

CREATE TABLE interview_types (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE interviews.interview_types OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE; Schema: interviews; Owner: postgres
--

CREATE SEQUENCE interview_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interviews.interview_types_id_seq OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE OWNED BY; Schema: interviews; Owner: postgres
--

ALTER SEQUENCE interview_types_id_seq OWNED BY interview_types.id;


--
-- Name: interviews; Type: TABLE; Schema: interviews; Owner: postgres; Tablespace: 
--

CREATE TABLE interviews (
    id integer NOT NULL,
    text text NOT NULL,
    type integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE interviews.interviews OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: interviews; Owner: postgres
--

CREATE SEQUENCE interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interviews.interviews_id_seq OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: interviews; Owner: postgres
--

ALTER SEQUENCE interviews_id_seq OWNED BY interviews.id;


--
-- Name: users_answers; Type: TABLE; Schema: interviews; Owner: postgres; Tablespace: 
--

CREATE TABLE users_answers (
    interview_id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE interviews.users_answers OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    text text NOT NULL,
    interview_id integer NOT NULL
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: interview_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE interview_types (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.interview_types OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE interview_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interview_types_id_seq OWNER TO postgres;

--
-- Name: interview_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE interview_types_id_seq OWNED BY interview_types.id;


--
-- Name: interviews; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE interviews (
    id integer NOT NULL,
    text text NOT NULL,
    type integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.interviews OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE interviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interviews_id_seq OWNER TO postgres;

--
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE interviews_id_seq OWNED BY interviews.id;


--
-- Name: users_answers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_answers (
    id integer NOT NULL,
    interview_id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.users_answers OWNER TO postgres;

--
-- Name: users_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_answers_id_seq OWNER TO postgres;

--
-- Name: users_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_answers_id_seq OWNED BY users_answers.id;


SET search_path = interviews, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: interviews; Owner: postgres
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: interviews; Owner: postgres
--

ALTER TABLE ONLY interview_types ALTER COLUMN id SET DEFAULT nextval('interview_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: interviews; Owner: postgres
--

ALTER TABLE ONLY interviews ALTER COLUMN id SET DEFAULT nextval('interviews_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interview_types ALTER COLUMN id SET DEFAULT nextval('interview_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interviews ALTER COLUMN id SET DEFAULT nextval('interviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_answers ALTER COLUMN id SET DEFAULT nextval('users_answers_id_seq'::regclass);


SET search_path = interviews, pg_catalog;

--
-- Data for Name: answers; Type: TABLE DATA; Schema: interviews; Owner: postgres
--

COPY answers (id, text, interview_id) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: interviews; Owner: postgres
--

SELECT pg_catalog.setval('answers_id_seq', 1, false);


--
-- Data for Name: interview_types; Type: TABLE DATA; Schema: interviews; Owner: postgres
--

COPY interview_types (id, text) FROM stdin;
\.


--
-- Name: interview_types_id_seq; Type: SEQUENCE SET; Schema: interviews; Owner: postgres
--

SELECT pg_catalog.setval('interview_types_id_seq', 1, false);


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: interviews; Owner: postgres
--

COPY interviews (id, text, type, post_id) FROM stdin;
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: interviews; Owner: postgres
--

SELECT pg_catalog.setval('interviews_id_seq', 1, false);


--
-- Data for Name: users_answers; Type: TABLE DATA; Schema: interviews; Owner: postgres
--

COPY users_answers (interview_id, user_id, answer_id, post_id) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answers (id, text, interview_id) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('answers_id_seq', 1, false);


--
-- Data for Name: interview_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interview_types (id, text) FROM stdin;
\.


--
-- Name: interview_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interview_types_id_seq', 1, false);


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interviews (id, text, type, post_id) FROM stdin;
\.


--
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interviews_id_seq', 1, false);


--
-- Data for Name: users_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_answers (id, interview_id, user_id, answer_id, post_id) FROM stdin;
\.


--
-- Name: users_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_answers_id_seq', 1, false);


SET search_path = interviews, pg_catalog;

--
-- Name: answers_pk; Type: CONSTRAINT; Schema: interviews; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pk PRIMARY KEY (id);


--
-- Name: interview_types_pk; Type: CONSTRAINT; Schema: interviews; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interview_types
    ADD CONSTRAINT interview_types_pk PRIMARY KEY (id);


--
-- Name: interviews_pk; Type: CONSTRAINT; Schema: interviews; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pk PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: answers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pk PRIMARY KEY (id);


--
-- Name: interview_types_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interview_types
    ADD CONSTRAINT interview_types_pk PRIMARY KEY (id);


--
-- Name: interviews_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pk PRIMARY KEY (id);


--
-- Name: users_answers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
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

