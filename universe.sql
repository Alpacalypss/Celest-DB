--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronomers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomers (
    astronomers_id integer NOT NULL,
    name character varying(20) NOT NULL,
    deceased boolean,
    planet_id integer
);


ALTER TABLE public.astronomers OWNER TO freecodecamp;

--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomers_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomers_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomers_astronomer_id_seq OWNED BY public.astronomers.astronomers_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_in_light_years integer,
    name character varying(20) NOT NULL,
    discovered_by character varying(50),
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_planet integer,
    gravity integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    habitable boolean,
    atmosphere text NOT NULL,
    gravity integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    lifespan numeric(4,1),
    discovered_by character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomers astronomers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers ALTER COLUMN astronomers_id SET DEFAULT nextval('public.astronomers_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomers VALUES (1, 'Galileo Galilei', true, 1);
INSERT INTO public.astronomers VALUES (2, 'Carl Sagan', true, 1);
INSERT INTO public.astronomers VALUES (3, 'Neil deGrasse Tyson', false, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0, 'Milky Way', 'Unknown', false);
INSERT INTO public.galaxy VALUES (2, 2537000, 'Andromeda', 'Simon Marius', true);
INSERT INTO public.galaxy VALUES (3, 3000000, 'Triangulum', 'Charles Messier', true);
INSERT INTO public.galaxy VALUES (4, 23000000, 'Whirlpool', 'Charles Messier', true);
INSERT INTO public.galaxy VALUES (5, 29000000, 'Sombrero', 'Pierre Mechain', true);
INSERT INTO public.galaxy VALUES (6, 21000000, 'Pinwheel', 'Pierre Mechain', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 2, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377, 0, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 0, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 18, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 870900, 13, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 15, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 13, 3);
INSERT INTO public.moon VALUES (8, 'Prox I', 5000, 1, 4);
INSERT INTO public.moon VALUES (9, 'Prox II', 6200, 1, 5);
INSERT INTO public.moon VALUES (10, 'Bet 1', 50000, 1, 6);
INSERT INTO public.moon VALUES (11, 'Bet 2', 120000, 2, 6);
INSERT INTO public.moon VALUES (12, 'Bet 3', 75000, 1, 7);
INSERT INTO public.moon VALUES (13, 'Sir 1', 30000, 3, 8);
INSERT INTO public.moon VALUES (14, 'Sir 2', 80000, 2, 8);
INSERT INTO public.moon VALUES (15, 'Rig 1', 150000, 2, 9);
INSERT INTO public.moon VALUES (16, 'Rig 2', 100000, 2, 10);
INSERT INTO public.moon VALUES (17, 'Rig 3', 200000, 1, 10);
INSERT INTO public.moon VALUES (18, 'Vega 1', 85000, 1, 11);
INSERT INTO public.moon VALUES (19, 'Vega 2', 120000, 2, 12);
INSERT INTO public.moon VALUES (20, 'Vega 3', 50000, 1, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Nitrogen-Oxygen', 9, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Carbon-Dioxide', 4, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Carbon-Dioxide', 9, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', true, 'Unknown', 9, 2);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', false, 'Unknown', 10, 2);
INSERT INTO public.planet VALUES (6, 'Betelgeuse I', false, 'Helium-Hydrogen', 5, 3);
INSERT INTO public.planet VALUES (7, 'Betelgeuse II', false, 'Helium-Hydrogen', 6, 3);
INSERT INTO public.planet VALUES (8, 'Sirius B I', false, 'Hydrogen-Helium', 10, 4);
INSERT INTO public.planet VALUES (9, 'Rigel I', false, 'Unknown', 15, 5);
INSERT INTO public.planet VALUES (10, 'Rigel II', false, 'Unknown', 12, 5);
INSERT INTO public.planet VALUES (11, 'Vega I', false, 'Unknown', 8, 6);
INSERT INTO public.planet VALUES (12, 'Vega II', false, 'Unknown', 7, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 10.0, 'Unknown', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.9, 'Robert Innes', 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8.5, 'Unknown', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 0.2, 'Unknown', 1);
INSERT INTO public.star VALUES (5, 'Rigel', 9.0, 'Unknown', 3);
INSERT INTO public.star VALUES (6, 'Vega', 0.5, 'Unknown', 1);


--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomers_astronomer_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomers astronomers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers
    ADD CONSTRAINT astronomers_name_key UNIQUE (name);


--
-- Name: astronomers astronomers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers
    ADD CONSTRAINT astronomers_pkey PRIMARY KEY (astronomers_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: astronomers astronomer_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomers
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon planet_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

