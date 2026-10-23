--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (156, 'user', 0, 0);
INSERT INTO public.users VALUES (144, 'admin', 46, 9);
INSERT INTO public.users VALUES (153, 'user_1792758059498', 239, 0);
INSERT INTO public.users VALUES (152, 'user_1792758059499', 521, 12);
INSERT INTO public.users VALUES (150, 'user_1792757685122', 198, 44);
INSERT INTO public.users VALUES (148, 'user_1792757551257', 249, 0);
INSERT INTO public.users VALUES (157, 'user_1792758460799', 546, 17);
INSERT INTO public.users VALUES (160, 'user_1792758966759', 2, 351);
INSERT INTO public.users VALUES (151, 'Gandalf', 49, 11);
INSERT INTO public.users VALUES (159, 'user_1792758966760', 5, 148);
INSERT INTO public.users VALUES (147, 'user_1792757551258', 577, 39);
INSERT INTO public.users VALUES (146, 'user_1792757099534', 198, 0);
INSERT INTO public.users VALUES (149, 'user_1792757685123', 663, 0);
INSERT INTO public.users VALUES (162, 'user_1792759150536', 2, 563);
INSERT INTO public.users VALUES (161, 'user_1792759150537', 5, 509);
INSERT INTO public.users VALUES (145, 'user_1792757099535', 571, 153);
INSERT INTO public.users VALUES (154, 'user_1792758313231', 516, 22);
INSERT INTO public.users VALUES (155, 'user_1792758313230', 217, 0);
INSERT INTO public.users VALUES (158, 'user_1792758460798', 236, 0);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 162, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

