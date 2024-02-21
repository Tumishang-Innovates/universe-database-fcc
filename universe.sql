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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    hemisphere character varying(255) NOT NULL,
    visible_months text NOT NULL,
    area numeric(10,2) NOT NULL,
    mythology text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    estimated_stars integer NOT NULL,
    estimated_age numeric(10,2) NOT NULL
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
    name character varying(255) NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    is_geologically_active boolean NOT NULL,
    diameter integer NOT NULL,
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
    name character varying(255) NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    is_habitable boolean NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
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
    name character varying(255) NOT NULL,
    spectral_type character varying(255) NOT NULL,
    mass numeric(10,2) NOT NULL,
    temperature integer NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Northern', 'December to March', 594.00, 'In Greek mythology, Orion was a giant huntsman whom Zeus placed among the stars as the constellation of Orion.');
INSERT INTO public.constellation VALUES (2, 'Crux', 'Southern', 'April to September', 68.00, 'Crux is a constellation located in the southern sky in a bright portion of the Milky Way. It is the smallest of the 88 modern constellations.');
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Northern', 'March to November', 1280.00, 'In Greek mythology, Ursa Major represents the nymph Callisto, who was transformed into a bear by Zeus and then placed in the sky as the constellation by the god Hera.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 200000000, 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000, 10.10);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 400000000, 12.40);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 100000000, 13.20);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 500000000, 11.80);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 600000000, 12.50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 27.32, false, 3474, 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 0.32, false, 22, 2);
INSERT INTO public.moon VALUES (23, 'Deimos', 1.26, false, 12, 2);
INSERT INTO public.moon VALUES (24, 'Europa', 3.55, true, 3122, 8);
INSERT INTO public.moon VALUES (25, 'Ganymede', 7.15, true, 5268, 8);
INSERT INTO public.moon VALUES (26, 'Io', 1.77, true, 3643, 8);
INSERT INTO public.moon VALUES (27, 'Titan', 15.95, true, 5150, 12);
INSERT INTO public.moon VALUES (28, 'Enceladus', 1.37, true, 504, 12);
INSERT INTO public.moon VALUES (29, 'Triton', 5.88, true, 2706, 13);
INSERT INTO public.moon VALUES (30, 'Charon', 6.39, true, 1208, 14);
INSERT INTO public.moon VALUES (31, 'Kepler-1625b I', 287.40, false, 3240, 10);
INSERT INTO public.moon VALUES (32, 'Kepler-1625b II', 451.60, false, 2740, 10);
INSERT INTO public.moon VALUES (33, 'TRAPPIST-1b', 1.51, false, 750, 11);
INSERT INTO public.moon VALUES (34, 'TRAPPIST-1c', 2.42, false, 934, 11);
INSERT INTO public.moon VALUES (35, 'TRAPPIST-1d', 4.05, false, 1076, 11);
INSERT INTO public.moon VALUES (36, 'TRAPPIST-1e', 6.10, false, 1172, 11);
INSERT INTO public.moon VALUES (37, 'TRAPPIST-1f', 9.21, false, 1412, 11);
INSERT INTO public.moon VALUES (38, 'TRAPPIST-1g', 12.35, false, 1274, 11);
INSERT INTO public.moon VALUES (39, 'TRAPPIST-1h', 18.77, false, 1390, 11);
INSERT INTO public.moon VALUES (40, 'TRAPPIST-1i', 28.05, false, 1236, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, false, 0.39, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.62, false, 0.72, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, true, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.88, false, 1.52, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.86, false, 5.20, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 29.46, false, 9.58, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 84.01, false, 19.22, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 164.80, false, 30.05, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 130.23, true, 0.47, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 11.20, true, 0.05, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 4.05, true, 0.03, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', 28.15, true, 0.13, 4);
INSERT INTO public.planet VALUES (13, 'HD 40307 g', 197.80, true, 0.60, 5);
INSERT INTO public.planet VALUES (14, 'KOI-1686.01', 57.80, true, 0.49, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Procyon A', 'F5IV', 12345678.90, 6530, 1);
INSERT INTO public.star VALUES (2, 'Vega', 'A0V', 9876543.21, 9602, 1);
INSERT INTO public.star VALUES (3, 'Altair', 'A7V', 5432109.87, 7550, 1);
INSERT INTO public.star VALUES (4, 'Arcturus', 'K0III', 6543210.98, 4286, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M1-2Ia-Iab', 8765432.10, 3590, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'B8Ia', 9876543.21, 12100, 1);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON UPDATE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON UPDATE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

