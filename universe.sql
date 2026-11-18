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
    name character varying(50) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    number_of_main_stars integer,
    is_zodiac boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    has_life boolean,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric(8,2),
    is_spherical boolean,
    description text,
    has_atmosphere boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    number_of_moons integer,
    distance_from_star numeric(12,3),
    has_life boolean,
    description text,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    has_planets boolean,
    description text
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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 7, false);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 7, false);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Cas', 5, false);
INSERT INTO public.constellation VALUES (4, 'Scorpius', 'Sco', 18, true);
INSERT INTO public.constellation VALUES (5, 'Leo', 'Leo', 9, true);
INSERT INTO public.constellation VALUES (6, 'Canis Major', 'CMa', 8, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.00, true, 'Home galaxy of the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.54, false, 'Nearest large galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2.73, false, 'Third largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 0.16, false, 'Satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23.00, false, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unbarred Spiral', 9000, 29.30, false, 'Galaxy with a bright nucleus and a large central bulge');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.32, true, 'Earth''s only natural satellite', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, 'Larger and closer moon of Mars', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, 'Smaller and farther moon of Mars', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, true, 'Most volcanically active body in the Solar System', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, 'Icy moon with a subsurface ocean', false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, true, 'Largest moon in the Solar System', false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, 'Heavily cratered moon of Jupiter', false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 15.95, true, 'Only moon with a dense atmosphere', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1.37, true, 'Icy moon with water geysers', false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 0.94, true, 'Moon with a giant impact crater', false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527, 4.52, true, 'Second largest moon of Saturn', false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123, 2.74, true, 'Icy moon of Saturn', false);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, 79.32, true, 'Moon with two differently colored hemispheres', false);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, 1.89, true, 'Icy moon with a huge canyon system', false);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577, 8.71, true, 'Largest moon of Uranus', false);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 13.46, true, 'Second largest moon of Uranus', false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 472, 1.41, true, 'Moon with extreme surface features', false);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, 2.52, true, 'Brightest moon of Uranus', false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1169, 4.14, true, 'Dark, heavily cratered moon of Uranus', false);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 5.88, true, 'Largest moon of Neptune with a retrograde orbit', true);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, 360.14, false, 'Moon of Neptune with a highly eccentric orbit', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0, 0.387, false, 'Smallest planet and closest to the Sun', true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0, 0.723, false, 'Hottest planet with a thick atmosphere', true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 1.000, true, 'The only known planet with life', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 2, 1.524, false, 'The red planet', true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 95, 5.203, false, 'Largest planet in the Solar System', true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 146, 9.537, false, 'Gas giant known for its rings', true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 28, 19.191, false, 'Ice giant that rotates on its side', true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 16, 30.069, false, 'Farthest planet from the Sun', true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 0, 0.049, false, 'Planet in the habitable zone of Proxima Centauri', true);
INSERT INTO public.planet VALUES (10, 'Proxima d', 4, 'Terrestrial', 0, 0.029, false, 'Small planet close to Proxima Centauri', true);
INSERT INTO public.planet VALUES (11, 'Sirius I', 2, 'Gas Giant', 4, 3.500, false, 'Placeholder gas giant orbiting Sirius', true);
INSERT INTO public.planet VALUES (12, 'Sirius II', 2, 'Terrestrial', 1, 1.200, false, 'Placeholder rocky planet orbiting Sirius', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 4600, 5772, true, 'The star at the center of the Solar System');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 242, 9940, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 10, 3600, false, 'Red supergiant in the constellation Orion');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 4850, 3042, true, 'Closest known star to the Sun');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue Supergiant', 8, 12100, false, 'Bright blue supergiant in Orion');
INSERT INTO public.star VALUES (6, 'Hubble V1', 2, 'Cepheid Variable', 100, 6000, false, 'Variable star used to measure the distance to Andromeda');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

