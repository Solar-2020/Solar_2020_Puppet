--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: authorization; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "authorization";


ALTER SCHEMA "authorization" OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "authorization", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: passwords; Type: TABLE; Schema: authorization; Owner: postgres; Tablespace: 
--

CREATE TABLE passwords (
    user_id integer NOT NULL,
    password_hash text NOT NULL,
    salt text NOT NULL,
    update_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE "authorization".passwords OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: authorization; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    cookie text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    create_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE "authorization".sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: authorization; Owner: postgres
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "authorization".sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: authorization; Owner: postgres
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: id; Type: DEFAULT; Schema: authorization; Owner: postgres
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Data for Name: passwords; Type: TABLE DATA; Schema: authorization; Owner: postgres
--

COPY passwords (user_id, password_hash, salt, update_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: authorization; Owner: postgres
--

COPY sessions (id, user_id, cookie, expiration, create_at) FROM stdin;
3	100	dwefwefwe	2020-10-28 01:23:13.329+03	2020-10-26 22:23:17.652982+03
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: authorization; Owner: postgres
--

SELECT pg_catalog.setval('sessions_id_seq', 4, true);


--
-- Name: passwords_pk; Type: CONSTRAINT; Schema: authorization; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY passwords
    ADD CONSTRAINT passwords_pk PRIMARY KEY (user_id);


--
-- Name: sessions_pk; Type: CONSTRAINT; Schema: authorization; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: sessions_cookie_uindex; Type: INDEX; Schema: authorization; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX sessions_cookie_uindex ON sessions USING btree (cookie);


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

