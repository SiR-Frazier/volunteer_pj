--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: project; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE project (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE project OWNER TO "Guest";

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_id_seq OWNER TO "Guest";

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE volunteer (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE volunteer OWNER TO "Guest";

--
-- Name: volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE volunteer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteer_id_seq OWNER TO "Guest";

--
-- Name: volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE volunteer_id_seq OWNED BY volunteer.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: volunteer id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY volunteer ALTER COLUMN id SET DEFAULT nextval('volunteer_id_seq'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY project (id, title) FROM stdin;
1	Teaching Kids to Code
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('project_id_seq', 1, true);


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY volunteer (id, name, project_id) FROM stdin;
1	Hannah	1
\.


--
-- Name: volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('volunteer_id_seq', 1, true);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: volunteer volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

