--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: filmek; Type: TABLE; Schema: public; Owner: adesz
--

CREATE TABLE public.filmek (
    id integer NOT NULL,
    nev text NOT NULL,
    megjelenes_datum integer,
    kategoria text
);


ALTER TABLE public.filmek OWNER TO adesz;

--
-- Name: filmek_id_seq; Type: SEQUENCE; Schema: public; Owner: adesz
--

CREATE SEQUENCE public.filmek_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filmek_id_seq OWNER TO adesz;

--
-- Name: filmek_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adesz
--

ALTER SEQUENCE public.filmek_id_seq OWNED BY public.filmek.id;


--
-- Name: filmek id; Type: DEFAULT; Schema: public; Owner: adesz
--

ALTER TABLE ONLY public.filmek ALTER COLUMN id SET DEFAULT nextval('public.filmek_id_seq'::regclass);


--
-- Data for Name: filmek; Type: TABLE DATA; Schema: public; Owner: adesz
--

COPY public.filmek (id, nev, megjelenes_datum, kategoria) FROM stdin;
1	Szellemlovas	2010	Horror,Akció
2	Rambo - Első vér	1982	Akció,Kaland
3	Viana	2016	Gyerek,Kaland
4	Mitchelék a gépek ellen	2021	Vígjáték,Kaland
5	Free Guy	2021	Akció,Sci-fi
6	Szörnyella	2021	Vígjáték,Krimi
7	A kívánságsárkány	2021	Vígjáték,Fantasy
8	Fekete Özvegy	2021	Akció,Sci-fi
9	Nyomás utána!	1983	Vígjáték,Kaland
10	Rendőrakadémia	1984	Vígjáték,Krimi
11	A feláldozhatók	2010	Akció,Kaland
\.


--
-- Name: filmek_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adesz
--

SELECT pg_catalog.setval('public.filmek_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

