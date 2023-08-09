--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellar (
    constellar_id integer NOT NULL,
    constellation character varying(30),
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    galaxy character varying(30)
);


ALTER TABLE public.constellar OWNER TO freecodecamp;

--
-- Name: constellar_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellar_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellar_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellar_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellar_constellation_id_seq OWNED BY public.constellar.constellar_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    magnitude character varying(30),
    constellation character varying(30) NOT NULL,
    distance_mly character varying(20),
    size character varying(30),
    ngc character varying(20),
    messier character varying(20),
    caldwell character varying(20)
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
    name character varying(30) NOT NULL,
    planet character varying(30),
    description text,
    discovered character varying(15),
    discoverer character varying(150),
    "distance_from_planet(km)" integer,
    "diameter(km)" numeric,
    "orbital_period(days)" numeric,
    is_close_to_planet boolean,
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
    name character varying(30) NOT NULL,
    star character varying(30),
    distance numeric,
    discovery numeric,
    meaning text,
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
-- Name: planet_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_star (
    planet_star_id integer NOT NULL,
    planet character varying(30) NOT NULL,
    constellation character varying(30),
    star character varying(30),
    star_id integer,
    name character varying(30),
    is_milky_way boolean
);


ALTER TABLE public.planet_star OWNER TO freecodecamp;

--
-- Name: planet_star_pstar_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_pstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_pstar_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_pstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_pstar_id_seq OWNED BY public.planet_star.planet_star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    "bayern designation" character varying(50),
    designation character varying(30),
    "approval date" date,
    "years after approval" integer,
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
-- Name: constellar constellar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellar ALTER COLUMN constellar_id SET DEFAULT nextval('public.constellar_constellation_id_seq'::regclass);


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
-- Name: planet_star planet_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star ALTER COLUMN planet_star_id SET DEFAULT nextval('public.planet_star_pstar_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellar VALUES (1, 'Eridanus', 1, 'Acamar', -1, NULL);
INSERT INTO public.constellar VALUES (2, 'Eridanus', 2, 'Achernar', -1, NULL);
INSERT INTO public.constellar VALUES (3, 'Eridanus', 66, 'Angetenar', -1, NULL);
INSERT INTO public.constellar VALUES (4, 'Eridanus', 86, 'Azha', -1, NULL);
INSERT INTO public.constellar VALUES (5, 'Eridanus', 90, 'Beemim', -1, NULL);
INSERT INTO public.constellar VALUES (6, 'Eridanus', 91, 'Beid', -1, NULL);
INSERT INTO public.constellar VALUES (7, 'Eridanus', 114, 'Cursa', -1, NULL);
INSERT INTO public.constellar VALUES (8, 'Eridanus', 169, 'Keid', -1, NULL);
INSERT INTO public.constellar VALUES (9, 'Eridanus', 249, 'Ran', -1, NULL);
INSERT INTO public.constellar VALUES (10, 'Eridanus', 272, 'Sceptrum', -1, NULL);
INSERT INTO public.constellar VALUES (11, 'Eridanus', 303, 'Theemin', -1, NULL);
INSERT INTO public.constellar VALUES (12, 'Eridanus', 329, 'Zaurak', -1, NULL);
INSERT INTO public.constellar VALUES (13, 'Eridanus', 332, 'Zibal', -1, NULL);
INSERT INTO public.constellar VALUES (14, 'Cassiopeia', 3, 'Achird', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (15, 'Cassiopeia', 3, 'Achird', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (16, 'Cassiopeia', 101, 'Caph', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (17, 'Cassiopeia', 101, 'Caph', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (18, 'Cassiopeia', 103, 'Castula', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (19, 'Cassiopeia', 103, 'Castula', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (20, 'Cassiopeia', 138, 'Fulu', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (21, 'Cassiopeia', 138, 'Fulu', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (22, 'Cassiopeia', 259, 'Ruchbah', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (23, 'Cassiopeia', 259, 'Ruchbah', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (24, 'Cassiopeia', 274, 'Schedar', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (25, 'Cassiopeia', 274, 'Schedar', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (26, 'Cassiopeia', 276, 'Segin', 50, 'Maffei I');
INSERT INTO public.constellar VALUES (27, 'Cassiopeia', 276, 'Segin', 51, 'Maffei II');
INSERT INTO public.constellar VALUES (28, 'Scorpius', 4, 'Acrab', -1, NULL);
INSERT INTO public.constellar VALUES (29, 'Scorpius', 44, 'Alniyat', -1, NULL);
INSERT INTO public.constellar VALUES (30, 'Scorpius', 69, 'Antares', -1, NULL);
INSERT INTO public.constellar VALUES (31, 'Scorpius', 122, 'Dschubba', -1, NULL);
INSERT INTO public.constellar VALUES (32, 'Scorpius', 134, 'Fang', -1, NULL);
INSERT INTO public.constellar VALUES (33, 'Scorpius', 141, 'Fuyue', -1, NULL);
INSERT INTO public.constellar VALUES (34, 'Scorpius', 158, 'Iklil', -1, NULL);
INSERT INTO public.constellar VALUES (35, 'Scorpius', 162, 'Jabbah', -1, NULL);
INSERT INTO public.constellar VALUES (36, 'Scorpius', 177, 'Larawag', -1, NULL);
INSERT INTO public.constellar VALUES (37, 'Scorpius', 178, 'Lesath', -1, NULL);
INSERT INTO public.constellar VALUES (38, 'Scorpius', 231, 'Paikauhale', -1, NULL);
INSERT INTO public.constellar VALUES (39, 'Scorpius', 237, 'Pipirima', -1, NULL);
INSERT INTO public.constellar VALUES (40, 'Scorpius', 270, 'Sargas', -1, NULL);
INSERT INTO public.constellar VALUES (41, 'Scorpius', 279, 'Shaula', -1, NULL);
INSERT INTO public.constellar VALUES (42, 'Scorpius', 323, 'Xamidimura', -1, NULL);
INSERT INTO public.constellar VALUES (43, 'Crux', 5, 'Acrux', -1, NULL);
INSERT INTO public.constellar VALUES (44, 'Crux', 142, 'Gacrux', -1, NULL);
INSERT INTO public.constellar VALUES (45, 'Crux', 145, 'Ginan', -1, NULL);
INSERT INTO public.constellar VALUES (46, 'Crux', 159, 'Imai', -1, NULL);
INSERT INTO public.constellar VALUES (47, 'Crux', 205, 'Mimosa', -1, NULL);
INSERT INTO public.constellar VALUES (48, 'Cancer', 6, 'Acubens', -1, NULL);
INSERT INTO public.constellar VALUES (49, 'Cancer', 75, 'Asellus Australis', -1, NULL);
INSERT INTO public.constellar VALUES (50, 'Cancer', 76, 'Asellus Borealis', -1, NULL);
INSERT INTO public.constellar VALUES (51, 'Cancer', 111, 'Copernicus', -1, NULL);
INSERT INTO public.constellar VALUES (52, 'Cancer', 194, 'Meleph', -1, NULL);
INSERT INTO public.constellar VALUES (53, 'Cancer', 221, 'Nahn', -1, NULL);
INSERT INTO public.constellar VALUES (54, 'Cancer', 236, 'Piautos', -1, NULL);
INSERT INTO public.constellar VALUES (55, 'Cancer', 298, 'Tarf', -1, NULL);
INSERT INTO public.constellar VALUES (56, 'Cancer', 300, 'Tegmine', -1, NULL);
INSERT INTO public.constellar VALUES (57, 'Leo', 7, 'Adhafera', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (58, 'Leo', 7, 'Adhafera', 44, 'Leo I');
INSERT INTO public.constellar VALUES (59, 'Leo', 7, 'Adhafera', 45, 'Leo II');
INSERT INTO public.constellar VALUES (60, 'Leo', 7, 'Adhafera', 46, 'Leo III');
INSERT INTO public.constellar VALUES (61, 'Leo', 7, 'Adhafera', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (62, 'Leo', 27, 'Algieba', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (63, 'Leo', 27, 'Algieba', 44, 'Leo I');
INSERT INTO public.constellar VALUES (64, 'Leo', 27, 'Algieba', 45, 'Leo II');
INSERT INTO public.constellar VALUES (65, 'Leo', 27, 'Algieba', 46, 'Leo III');
INSERT INTO public.constellar VALUES (66, 'Leo', 27, 'Algieba', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (67, 'Leo', 59, 'Alterf', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (68, 'Leo', 59, 'Alterf', 44, 'Leo I');
INSERT INTO public.constellar VALUES (69, 'Leo', 59, 'Alterf', 45, 'Leo II');
INSERT INTO public.constellar VALUES (70, 'Leo', 59, 'Alterf', 46, 'Leo III');
INSERT INTO public.constellar VALUES (71, 'Leo', 59, 'Alterf', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (72, 'Leo', 110, 'Chertan', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (73, 'Leo', 110, 'Chertan', 44, 'Leo I');
INSERT INTO public.constellar VALUES (74, 'Leo', 110, 'Chertan', 45, 'Leo II');
INSERT INTO public.constellar VALUES (75, 'Leo', 110, 'Chertan', 46, 'Leo III');
INSERT INTO public.constellar VALUES (76, 'Leo', 110, 'Chertan', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (77, 'Leo', 119, 'Denebola', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (78, 'Leo', 119, 'Denebola', 44, 'Leo I');
INSERT INTO public.constellar VALUES (79, 'Leo', 119, 'Denebola', 45, 'Leo II');
INSERT INTO public.constellar VALUES (80, 'Leo', 119, 'Denebola', 46, 'Leo III');
INSERT INTO public.constellar VALUES (81, 'Leo', 119, 'Denebola', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (82, 'Leo', 250, 'Rasalas', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (83, 'Leo', 250, 'Rasalas', 44, 'Leo I');
INSERT INTO public.constellar VALUES (84, 'Leo', 250, 'Rasalas', 45, 'Leo II');
INSERT INTO public.constellar VALUES (85, 'Leo', 250, 'Rasalas', 46, 'Leo III');
INSERT INTO public.constellar VALUES (86, 'Leo', 250, 'Rasalas', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (87, 'Leo', 254, 'Regulus', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (88, 'Leo', 254, 'Regulus', 44, 'Leo I');
INSERT INTO public.constellar VALUES (89, 'Leo', 254, 'Regulus', 45, 'Leo II');
INSERT INTO public.constellar VALUES (90, 'Leo', 254, 'Regulus', 46, 'Leo III');
INSERT INTO public.constellar VALUES (91, 'Leo', 254, 'Regulus', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (92, 'Leo', 287, 'Subra', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (93, 'Leo', 287, 'Subra', 44, 'Leo I');
INSERT INTO public.constellar VALUES (94, 'Leo', 287, 'Subra', 45, 'Leo II');
INSERT INTO public.constellar VALUES (95, 'Leo', 287, 'Subra', 46, 'Leo III');
INSERT INTO public.constellar VALUES (96, 'Leo', 287, 'Subra', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (97, 'Leo', 333, 'Zosma', 22, 'Copeland Septet');
INSERT INTO public.constellar VALUES (98, 'Leo', 333, 'Zosma', 44, 'Leo I');
INSERT INTO public.constellar VALUES (99, 'Leo', 333, 'Zosma', 45, 'Leo II');
INSERT INTO public.constellar VALUES (100, 'Leo', 333, 'Zosma', 46, 'Leo III');
INSERT INTO public.constellar VALUES (101, 'Leo', 333, 'Zosma', 47, 'Leo Triplet');
INSERT INTO public.constellar VALUES (102, 'Canis Major', 8, 'Adhara', -1, NULL);
INSERT INTO public.constellar VALUES (103, 'Canis Major', 60, 'Aludra', -1, NULL);
INSERT INTO public.constellar VALUES (104, 'Canis Major', 140, 'Furud', -1, NULL);
INSERT INTO public.constellar VALUES (105, 'Canis Major', 213, 'Mirzam', -1, NULL);
INSERT INTO public.constellar VALUES (106, 'Canis Major', 217, 'Muliphein', -1, NULL);
INSERT INTO public.constellar VALUES (107, 'Canis Major', 282, 'Sirius', -1, NULL);
INSERT INTO public.constellar VALUES (108, 'Canis Major', 315, 'Unurgunite', -1, NULL);
INSERT INTO public.constellar VALUES (109, 'Canis Major', 321, 'Wezen', -1, NULL);
INSERT INTO public.constellar VALUES (110, 'Andromeda', 9, 'Adhil', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (111, 'Andromeda', 9, 'Adhil', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (112, 'Andromeda', 39, 'Almach', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (113, 'Andromeda', 39, 'Almach', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (114, 'Andromeda', 47, 'Alpheratz', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (115, 'Andromeda', 47, 'Alpheratz', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (116, 'Andromeda', 210, 'Mirach', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (117, 'Andromeda', 210, 'Mirach', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (118, 'Andromeda', 225, 'Nembus', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (119, 'Andromeda', 225, 'Nembus', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (120, 'Andromeda', 308, 'Titawin', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (121, 'Andromeda', 308, 'Titawin', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (122, 'Andromeda', 317, 'Veritate', 56, 'Messier 110');
INSERT INTO public.constellar VALUES (123, 'Andromeda', 317, 'Veritate', 57, 'Messier 32');
INSERT INTO public.constellar VALUES (124, 'Taurus', 10, 'Ain', -1, NULL);
INSERT INTO public.constellar VALUES (125, 'Taurus', 18, 'Alcyone', -1, NULL);
INSERT INTO public.constellar VALUES (126, 'Taurus', 19, 'Aldebaran', -1, NULL);
INSERT INTO public.constellar VALUES (127, 'Taurus', 82, 'Atlas', -1, NULL);
INSERT INTO public.constellar VALUES (128, 'Taurus', 105, 'Celaeno', -1, NULL);
INSERT INTO public.constellar VALUES (129, 'Taurus', 108, 'Chamukuy', -1, NULL);
INSERT INTO public.constellar VALUES (130, 'Taurus', 126, 'Electra', -1, NULL);
INSERT INTO public.constellar VALUES (131, 'Taurus', 129, 'Elnath', -1, NULL);
INSERT INTO public.constellar VALUES (132, 'Taurus', 184, 'Maia', -1, NULL);
INSERT INTO public.constellar VALUES (133, 'Taurus', 202, 'Merope', -1, NULL);
INSERT INTO public.constellar VALUES (134, 'Taurus', 238, 'Pleione', -1, NULL);
INSERT INTO public.constellar VALUES (135, 'Taurus', 245, 'Prima Hyadum', -1, NULL);
INSERT INTO public.constellar VALUES (136, 'Taurus', 275, 'Secunda Hyadum', -1, NULL);
INSERT INTO public.constellar VALUES (137, 'Taurus', 299, 'Taygeta', -1, NULL);
INSERT INTO public.constellar VALUES (138, 'Taurus', 306, 'Tianguan', -1, NULL);
INSERT INTO public.constellar VALUES (139, 'Sagittarius', 11, 'Ainalrami', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (140, 'Sagittarius', 11, 'Ainalrami', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (141, 'Sagittarius', 11, 'Ainalrami', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (142, 'Sagittarius', 11, 'Ainalrami', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (143, 'Sagittarius', 13, 'Albaldah', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (144, 'Sagittarius', 13, 'Albaldah', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (145, 'Sagittarius', 13, 'Albaldah', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (146, 'Sagittarius', 13, 'Albaldah', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (147, 'Sagittarius', 41, 'Alnasl', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (148, 'Sagittarius', 41, 'Alnasl', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (149, 'Sagittarius', 41, 'Alnasl', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (150, 'Sagittarius', 41, 'Alnasl', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (151, 'Sagittarius', 71, 'Arkab Posterior', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (152, 'Sagittarius', 71, 'Arkab Posterior', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (153, 'Sagittarius', 71, 'Arkab Posterior', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (154, 'Sagittarius', 71, 'Arkab Posterior', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (155, 'Sagittarius', 72, 'Arkab Prior', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (156, 'Sagittarius', 72, 'Arkab Prior', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (157, 'Sagittarius', 72, 'Arkab Prior', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (158, 'Sagittarius', 72, 'Arkab Prior', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (159, 'Sagittarius', 74, 'Ascella', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (160, 'Sagittarius', 74, 'Ascella', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (161, 'Sagittarius', 74, 'Ascella', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (162, 'Sagittarius', 74, 'Ascella', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (163, 'Sagittarius', 166, 'Kaus Australis', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (164, 'Sagittarius', 166, 'Kaus Australis', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (165, 'Sagittarius', 166, 'Kaus Australis', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (166, 'Sagittarius', 166, 'Kaus Australis', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (167, 'Sagittarius', 167, 'Kaus Borealis', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (168, 'Sagittarius', 167, 'Kaus Borealis', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (169, 'Sagittarius', 167, 'Kaus Borealis', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (170, 'Sagittarius', 167, 'Kaus Borealis', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (171, 'Sagittarius', 168, 'Kaus Media', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (172, 'Sagittarius', 168, 'Kaus Media', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (173, 'Sagittarius', 168, 'Kaus Media', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (174, 'Sagittarius', 168, 'Kaus Media', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (175, 'Sagittarius', 227, 'Nunki', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (176, 'Sagittarius', 227, 'Nunki', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (177, 'Sagittarius', 227, 'Nunki', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (178, 'Sagittarius', 227, 'Nunki', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (179, 'Sagittarius', 241, 'Polis', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (180, 'Sagittarius', 241, 'Polis', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (181, 'Sagittarius', 241, 'Polis', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (182, 'Sagittarius', 241, 'Polis', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (183, 'Sagittarius', 260, 'Rukbat', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (184, 'Sagittarius', 260, 'Rukbat', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (185, 'Sagittarius', 260, 'Rukbat', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (186, 'Sagittarius', 260, 'Rukbat', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (187, 'Sagittarius', 302, 'Terebellum', 5, 'Barnard''s Galaxy');
INSERT INTO public.constellar VALUES (188, 'Sagittarius', 302, 'Terebellum', 42, 'Kowal''s Object');
INSERT INTO public.constellar VALUES (189, 'Sagittarius', 302, 'Terebellum', 68, 'Sagittarius Dwarf');
INSERT INTO public.constellar VALUES (190, 'Sagittarius', 302, 'Terebellum', 93, 'Milky Way');
INSERT INTO public.constellar VALUES (191, 'Lyra', 12, 'Aladfar', -1, NULL);
INSERT INTO public.constellar VALUES (192, 'Lyra', 280, 'Sheliak', -1, NULL);
INSERT INTO public.constellar VALUES (193, 'Lyra', 289, 'Sulafat', -1, NULL);
INSERT INTO public.constellar VALUES (194, 'Lyra', 316, 'Vega', -1, NULL);
INSERT INTO public.constellar VALUES (195, 'Aquarius', 14, 'Albali', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (196, 'Aquarius', 14, 'Albali', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (197, 'Aquarius', 65, 'Ancha', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (198, 'Aquarius', 65, 'Ancha', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (199, 'Aquarius', 98, 'Bunda', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (200, 'Aquarius', 98, 'Bunda', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (201, 'Aquarius', 263, 'Sadachbia', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (202, 'Aquarius', 263, 'Sadachbia', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (203, 'Aquarius', 265, 'Sadalmelik', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (204, 'Aquarius', 265, 'Sadalmelik', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (205, 'Aquarius', 266, 'Sadalsuud', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (206, 'Aquarius', 266, 'Sadalsuud', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (207, 'Aquarius', 283, 'Situla', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (208, 'Aquarius', 283, 'Situla', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (209, 'Aquarius', 284, 'Skat', 2, 'Aquarius Dwarf');
INSERT INTO public.constellar VALUES (210, 'Aquarius', 284, 'Skat', 3, 'Atoms-for-Peace');
INSERT INTO public.constellar VALUES (211, 'Cygnus', 15, 'Albireo', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (212, 'Cygnus', 15, 'Albireo', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (213, 'Cygnus', 32, 'Aljanah', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (214, 'Cygnus', 32, 'Aljanah', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (215, 'Cygnus', 85, 'Azelfafage', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (216, 'Cygnus', 85, 'Azelfafage', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (217, 'Cygnus', 117, 'Deneb', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (218, 'Cygnus', 117, 'Deneb', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (219, 'Cygnus', 135, 'Fawaris', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (220, 'Cygnus', 135, 'Fawaris', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (221, 'Cygnus', 267, 'Sadr', 24, 'Cygnus A');
INSERT INTO public.constellar VALUES (222, 'Cygnus', 267, 'Sadr', 29, 'Fireworks Galaxy');
INSERT INTO public.constellar VALUES (223, 'Corvus', 16, 'Alchiba', 1, 'Antennae Galaxies');
INSERT INTO public.constellar VALUES (224, 'Corvus', 29, 'Algorab', 1, 'Antennae Galaxies');
INSERT INTO public.constellar VALUES (225, 'Corvus', 144, 'Gienah', 1, 'Antennae Galaxies');
INSERT INTO public.constellar VALUES (226, 'Corvus', 174, 'Kraz', 1, 'Antennae Galaxies');
INSERT INTO public.constellar VALUES (227, 'Ursa Major', 17, 'Alcor', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (228, 'Ursa Major', 17, 'Alcor', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (229, 'Ursa Major', 17, 'Alcor', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (230, 'Ursa Major', 17, 'Alcor', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (231, 'Ursa Major', 17, 'Alcor', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (232, 'Ursa Major', 17, 'Alcor', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (233, 'Ursa Major', 17, 'Alcor', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (234, 'Ursa Major', 17, 'Alcor', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (235, 'Ursa Major', 17, 'Alcor', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (236, 'Ursa Major', 17, 'Alcor', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (237, 'Ursa Major', 31, 'Alioth', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (238, 'Ursa Major', 31, 'Alioth', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (239, 'Ursa Major', 31, 'Alioth', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (240, 'Ursa Major', 31, 'Alioth', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (241, 'Ursa Major', 31, 'Alioth', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (242, 'Ursa Major', 31, 'Alioth', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (243, 'Ursa Major', 31, 'Alioth', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (244, 'Ursa Major', 31, 'Alioth', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (245, 'Ursa Major', 31, 'Alioth', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (246, 'Ursa Major', 31, 'Alioth', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (247, 'Ursa Major', 33, 'Alkaid', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (248, 'Ursa Major', 33, 'Alkaid', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (249, 'Ursa Major', 33, 'Alkaid', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (250, 'Ursa Major', 33, 'Alkaid', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (251, 'Ursa Major', 33, 'Alkaid', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (252, 'Ursa Major', 33, 'Alkaid', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (253, 'Ursa Major', 33, 'Alkaid', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (254, 'Ursa Major', 33, 'Alkaid', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (255, 'Ursa Major', 33, 'Alkaid', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (256, 'Ursa Major', 33, 'Alkaid', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (257, 'Ursa Major', 35, 'Alkaphrah', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (258, 'Ursa Major', 35, 'Alkaphrah', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (259, 'Ursa Major', 35, 'Alkaphrah', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (260, 'Ursa Major', 35, 'Alkaphrah', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (261, 'Ursa Major', 35, 'Alkaphrah', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (262, 'Ursa Major', 35, 'Alkaphrah', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (263, 'Ursa Major', 35, 'Alkaphrah', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (264, 'Ursa Major', 35, 'Alkaphrah', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (265, 'Ursa Major', 35, 'Alkaphrah', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (266, 'Ursa Major', 35, 'Alkaphrah', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (267, 'Ursa Major', 61, 'Alula Australis', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (268, 'Ursa Major', 61, 'Alula Australis', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (269, 'Ursa Major', 61, 'Alula Australis', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (270, 'Ursa Major', 61, 'Alula Australis', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (271, 'Ursa Major', 61, 'Alula Australis', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (272, 'Ursa Major', 61, 'Alula Australis', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (273, 'Ursa Major', 61, 'Alula Australis', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (274, 'Ursa Major', 61, 'Alula Australis', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (275, 'Ursa Major', 61, 'Alula Australis', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (276, 'Ursa Major', 61, 'Alula Australis', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (277, 'Ursa Major', 62, 'Alula Borealis', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (278, 'Ursa Major', 62, 'Alula Borealis', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (279, 'Ursa Major', 62, 'Alula Borealis', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (280, 'Ursa Major', 62, 'Alula Borealis', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (281, 'Ursa Major', 62, 'Alula Borealis', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (282, 'Ursa Major', 62, 'Alula Borealis', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (283, 'Ursa Major', 62, 'Alula Borealis', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (284, 'Ursa Major', 62, 'Alula Borealis', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (285, 'Ursa Major', 62, 'Alula Borealis', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (286, 'Ursa Major', 62, 'Alula Borealis', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (287, 'Ursa Major', 107, 'Chalawan', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (288, 'Ursa Major', 107, 'Chalawan', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (289, 'Ursa Major', 107, 'Chalawan', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (290, 'Ursa Major', 107, 'Chalawan', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (291, 'Ursa Major', 107, 'Chalawan', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (292, 'Ursa Major', 107, 'Chalawan', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (293, 'Ursa Major', 107, 'Chalawan', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (294, 'Ursa Major', 107, 'Chalawan', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (295, 'Ursa Major', 107, 'Chalawan', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (296, 'Ursa Major', 107, 'Chalawan', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (297, 'Ursa Major', 123, 'Dubhe', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (298, 'Ursa Major', 123, 'Dubhe', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (299, 'Ursa Major', 123, 'Dubhe', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (300, 'Ursa Major', 123, 'Dubhe', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (301, 'Ursa Major', 123, 'Dubhe', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (302, 'Ursa Major', 123, 'Dubhe', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (303, 'Ursa Major', 123, 'Dubhe', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (304, 'Ursa Major', 123, 'Dubhe', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (305, 'Ursa Major', 123, 'Dubhe', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (306, 'Ursa Major', 123, 'Dubhe', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (307, 'Ursa Major', 160, 'Intercrus', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (308, 'Ursa Major', 160, 'Intercrus', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (309, 'Ursa Major', 160, 'Intercrus', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (310, 'Ursa Major', 160, 'Intercrus', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (311, 'Ursa Major', 160, 'Intercrus', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (312, 'Ursa Major', 160, 'Intercrus', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (313, 'Ursa Major', 160, 'Intercrus', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (314, 'Ursa Major', 160, 'Intercrus', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (315, 'Ursa Major', 160, 'Intercrus', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (316, 'Ursa Major', 160, 'Intercrus', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (317, 'Ursa Major', 191, 'Megrez', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (318, 'Ursa Major', 191, 'Megrez', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (319, 'Ursa Major', 191, 'Megrez', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (320, 'Ursa Major', 191, 'Megrez', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (321, 'Ursa Major', 191, 'Megrez', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (322, 'Ursa Major', 191, 'Megrez', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (323, 'Ursa Major', 191, 'Megrez', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (324, 'Ursa Major', 191, 'Megrez', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (325, 'Ursa Major', 191, 'Megrez', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (326, 'Ursa Major', 191, 'Megrez', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (327, 'Ursa Major', 199, 'Merak', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (328, 'Ursa Major', 199, 'Merak', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (329, 'Ursa Major', 199, 'Merak', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (330, 'Ursa Major', 199, 'Merak', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (331, 'Ursa Major', 199, 'Merak', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (332, 'Ursa Major', 199, 'Merak', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (333, 'Ursa Major', 199, 'Merak', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (334, 'Ursa Major', 199, 'Merak', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (335, 'Ursa Major', 199, 'Merak', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (336, 'Ursa Major', 199, 'Merak', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (337, 'Ursa Major', 215, 'Mizar', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (338, 'Ursa Major', 215, 'Mizar', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (339, 'Ursa Major', 215, 'Mizar', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (340, 'Ursa Major', 215, 'Mizar', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (341, 'Ursa Major', 215, 'Mizar', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (342, 'Ursa Major', 215, 'Mizar', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (343, 'Ursa Major', 215, 'Mizar', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (344, 'Ursa Major', 215, 'Mizar', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (345, 'Ursa Major', 215, 'Mizar', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (346, 'Ursa Major', 215, 'Mizar', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (347, 'Ursa Major', 219, 'Muscida', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (348, 'Ursa Major', 219, 'Muscida', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (349, 'Ursa Major', 219, 'Muscida', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (350, 'Ursa Major', 219, 'Muscida', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (351, 'Ursa Major', 219, 'Muscida', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (352, 'Ursa Major', 219, 'Muscida', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (353, 'Ursa Major', 219, 'Muscida', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (354, 'Ursa Major', 219, 'Muscida', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (355, 'Ursa Major', 219, 'Muscida', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (356, 'Ursa Major', 219, 'Muscida', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (357, 'Ursa Major', 234, 'Phecda', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (358, 'Ursa Major', 234, 'Phecda', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (359, 'Ursa Major', 234, 'Phecda', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (360, 'Ursa Major', 234, 'Phecda', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (361, 'Ursa Major', 234, 'Phecda', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (362, 'Ursa Major', 234, 'Phecda', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (363, 'Ursa Major', 234, 'Phecda', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (364, 'Ursa Major', 234, 'Phecda', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (365, 'Ursa Major', 234, 'Phecda', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (366, 'Ursa Major', 234, 'Phecda', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (367, 'Ursa Major', 292, 'Taiyangshou', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (368, 'Ursa Major', 292, 'Taiyangshou', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (369, 'Ursa Major', 292, 'Taiyangshou', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (370, 'Ursa Major', 292, 'Taiyangshou', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (371, 'Ursa Major', 292, 'Taiyangshou', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (372, 'Ursa Major', 292, 'Taiyangshou', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (373, 'Ursa Major', 292, 'Taiyangshou', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (374, 'Ursa Major', 292, 'Taiyangshou', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (375, 'Ursa Major', 292, 'Taiyangshou', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (376, 'Ursa Major', 292, 'Taiyangshou', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (377, 'Ursa Major', 294, 'Talitha', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (378, 'Ursa Major', 294, 'Talitha', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (379, 'Ursa Major', 294, 'Talitha', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (380, 'Ursa Major', 294, 'Talitha', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (381, 'Ursa Major', 294, 'Talitha', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (382, 'Ursa Major', 294, 'Talitha', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (383, 'Ursa Major', 294, 'Talitha', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (384, 'Ursa Major', 294, 'Talitha', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (385, 'Ursa Major', 294, 'Talitha', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (386, 'Ursa Major', 294, 'Talitha', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (387, 'Ursa Major', 295, 'Tania Australis', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (388, 'Ursa Major', 295, 'Tania Australis', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (389, 'Ursa Major', 295, 'Tania Australis', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (390, 'Ursa Major', 295, 'Tania Australis', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (391, 'Ursa Major', 295, 'Tania Australis', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (392, 'Ursa Major', 295, 'Tania Australis', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (393, 'Ursa Major', 295, 'Tania Australis', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (394, 'Ursa Major', 295, 'Tania Australis', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (395, 'Ursa Major', 295, 'Tania Australis', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (396, 'Ursa Major', 295, 'Tania Australis', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (397, 'Ursa Major', 296, 'Tania Borealis', 8, 'Bode''s Galaxy');
INSERT INTO public.constellar VALUES (398, 'Ursa Major', 296, 'Tania Borealis', 16, 'Cigar Galaxy');
INSERT INTO public.constellar VALUES (399, 'Ursa Major', 296, 'Tania Borealis', 18, 'Coddington''s Nebula');
INSERT INTO public.constellar VALUES (400, 'Ursa Major', 296, 'Tania Borealis', 35, 'Helix Galaxy');
INSERT INTO public.constellar VALUES (401, 'Ursa Major', 296, 'Tania Borealis', 41, 'Keenan''s System');
INSERT INTO public.constellar VALUES (402, 'Ursa Major', 296, 'Tania Borealis', 53, 'Mayall''s Object');
INSERT INTO public.constellar VALUES (403, 'Ursa Major', 296, 'Tania Borealis', 55, 'Medusa Merger');
INSERT INTO public.constellar VALUES (404, 'Ursa Major', 296, 'Tania Borealis', 64, 'Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (405, 'Ursa Major', 296, 'Tania Borealis', 85, 'The Guitar');
INSERT INTO public.constellar VALUES (406, 'Ursa Major', 296, 'Tania Borealis', 90, 'Whirlpool Galaxy');
INSERT INTO public.constellar VALUES (407, 'Cepheus', 20, 'Alderamin', -1, NULL);
INSERT INTO public.constellar VALUES (408, 'Cepheus', 24, 'Alfirk', -1, NULL);
INSERT INTO public.constellar VALUES (409, 'Cepheus', 132, 'Errai', -1, NULL);
INSERT INTO public.constellar VALUES (410, 'Cepheus', 175, 'Kurhah', -1, NULL);
INSERT INTO public.constellar VALUES (411, 'Grus', 21, 'Aldhanab', 33, 'Grus Quartet');
INSERT INTO public.constellar VALUES (412, 'Grus', 40, 'Alnair', 33, 'Grus Quartet');
INSERT INTO public.constellar VALUES (413, 'Grus', 305, 'Tiaki', 33, 'Grus Quartet');
INSERT INTO public.constellar VALUES (414, 'Draco', 22, 'Aldhibah', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (415, 'Draco', 22, 'Aldhibah', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (416, 'Draco', 22, 'Aldhibah', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (417, 'Draco', 22, 'Aldhibah', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (418, 'Draco', 49, 'Alrakis', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (419, 'Draco', 49, 'Alrakis', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (420, 'Draco', 49, 'Alrakis', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (421, 'Draco', 49, 'Alrakis', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (422, 'Draco', 51, 'Alruba', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (423, 'Draco', 51, 'Alruba', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (424, 'Draco', 51, 'Alruba', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (425, 'Draco', 51, 'Alruba', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (426, 'Draco', 52, 'Alsafi', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (427, 'Draco', 52, 'Alsafi', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (428, 'Draco', 52, 'Alsafi', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (429, 'Draco', 52, 'Alsafi', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (430, 'Draco', 58, 'Altais', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (431, 'Draco', 58, 'Altais', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (432, 'Draco', 58, 'Altais', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (433, 'Draco', 58, 'Altais', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (434, 'Draco', 80, 'Athebyne', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (435, 'Draco', 80, 'Athebyne', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (436, 'Draco', 80, 'Athebyne', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (437, 'Draco', 80, 'Athebyne', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (438, 'Draco', 124, 'Dziban', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (439, 'Draco', 124, 'Dziban', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (440, 'Draco', 124, 'Dziban', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (441, 'Draco', 124, 'Dziban', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (442, 'Draco', 125, 'Edasich', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (443, 'Draco', 125, 'Edasich', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (444, 'Draco', 125, 'Edasich', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (445, 'Draco', 125, 'Edasich', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (446, 'Draco', 130, 'Eltanin', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (447, 'Draco', 130, 'Eltanin', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (448, 'Draco', 130, 'Eltanin', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (449, 'Draco', 130, 'Eltanin', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (450, 'Draco', 133, 'Fafnir', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (451, 'Draco', 133, 'Fafnir', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (452, 'Draco', 133, 'Fafnir', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (453, 'Draco', 133, 'Fafnir', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (454, 'Draco', 143, 'Giausar', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (455, 'Draco', 143, 'Giausar', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (456, 'Draco', 143, 'Giausar', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (457, 'Draco', 143, 'Giausar', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (458, 'Draco', 147, 'Grumium', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (459, 'Draco', 147, 'Grumium', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (460, 'Draco', 147, 'Grumium', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (461, 'Draco', 147, 'Grumium', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (462, 'Draco', 253, 'Rastaban', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (463, 'Draco', 253, 'Rastaban', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (464, 'Draco', 253, 'Rastaban', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (465, 'Draco', 253, 'Rastaban', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (466, 'Draco', 293, 'Taiyi', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (467, 'Draco', 293, 'Taiyi', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (468, 'Draco', 293, 'Taiyi', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (469, 'Draco', 293, 'Taiyi', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (470, 'Draco', 304, 'Thuban', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (471, 'Draco', 304, 'Thuban', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (472, 'Draco', 304, 'Thuban', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (473, 'Draco', 304, 'Thuban', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (474, 'Draco', 307, 'Tianyi', 25, 'Draco Dwarf');
INSERT INTO public.constellar VALUES (475, 'Draco', 307, 'Tianyi', 78, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (476, 'Draco', 307, 'Tianyi', 79, 'Spindle Galaxy');
INSERT INTO public.constellar VALUES (477, 'Draco', 307, 'Tianyi', 84, 'Tadpole Galaxy');
INSERT INTO public.constellar VALUES (478, 'Delphinus', 23, 'Aldulfin', -1, NULL);
INSERT INTO public.constellar VALUES (479, 'Delphinus', 220, 'Musica', -1, NULL);
INSERT INTO public.constellar VALUES (480, 'Delphinus', 258, 'Rotanev', -1, NULL);
INSERT INTO public.constellar VALUES (481, 'Delphinus', 286, 'Sualocin', -1, NULL);
INSERT INTO public.constellar VALUES (482, 'Capricornus', 25, 'Algedi', -1, NULL);
INSERT INTO public.constellar VALUES (483, 'Capricornus', 56, 'Alshat', -1, NULL);
INSERT INTO public.constellar VALUES (484, 'Capricornus', 115, 'Dabih', -1, NULL);
INSERT INTO public.constellar VALUES (485, 'Capricornus', 118, 'Deneb Algedi', -1, NULL);
INSERT INTO public.constellar VALUES (486, 'Capricornus', 223, 'Nashira', -1, NULL);
INSERT INTO public.constellar VALUES (487, 'Pegasus', 26, 'Algenib', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (488, 'Pegasus', 26, 'Algenib', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (489, 'Pegasus', 26, 'Algenib', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (490, 'Pegasus', 36, 'Alkarab', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (491, 'Pegasus', 36, 'Alkarab', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (492, 'Pegasus', 36, 'Alkarab', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (493, 'Pegasus', 95, 'Biham', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (494, 'Pegasus', 95, 'Biham', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (495, 'Pegasus', 95, 'Biham', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (496, 'Pegasus', 131, 'Enif', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (497, 'Pegasus', 131, 'Enif', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (498, 'Pegasus', 131, 'Enif', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (499, 'Pegasus', 155, 'Helvetios', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (500, 'Pegasus', 155, 'Helvetios', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (501, 'Pegasus', 155, 'Helvetios', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (502, 'Pegasus', 157, 'Homam', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (503, 'Pegasus', 157, 'Homam', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (504, 'Pegasus', 157, 'Homam', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (505, 'Pegasus', 186, 'Markab', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (506, 'Pegasus', 186, 'Markab', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (507, 'Pegasus', 186, 'Markab', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (508, 'Pegasus', 189, 'Matar', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (509, 'Pegasus', 189, 'Matar', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (510, 'Pegasus', 189, 'Matar', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (511, 'Pegasus', 264, 'Sadalbari', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (512, 'Pegasus', 264, 'Sadalbari', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (513, 'Pegasus', 264, 'Sadalbari', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (514, 'Pegasus', 269, 'Salm', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (515, 'Pegasus', 269, 'Salm', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (516, 'Pegasus', 269, 'Salm', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (517, 'Pegasus', 273, 'Scheat', 49, 'Little Sombrero Galaxy');
INSERT INTO public.constellar VALUES (518, 'Pegasus', 273, 'Scheat', 61, 'Pegasus Dwarf');
INSERT INTO public.constellar VALUES (519, 'Pegasus', 273, 'Scheat', 82, 'Stephan''s Quintet');
INSERT INTO public.constellar VALUES (520, 'Perseus', 28, 'Algol', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (521, 'Perseus', 81, 'Atik', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (522, 'Perseus', 198, 'Menkib', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (523, 'Perseus', 211, 'Miram', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (524, 'Perseus', 212, 'Mirfak', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (525, 'Perseus', 214, 'Misam', 62, 'Perseus A');
INSERT INTO public.constellar VALUES (526, 'Gemini', 30, 'Alhena', -1, NULL);
INSERT INTO public.constellar VALUES (527, 'Gemini', 64, 'Alzirr', -1, NULL);
INSERT INTO public.constellar VALUES (528, 'Gemini', 102, 'Castor', -1, NULL);
INSERT INTO public.constellar VALUES (529, 'Gemini', 163, 'Jishui', -1, NULL);
INSERT INTO public.constellar VALUES (530, 'Gemini', 190, 'Mebsuta', -1, NULL);
INSERT INTO public.constellar VALUES (531, 'Gemini', 193, 'Mekbuda', -1, NULL);
INSERT INTO public.constellar VALUES (532, 'Gemini', 242, 'Pollux', -1, NULL);
INSERT INTO public.constellar VALUES (533, 'Gemini', 247, 'Propus', -1, NULL);
INSERT INTO public.constellar VALUES (534, 'Gemini', 301, 'Tejat', -1, NULL);
INSERT INTO public.constellar VALUES (535, 'Gemini', 319, 'Wasat', -1, NULL);
INSERT INTO public.constellar VALUES (536, 'Bootes', 34, 'Alkalurops', -1, NULL);
INSERT INTO public.constellar VALUES (537, 'Bootes', 70, 'Arcturus', -1, NULL);
INSERT INTO public.constellar VALUES (538, 'Bootes', 161, 'Izar', -1, NULL);
INSERT INTO public.constellar VALUES (539, 'Bootes', 200, 'Merga', -1, NULL);
INSERT INTO public.constellar VALUES (540, 'Bootes', 218, 'Muphrid', -1, NULL);
INSERT INTO public.constellar VALUES (541, 'Bootes', 224, 'Nekkar', -1, NULL);
INSERT INTO public.constellar VALUES (542, 'Bootes', 277, 'Seginus', -1, NULL);
INSERT INTO public.constellar VALUES (543, 'Bootes', 324, 'Xuange', -1, NULL);
INSERT INTO public.constellar VALUES (544, 'Crater', 37, 'Alkes', -1, NULL);
INSERT INTO public.constellar VALUES (545, 'Auriga', 38, 'Almaaz', -1, NULL);
INSERT INTO public.constellar VALUES (546, 'Auriga', 100, 'Capella', -1, NULL);
INSERT INTO public.constellar VALUES (547, 'Auriga', 151, 'Haedus', -1, NULL);
INSERT INTO public.constellar VALUES (548, 'Auriga', 153, 'Hassaleh', -1, NULL);
INSERT INTO public.constellar VALUES (549, 'Auriga', 183, 'Mahasim', -1, NULL);
INSERT INTO public.constellar VALUES (550, 'Auriga', 195, 'Menkalinan', -1, NULL);
INSERT INTO public.constellar VALUES (551, 'Auriga', 262, 'Saclateni', -1, NULL);
INSERT INTO public.constellar VALUES (552, 'Orion', 42, 'Alnilam', -1, NULL);
INSERT INTO public.constellar VALUES (553, 'Orion', 43, 'Alnitak', -1, NULL);
INSERT INTO public.constellar VALUES (554, 'Orion', 92, 'Bellatrix', -1, NULL);
INSERT INTO public.constellar VALUES (555, 'Orion', 93, 'Betelgeuse', -1, NULL);
INSERT INTO public.constellar VALUES (556, 'Orion', 154, 'Hatysa', -1, NULL);
INSERT INTO public.constellar VALUES (557, 'Orion', 192, 'Meissa', -1, NULL);
INSERT INTO public.constellar VALUES (558, 'Orion', 208, 'Mintaka', -1, NULL);
INSERT INTO public.constellar VALUES (559, 'Orion', 256, 'Rigel', -1, NULL);
INSERT INTO public.constellar VALUES (560, 'Orion', 268, 'Saiph', -1, NULL);
INSERT INTO public.constellar VALUES (561, 'Orion', 291, 'Tabit', -1, NULL);
INSERT INTO public.constellar VALUES (562, 'Hydra', 45, 'Alphard', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (563, 'Hydra', 45, 'Alphard', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (564, 'Hydra', 77, 'Ashlesha', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (565, 'Hydra', 77, 'Ashlesha', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (566, 'Hydra', 136, 'Felis', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (567, 'Hydra', 136, 'Felis', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (568, 'Hydra', 206, 'Minchir', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (569, 'Hydra', 206, 'Minchir', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (570, 'Hydra', 313, 'Ukdah', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (571, 'Hydra', 313, 'Ukdah', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (572, 'Hydra', 331, 'Zhang', 39, 'Hydra A');
INSERT INTO public.constellar VALUES (573, 'Hydra', 331, 'Zhang', 77, 'Southern Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (574, 'Corona Borealis', 46, 'Alphecca', -1, NULL);
INSERT INTO public.constellar VALUES (575, 'Corona Borealis', 228, 'Nusakan', -1, NULL);
INSERT INTO public.constellar VALUES (576, 'Pisces', 48, 'Alpherg', 65, 'Pisces Cloud');
INSERT INTO public.constellar VALUES (577, 'Pisces', 48, 'Alpherg', 66, 'Pisces Dwarf');
INSERT INTO public.constellar VALUES (578, 'Pisces', 50, 'Alrescha', 65, 'Pisces Cloud');
INSERT INTO public.constellar VALUES (579, 'Pisces', 50, 'Alrescha', 66, 'Pisces Dwarf');
INSERT INTO public.constellar VALUES (580, 'Pisces', 139, 'Fumalsamakah', 65, 'Pisces Cloud');
INSERT INTO public.constellar VALUES (581, 'Pisces', 139, 'Fumalsamakah', 66, 'Pisces Dwarf');
INSERT INTO public.constellar VALUES (582, 'Pisces', 255, 'Revati', 65, 'Pisces Cloud');
INSERT INTO public.constellar VALUES (583, 'Pisces', 255, 'Revati', 66, 'Pisces Dwarf');
INSERT INTO public.constellar VALUES (584, 'Pisces', 311, 'Torcular', 65, 'Pisces Cloud');
INSERT INTO public.constellar VALUES (585, 'Pisces', 311, 'Torcular', 66, 'Pisces Dwarf');
INSERT INTO public.constellar VALUES (586, 'Lynx', 53, 'Alsciaukat', 6, 'Bear''s Paw');
INSERT INTO public.constellar VALUES (587, 'Vela', 54, 'Alsephina', -1, NULL);
INSERT INTO public.constellar VALUES (588, 'Vela', 187, 'Markeb', -1, NULL);
INSERT INTO public.constellar VALUES (589, 'Vela', 288, 'Suhail', -1, NULL);
INSERT INTO public.constellar VALUES (590, 'Aquila', 55, 'Alshain', -1, NULL);
INSERT INTO public.constellar VALUES (591, 'Aquila', 57, 'Altair', -1, NULL);
INSERT INTO public.constellar VALUES (592, 'Aquila', 179, 'Libertas', -1, NULL);
INSERT INTO public.constellar VALUES (593, 'Aquila', 230, 'Okab', -1, NULL);
INSERT INTO public.constellar VALUES (594, 'Aquila', 297, 'Tarazed', -1, NULL);
INSERT INTO public.constellar VALUES (595, 'Serpens', 63, 'Alya', 37, 'Hoag''s Object');
INSERT INTO public.constellar VALUES (596, 'Serpens', 63, 'Alya', 74, 'Seyfert''s Sextet');
INSERT INTO public.constellar VALUES (597, 'Serpens', 148, 'Gudja', 37, 'Hoag''s Object');
INSERT INTO public.constellar VALUES (598, 'Serpens', 148, 'Gudja', 74, 'Seyfert''s Sextet');
INSERT INTO public.constellar VALUES (599, 'Serpens', 314, 'Unukalhai', 37, 'Hoag''s Object');
INSERT INTO public.constellar VALUES (600, 'Serpens', 314, 'Unukalhai', 74, 'Seyfert''s Sextet');
INSERT INTO public.constellar VALUES (601, 'Phoenix', 67, 'Ankaa', 63, 'Phoenix Dwarf');
INSERT INTO public.constellar VALUES (602, 'Phoenix', 322, 'Wurren', 63, 'Phoenix Dwarf');
INSERT INTO public.constellar VALUES (603, 'Vulpecula', 68, 'Anser', -1, NULL);
INSERT INTO public.constellar VALUES (604, 'Lepus', 73, 'Arneb', -1, NULL);
INSERT INTO public.constellar VALUES (605, 'Lepus', 226, 'Nihal', -1, NULL);
INSERT INTO public.constellar VALUES (606, 'Carina', 78, 'Aspidiske', 12, 'Carina Dwarf');
INSERT INTO public.constellar VALUES (607, 'Carina', 84, 'Avior', 12, 'Carina Dwarf');
INSERT INTO public.constellar VALUES (608, 'Carina', 99, 'Canopus', 12, 'Carina Dwarf');
INSERT INTO public.constellar VALUES (609, 'Carina', 204, 'Miaplacidus', 12, 'Carina Dwarf');
INSERT INTO public.constellar VALUES (610, NULL, 79, 'Asterope', -1, NULL);
INSERT INTO public.constellar VALUES (611, 'Triangulum Australe', 83, 'Atria', -1, NULL);
INSERT INTO public.constellar VALUES (612, 'Puppis', 87, 'Azmidi', -1, NULL);
INSERT INTO public.constellar VALUES (613, 'Puppis', 222, 'Naos', -1, NULL);
INSERT INTO public.constellar VALUES (614, 'Puppis', 312, 'Tureis', -1, NULL);
INSERT INTO public.constellar VALUES (615, 'Ophiuchus', 88, 'Barnard’s Star', -1, NULL);
INSERT INTO public.constellar VALUES (616, 'Ophiuchus', 104, 'Cebalrai', -1, NULL);
INSERT INTO public.constellar VALUES (617, 'Ophiuchus', 149, 'Guniibuu', -1, NULL);
INSERT INTO public.constellar VALUES (618, 'Ophiuchus', 185, 'Marfik', -1, NULL);
INSERT INTO public.constellar VALUES (619, 'Ophiuchus', 252, 'Rasalhague', -1, NULL);
INSERT INTO public.constellar VALUES (620, 'Ophiuchus', 261, 'Sabik', -1, NULL);
INSERT INTO public.constellar VALUES (621, 'Ophiuchus', 325, 'Yed Posterior', -1, NULL);
INSERT INTO public.constellar VALUES (622, 'Ophiuchus', 326, 'Yed Prior', -1, NULL);
INSERT INTO public.constellar VALUES (623, 'Cetus', 89, 'Baten Kaitos', 15, 'Cetus A');
INSERT INTO public.constellar VALUES (624, 'Cetus', 89, 'Baten Kaitos', 59, 'Minkowski''s Object');
INSERT INTO public.constellar VALUES (625, 'Cetus', 89, 'Baten Kaitos', 92, 'Wolf-Lundmark-Melotte');
INSERT INTO public.constellar VALUES (626, 'Cetus', 121, 'Diphda', 15, 'Cetus A');
INSERT INTO public.constellar VALUES (627, 'Cetus', 121, 'Diphda', 59, 'Minkowski''s Object');
INSERT INTO public.constellar VALUES (628, 'Cetus', 121, 'Diphda', 92, 'Wolf-Lundmark-Melotte');
INSERT INTO public.constellar VALUES (629, 'Cetus', 164, 'Kaffaljidhma', 15, 'Cetus A');
INSERT INTO public.constellar VALUES (630, 'Cetus', 164, 'Kaffaljidhma', 59, 'Minkowski''s Object');
INSERT INTO public.constellar VALUES (631, 'Cetus', 164, 'Kaffaljidhma', 92, 'Wolf-Lundmark-Melotte');
INSERT INTO public.constellar VALUES (632, 'Cetus', 196, 'Menkar', 15, 'Cetus A');
INSERT INTO public.constellar VALUES (633, 'Cetus', 196, 'Menkar', 59, 'Minkowski''s Object');
INSERT INTO public.constellar VALUES (634, 'Cetus', 196, 'Menkar', 92, 'Wolf-Lundmark-Melotte');
INSERT INTO public.constellar VALUES (635, 'Cetus', 209, 'Mira', 15, 'Cetus A');
INSERT INTO public.constellar VALUES (636, 'Cetus', 209, 'Mira', 59, 'Minkowski''s Object');
INSERT INTO public.constellar VALUES (637, 'Cetus', 209, 'Mira', 92, 'Wolf-Lundmark-Melotte');
INSERT INTO public.constellar VALUES (638, 'Aries', 94, 'Bharani', -1, NULL);
INSERT INTO public.constellar VALUES (639, 'Aries', 96, 'Botein', -1, NULL);
INSERT INTO public.constellar VALUES (640, 'Aries', 152, 'Hamal', -1, NULL);
INSERT INTO public.constellar VALUES (641, 'Aries', 181, 'Lilii Borea', -1, NULL);
INSERT INTO public.constellar VALUES (642, 'Aries', 203, 'Mesarthim', -1, NULL);
INSERT INTO public.constellar VALUES (643, 'Aries', 281, 'Sheratan', -1, NULL);
INSERT INTO public.constellar VALUES (644, 'Libra', 97, 'Brachium', 28, 'Fath 703');
INSERT INTO public.constellar VALUES (645, 'Libra', 334, 'Zubenelgenubi', 28, 'Fath 703');
INSERT INTO public.constellar VALUES (646, 'Libra', 335, 'Zubenelhakrabi', 28, 'Fath 703');
INSERT INTO public.constellar VALUES (647, 'Libra', 336, 'Zubeneschamali', 28, 'Fath 703');
INSERT INTO public.constellar VALUES (648, 'Ara', 106, 'Cervantes', -1, NULL);
INSERT INTO public.constellar VALUES (649, 'Canes Venatici', 109, 'Chara', 26, 'Eye of Sauron');
INSERT INTO public.constellar VALUES (650, 'Canes Venatici', 109, 'Chara', 38, 'Hockey Stick Galaxy');
INSERT INTO public.constellar VALUES (651, 'Canes Venatici', 109, 'Chara', 83, 'Sunflower Galaxy');
INSERT INTO public.constellar VALUES (652, 'Canes Venatici', 109, 'Chara', 89, 'Whale galaxy');
INSERT INTO public.constellar VALUES (653, 'Canes Venatici', 112, 'Cor Caroli', 26, 'Eye of Sauron');
INSERT INTO public.constellar VALUES (654, 'Canes Venatici', 112, 'Cor Caroli', 38, 'Hockey Stick Galaxy');
INSERT INTO public.constellar VALUES (655, 'Canes Venatici', 112, 'Cor Caroli', 83, 'Sunflower Galaxy');
INSERT INTO public.constellar VALUES (656, 'Canes Venatici', 112, 'Cor Caroli', 89, 'Whale galaxy');
INSERT INTO public.constellar VALUES (657, 'Canes Venatici', 176, 'La Superba', 26, 'Eye of Sauron');
INSERT INTO public.constellar VALUES (658, 'Canes Venatici', 176, 'La Superba', 38, 'Hockey Stick Galaxy');
INSERT INTO public.constellar VALUES (659, 'Canes Venatici', 176, 'La Superba', 83, 'Sunflower Galaxy');
INSERT INTO public.constellar VALUES (660, 'Canes Venatici', 176, 'La Superba', 89, 'Whale galaxy');
INSERT INTO public.constellar VALUES (661, 'Hercules', 113, 'Cujam', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (662, 'Hercules', 173, 'Kornephoros', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (663, 'Hercules', 182, 'Maasym', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (664, 'Hercules', 188, 'Marsic', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (665, 'Hercules', 229, 'Ogma', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (666, 'Hercules', 251, 'Rasalgethi', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (667, 'Hercules', 271, 'Sarin', 36, 'Hercules A');
INSERT INTO public.constellar VALUES (668, 'Fornax', 116, 'Dalim', 30, 'Fornax A');
INSERT INTO public.constellar VALUES (669, 'Fornax', 116, 'Dalim', 31, 'Fornax Dwarf');
INSERT INTO public.constellar VALUES (670, 'Coma Berenices', 120, 'Diadem', 7, 'Black Eye Galaxy');
INSERT INTO public.constellar VALUES (671, 'Coma Berenices', 120, 'Diadem', 19, 'Coma Cluster');
INSERT INTO public.constellar VALUES (672, 'Coma Berenices', 120, 'Diadem', 20, 'Coma Pinwheel Galaxy');
INSERT INTO public.constellar VALUES (673, 'Coma Berenices', 120, 'Diadem', 52, 'Malin 1');
INSERT INTO public.constellar VALUES (674, 'Coma Berenices', 120, 'Diadem', 58, 'Mice Galaxies');
INSERT INTO public.constellar VALUES (675, 'Coma Berenices', 120, 'Diadem', 60, 'Needle Galaxy');
INSERT INTO public.constellar VALUES (676, 'Virgo', 127, 'Elgafar', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (677, 'Virgo', 127, 'Elgafar', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (678, 'Virgo', 127, 'Elgafar', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (679, 'Virgo', 127, 'Elgafar', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (680, 'Virgo', 127, 'Elgafar', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (681, 'Virgo', 127, 'Elgafar', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (682, 'Virgo', 127, 'Elgafar', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (683, 'Virgo', 156, 'Heze', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (684, 'Virgo', 156, 'Heze', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (685, 'Virgo', 156, 'Heze', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (686, 'Virgo', 156, 'Heze', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (687, 'Virgo', 156, 'Heze', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (688, 'Virgo', 156, 'Heze', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (689, 'Virgo', 156, 'Heze', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (690, 'Virgo', 165, 'Kang', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (691, 'Virgo', 165, 'Kang', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (692, 'Virgo', 165, 'Kang', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (693, 'Virgo', 165, 'Kang', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (694, 'Virgo', 165, 'Kang', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (695, 'Virgo', 165, 'Kang', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (696, 'Virgo', 165, 'Kang', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (697, 'Virgo', 170, 'Khambalia', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (698, 'Virgo', 170, 'Khambalia', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (699, 'Virgo', 170, 'Khambalia', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (700, 'Virgo', 170, 'Khambalia', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (701, 'Virgo', 170, 'Khambalia', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (702, 'Virgo', 170, 'Khambalia', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (703, 'Virgo', 170, 'Khambalia', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (704, 'Virgo', 180, 'Lich', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (705, 'Virgo', 180, 'Lich', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (706, 'Virgo', 180, 'Lich', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (707, 'Virgo', 180, 'Lich', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (708, 'Virgo', 180, 'Lich', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (709, 'Virgo', 180, 'Lich', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (710, 'Virgo', 180, 'Lich', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (711, 'Virgo', 207, 'Minelauva', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (712, 'Virgo', 207, 'Minelauva', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (713, 'Virgo', 207, 'Minelauva', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (714, 'Virgo', 207, 'Minelauva', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (715, 'Virgo', 207, 'Minelauva', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (716, 'Virgo', 207, 'Minelauva', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (717, 'Virgo', 207, 'Minelauva', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (718, 'Virgo', 243, 'Porrima', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (719, 'Virgo', 243, 'Porrima', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (720, 'Virgo', 243, 'Porrima', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (721, 'Virgo', 243, 'Porrima', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (722, 'Virgo', 243, 'Porrima', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (723, 'Virgo', 243, 'Porrima', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (724, 'Virgo', 243, 'Porrima', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (725, 'Virgo', 285, 'Spica', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (726, 'Virgo', 285, 'Spica', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (727, 'Virgo', 285, 'Spica', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (728, 'Virgo', 285, 'Spica', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (729, 'Virgo', 285, 'Spica', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (730, 'Virgo', 285, 'Spica', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (731, 'Virgo', 285, 'Spica', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (732, 'Virgo', 290, 'Syrma', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (733, 'Virgo', 290, 'Syrma', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (734, 'Virgo', 290, 'Syrma', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (735, 'Virgo', 290, 'Syrma', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (736, 'Virgo', 290, 'Syrma', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (737, 'Virgo', 290, 'Syrma', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (738, 'Virgo', 290, 'Syrma', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (739, 'Virgo', 318, 'Vindemiatrix', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (740, 'Virgo', 318, 'Vindemiatrix', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (741, 'Virgo', 318, 'Vindemiatrix', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (742, 'Virgo', 318, 'Vindemiatrix', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (743, 'Virgo', 318, 'Vindemiatrix', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (744, 'Virgo', 318, 'Vindemiatrix', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (745, 'Virgo', 318, 'Vindemiatrix', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (746, 'Virgo', 328, 'Zaniah', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (747, 'Virgo', 328, 'Zaniah', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (748, 'Virgo', 328, 'Zaniah', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (749, 'Virgo', 328, 'Zaniah', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (750, 'Virgo', 328, 'Zaniah', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (751, 'Virgo', 328, 'Zaniah', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (752, 'Virgo', 328, 'Zaniah', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (753, 'Virgo', 330, 'Zavijava', 10, 'Butterfly Galaxies');
INSERT INTO public.constellar VALUES (754, 'Virgo', 330, 'Zavijava', 27, 'Eyes Galaxies');
INSERT INTO public.constellar VALUES (755, 'Virgo', 330, 'Zavijava', 54, 'McLeish''s Object');
INSERT INTO public.constellar VALUES (756, 'Virgo', 330, 'Zavijava', 67, 'Reinmuth 80');
INSERT INTO public.constellar VALUES (757, 'Virgo', 330, 'Zavijava', 76, 'Sombrero Galaxy');
INSERT INTO public.constellar VALUES (758, 'Virgo', 330, 'Zavijava', 88, 'Virgo A');
INSERT INTO public.constellar VALUES (759, 'Virgo', 330, 'Zavijava', 91, 'Wild''s Triplet');
INSERT INTO public.constellar VALUES (760, 'Columba', 128, 'Elkurud', -1, NULL);
INSERT INTO public.constellar VALUES (761, 'Columba', 233, 'Phact', -1, NULL);
INSERT INTO public.constellar VALUES (762, 'Columba', 320, 'Wazn', -1, NULL);
INSERT INTO public.constellar VALUES (763, 'Piscis Austrinus', 137, 'Fomalhaut', -1, NULL);
INSERT INTO public.constellar VALUES (764, 'Canis Minor', 146, 'Gomeisa', -1, NULL);
INSERT INTO public.constellar VALUES (765, 'Canis Minor', 246, 'Procyon', -1, NULL);
INSERT INTO public.constellar VALUES (766, 'Centaurus', 150, 'Hadar', 4, 'Backward Galaxy');
INSERT INTO public.constellar VALUES (767, 'Centaurus', 150, 'Hadar', 14, 'Centaurus A');
INSERT INTO public.constellar VALUES (768, 'Centaurus', 150, 'Hadar', 32, 'Fourcade-Figueroa object');
INSERT INTO public.constellar VALUES (769, 'Centaurus', 150, 'Hadar', 34, 'Hardcastle Nebula');
INSERT INTO public.constellar VALUES (770, 'Centaurus', 150, 'Hadar', 71, 'Seashell Galaxy');
INSERT INTO public.constellar VALUES (771, 'Centaurus', 197, 'Menkent', 4, 'Backward Galaxy');
INSERT INTO public.constellar VALUES (772, 'Centaurus', 197, 'Menkent', 14, 'Centaurus A');
INSERT INTO public.constellar VALUES (773, 'Centaurus', 197, 'Menkent', 32, 'Fourcade-Figueroa object');
INSERT INTO public.constellar VALUES (774, 'Centaurus', 197, 'Menkent', 34, 'Hardcastle Nebula');
INSERT INTO public.constellar VALUES (775, 'Centaurus', 197, 'Menkent', 71, 'Seashell Galaxy');
INSERT INTO public.constellar VALUES (776, 'Centaurus', 248, 'Proxima Centauri', 4, 'Backward Galaxy');
INSERT INTO public.constellar VALUES (777, 'Centaurus', 248, 'Proxima Centauri', 14, 'Centaurus A');
INSERT INTO public.constellar VALUES (778, 'Centaurus', 248, 'Proxima Centauri', 32, 'Fourcade-Figueroa object');
INSERT INTO public.constellar VALUES (779, 'Centaurus', 248, 'Proxima Centauri', 34, 'Hardcastle Nebula');
INSERT INTO public.constellar VALUES (780, 'Centaurus', 248, 'Proxima Centauri', 71, 'Seashell Galaxy');
INSERT INTO public.constellar VALUES (781, 'Centaurus', 257, 'Rigil Kentaurus', 4, 'Backward Galaxy');
INSERT INTO public.constellar VALUES (782, 'Centaurus', 257, 'Rigil Kentaurus', 14, 'Centaurus A');
INSERT INTO public.constellar VALUES (783, 'Centaurus', 257, 'Rigil Kentaurus', 32, 'Fourcade-Figueroa object');
INSERT INTO public.constellar VALUES (784, 'Centaurus', 257, 'Rigil Kentaurus', 34, 'Hardcastle Nebula');
INSERT INTO public.constellar VALUES (785, 'Centaurus', 257, 'Rigil Kentaurus', 71, 'Seashell Galaxy');
INSERT INTO public.constellar VALUES (786, 'Centaurus', 309, 'Toliman', 4, 'Backward Galaxy');
INSERT INTO public.constellar VALUES (787, 'Centaurus', 309, 'Toliman', 14, 'Centaurus A');
INSERT INTO public.constellar VALUES (788, 'Centaurus', 309, 'Toliman', 32, 'Fourcade-Figueroa object');
INSERT INTO public.constellar VALUES (789, 'Centaurus', 309, 'Toliman', 34, 'Hardcastle Nebula');
INSERT INTO public.constellar VALUES (790, 'Centaurus', 309, 'Toliman', 71, 'Seashell Galaxy');
INSERT INTO public.constellar VALUES (791, 'Equuleus', 171, 'Kitalpha', -1, NULL);
INSERT INTO public.constellar VALUES (792, 'Ursa Minor', 172, 'Kochab', 87, 'Ursa Minor Dwarf');
INSERT INTO public.constellar VALUES (793, 'Ursa Minor', 235, 'Pherkad', 87, 'Ursa Minor Dwarf');
INSERT INTO public.constellar VALUES (794, 'Ursa Minor', 239, 'Polaris', 87, 'Ursa Minor Dwarf');
INSERT INTO public.constellar VALUES (795, 'Ursa Minor', 327, 'Yildun', 87, 'Ursa Minor Dwarf');
INSERT INTO public.constellar VALUES (796, 'Corona Australis', 201, 'Meridiana', -1, NULL);
INSERT INTO public.constellar VALUES (797, 'Triangulum', 216, 'Mothallah', 86, 'Triangulum Galaxy');
INSERT INTO public.constellar VALUES (798, 'Pavo', 232, 'Peacock', -1, NULL);
INSERT INTO public.constellar VALUES (799, 'Octans', 240, 'Polaris Australis', -1, NULL);
INSERT INTO public.constellar VALUES (800, 'Leo Minor', 244, 'Praecipua', -1, NULL);
INSERT INTO public.constellar VALUES (801, 'Sagitta', 278, 'Sham', -1, NULL);
INSERT INTO public.constellar VALUES (802, 'Camelopardalis', 310, 'Tonatiuh', 40, 'Integral Sign Galaxy');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Antennae Galaxies', 'galaxy pair', '11.2', 'Corvus', '45 Mly', '5.2'' x 3.1''''', NULL, NULL, 'C60/61');
INSERT INTO public.galaxy VALUES (2, 'Aquarius Dwarf', 'irregular dwarf', '14', 'Aquarius', '3.2 Mly', '2.2'' x 1.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Atoms-for-Peace', 'peculiar', '12.7', 'Aquarius', '220 Mly', '1.9'' x 1.6''''', 'NGC 7252', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'unbarred spiral', '12.6', 'Centaurus', '200 Mly', '1.7'' x 1.6''''', 'NGC 4622', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Barnard''s Galaxy', 'barred irregular', '9.3', 'Sagittarius', '1.63 Mly', '15.5'' x 13.5''''', 'NGC 6822', NULL, 'C57');
INSERT INTO public.galaxy VALUES (6, 'Bear''s Paw', 'compact dwarf', '12.3', 'Lynx', NULL, '1.7'' x 1.5''''', 'NGC 2537', NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', 'spiral', '8.52', 'Coma Berenices', '17.3 Mly', '10.7'' x 5.13''''', 'NGC 4286', 'M64', NULL);
INSERT INTO public.galaxy VALUES (8, 'Bode''s Galaxy', 'spiral', '6.94', 'Ursa Major', '12 Mly', '26.9'' x 14.1''', 'NGC 3031/34', 'M81', NULL);
INSERT INTO public.galaxy VALUES (9, 'Burbidge''s Chain', 'galaxy group', '14.4-17', 'Sculptor', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Butterfly Galaxies', 'unbarred spiral', '10.9', 'Virgo', '59.4 Mly', '4.6'' x 2.1''''', 'NGC 4567/4568', NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'Carafe Group', 'galaxy group', '9.75-13.75', 'Caelum', '143 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, 'Carina Dwarf', 'spheroidal dwarf', '11.3', 'Carina', '0.33 Mly', '23.4'' x 15.5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (13, 'Cartwheel Galaxy', 'lenticular', '15.2', 'Sculptor', '500 Mly', '1.1'' x 0.9''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (14, 'Centaurus A', 'elliptical', '6.84', 'Centaurus', '13 Mly', '25.7'' x 20''''', 'NGC 5128', NULL, 'C77');
INSERT INTO public.galaxy VALUES (15, 'Cetus A', 'barred spiral', '9.6', 'Cetus', '47 Mly', '7.1'' x 6''''', NULL, 'M77', NULL);
INSERT INTO public.galaxy VALUES (16, 'Cigar Galaxy', 'starburst', '8.41', 'Ursa Major', '12 Mly', '11.2'' x 4.3''''', NULL, 'M82', NULL);
INSERT INTO public.galaxy VALUES (17, 'Circinus Galaxy', 'Seyfert', '12.1', 'Circinus', '13 Mly', '6.9'' x 3.0''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (18, 'Coddington''s Nebula', 'spiral dwarf', '12.8', 'Ursa Major', NULL, '12.0'' x 5.5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (19, 'Coma Cluster', 'galaxy cluster', '12.7', 'Coma Berenices', '321 Mly', NULL, NULL, NULL, 'C35');
INSERT INTO public.galaxy VALUES (20, 'Coma Pinwheel Galaxy', 'spiral', '10.4', 'Coma Berenices', '45.2 Mly', '5.4'' x 4.7''''', NULL, 'M99', NULL);
INSERT INTO public.galaxy VALUES (21, 'Comet Galaxy', 'spiral', '18.7', 'Sculptor', '3200 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (22, 'Copeland Septet', 'galaxy group', NULL, 'Leo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (23, 'Cosmos Redshift 7', 'Lyman-alpha emitter', NULL, 'Sextans', '12000 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (24, 'Cygnus A', 'radio galaxy', '16.2', 'Cygnus', '757 Mly', '0.55'' x 0.46''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (25, 'Draco Dwarf', 'spheroidal', '10.9', 'Draco', NULL, '35.5'' x 24.5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (26, 'Eye of Sauron', 'Seyfert', '11.5', 'Canes Venatici', '62 Mly', '6.4'' x 5.5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (27, 'Eyes Galaxies', 'galaxy pair', '10', 'Virgo', '52 Mly', '8.5'' x 3.2''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (28, 'Fath 703', 'spiral', '11', 'Libra', '100 Mly', NULL, 'NGC 5892', NULL, NULL);
INSERT INTO public.galaxy VALUES (29, 'Fireworks Galaxy', 'spiral', '9.6', 'Cygnus', '22.5 Mly', '11.5'' x 9.8''''', NULL, NULL, 'C12');
INSERT INTO public.galaxy VALUES (30, 'Fornax A', 'lenticular', '9.4', 'Fornax', '62 Mly', '12'' x 8.5''''', 'NGC 1316', NULL, NULL);
INSERT INTO public.galaxy VALUES (31, 'Fornax Dwarf', 'elliptical dwarf', '9.3', 'Fornax', '0.46 Mly', '17'' x 12.6''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (32, 'Fourcade-Figueroa object', 'galaxy shred', '11.7', 'Centaurus', NULL, '11.5'' x 1.4''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (33, 'Grus Quartet', 'spiral', NULL, 'Grus', NULL, NULL, 'NGC 7582', NULL, NULL);
INSERT INTO public.galaxy VALUES (34, 'Hardcastle Nebula', 'barred spiral', '13.3', 'Centaurus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (35, 'Helix Galaxy', 'Seyfert', NULL, 'Ursa Major', '42 Mly', NULL, 'NGC 2685', NULL, NULL);
INSERT INTO public.galaxy VALUES (36, 'Hercules A', 'radio galaxy', NULL, 'Hercules', '2100 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (37, 'Hoag''s Object', 'ring', '16.2', 'Serpens', '613 Mly', '0.28'' x 0.28''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (38, 'Hockey Stick Galaxy', 'barred spiral', '11', 'Canes Venatici', NULL, '12.9'' x 12.9''''', 'NGC 4565/4657', NULL, NULL);
INSERT INTO public.galaxy VALUES (39, 'Hydra A', 'galaxy cluster', NULL, 'Hydra', '840 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (40, 'Integral Sign Galaxy', 'spiral', '16.3', 'Camelopardalis', '151 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (41, 'Keenan''s System', 'spiral/globular', '14.4-17', 'Ursa Major', '17 Mly', NULL, 'NGC 5216/18', NULL, NULL);
INSERT INTO public.galaxy VALUES (42, 'Kowal''s Object', 'dwarf', '15.5', 'Sagittarius', '3.3 Mly', '2.9'' x 2.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (43, 'Large Magellanic Cloud', 'spiral', '0.9', 'Dorado', '0.163 Mly', '10.75'' x 9.17''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (44, 'Leo I', 'spheroidal dwarf', '11.2', 'Leo', '0.82 Mly', '9.8'' x 7.4''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (45, 'Leo II', 'spheroidal dwarf', '12.6', 'Leo', '0.69 Mly', '12'' x 11''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (46, 'Leo III', 'irregular', '12.9', 'Leo', '2.6 Mly', '5.1'' x 3.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (47, 'Leo Triplet', 'galaxy group', '8.9', 'Leo', '35 Mly', NULL, NULL, 'M65/66', NULL);
INSERT INTO public.galaxy VALUES (48, 'Lindsay-Shapley Ring', 'lenticular/ring', '14', 'Volans', '300 Mly', '1.7'' x 1.7''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (49, 'Little Sombrero Galaxy', 'spiral', '11.6', 'Pegasus', '40 Mly', '5.5'' x 2.3''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (50, 'Maffei I', 'elliptical', '11.14', 'Cassiopeia', '2.86 Mly', '3.36'' x 1.68''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (51, 'Maffei II', 'spiral', '16', 'Cassiopeia', '9.8 Mly', '15.2'' x 7''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (52, 'Malin 1', 'spiral', '15.8', 'Coma Berenices', '1190 Mly', '0.22 x 0.20''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (53, 'Mayall''s Object', 'galaxy pair', NULL, 'Ursa Major', '450 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (54, 'McLeish''s Object', 'barred spiral', '10.7', 'Virgo', '54.1 Mly', '11.8'' x 11''''', 'NGC 4535 ', NULL, NULL);
INSERT INTO public.galaxy VALUES (55, 'Medusa Merger', 'galaxy pair', '16.3', 'Ursa Major', '128.8 Mly', '0.14'' x 0.13''''', 'NGC 4194', NULL, NULL);
INSERT INTO public.galaxy VALUES (56, 'Messier 110', 'elliptical dwarf', '8.9', 'Andromeda', NULL, '21.9'' x 11''''', NULL, 'M110', NULL);
INSERT INTO public.galaxy VALUES (57, 'Messier 32', 'dwarf', '8.1', 'Andromeda', '2.49 Mly', '8.7'' x 6.5''''', NULL, 'M32', NULL);
INSERT INTO public.galaxy VALUES (58, 'Mice Galaxies', 'spiral pair', '14.5', 'Coma Berenices', '290 Mly', '2.3'' x 0.8''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (59, 'Minkowski''s Object', 'lenticular', '12.2', 'Cetus', '230 Mly', '1.8'' x 1.7''''', 'NGC 541', NULL, NULL);
INSERT INTO public.galaxy VALUES (60, 'Needle Galaxy', 'spiral', '10.42', 'Coma Berenices', '42.7 Mly', '15.9'' x 1.85''''', NULL, NULL, 'C38');
INSERT INTO public.galaxy VALUES (61, 'Pegasus Dwarf', 'irregular dwarf', '13.2', 'Pegasus', '3 Mly', '5'' x 2.7''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (62, 'Perseus A', 'Seyfert', '12.6', 'Perseus', '222 Mly', '2.2'' x 1.7''''', 'NGC 1275', NULL, 'C24');
INSERT INTO public.galaxy VALUES (63, 'Phoenix Dwarf', 'irregular dwarf', '13.1', 'Phoenix', '1.44 Mly', '4.9'' x 4.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (64, 'Pinwheel Galaxy', 'spiral', '7.86', 'Ursa Major', '20.9 Mly', '28.8 x 26.9''''', NULL, 'M101', NULL);
INSERT INTO public.galaxy VALUES (65, 'Pisces Cloud', 'galaxy group', '12.14', 'Pisces', '206.7 Mly', NULL, 'NGC 383', NULL, NULL);
INSERT INTO public.galaxy VALUES (66, 'Pisces Dwarf', 'irregular dwarf', '14.2', 'Pisces', '2.51 Mly', '2'' x 2''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (67, 'Reinmuth 80', 'spiral', '12.4', 'Virgo', '40 Mly', '10.73'' x 1.7''''', 'NGC 4517A', NULL, NULL);
INSERT INTO public.galaxy VALUES (68, 'Sagittarius Dwarf', 'elliptical dwarf', '4.5', 'Sagittarius', '0.065 Mly', '450'' x 216''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (69, 'Sculptor Dwarf Galaxy', 'elliptical dwarf', '10.1', 'Sculptor', '0.29 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (70, 'Sculptor Galaxy', 'spiral', '8', 'Sculptor', '11.4 Mly', '27.5'' x 6.8''''', NULL, NULL, 'C65');
INSERT INTO public.galaxy VALUES (71, 'Seashell Galaxy', 'galaxy group', '14.1', 'Centaurus', '280 Mly', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (72, 'Sextans A', 'irregular dwarf', '11.9', 'Sextans', '4.31 Mly', '5.9'' x 4.9''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (73, 'Sextans B', 'irregular dwarf', '11.9', 'Sextans', '4.44 Mly', '5.1'' x 3.5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (74, 'Seyfert''s Sextet', 'galaxy group', '14.7', 'Serpens', '190 Mly', NULL, 'NGC 6027A-E', NULL, NULL);
INSERT INTO public.galaxy VALUES (75, 'Small Magellanic Cloud', 'irregular dwarf', '2.7', 'Tucana', '0.2 Mly', '5&deg 20'' x 3° 5''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (76, 'Sombrero Galaxy', 'lenticular', '8.98', 'Virgo', '31.1 Mly', '9'' x 4''''', 'NGC 4594', 'M104', NULL);
INSERT INTO public.galaxy VALUES (77, 'Southern Pinwheel Galaxy', 'barred spiral', '7.54', 'Hydra', '14.7 Mly', '12.9'' x 11.5''''', NULL, 'M83', NULL);
INSERT INTO public.galaxy VALUES (81, 'Spindle Galaxy', 'lenticular', '9.9', 'Sextans', '31.6 Mly', '7.2'' x 2.5''''', NULL, NULL, 'C53');
INSERT INTO public.galaxy VALUES (82, 'Stephan''s Quintet', 'galaxy group', '14.4', 'Pegasus', NULL, NULL, 'NGC 7317-20', NULL, NULL);
INSERT INTO public.galaxy VALUES (83, 'Sunflower Galaxy', 'spiral', '9.3', 'Canes Venatici', '29.3 Mly', '12.6'' x 7.2''''', NULL, 'M63', NULL);
INSERT INTO public.galaxy VALUES (84, 'Tadpole Galaxy', 'barred spiral', '14.4', 'Draco', '400 Mly', '3.6'' x 0.8''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (85, 'The Guitar', 'galaxy pair', '14.5', 'Ursa Major', '412 Mly', '1.36'' x 0.69''''', 'NGC 3561A/B', NULL, NULL);
INSERT INTO public.galaxy VALUES (86, 'Triangulum Galaxy', 'spiral', '5.72', 'Triangulum', '2.73 Mly', '70.8'' x 41.7''''', 'NGC 0598', 'M33', NULL);
INSERT INTO public.galaxy VALUES (87, 'Ursa Minor Dwarf', 'spheroidal dwarf', '11.9', 'Ursa Minor', '0.2 Mly', '30.2'' x 19.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (88, 'Virgo A', 'elliptical supergiant', '8.79', 'Virgo', '53.4 Mly', '7.2'' x 6.8''''', 'NGC 4486 ', 'M87', NULL);
INSERT INTO public.galaxy VALUES (89, 'Whale galaxy', 'barred spiral', '9.8', 'Canes Venatici', '30 Mly', '15.5'' x 2.7''''', NULL, NULL, 'C32');
INSERT INTO public.galaxy VALUES (90, 'Whirlpool Galaxy', 'spiral', '8.4', 'Ursa Major', '23 Mly', '11.2'' x 6.9''''', 'NGC 5194', 'M51', NULL);
INSERT INTO public.galaxy VALUES (91, 'Wild''s Triplet', 'spiral', NULL, 'Virgo', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (92, 'Wolf-Lundmark-Melotte', 'barred irregular', '11', 'Cetus', '3.04 Mly', '11.5'' x 4.2''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (93, 'Milky Way', 'barred spiral galaxy', '21', 'Sagittarius', '25000 Mly', '5.2'' x 3.1''''', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (78, 'Spindle GalaxyD', 'lenticular', '10.7', 'Draco', '50 Mly', '4.7'' x 1.9''''', NULL, 'M102', NULL);
INSERT INTO public.galaxy VALUES (79, 'Spindle GalaxySM', 'lenticular', '10.7', 'Draco', '31.6 Mly', '7.2'' x 2.5''''', NULL, NULL, 'C53');
INSERT INTO public.galaxy VALUES (80, 'Spindle GalaxyC', 'lenticular', '9.9', 'Sextans', '50 Mly', '4.7'' x 1.9''''', NULL, 'M102', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', '“month”', '-', '-', 384400, 3475.0, 27.322, true, 8);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 'Greek god of fear and panic', '1877', 'Asaph Hall', 9270, 22.5, 0.3189, true, 17);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 'Greek god of dread and terror', '1877', 'Asaph Hall', 23460, 12.4, 1.2624, true, 17);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 'Ancestor to Perseus, Cadmus, Heracles, and Minos', '1610', 'Galileo', 421600, 3629.0, 1.769, true, 14);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 'Mother of king Minos of Crete', '1610', 'Galileo', 670900, 3126.0, 3.551, true, 14);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 'Male hero of Troy. Served as Zeus cup-bearer in Olympus', '1610', 'Galileo', 1070000, 5276.0, 7.155, true, 14);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 'One of the nymphs. Daughter of king Lycaon and one of Artemis followers', '1610', 'Galileo', 1883000, 4800.0, 16.689, true, 14);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 'Foster-mother of Zeus', '1892', 'E. Barnard', 181300, 134.0, 0.498, true, 14);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Jupiter', 'Nymph of the island of Rhodes. Had three sons with Zeus: Sparteus, Kronios and Kytos', '1904', 'C. Perrine', 11480000, 170.0, 250.57, true, 14);
INSERT INTO public.moon VALUES (10, 'Elara', 'Jupiter', 'Mortal princess, daughter of king Orchomenus and mother of the giant Tytios.', '1905', 'C. Perrine', 11737000, 80.0, 259.65, true, 14);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'Jupiter', 'Queen of Crete. Daughter of Helios and mother of the minotaur.', '1908', 'P. Melotte', 23500000, 36.0, 735.0, false, 14);
INSERT INTO public.moon VALUES (12, 'Sinope', 'Jupiter', 'Daughter of Ares and one of the Amazons. It is believed the Turkish city of Sinop is named after her.', '1914', 'S. Nicholson', 23700700, 28.0, 758.0, false, 14);
INSERT INTO public.moon VALUES (13, 'Lysithea', 'Jupiter', 'Mother of Heracles and Zeus. Daughter of the titan Oceanus.', '1938', 'S. Nicholson', 11720000, 24.0, 259.22, true, 14);
INSERT INTO public.moon VALUES (14, 'Carme', 'Jupiter', 'Mother of Britomartis, goddess of mountains and hunting', '1938', 'S. Nicholson', 22600000, 30.0, 692.0, false, 14);
INSERT INTO public.moon VALUES (15, 'Ananke', 'Jupiter', 'Personification of necessity. It also means “constrain” or “force”.', '1951', 'S. Nicholson', 21200000, 20.0, 631.0, false, 14);
INSERT INTO public.moon VALUES (16, 'Leda', 'Jupiter', 'Aetolian princess and later Spartan queen.', '1974', 'C. Kowal', 11094000, 10.0, 238.72, true, 14);
INSERT INTO public.moon VALUES (17, 'Thebe', 'Jupiter', 'Name used by a few of Zeus’ daughters. It is also the name of a city in central Greece.', '1979', 'S. Synnott', 221900, 100.0, 0.675, true, 14);
INSERT INTO public.moon VALUES (18, 'Adrastea', 'Jupiter', 'Goddess of “inevitable fate”. Was in charge of nurturing and protecting Zeus.', '1979', 'Jewitt & Danielson', 128980, 16.0, 0.298, true, 14);
INSERT INTO public.moon VALUES (19, 'Metis', 'Jupiter', 'First wife of Zeus and mother of Athena.', '1979', 'S. Sunnott', 127960, 40.0, 0.295, true, 14);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 'Jupiter', 'One of the Oceanids (daughters of the titan Oceanus)', '2000', 'Spacewatch Project Minor Planet Center', 24200000, 10.0, 774.0, false, 14);
INSERT INTO public.moon VALUES (21, 'Themisto', 'Jupiter', 'Daughter of the river god Inachus.', '1975', 'C. Kowal & E. Roemer', 7507000, 8.0, 130.07, true, 14);
INSERT INTO public.moon VALUES (22, 'Taygete', 'Jupiter', 'One of the Pleiades, daughter of the titan Atlas.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23360000, 5.0, 687.0, false, 14);
INSERT INTO public.moon VALUES (23, 'Chaldene', 'Jupiter', 'Mother of the hero Solymos.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23179000, 3.8, 741.0, false, 14);
INSERT INTO public.moon VALUES (24, 'Harpalyke', 'Jupiter', 'Princess of Arcadia.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21105000, 4.3, 595.0, false, 14);
INSERT INTO public.moon VALUES (25, 'Kalyke', 'Jupiter', 'Alternatively written as Calyce. Thessalian princess. It is also the name of one of the nymphs.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23583000, 5.2, 760.0, false, 14);
INSERT INTO public.moon VALUES (26, 'Iocaste', 'Jupiter', 'Named after Jocasta, daughter of king Menoeceus and wife of Oedipus.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21269000, 5.2, 657.0, false, 14);
INSERT INTO public.moon VALUES (27, 'Erinome', 'Jupiter', 'In her story, Venus compelled her to fall in love with Jupiter to ruin her.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 23279000, 3.2, 672.0, false, 14);
INSERT INTO public.moon VALUES (28, 'Praxidike', 'Jupiter', 'Greek goddess of punishment.', '2000', 'S. Sheppard, D. Jewitt, Y. Fernandez, & G. Magnier', 21147000, 6.8, 632.0, false, 14);
INSERT INTO public.moon VALUES (29, 'Autonoe', 'Jupiter', 'Theban princess and eldest daughter of Cadmus.', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 24122000, 4.0, 753.0, false, 14);
INSERT INTO public.moon VALUES (30, 'Thyone', 'Jupiter', 'Also known as Semele. Youngest daughter of Cadmus.', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 21312000, 4.0, 615.0, false, 14);
INSERT INTO public.moon VALUES (31, 'Hermippe', 'Jupiter', 'Daughter of Boetus. Had a son with Poseidon.', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 21252000, 4.0, 630.0, false, 14);
INSERT INTO public.moon VALUES (32, 'Aitne', 'Jupiter', 'The personification of mount Etna', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23547000, 3.0, 736.0, false, 14);
INSERT INTO public.moon VALUES (33, 'Eurydome', 'Jupiter', 'Also known as Eurynome or Euanthe. Mother of the Graces, goddesses of charm, beauty, goodwill, and creativity', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23219000, 3.0, 713.0, false, 14);
INSERT INTO public.moon VALUES (34, 'Euanthe', 'Jupiter', 'See above', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 21017000, 3.0, 622.0, false, 14);
INSERT INTO public.moon VALUES (35, 'Euporie', 'Jupiter', 'Also known as Euporia. Greek goddess of abundance.', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 19394000, 2.0, 534.0, false, 14);
INSERT INTO public.moon VALUES (36, 'Orthosie', 'Jupiter', 'Greek goddess of prosperity and one of the Horae.', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 21168000, 2.0, 617.0, false, 14);
INSERT INTO public.moon VALUES (37, 'Sponde', 'Jupiter', 'One of the Horae (goddesses of seasons and time periods)', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23808000, 2.0, 732.0, false, 14);
INSERT INTO public.moon VALUES (38, 'Kale', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23124000, 2.0, 609.0, false, 14);
INSERT INTO public.moon VALUES (39, 'Pasithee', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', '2001', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23029000, 2.0, 715.0, false, 14);
INSERT INTO public.moon VALUES (40, 'Hegemone', 'Jupiter', 'One of the Graces or Charities (goddesses of charm, beauty, goodwill, and creativity)', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 24514095, 3.0, 781.6, false, 14);
INSERT INTO public.moon VALUES (41, 'Mneme', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', '2003', 'Scott S. Sheppard & B. Gladman', 21069000, 2.0, 620.04, false, 14);
INSERT INTO public.moon VALUES (42, 'Aoede', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 23807655, 4.0, 748.8, false, 14);
INSERT INTO public.moon VALUES (43, 'Thelxinoe', 'Jupiter', 'One of the three original muses (goddesses of literature, science, and arts)', '2003', 'Scott S. Sheppard & B. Gladman', 21162000, 2.0, 628.09, false, 14);
INSERT INTO public.moon VALUES (44, 'Arche', 'Jupiter', 'One of the muses', '2002', 'S. Sheppard', 23064000, 3.0, 715.6, false, 14);
INSERT INTO public.moon VALUES (45, 'Kallichore', 'Jupiter', 'One of the nymphs', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 22395390, 2.0, 683.0, false, 14);
INSERT INTO public.moon VALUES (46, 'Helike', 'Jupiter', 'One of the nymphs', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 10972830, 4.0, 233.8, true, 14);
INSERT INTO public.moon VALUES (47, 'Carpo', 'Jupiter', 'Daughter of Zeus and one of the Horae (goddesses of the seasons)', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 17100000, 3.0, 456.5, false, 14);
INSERT INTO public.moon VALUES (48, 'Eukelade', 'Jupiter', 'Also written as Eucelade. One of the muses', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 24557295, 4.0, 746.4, false, 14);
INSERT INTO public.moon VALUES (49, 'Cyllene', 'Jupiter', 'A naiad (a spirit or nymph that hangs in rivers, lakes, streams or other water bodies)', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 24000000, 2.0, 737.8, false, 14);
INSERT INTO public.moon VALUES (50, 'Kore', 'Jupiter', 'Alternativve name for Persephone, daughter of Zeus and wife to Hades which made her queen of the underworld.', '2003', 'S. Sheppard, D. Jewitt, & J. Kleyna', 24543000, 2.0, 779.2, false, 14);
INSERT INTO public.moon VALUES (51, 'Mimas', 'Saturn', 'One of the Gigantes (giants). Son of Gaia (Earth)', '1789', 'W. Herschel', 185520, 398.0, 0.942, true, 29);
INSERT INTO public.moon VALUES (52, 'Enceladus', 'Saturn', 'One of the Gigantes (giants). Son of Gaia (Earth) and Uranus (Sky)', '1789', 'W. Herschel', 238020, 498.0, 1.37, true, 29);
INSERT INTO public.moon VALUES (53, 'Tethys', 'Saturn', 'One of the Titans. Mother of the Oceanids.', '1684', 'G. Cassini', 294660, 1060.0, 1.888, true, 29);
INSERT INTO public.moon VALUES (54, 'Dione', 'Saturn', 'One of the Titans', '1684', 'G. Cassini', 377400, 1120.0, 2.737, true, 29);
INSERT INTO public.moon VALUES (55, 'Rhea', 'Saturn', 'One of the Titans. Older sister of Cronus.', '1672', 'G. Cassini', 527040, 1528.0, 4.518, true, 29);
INSERT INTO public.moon VALUES (56, 'Titan', 'Saturn', 'Named after the Greek Titans', '1655', 'C. Huygens', 1221850, 5150.0, 15.945, true, 29);
INSERT INTO public.moon VALUES (57, 'Hyperion', 'Saturn', 'Titan god of observation. Father of Helios, Eos, and Selene (the Moon)', '1848', 'W. Bond', 1481000, 226.0, 21.277, true, 29);
INSERT INTO public.moon VALUES (58, 'Iapetus', 'Saturn', 'One of the Titans. Father of Atlas and Prometheus. Also written as Japetus', '1671', 'G. Cassini', 3561300, 1436.0, 79.3215, true, 29);
INSERT INTO public.moon VALUES (59, 'Phoebe', 'Saturn', 'One of the first generation Titaness. It means “shining” or “bright”. Original owner of the oracle of Delphi.', '1898', 'W. Pickering', 12952000, 220.0, 550.48, true, 29);
INSERT INTO public.moon VALUES (60, 'Janus', 'Saturn', 'Roman god of beginnings, duality, time, and doorways.', '1966', 'A. Dollfus', 151472, 154.0, 0.695, true, 29);
INSERT INTO public.moon VALUES (61, 'Epimetheus', 'Saturn', 'One of the Titans. Brother of Prometheus', '1966', 'R. Walker', 151422, 110.0, 0.694, true, 29);
INSERT INTO public.moon VALUES (62, 'Helene', 'Saturn', 'Named after Helen of Troy. Granddaughter of Cronus.', '1980', 'Laques & Lecacheux', 377400, 28.0, 2.737, true, 29);
INSERT INTO public.moon VALUES (63, 'Telesto', 'Saturn', 'Personification of divine blessing and success. One of the Oceanids.', '1980', 'B. Smith', 294660, 16.0, 1.888, true, 29);
INSERT INTO public.moon VALUES (64, 'Calypso', 'Saturn', 'A nymph who lived in the island of Ogygia', '1980', 'B. Smith', 294660, 16.0, 1.888, true, 29);
INSERT INTO public.moon VALUES (65, 'Atlas', 'Saturn', 'One of the Titans. Condemned to hold up the sky for eternity after the Titanomachy', '1980', 'R. Terrile', 137640, 27.0, 0.602, true, 29);
INSERT INTO public.moon VALUES (66, 'Prometheus', 'Saturn', 'One of the Titans. Known for stealing the fire of the gods and gifting it to humanity', '1980', 'S. Collins', 139350, 68.0, 0.613, true, 29);
INSERT INTO public.moon VALUES (67, 'Pandora', 'Saturn', 'Also known as Anesidora.It means “she who sends up gifts”', '1980', 'S. Collins', 141700, 62.0, 0.629, true, 29);
INSERT INTO public.moon VALUES (68, 'Pan', 'Saturn', 'God of the wild, sheperds, and flocks.', '1990', 'M. Showalter', 133630, 19.32, 0.575, true, 29);
INSERT INTO public.moon VALUES (69, 'Ymir', 'Saturn', 'Ancestor to all the frost giants in Norse mythology. Also known as Aurgelmir, Brimir, or Bláinn', '2000', 'Intl. Team of 8 Astronomers', 23096000, 20.0, 1312.37, false, 29);
INSERT INTO public.moon VALUES (70, 'Paaliaq', 'Saturn', 'Named after after a fictional shaman in the book The Curse of the Shaman', '2000', 'Intl. Team of 8 Astronomers', 15199000, 25.0, 686.92, true, 29);
INSERT INTO public.moon VALUES (71, 'Tarvos', 'Saturn', 'A divine figure of a bulle with thre cranes perched on its back', '2000', 'Intl. Team of 8 Astronomers', 18239000, 16.0, 925.7, false, 29);
INSERT INTO public.moon VALUES (72, 'Ijiraq', 'Saturn', 'Shapeshifting creature in Inuit mythology', '2000', 'Intl. Team of 8 Astronomers', 11440000, 14.0, 451.48, true, 29);
INSERT INTO public.moon VALUES (73, 'Suttungr', 'Saturn', 'A Jötunn (giant) in Norse mythlogy', '2000', 'Gladman et al.', 19470000, 7.0, 1016.8, false, 29);
INSERT INTO public.moon VALUES (74, 'Kiviuq', 'Saturn', 'A hero in Inuit mythology', '2000', 'Intl. Team of 8 Astronomers', 11365000, 17.0, 449.22, true, 29);
INSERT INTO public.moon VALUES (75, 'Mundilfari', 'Saturn', 'Father of the Sun and the Moon in Norse mythology', '2000', 'Intl. Team of 8 Astronomers', 18709000, 7.0, 951.38, false, 29);
INSERT INTO public.moon VALUES (76, 'Albiorix', 'Saturn', 'Named after a Gallic giant who was said to be “king of the world”', '2000', 'Gladman et al.', 16392000, 30.0, 783.0, true, 29);
INSERT INTO public.moon VALUES (77, 'Skathi', 'Saturn', 'Also known as Skadi or Skaði. A goddess associated with bowhunting, skiing, winter, and the mountains', '2000', 'Intl. Team of 8 Astronomers', 15645000, 8.0, 728.93, true, 29);
INSERT INTO public.moon VALUES (78, 'Erriapus', 'Saturn', 'A giant in Gaulish (Celtic) mythology', '2000', 'Intl. Team of 8 Astronomers', 17611000, 10.0, 871.17, false, 29);
INSERT INTO public.moon VALUES (79, 'Siarnaq', 'Saturn', 'Inuit goddess of the sea. Also kown as Sedna', '2000', 'Intl. Team of 8 Astronomers', 18160000, 45.0, 893.07, false, 29);
INSERT INTO public.moon VALUES (80, 'Thrymr', 'Saturn', 'King of the Jǫtnar in Norse mythology', '2000', 'Intl. Team of 8 Astronomers', 20470000, 7.0, 1088.89, false, 29);
INSERT INTO public.moon VALUES (81, 'Narvi', 'Saturn', 'Named after Narfi, a Jötunn (giant) in Norse mythlogy', '2003', 'Scott S. Sheppard, David Jewitt, and Jan Kleyna', 18719000, 8.0, 956.2, false, 29);
INSERT INTO public.moon VALUES (82, 'Methone', 'Saturn', 'One of the Alkyonides, the seven beatiful daughters of Alkyoneus', '2004', 'C.C. Porco et al./Cassini', 194000, 3.0, 1.01, true, 29);
INSERT INTO public.moon VALUES (83, 'Pallene', 'Saturn', 'One of the Alkyonides, the seven beatiful daughters of Alkyoneus', '2004', 'C.C. Porco et al./Cassini', 211000, 4.0, 1.14, true, 29);
INSERT INTO public.moon VALUES (84, 'Polydeuces', 'Saturn', 'Alternative name for Pollux, son of Zeus and Leda', '2004', 'C.C. Porco et al./Cassini', 377400, 4.0, 2.74, true, 29);
INSERT INTO public.moon VALUES (85, 'Daphnis', 'Saturn', 'A Sicilian sheperd, descendant of the Titans', '2005', 'Cassini Imaging Science Team', 136500, 7.0, 0.594, true, 29);
INSERT INTO public.moon VALUES (86, 'Aegir', 'Saturn', 'Personification of the tranquil seas in Norse mythology', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 20735000, 6.0, 1116.5, false, 29);
INSERT INTO public.moon VALUES (87, 'Bebhionn', 'Saturn', 'Irish goddess of birth', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 17119000, 6.0, 834.8, false, 29);
INSERT INTO public.moon VALUES (88, 'Bergelmir', 'Saturn', 'A giant of Norse mythology. Grandsonof Ymir', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 19338000, 6.0, 1005.9, false, 29);
INSERT INTO public.moon VALUES (89, 'Bestla', 'Saturn', 'Mother of Odin', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 20129000, 7.0, 1083.6, false, 29);
INSERT INTO public.moon VALUES (90, 'Farbauti', 'Saturn', 'Father of Loki', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 20390000, 5.0, 1086.1, false, 29);
INSERT INTO public.moon VALUES (91, 'Fenrir', 'Saturn', 'Giant wolf from Norse mythology', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 22453000, 4.0, 1260.3, false, 29);
INSERT INTO public.moon VALUES (92, 'Fornjot', 'Saturn', 'A giant of Norse mythology', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 25108000, 6.0, 1490.9, false, 29);
INSERT INTO public.moon VALUES (93, 'Hati', 'Saturn', 'Giant wolf from Norse mythology. Son of Fenrir', '2005', 'D. Jewitt, S. Sheppard, J. Kleyna', 19856000, 6.0, 1038.7, false, 29);
INSERT INTO public.moon VALUES (94, 'Hyrrokkin', 'Saturn', 'A female Jötunn (giant)', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 18437000, 8.0, 931.8, false, 29);
INSERT INTO public.moon VALUES (95, 'Kari', 'Saturn', 'Personification of wind in Norse mythology', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 22118000, 7.0, 1233.6, false, 29);
INSERT INTO public.moon VALUES (96, 'Loge', 'Saturn', 'Also named Logi. A fire Jötunn (giant)', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 23065000, 6.0, 1312.0, false, 29);
INSERT INTO public.moon VALUES (97, 'Skoll', 'Saturn', 'Giant wolf from Norse mythology. Son of Fenrir', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 17665000, 6.0, 878.3, false, 29);
INSERT INTO public.moon VALUES (98, 'Surtur', 'Saturn', 'Also known as Surt. Leader of the fire fire Jötunn (giants)', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 22707000, 6.0, 1297.7, false, 29);
INSERT INTO public.moon VALUES (99, 'Anthe', 'Saturn', 'It means “flowery”. One of the Alkyonides, the seven beatiful daughters of Alkyoneus', '2004', 'Cassini Imaging Team', 197700, 1.0, 1.04, true, 29);
INSERT INTO public.moon VALUES (100, 'Jarnsaxa', 'Saturn', 'A female Jötunn (giant)', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 18811000, 6.0, 964.7, false, 29);
INSERT INTO public.moon VALUES (101, 'Greip', 'Saturn', 'A female Jötunn (giant)', '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 18206000, 6.0, 921.2, false, 29);
INSERT INTO public.moon VALUES (102, 'Tarqeq', 'Saturn', 'A lunar (moon) deity in Inuit mythology', '2007', 'S. Sheppard, D. Jewitt, J. Kleyna', 18009000, 7.0, 887.5, false, 29);
INSERT INTO public.moon VALUES (103, 'S/2004 S 12', 'Saturn', NULL, '2004', 'D. Jewitt, S. Sheppard, J. Kleyna', 19650000, 5.0, 1048.0, false, 29);
INSERT INTO public.moon VALUES (104, 'S/2004 S 13', 'Saturn', NULL, '2004', 'D. Jewitt, S. Sheppard, J. Kleyna', 18450000, 6.0, 906.0, false, 29);
INSERT INTO public.moon VALUES (105, 'S/2004 S 17', 'Saturn', NULL, '2004', 'D. Jewitt, S. Sheppard, J. Kleyna', 18600000, 4.0, 986.0, false, 29);
INSERT INTO public.moon VALUES (106, 'S/2006 S 1', 'Saturn', NULL, '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 18981135, 6.0, 970.0, false, 29);
INSERT INTO public.moon VALUES (107, 'S/2006 S 3', 'Saturn', NULL, '2006', 'S. Sheppard, D. Jewitt, J. Kleyna', 21132000, 6.0, 1142.0, false, 29);
INSERT INTO public.moon VALUES (108, 'S/2007 S 2', 'Saturn', NULL, '2007', 'S. Sheppard, D. Jewitt, J. Kleyna', 16560000, 6.0, 800.0, true, 29);
INSERT INTO public.moon VALUES (109, 'S/2007 S 3', 'Saturn', NULL, '2007', 'S. Sheppard, D. Jewitt, J. Kleyna', 20518500, 5.0, 1100.0, false, 29);
INSERT INTO public.moon VALUES (110, 'Ariel', 'Uranus', 'Named after a character in Alexander Pope’s works.', '1851', 'W. Lassell', 191240, 1160.0, 2.52, true, 36);
INSERT INTO public.moon VALUES (111, 'Umbriel', 'Uranus', 'Named after the “dusky melancholy sprite” in Alexander Pope’s works.', '1851', 'W. Lassel', 265970, 1190.0, 4.144, true, 36);
INSERT INTO public.moon VALUES (112, 'Titania', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', '1787', 'W. Herschel', 435840, 1578.0, 8.706, true, 36);
INSERT INTO public.moon VALUES (113, 'Oberon', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', '1787', 'W. Herschel', 582600, 1526.0, 13.463, true, 36);
INSERT INTO public.moon VALUES (114, 'Miranda', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1948', 'G. Kuiper', 129780, 472.0, 1.414, true, 36);
INSERT INTO public.moon VALUES (115, 'Cordelia', 'Uranus', 'Named after a charcter in Shakespeare’s play King Lear', '1986', 'Voyager 2', 49750, 26.0, 0.335, true, 36);
INSERT INTO public.moon VALUES (116, 'Ophelia', 'Uranus', 'Named after a charcter in Shakespeare’s play Hamlet', '1986', 'Voyager 2', 53440, 30.4, 0.3764, true, 36);
INSERT INTO public.moon VALUES (117, 'Bianca', 'Uranus', 'Named after a charcter in Shakespeare’s play The Taming of the Shrew', '1986', 'Voyager 2', 75260, 42.0, 0.433, true, 36);
INSERT INTO public.moon VALUES (118, 'Cressida', 'Uranus', 'Named after a charcter in Shakespeare’s play Troilus and Cressida', '1986', 'Voyager 2', 61770, 62.0, 0.464, true, 36);
INSERT INTO public.moon VALUES (119, 'Desdemona', 'Uranus', 'Named after a charcter in Shakespeare’s play Othello', '1986', 'Voyager 2', 62660, 54.0, 0.474, true, 36);
INSERT INTO public.moon VALUES (120, 'Juliet', 'Uranus', 'Named after a charcter in Shakespeare’s play Romeo and Juliet', '1986', 'Voyager 2', 64360, 84.0, 0.493, true, 36);
INSERT INTO public.moon VALUES (121, 'Portia', 'Uranus', 'Named after a charcter in Shakespeare’s play The Merchant of Venice', '1986', 'Voyager 2', 66085, 108.0, 0.513, true, 36);
INSERT INTO public.moon VALUES (122, 'Rosalind', 'Uranus', 'Named after a charcter in Shakespeare’s play As You Like It', '1986', 'Voyager 2', 69941, 54.0, 0.558, true, 36);
INSERT INTO public.moon VALUES (123, 'Belinda', 'Uranus', 'Named after a character in Alexander Pope’s works.', '1986', 'Voyager 2', 75260, 66.0, 0.624, true, 36);
INSERT INTO public.moon VALUES (124, 'Puck', 'Uranus', 'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream', '1985', 'Voyager 2', 86010, 154.0, 0.762, true, 36);
INSERT INTO public.moon VALUES (125, 'Caliban', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1997', 'Gladman, Nicholson, Burns, & Kavelaars', 7200000, 80.0, 579.5, true, 36);
INSERT INTO public.moon VALUES (126, 'Sycorax', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1997', 'Gladman, Nicholson, Burns, & Kavelaars', 12200000, 160.0, 1283.39, true, 36);
INSERT INTO public.moon VALUES (127, 'Prospero', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1999', 'Kavelaars, Gladman, Holman et al', 16256000, 30.0, 5.346, true, 36);
INSERT INTO public.moon VALUES (128, 'Setebos', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1999', 'Kavelaars, Gladman, Holman et al', 17418000, 47.0, 2234.8, false, 36);
INSERT INTO public.moon VALUES (129, 'Stephano', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '1999', 'Kavelaars, Gladman, Holman et al', 8004000, 32.0, 677.4, true, 36);
INSERT INTO public.moon VALUES (130, 'Trinculo', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '2001', 'M. Holman, J. Kavelaars & D. Milisavljevic', 8578000, 10.0, 759.0, true, 36);
INSERT INTO public.moon VALUES (131, 'Francisco', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '2001', 'M. Holman & B. Gladman et al', 4276000, 22.0, 266.6, true, 36);
INSERT INTO public.moon VALUES (132, 'Margaret', 'Uranus', 'Named after a charcter in Shakespeare’s play Much Ado About Nothing', '2003', 'S. Sheppard', 14688700, 11.0, 1694.8, true, 36);
INSERT INTO public.moon VALUES (133, 'Ferdinand', 'Uranus', 'Named after a charcter in Shakespeare’s play The Tempest', '2001', 'M. Holman & B. Gladman et al', 20901000, 21.0, 2823.4, false, 36);
INSERT INTO public.moon VALUES (134, 'Perdita', 'Uranus', 'Named after a charcter in Shakespeare’s play The Winter’s Tale', '1986', 'E. Karkoschka/Voyager 2', 76420, 20.0, 0.638, true, 36);
INSERT INTO public.moon VALUES (135, 'Mab', 'Uranus', 'Named after a charcter in Shakespeare’s play Romeo and Juliet', '2003', 'M. Showalter & J. Lissauer', 97734, 16.0, 0.923, true, 36);
INSERT INTO public.moon VALUES (136, 'Cupid', 'Uranus', 'Named after a charcter in Shakespeare’s play Timon of Athens', '2003', 'M. Showalter & J. Lissauer', 74800, 12.0, 0.618, true, 36);
INSERT INTO public.moon VALUES (137, 'Triton', 'Neptune', 'Greek god of the sea. Son of Poseidon', '1846', 'W. Lassel', 354800, 2705.0, 5.877, true, 20);
INSERT INTO public.moon VALUES (138, 'Nereid', 'Neptune', 'Named after the Nereids, the sea-nymphs of Greek mythology', '1949', 'G. Kuiper', 5513400, 340.0, 360.16, true, 20);
INSERT INTO public.moon VALUES (139, 'Naiad', 'Neptune', 'Named after the Naiads, spirts or nymphs of rivers, seas, fountains, etc.', '1989', 'Voyager 2', 48200, 50.0, 0.3, true, 20);
INSERT INTO public.moon VALUES (140, 'Thalassa', 'Neptune', 'Pre-Greek word for “sea” and its representation in mythology', '1989', 'Voyager 2', 50000, 90.0, 0.31, true, 20);
INSERT INTO public.moon VALUES (141, 'Despina', 'Neptune', 'Also known as Despoina. One of Poseidon’s daughter', '1989', 'Voyager 2', 62000, 160.0, 0.4, true, 20);
INSERT INTO public.moon VALUES (142, 'Galatea', 'Neptune', 'One of the Nereids in Greek mythology', '1989', 'Voyager 2', 52500, 140.0, 0.33, true, 20);
INSERT INTO public.moon VALUES (143, 'Larissa', 'Neptune', 'Nymph from Thelassy in Greek mythology', '1989', 'Voyager 2', 73600, 200.0, 0.56, true, 20);
INSERT INTO public.moon VALUES (144, 'Proteus', 'Neptune', 'Shape-changing sea god in Greek mythology', '1989', 'Voyager 2', 117600, 420.0, 1.12, true, 20);
INSERT INTO public.moon VALUES (145, 'Halimede', 'Neptune', 'One of the Nereids in Greek mythology', '2002', 'M. Holman & J.J. Kavelaars', 15686000, 60.0, 1874.83, true, 20);
INSERT INTO public.moon VALUES (146, 'Psamathe', 'Neptune', 'One of the Nereids in Greek mythology', '2003', 'D. Jewitt, J. Kleyna & S. Sheppard', 46738000, 38.0, 9136.11, false, 20);
INSERT INTO public.moon VALUES (147, 'Sao', 'Neptune', 'One of the Nereids. Associated with “safety” and “rescue” at sea.', '2002', 'M. Holman & J.J. Kavelaars', 22337190, 38.0, 2925.6, false, 20);
INSERT INTO public.moon VALUES (148, 'Laomedeia', 'Neptune', 'One of the Nereids in Greek mythology', '2002', 'M. Holman & J.J. Kavelaars', 22613200, 38.0, 2980.4, false, 20);
INSERT INTO public.moon VALUES (149, 'Neso', 'Neptune', 'One of the Nereids in Greek mythology', '2002', 'Holman & Gladman et al', 47279670, 60.0, 9007.1, false, 20);
INSERT INTO public.moon VALUES (150, 'Charon', 'Pluto', '﻿', '1978', 'J. Christy', 19571, 1207.0, 6.387, true, 40);
INSERT INTO public.moon VALUES (151, 'Nix', 'Pluto', '﻿', '2005', 'H.A. Weaver, S.A. Stern, et al.', 48675, 130.0, 24.856, true, 40);
INSERT INTO public.moon VALUES (152, 'Hydra', 'Pluto', '﻿', '2005', 'H.A. Weaver, S.A. Stern, et al.', 64780, 130.0, 38.206, true, 40);
INSERT INTO public.moon VALUES (153, 'Kerberos', 'Pluto', '﻿', '2011', 'Showalter, M. R. et al.', 59000, 34.0, 32.1, true, 40);
INSERT INTO public.moon VALUES (154, 'Styx', 'Pluto', '﻿', '2012', 'Showalter, M. R. et al.', 42000, 25.0, 20.2, true, 40);
INSERT INTO public.moon VALUES (155, 'Hiʻiaka', 'Haumea', '﻿', '2005', 'H.A. Weaver, S.A. Stern, et al.', 49500, 310.0, 49.12, true, 42);
INSERT INTO public.moon VALUES (156, 'Namaka', 'Haumea', '﻿', '2005', 'H.A. Weaver, S.A. Stern, et al.', 39000, 170.0, 34.7, true, 42);
INSERT INTO public.moon VALUES (157, 'Dysnomia', 'Eris', '﻿', '2005', 'M. Brown, M. van Dam, A. Bouches, D. Le Mignant', 36000, 300.0, 14.0, true, 45);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Amateru', 'Ain', 155.0, 2006.0, 'From Amaterasu, the Japanese goddess of the sun', 10);
INSERT INTO public.planet VALUES (2, 'Arion', 'Musica', 238.0, 2008.0, 'Ancient Greek poet', 220);
INSERT INTO public.planet VALUES (3, 'Arkas', 'Intercrus', 288.0, 2007.0, 'One of the sons of Zeus and Callisto in Greek mythology', 160);
INSERT INTO public.planet VALUES (4, 'Brahe', 'Copernicus', 41.0, 2004.0, 'Danish astronomer', 111);
INSERT INTO public.planet VALUES (5, 'Dimidium', 'Helvetios', 50.0, 1995.0, 'From the latin word for “half”', 155);
INSERT INTO public.planet VALUES (6, 'Draugr', 'Lich', 2300.0, 1994.0, 'From Norse mythology', 180);
INSERT INTO public.planet VALUES (7, 'Dulcinea', 'Cervantes', 50.0, 2004.0, 'from the word for “sweet” in Spanish', 106);
INSERT INTO public.planet VALUES (8, 'Earth', 'Centaurus', 0.0, NULL, '“the ground”', 257);
INSERT INTO public.planet VALUES (9, 'Fortitudo', 'Libertas', 204.0, 2007.0, 'Latin for “fortitude”', 179);
INSERT INTO public.planet VALUES (10, 'Galileo', 'Copernicus', 41.0, 1996.0, 'Italian astronomer', 111);
INSERT INTO public.planet VALUES (11, 'Harriot', 'Copernicus', 41.0, 2007.0, 'English astronomer', 111);
INSERT INTO public.planet VALUES (12, 'Hypatia', 'Edasich', 102.0, 2002.0, 'Female Greek astronomer and philosopher', 125);
INSERT INTO public.planet VALUES (13, 'Janssen', 'Copernicus', 41.0, 2004.0, 'Dutch astronomer', 111);
INSERT INTO public.planet VALUES (14, 'Jupiter', 'Centaurus', 0.0, NULL, 'Roman equivalent to the Greek god Zeus', 121);
INSERT INTO public.planet VALUES (15, 'Lipperhey', 'Copernicus', 41.0, 2002.0, 'Dutch lensmaker', 111);
INSERT INTO public.planet VALUES (16, 'Majriti', 'Titawin', 44.0, 1999.0, 'Muslim astronomer', 308);
INSERT INTO public.planet VALUES (17, 'Mars', 'Centaurus', 0.0, NULL, 'Roman equivalent of the Greek god Ares', 19);
INSERT INTO public.planet VALUES (18, 'Mercury', 'Centaurus', 0.0, NULL, 'Roman equivalent of the Greek god Hermes', 285);
INSERT INTO public.planet VALUES (19, 'Meztli', 'Tonatiuh', 333.0, 2003.0, 'Aztec god of the moon and the night', 310);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Centaurus', 0.0, NULL, 'Roman equivalent of the Greek god Poseidon', 266);
INSERT INTO public.planet VALUES (21, 'Orbitar', 'Fafnir', 317.0, 2008.0, '“to orbit”', 133);
INSERT INTO public.planet VALUES (22, 'Phobetor', 'Lich', 2300.0, 1992.0, 'Greek myth', 180);
INSERT INTO public.planet VALUES (23, 'Poltergeist', 'Lich', 2300.0, 1992.0, '“noisy ghost” (Germany)', 180);
INSERT INTO public.planet VALUES (24, 'Quijote', 'Cervantes', 50.0, 2000.0, 'From Don Quixote', 106);
INSERT INTO public.planet VALUES (25, 'Rocinante', 'Cervantes', 50.0, 2004.0, 'The horse of Don Quixote', 106);
INSERT INTO public.planet VALUES (26, 'Saffar', 'Titawin', 44.0, 1996.0, 'Muslim astronomer', 308);
INSERT INTO public.planet VALUES (27, 'Samh', 'Titawin', 44.0, 1999.0, 'Muslim astronomer', 308);
INSERT INTO public.planet VALUES (28, 'Sancho', 'Cervantes', 50.0, 2006.0, 'Character from Don Quixote', 106);
INSERT INTO public.planet VALUES (29, 'Saturn', 'Centaurus', 0.0, NULL, 'Roman equivalent to the Greek god Cronus', 117);
INSERT INTO public.planet VALUES (30, 'Smertrios', 'Ogma', 257.0, 2005.0, 'Gallic god of war', 229);
INSERT INTO public.planet VALUES (31, 'Spe', 'Veritate', 249.0, 2008.0, '“Hope” (Latin)', 317);
INSERT INTO public.planet VALUES (32, 'Tadmor', 'Errai', 45.0, 2003.0, 'Modern Arabic name for Palmyra', 132);
INSERT INTO public.planet VALUES (33, 'Taphao Kaew', 'Chalawan', 46.0, 2001.0, 'One of two sisters associated with a Thai folk tale', 107);
INSERT INTO public.planet VALUES (34, 'Taphao Thong', 'Chalawan', 46.0, 1996.0, 'One of two sisters associated with a Thai folk tale', 107);
INSERT INTO public.planet VALUES (35, 'Thestias', 'Pollux', 34.0, 2006.0, 'Greek myth', 242);
INSERT INTO public.planet VALUES (36, 'Uranus', 'Centaurus', 0.0, NULL, 'Personification of the sky in Greek mythology', 152);
INSERT INTO public.planet VALUES (37, 'Venus', 'Centaurus', 0.0, NULL, 'Roman equivalent of the Greek goddess Aphrodite', 254);
INSERT INTO public.planet VALUES (38, 'Ceres', 'Leo', 413.9, 1801.0, 'Roman goddess of agriculture', 254);
INSERT INTO public.planet VALUES (39, 'Orcus', 'Sagittarius', 6500.0, 2004.0, 'One of the Roman deities of the underworld', 166);
INSERT INTO public.planet VALUES (40, 'Pluto', 'Sagittarius', 5913.52, 1930.0, 'Greek god of the underworld', 166);
INSERT INTO public.planet VALUES (41, 'Salacia', 'Pegasus', 6311.53, 2004.0, 'Roman goddess of salt water. Consort to Neptune.', 131);
INSERT INTO public.planet VALUES (42, 'Haumea', 'Bootes', 6000.0, 2004.0, 'Goddess of fertility and childbirth in Hawaiian mythology', 70);
INSERT INTO public.planet VALUES (43, 'Quaoar', 'Ophiuchus', 6400.0, 2002.0, 'Mythological figure of the Mission Indians of coastal Southern California', 252);
INSERT INTO public.planet VALUES (44, 'Gonggong', 'Aquarius', 9997.62, 2007.0, 'Chinese water god', 266);
INSERT INTO public.planet VALUES (45, 'Eris', 'Cetus', 10139.74, 2005.0, 'Gree goddess of strife and discord', 121);
INSERT INTO public.planet VALUES (46, 'Sedna', 'Taurus', 75696.52, 2003.0, 'Goddess of the sea in Inuit mythology', 19);
INSERT INTO public.planet VALUES (47, 'Varda', 'Aquarius', NULL, 2003.0, 'Queen of the Valar, creator of the stars in J.R.R. Tolkien’s books', 266);


--
-- Data for Name: planet_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_star VALUES (1, 'Ceres', 'Leo', 'Regulus', 254, 'Regulus', NULL);
INSERT INTO public.planet_star VALUES (2, 'Venus', 'Centaurus', 'Regulus', 254, 'Regulus', NULL);
INSERT INTO public.planet_star VALUES (3, 'Orcus', 'Sagittarius', 'Kaus Australis', 166, 'Kaus Australis', NULL);
INSERT INTO public.planet_star VALUES (4, 'Pluto', 'Sagittarius', 'Kaus Australis', 166, 'Kaus Australis', NULL);
INSERT INTO public.planet_star VALUES (5, 'Salacia', 'Pegasus', 'Enif', 131, 'Enif', NULL);
INSERT INTO public.planet_star VALUES (6, 'Haumea', 'Boötes', 'Arcturus', 70, 'Arcturus', NULL);
INSERT INTO public.planet_star VALUES (7, 'Quaoar', 'Ophiuchus', 'Rasalhague', 252, 'Rasalhague', NULL);
INSERT INTO public.planet_star VALUES (8, 'Gonggong', 'Aquarius', 'Sadalsuud', 266, 'Sadalsuud', NULL);
INSERT INTO public.planet_star VALUES (9, 'Varda', 'Aquarius', 'Sadalsuud', 266, 'Sadalsuud', NULL);
INSERT INTO public.planet_star VALUES (10, 'Neptune', 'Centaurus', 'Sadalsuud', 266, 'Sadalsuud', NULL);
INSERT INTO public.planet_star VALUES (11, 'Eris', 'Cetus', 'Diphda', 121, 'Diphda', NULL);
INSERT INTO public.planet_star VALUES (12, 'Jupiter', 'Centaurus', 'Diphda', 121, 'Diphda', NULL);
INSERT INTO public.planet_star VALUES (13, 'Sedna', 'Taurus', 'Aldebaran', 19, 'Aldebaran', NULL);
INSERT INTO public.planet_star VALUES (14, 'Mars', 'Centaurus', 'Aldebaran', 19, 'Aldebaran', NULL);
INSERT INTO public.planet_star VALUES (15, 'Earth', 'Centaurus', 'Rigil Kentaurus', 257, 'Rigil Kentaurus', NULL);
INSERT INTO public.planet_star VALUES (16, 'Mercury', 'Centaurus', 'Spica', 285, 'Spica', NULL);
INSERT INTO public.planet_star VALUES (17, 'Saturn', 'Centaurus', 'Deneb', 117, 'Deneb', NULL);
INSERT INTO public.planet_star VALUES (18, 'Uranus', 'Centaurus', 'Hamal', 152, 'Hamal', NULL);
INSERT INTO public.planet_star VALUES (19, 'Majriti', 'Andromeda', 'Titawin', 308, 'Titawin', NULL);
INSERT INTO public.planet_star VALUES (20, 'Saffar', 'Andromeda', 'Titawin', 308, 'Titawin', NULL);
INSERT INTO public.planet_star VALUES (21, 'Samh', 'Andromeda', 'Titawin', 308, 'Titawin', NULL);
INSERT INTO public.planet_star VALUES (22, 'Spe', 'Andromeda', 'Veritate', 317, 'Veritate', NULL);
INSERT INTO public.planet_star VALUES (23, 'Fortitudo', 'Aquila', 'Libertas', 179, 'Libertas', NULL);
INSERT INTO public.planet_star VALUES (24, 'Dulcinea', 'Ara', 'Cervantes', 106, 'Cervantes', NULL);
INSERT INTO public.planet_star VALUES (25, 'Quijote', 'Ara', 'Cervantes', 106, 'Cervantes', NULL);
INSERT INTO public.planet_star VALUES (26, 'Rocinante', 'Ara', 'Cervantes', 106, 'Cervantes', NULL);
INSERT INTO public.planet_star VALUES (27, 'Sancho', 'Ara', 'Cervantes', 106, 'Cervantes', NULL);
INSERT INTO public.planet_star VALUES (28, 'Meztli', 'Camelopardalis', 'Tonatiuh', 310, 'Tonatiuh', NULL);
INSERT INTO public.planet_star VALUES (29, 'Brahe', 'Cancer', 'Copernicus', 111, 'Copernicus', NULL);
INSERT INTO public.planet_star VALUES (30, 'Galileo', 'Cancer', 'Copernicus', 111, 'Copernicus', NULL);
INSERT INTO public.planet_star VALUES (31, 'Harriot', 'Cancer', 'Copernicus', 111, 'Copernicus', NULL);
INSERT INTO public.planet_star VALUES (32, 'Janssen', 'Cancer', 'Copernicus', 111, 'Copernicus', NULL);
INSERT INTO public.planet_star VALUES (33, 'Lipperhey', 'Cancer', 'Copernicus', 111, 'Copernicus', NULL);
INSERT INTO public.planet_star VALUES (34, 'Proxima Centauri b', 'Centaurus', 'Proxima Centauri', 248, 'Proxima Centauri', NULL);
INSERT INTO public.planet_star VALUES (35, 'Tadmor', 'Cepheus', 'Errai', 132, 'Errai', NULL);
INSERT INTO public.planet_star VALUES (36, 'Arion', 'Delphinus', 'Musica', 220, 'Musica', NULL);
INSERT INTO public.planet_star VALUES (37, 'Hypatia', 'Draco', 'Edasich', 125, 'Edasich', NULL);
INSERT INTO public.planet_star VALUES (38, 'Orbitar', 'Draco', 'Fafnir', 133, 'Fafnir', NULL);
INSERT INTO public.planet_star VALUES (39, 'Aegir', 'Eridanus', 'Ran', 249, 'Ran', NULL);
INSERT INTO public.planet_star VALUES (40, 'Thestias', 'Gemini', 'Pollux', 242, 'Pollux', NULL);
INSERT INTO public.planet_star VALUES (41, 'Smertrios', 'Hercules', 'Ogma', 229, 'Ogma', NULL);
INSERT INTO public.planet_star VALUES (42, 'Dimidium', 'Pegasus', 'Helvetios', 155, 'Helvetios', NULL);
INSERT INTO public.planet_star VALUES (43, 'Amateru', 'Taurus', 'Ain', 10, 'Ain', NULL);
INSERT INTO public.planet_star VALUES (44, 'Taphao Kaew', 'Ursa Major', 'Chalawan', 107, 'Chalawan', NULL);
INSERT INTO public.planet_star VALUES (45, 'Taphao Thong', 'Ursa Major', 'Chalawan', 107, 'Chalawan', NULL);
INSERT INTO public.planet_star VALUES (46, 'Arkas', 'Ursa Major', 'Intercrus', 160, 'Intercrus', NULL);
INSERT INTO public.planet_star VALUES (47, 'Draugr', 'Virgo', 'Lich', 180, 'Lich', NULL);
INSERT INTO public.planet_star VALUES (48, 'Phobetor', 'Virgo', 'Lich', 180, 'Lich', NULL);
INSERT INTO public.planet_star VALUES (49, 'Poltergeist', 'Virgo', 'Lich', 180, 'Lich', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Achird', 'Cassiopeia', 'η Cassiopeiae A', 'HR 219', '2017-09-05', 5, 50);
INSERT INTO public.star VALUES (7, 'Adhafera', 'Leo', 'ζ Leonis Aa', 'HR 4031', '2016-07-20', 6, 22);
INSERT INTO public.star VALUES (9, 'Adhil', 'Andromeda', 'ξ Andromedae', 'HR 390', '2016-08-21', 6, 56);
INSERT INTO public.star VALUES (11, 'Ainalrami', 'Sagittarius', 'ν1 Sagittarii A', 'HR 7116', '2017-09-05', 5, 5);
INSERT INTO public.star VALUES (13, 'Albaldah', 'Sagittarius', 'π Sagittarii A', 'HR 7264', '2017-09-05', 5, 5);
INSERT INTO public.star VALUES (14, 'Albali', 'Aquarius', 'ε Aquarii', 'HR 7950', '2016-09-12', 6, 2);
INSERT INTO public.star VALUES (15, 'Albireo', 'Cygnus', 'β1 Cygni Aa', 'HR 7417', '2016-07-20', 6, 24);
INSERT INTO public.star VALUES (16, 'Alchiba', 'Corvus', 'α Corvi', 'HR 4623', '2016-09-12', 6, 1);
INSERT INTO public.star VALUES (17, 'Alcor', 'Ursa Major', '80 Ursae Majoris Ca', 'HR 5062', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (21, 'Aldhanab', 'Grus', 'γ Gruis', 'HR 8353', '2017-09-05', 5, 33);
INSERT INTO public.star VALUES (22, 'Aldhibah', 'Draco', 'ζ Draconis A', 'HR 6396', '2017-09-05', 5, 25);
INSERT INTO public.star VALUES (26, 'Algenib', 'Pegasus', 'γ Pegasi', 'HR 39', '2016-06-30', 6, 49);
INSERT INTO public.star VALUES (27, 'Algieba', 'Leo', 'γ1 Leonis', 'HR 4057', '2016-07-20', 6, 22);
INSERT INTO public.star VALUES (28, 'Algol', 'Perseus', 'β Persei Aa1', 'HR 936', '2016-06-30', 6, 62);
INSERT INTO public.star VALUES (29, 'Algorab', 'Corvus', 'δ Corvi A', 'HR 4757', '2016-07-20', 6, 1);
INSERT INTO public.star VALUES (31, 'Alioth', 'Ursa Major', 'ε Ursae Majoris A', 'HR 4905', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (32, 'Aljanah', 'Cygnus', 'ε Cygni Aa', 'HR 7949', '2017-06-30', 5, 24);
INSERT INTO public.star VALUES (33, 'Alkaid', 'Ursa Major', 'η Ursae Majoris', 'HR 5191', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (35, 'Alkaphrah', 'Ursa Major', 'κ Ursae Majoris A', 'HR 3594', '2017-09-05', 5, 8);
INSERT INTO public.star VALUES (36, 'Alkarab', 'Pegasus', 'υ Pegasi', 'HR 8905', '2017-09-05', 5, 49);
INSERT INTO public.star VALUES (39, 'Almach', 'Andromeda', 'γ Andromedae A', 'HR 603', '2016-07-20', 6, 56);
INSERT INTO public.star VALUES (40, 'Alnair', 'Grus', 'α Gruis', 'HR 8425', '2016-07-20', 6, 33);
INSERT INTO public.star VALUES (41, 'Alnasl', 'Sagittarius', 'γ2 Sagittarii', 'HR 6746', '2016-08-21', 6, 5);
INSERT INTO public.star VALUES (45, 'Alphard', 'Hydra', 'α Hydrae', 'HR 3748', '2016-07-20', 6, 39);
INSERT INTO public.star VALUES (47, 'Alpheratz', 'Andromeda', 'α Andromedae Aa', 'HR 15', '2016-06-30', 6, 56);
INSERT INTO public.star VALUES (48, 'Alpherg', 'Pisces', 'η Piscium A', 'HR 437', '2018-06-01', 4, 65);
INSERT INTO public.star VALUES (49, 'Alrakis', 'Draco', 'μ Draconis A', 'HR 6370', '2017-02-01', 5, 25);
INSERT INTO public.star VALUES (50, 'Alrescha', 'Pisces', 'α Piscium A', 'HR 596', '2016-08-21', 6, 65);
INSERT INTO public.star VALUES (51, 'Alruba', 'Draco', 'HD 161693', 'HR 6618', '2018-06-01', 4, 25);
INSERT INTO public.star VALUES (52, 'Alsafi', 'Draco', 'σ Draconis', 'HR 7462', '2017-06-30', 5, 25);
INSERT INTO public.star VALUES (53, 'Alsciaukat', 'Lynx', '31 Lyncis', 'HR 3275', '2017-06-30', 5, 6);
INSERT INTO public.star VALUES (58, 'Altais', 'Draco', 'δ Draconis', 'HR 7310', '2016-08-21', 6, 25);
INSERT INTO public.star VALUES (59, 'Alterf', 'Leo', 'λ Leonis', 'HR 3773', '2017-02-01', 5, 22);
INSERT INTO public.star VALUES (61, 'Alula Australis', 'Ursa Major', 'ξ Ursae Majoris Aa', 'HR 4375', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (62, 'Alula Borealis', 'Ursa Major', 'ν Ursae Majoris', 'HR 4377', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (63, 'Alya', 'Serpens', 'θ1 Serpentis A', 'HR 7141', '2016-08-21', 6, 37);
INSERT INTO public.star VALUES (65, 'Ancha', 'Aquarius', 'θ Aquarii', 'HR 8499', '2016-09-12', 6, 2);
INSERT INTO public.star VALUES (67, 'Ankaa', 'Phoenix', 'α Phoenicis', 'HR 99', '2016-07-20', 6, 63);
INSERT INTO public.star VALUES (71, 'Arkab Posterior', 'Sagittarius', 'β2 Sagittarii', 'HR 7343', '2016-10-05', 6, 5);
INSERT INTO public.star VALUES (72, 'Arkab Prior', 'Sagittarius', 'β1 Sagittarii', 'HR 7337', '2016-10-05', 6, 5);
INSERT INTO public.star VALUES (74, 'Ascella', 'Sagittarius', 'ζ Sagittarii A', 'HR 7194', '2016-09-12', 6, 5);
INSERT INTO public.star VALUES (77, 'Ashlesha', 'Hydra', 'ε Hydrae A', 'HR 3482', '2018-06-01', 4, 39);
INSERT INTO public.star VALUES (78, 'Aspidiske', 'Carina', 'ι Carinae', 'HR 3699', '2016-07-20', 6, 12);
INSERT INTO public.star VALUES (80, 'Athebyne', 'Draco', 'η Draconis A', 'HR 6132', '2017-09-05', 5, 25);
INSERT INTO public.star VALUES (81, 'Atik', 'Perseus', 'ο Persei A', 'HR 1131', '2016-09-12', 6, 62);
INSERT INTO public.star VALUES (84, 'Avior', 'Carina', 'ε Carinae A', 'HR 3307', '2016-07-20', 6, 12);
INSERT INTO public.star VALUES (85, 'Azelfafage', 'Cygnus', 'π1 Cygni', 'HR 8301', '2016-09-12', 6, 24);
INSERT INTO public.star VALUES (89, 'Baten Kaitos', 'Cetus', 'ζ Ceti Aa', 'HR 539', '2016-09-12', 6, 15);
INSERT INTO public.star VALUES (95, 'Biham', 'Pegasus', 'θ Pegasi', 'HR 8450', '2016-08-21', 6, 49);
INSERT INTO public.star VALUES (97, 'Brachium', 'Libra', 'σ Librae A', 'HR 5603', '2017-09-05', 5, 28);
INSERT INTO public.star VALUES (98, 'Bunda', 'Aquarius', 'ξ Aquarii A', 'HR 8264', '2018-06-01', 4, 2);
INSERT INTO public.star VALUES (99, 'Canopus', 'Carina', 'α Carinae A', 'HR 2326', '2016-06-30', 6, 12);
INSERT INTO public.star VALUES (101, 'Caph', 'Cassiopeia', 'β Cassiopeiae A', 'HR 21', '2016-06-30', 6, 50);
INSERT INTO public.star VALUES (103, 'Castula', 'Cassiopeia', 'υ2 Cassiopeiae', 'HR 265', '2017-09-05', 5, 50);
INSERT INTO public.star VALUES (107, 'Chalawan', 'Ursa Major', '47 Ursae Majoris', 'HR 4277', '2015-12-15', 7, 8);
INSERT INTO public.star VALUES (109, 'Chara', 'Canes Venatici', 'β Canum Venaticorum Aa', 'HR 4785', '2016-07-20', 6, 26);
INSERT INTO public.star VALUES (110, 'Chertan', 'Leo', 'θ Leonis', 'HR 4359', '2016-07-20', 6, 22);
INSERT INTO public.star VALUES (112, 'Cor Caroli', 'Canes Venatici', 'α2 Canum Venaticorum Aa', 'HR 4915', '2016-07-20', 6, 26);
INSERT INTO public.star VALUES (113, 'Cujam', 'Hercules', 'ω Herculis A', 'HR 6117', '2017-02-01', 5, 36);
INSERT INTO public.star VALUES (116, 'Dalim', 'Fornax', 'α Fornacis A', 'HR 963', '2017-09-05', 5, 30);
INSERT INTO public.star VALUES (117, 'Deneb', 'Cygnus', 'α Cygni', 'HR 7924', '2016-06-30', 6, 24);
INSERT INTO public.star VALUES (119, 'Denebola', 'Leo', 'β Leonis', 'HR 4534', '2016-06-30', 6, 22);
INSERT INTO public.star VALUES (120, 'Diadem', 'Coma Berenices', 'α Comae Berenices A', 'HR 4968', '2017-02-01', 5, 7);
INSERT INTO public.star VALUES (121, 'Diphda', 'Cetus', 'β Ceti', 'HR 188', '2016-08-21', 6, 15);
INSERT INTO public.star VALUES (123, 'Dubhe', 'Ursa Major', 'α Ursae Majoris A', 'HR 4301', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (124, 'Dziban', 'Draco', 'ψ1 Draconis A', 'HR 6636', '2017-09-05', 5, 25);
INSERT INTO public.star VALUES (125, 'Edasich', 'Draco', 'ι Draconis', 'HR 5744', '2015-12-15', 7, 25);
INSERT INTO public.star VALUES (127, 'Elgafar', 'Virgo', 'φ Virginis A', 'HR 5409', '2018-06-01', 4, 10);
INSERT INTO public.star VALUES (130, 'Eltanin', 'Draco', 'γ Draconis', 'HR 6705', '2016-08-21', 6, 25);
INSERT INTO public.star VALUES (131, 'Enif', 'Pegasus', 'ε Pegasi', 'HR 8308', '2016-07-20', 6, 49);
INSERT INTO public.star VALUES (133, 'Fafnir', 'Draco', '42 Draconis A', 'HR 6945', '2015-12-15', 7, 25);
INSERT INTO public.star VALUES (135, 'Fawaris', 'Cygnus', 'δ Cygni A', 'HR 7528', '2018-06-01', 4, 24);
INSERT INTO public.star VALUES (136, 'Felis', 'Hydra', 'HD 85951', 'HR 3923', '2018-06-01', 4, 39);
INSERT INTO public.star VALUES (138, 'Fulu', 'Cassiopeia', 'ζ Cassiopeiae', 'HR 153', '2017-06-30', 5, 50);
INSERT INTO public.star VALUES (139, 'Fumalsamakah', 'Pisces', 'β Piscium', 'HR 8773', '2018-06-01', 4, 65);
INSERT INTO public.star VALUES (143, 'Giausar', 'Draco', 'λ Draconis', 'HR 4434', '2017-02-01', 5, 25);
INSERT INTO public.star VALUES (144, 'Gienah', 'Corvus', 'γ Corvi A', 'HR 4662', '2016-11-06', 6, 1);
INSERT INTO public.star VALUES (147, 'Grumium', 'Draco', 'ξ Draconis A', 'HR 6688', '2016-09-12', 6, 25);
INSERT INTO public.star VALUES (148, 'Gudja', 'Serpens', 'κ Serpentis', 'HR 5879', '2018-08-10', 4, 37);
INSERT INTO public.star VALUES (150, 'Hadar', 'Centaurus', 'β Centauri Aa', 'HR 5267', '2016-08-21', 6, 4);
INSERT INTO public.star VALUES (155, 'Helvetios', 'Pegasus', '51 Pegasi', 'HR 8729', '2015-12-15', 7, 49);
INSERT INTO public.star VALUES (156, 'Heze', 'Virgo', 'ζ Virginis A', 'HR 5107', '2018-06-01', 4, 10);
INSERT INTO public.star VALUES (157, 'Homam', 'Pegasus', 'ζ Pegasi A', 'HR 8634', '2016-08-21', 6, 49);
INSERT INTO public.star VALUES (160, 'Intercrus', 'Ursa Major', '41 Lyncis', 'HR 3743', '2015-12-15', 7, 8);
INSERT INTO public.star VALUES (164, 'Kaffaljidhma', 'Cetus', 'γ Ceti A', 'HR 804', '2017-02-01', 5, 15);
INSERT INTO public.star VALUES (165, 'Kang', 'Virgo', 'κ Virginis', 'HR 5315', '2017-06-30', 5, 10);
INSERT INTO public.star VALUES (166, 'Kaus Australis', 'Sagittarius', 'ε Sagittarii A', 'HR 6879', '2016-07-20', 6, 5);
INSERT INTO public.star VALUES (167, 'Kaus Borealis', 'Sagittarius', 'λ Sagittarii', 'HR 6913', '2016-07-20', 6, 5);
INSERT INTO public.star VALUES (168, 'Kaus Media', 'Sagittarius', 'δ Sagittarii', 'HR 6859', '2016-07-20', 6, 5);
INSERT INTO public.star VALUES (170, 'Khambalia', 'Virgo', 'λ Virginis A', 'HR 5359', '2017-09-05', 5, 10);
INSERT INTO public.star VALUES (172, 'Kochab', 'Ursa Minor', 'β Ursae Minoris', 'HR 5563', '2016-07-20', 6, 87);
INSERT INTO public.star VALUES (173, 'Kornephoros', 'Hercules', 'β Herculis Aa', 'HR 6148', '2016-08-21', 6, 36);
INSERT INTO public.star VALUES (174, 'Kraz', 'Corvus', 'β Corvi', 'HR 4786', '2018-06-01', 4, 1);
INSERT INTO public.star VALUES (176, 'La Superba', 'Canes Venatici', 'Y Canum Venaticorum', 'HR 4846', '2018-08-10', 4, 26);
INSERT INTO public.star VALUES (180, 'Lich', 'Virgo', 'PSR B1257+12', 'PSR B1257+12', '2015-12-15', 7, 10);
INSERT INTO public.star VALUES (182, 'Maasym', 'Hercules', 'λ Herculis', 'HR 6526', '2016-09-12', 6, 36);
INSERT INTO public.star VALUES (186, 'Markab', 'Pegasus', 'α Pegasi', 'HR 8781', '2016-06-30', 6, 49);
INSERT INTO public.star VALUES (188, 'Marsic', 'Hercules', 'κ Herculis A', 'HR 6008', '2017-02-01', 5, 36);
INSERT INTO public.star VALUES (189, 'Matar', 'Pegasus', 'η Pegasi Aa', 'HR 8650', '2016-08-21', 6, 49);
INSERT INTO public.star VALUES (191, 'Megrez', 'Ursa Major', 'δ Ursae Majoris', 'HR 4660', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (196, 'Menkar', 'Cetus', 'α Ceti', 'HR 911', '2016-06-30', 6, 15);
INSERT INTO public.star VALUES (197, 'Menkent', 'Centaurus', 'θ Centauri', 'HR 5288', '2016-08-21', 6, 4);
INSERT INTO public.star VALUES (198, 'Menkib', 'Perseus', 'ξ Persei', 'HR 1228', '2016-09-12', 6, 62);
INSERT INTO public.star VALUES (199, 'Merak', 'Ursa Major', 'β Ursae Majoris', 'HR 4295', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (204, 'Miaplacidus', 'Carina', 'β Carinae', 'HR 3685', '2016-07-20', 6, 12);
INSERT INTO public.star VALUES (206, 'Minchir', 'Hydra', 'σ Hydrae', 'HR 3418', '2017-09-05', 5, 39);
INSERT INTO public.star VALUES (207, 'Minelauva', 'Virgo', 'δ Virginis', 'HR 4910', '2017-06-30', 5, 10);
INSERT INTO public.star VALUES (209, 'Mira', 'Cetus', 'ο Ceti Aa', 'HR 681', '2016-06-30', 6, 15);
INSERT INTO public.star VALUES (210, 'Mirach', 'Andromeda', 'β Andromedae', 'HR 337', '2016-06-30', 6, 56);
INSERT INTO public.star VALUES (211, 'Miram', 'Perseus', 'η Persei A', 'HR 834', '2017-09-05', 5, 62);
INSERT INTO public.star VALUES (212, 'Mirfak', 'Perseus', 'α Persei', 'HR 1017', '2016-07-20', 6, 62);
INSERT INTO public.star VALUES (214, 'Misam', 'Perseus', 'κ Persei Aa', 'HR 941', '2017-09-05', 5, 62);
INSERT INTO public.star VALUES (215, 'Mizar', 'Ursa Major', 'ζ Ursae Majoris Aa', 'HR 5054', '2016-06-30', 6, 8);
INSERT INTO public.star VALUES (216, 'Mothallah', 'Triangulum', 'α Trianguli', 'HR 544', '2016-08-21', 6, 86);
INSERT INTO public.star VALUES (219, 'Muscida', 'Ursa Major', 'ο Ursae Majoris A', 'HR 3323', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (225, 'Nembus', 'Andromeda', '51 Andromedae', 'HR 464', '2017-09-05', 5, 56);
INSERT INTO public.star VALUES (227, 'Nunki', 'Sagittarius', 'σ Sagittarii Aa', 'HR 7121', '2016-08-21', 6, 5);
INSERT INTO public.star VALUES (229, 'Ogma', 'Hercules', 'HD 149026', 'HD 149026', '2015-12-15', 7, 36);
INSERT INTO public.star VALUES (234, 'Phecda', 'Ursa Major', 'γ Ursae Majoris Aa', 'HR 4554', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (235, 'Pherkad', 'Ursa Minor', 'γ Ursae Minoris', 'HR 5735', '2016-08-21', 6, 87);
INSERT INTO public.star VALUES (239, 'Polaris', 'Ursa Minor', 'α Ursae Minoris', 'HR 424', '2016-06-30', 6, 87);
INSERT INTO public.star VALUES (241, 'Polis', 'Sagittarius', 'μ Sagittarii Aa', 'HR 6812', '2017-09-05', 5, 5);
INSERT INTO public.star VALUES (243, 'Porrima', 'Virgo', 'γ Virginis A', 'HR 4825', '2016-07-20', 6, 10);
INSERT INTO public.star VALUES (248, 'Proxima Centauri', 'Centaurus', 'α Centauri C', 'GJ 551', '2016-08-21', 6, 4);
INSERT INTO public.star VALUES (250, 'Rasalas', 'Leo', 'μ Leonis', 'HR 3905', '2016-09-12', 6, 22);
INSERT INTO public.star VALUES (251, 'Rasalgethi', 'Hercules', 'α1 Herculis Aa', 'HR 6406', '2016-06-30', 6, 36);
INSERT INTO public.star VALUES (253, 'Rastaban', 'Draco', 'β Draconis A', 'HR 6536', '2016-08-21', 6, 25);
INSERT INTO public.star VALUES (254, 'Regulus', 'Leo', 'α Leonis A', 'HR 3982', '2016-06-30', 6, 22);
INSERT INTO public.star VALUES (255, 'Revati', 'Pisces', 'ζ Piscium A', 'HR 361', '2017-06-30', 5, 65);
INSERT INTO public.star VALUES (257, 'Rigil Kentaurus', 'Centaurus', 'α Centauri A', 'HR 5459', '2016-11-06', 6, 4);
INSERT INTO public.star VALUES (259, 'Ruchbah', 'Cassiopeia', 'δ Cassiopeiae Aa', 'HR 403', '2016-08-21', 6, 50);
INSERT INTO public.star VALUES (260, 'Rukbat', 'Sagittarius', 'α Sagittarii', 'HR 7348', '2016-07-20', 6, 5);
INSERT INTO public.star VALUES (263, 'Sadachbia', 'Aquarius', 'γ Aquarii Aa', 'HR 8518', '2016-08-21', 6, 2);
INSERT INTO public.star VALUES (264, 'Sadalbari', 'Pegasus', 'μ Pegasi', 'HR 8684', '2016-08-21', 6, 49);
INSERT INTO public.star VALUES (265, 'Sadalmelik', 'Aquarius', 'α Aquarii A', 'HR 8414', '2016-08-21', 6, 2);
INSERT INTO public.star VALUES (266, 'Sadalsuud', 'Aquarius', 'β Aquarii A', 'HR 8232', '2016-08-21', 6, 2);
INSERT INTO public.star VALUES (267, 'Sadr', 'Cygnus', 'γ Cygni A', 'HR 7796', '2016-08-21', 6, 24);
INSERT INTO public.star VALUES (269, 'Salm', 'Pegasus', 'τ Pegasi', 'HR 8880', '2017-09-05', 5, 49);
INSERT INTO public.star VALUES (271, 'Sarin', 'Hercules', 'δ Herculis Aa', 'HR 6410', '2016-09-12', 6, 36);
INSERT INTO public.star VALUES (273, 'Scheat', 'Pegasus', 'β Pegasi', 'HR 8775', '2016-06-30', 6, 49);
INSERT INTO public.star VALUES (274, 'Schedar', 'Cassiopeia', 'α Cassiopeiae', 'HR 168', '2016-08-21', 6, 50);
INSERT INTO public.star VALUES (276, 'Segin', 'Cassiopeia', 'ε Cassiopeiae', 'HR 0542', '2017-09-05', 5, 50);
INSERT INTO public.star VALUES (283, 'Situla', 'Aquarius', 'κ Aquarii A', 'HR 8610', '2016-09-12', 6, 2);
INSERT INTO public.star VALUES (284, 'Skat', 'Aquarius', 'δ Aquarii A', 'HR 8709', '2016-08-21', 6, 2);
INSERT INTO public.star VALUES (285, 'Spica', 'Virgo', 'α Virginis Aa', 'HR 5056', '2016-06-30', 6, 10);
INSERT INTO public.star VALUES (287, 'Subra', 'Leo', 'ο Leonis Aa', 'HR 3852', '2016-09-12', 6, 22);
INSERT INTO public.star VALUES (290, 'Syrma', 'Virgo', 'ι Virginis', 'HR 5338', '2016-09-12', 6, 10);
INSERT INTO public.star VALUES (292, 'Taiyangshou', 'Ursa Major', 'χ Ursae Majoris', 'HR 4518', '2017-06-30', 5, 8);
INSERT INTO public.star VALUES (293, 'Taiyi', 'Draco', '8 Draconis', 'HR 4916', '2017-06-30', 5, 25);
INSERT INTO public.star VALUES (294, 'Talitha', 'Ursa Major', 'ι Ursae Majoris Aa', 'HR 3569', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (295, 'Tania Australis', 'Ursa Major', 'μ Ursae Majoris A', 'HR 4069', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (296, 'Tania Borealis', 'Ursa Major', 'λ Ursae Majoris A', 'HR 4033', '2016-07-20', 6, 8);
INSERT INTO public.star VALUES (302, 'Terebellum', 'Sagittarius', 'ω Sagittarii A', 'HR 7597', '2017-09-05', 5, 5);
INSERT INTO public.star VALUES (304, 'Thuban', 'Draco', 'α Draconis A', 'HR 5291', '2016-06-30', 6, 25);
INSERT INTO public.star VALUES (305, 'Tiaki', 'Grus', 'β Gruis', 'HR 8636', '2017-09-05', 5, 33);
INSERT INTO public.star VALUES (307, 'Tianyi', 'Draco', '7 Draconis', 'HR 4863', '2017-06-30', 5, 25);
INSERT INTO public.star VALUES (308, 'Titawin', 'Andromeda', 'υ Andromedae A', 'HR 458', '2015-12-15', 7, 56);
INSERT INTO public.star VALUES (309, 'Toliman', 'Centaurus', 'α Centauri B', 'HR 5460', '2018-08-10', 4, 4);
INSERT INTO public.star VALUES (310, 'Tonatiuh', 'Camelopardalis', 'HD 104985', 'HR 4609', '2015-12-15', 7, 40);
INSERT INTO public.star VALUES (311, 'Torcular', 'Pisces', 'ο Piscium A', 'HR 510', '2017-09-05', 5, 65);
INSERT INTO public.star VALUES (313, 'Ukdah', 'Hydra', 'ι Hydrae', 'HR 3845', '2018-06-01', 4, 39);
INSERT INTO public.star VALUES (314, 'Unukalhai', 'Serpens', 'α Serpentis', 'HR 5854', '2016-08-21', 6, 37);
INSERT INTO public.star VALUES (317, 'Veritate', 'Andromeda', '14 Andromedae A', 'HR 8930', '2015-12-15', 7, 56);
INSERT INTO public.star VALUES (318, 'Vindemiatrix', 'Virgo', 'ε Virginis', 'HR 4932', '2016-07-20', 6, 10);
INSERT INTO public.star VALUES (322, 'Wurren', 'Phoenix', 'ζ Phoenicis Aa', 'HR 338', '2017-11-19', 5, 63);
INSERT INTO public.star VALUES (327, 'Yildun', 'Ursa Minor', 'δ Ursae Minoris', 'HR 6789', '2016-08-21', 6, 87);
INSERT INTO public.star VALUES (328, 'Zaniah', 'Virgo', 'η Virginis Aa', 'HR 4689', '2016-09-12', 6, 10);
INSERT INTO public.star VALUES (330, 'Zavijava', 'Virgo', 'β Virginis', 'HR 4540', '2016-08-21', 6, 10);
INSERT INTO public.star VALUES (331, 'Zhang', 'Hydra', 'υ1 Hydrae A', 'HR 3903', '2017-06-30', 5, 39);
INSERT INTO public.star VALUES (333, 'Zosma', 'Leo', 'δ Leonis', 'HR 4357', '2016-07-20', 6, 22);
INSERT INTO public.star VALUES (334, 'Zubenelgenubi', 'Libra', 'α2 Librae Aa', 'HR 5531', '2016-08-21', 6, 28);
INSERT INTO public.star VALUES (335, 'Zubenelhakrabi', 'Libra', 'γ Librae A', 'HR 5787', '2017-09-05', 5, 28);
INSERT INTO public.star VALUES (336, 'Zubeneschamali', 'Libra', 'β Librae', 'HR 5685', '2016-08-21', 6, 28);
INSERT INTO public.star VALUES (1, 'Acamar', 'Eridanus', 'θ1 Eridani A', 'HR 897', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (2, 'Achernar', 'Eridanus', 'α Eridani A', 'HR 472', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (4, 'Acrab', 'Scorpius', 'β1 Scorpii Aa', 'HR 5984', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (5, 'Acrux', 'Crux', 'α Crucis Aa', 'HR 4730', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (6, 'Acubens', 'Cancer', 'α Cancri Aa', 'HR 3572', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (8, 'Adhara', 'Canis Major', 'ε Canis Majoris A', 'HR 2618', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (10, 'Ain', 'Taurus', 'ε Tauri Aa1', 'HR 1409', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (12, 'Aladfar', 'Lyra', 'η Lyrae Aa', 'HR 7298', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (18, 'Alcyone', 'Taurus', 'η Tauri A', 'HR 1165', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (19, 'Aldebaran', 'Taurus', 'α Tauri', 'HR 1457', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (20, 'Alderamin', 'Cepheus', 'α Cephei', 'HR 8162', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (23, 'Aldulfin', 'Delphinus', 'ε Delphini', 'HR 7852', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (24, 'Alfirk', 'Cepheus', 'β Cephei Aa', 'HR 8238', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (25, 'Algedi', 'Capricornus', 'α2 Capricorni', 'HR 7754', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (30, 'Alhena', 'Gemini', 'γ Geminorum Aa', 'HR 2421', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (34, 'Alkalurops', 'Bootes', 'μ1 Boötis Aa', 'HR 5733', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (37, 'Alkes', 'Crater', 'α Crateris', 'HR 4287', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (38, 'Almaaz', 'Auriga', 'ε Aurigae', 'HR 1605', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (42, 'Alnilam', 'Orion', 'ε Orionis', 'HR 1903', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (43, 'Alnitak', 'Orion', 'ζ Orionis Aa', 'HR 1948', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (44, 'Alniyat', 'Scorpius', 'σ Scorpii Aa1', 'HR 6084', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (46, 'Alphecca', 'Corona Borealis', 'α Coronae Borealis', 'HR 5793', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (54, 'Alsephina', 'Vela', 'δ Velorum Aa', 'HR 3485', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (55, 'Alshain', 'Aquila', 'β Aquilae A', 'HR 7602', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (56, 'Alshat', 'Capricornus', 'ν Capricorni A', 'HR 7773', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (57, 'Altair', 'Aquila', 'α Aquilae', 'HR 7557', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (60, 'Aludra', 'Canis Major', 'η Canis Majoris', 'HR 2827', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (64, 'Alzirr', 'Gemini', 'ξ Geminorum', 'HR 2484', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (66, 'Angetenar', 'Eridanus', 'τ2 Eridani', 'HR 850', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (68, 'Anser', 'Vulpecula', 'α Vulpeculae', 'HR 7405', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (69, 'Antares', 'Scorpius', 'α Scorpii A', 'HR 6134', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (70, 'Arcturus', 'Bootes', 'α Boötis', 'HR 5340', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (73, 'Arneb', 'Lepus', 'α Leporis A', 'HR 1865', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (75, 'Asellus Australis', 'Cancer', 'δ Cancri Aa', 'HR 3461', '2016-11-06', 6, 3);
INSERT INTO public.star VALUES (76, 'Asellus Borealis', 'Cancer', 'γ Cancri Aa', 'HR 3449', '2016-11-06', 6, 3);
INSERT INTO public.star VALUES (79, 'Asterope', NULL, NULL, 'HR 1151', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (82, 'Atlas', 'Taurus', '27 Tauri Aa1', 'HR 1178', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (83, 'Atria', 'Triangulum Australe', 'α Trianguli Australis', 'HR 6217', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (86, 'Azha', 'Eridanus', 'η Eridani', 'HR 874', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (87, 'Azmidi', 'Puppis', 'ξ Puppis', 'HR 3045', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (88, 'Barnard’s Star', 'Ophiuchus', 'V2500 Ophiuchi', 'GJ 699', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (90, 'Beemim', 'Eridanus', 'υ3 Eridani', 'HR 1393', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (91, 'Beid', 'Eridanus', 'ο1 Eridani', 'HR 1298', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (92, 'Bellatrix', 'Orion', 'γ Orionis', 'HR 1790', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (93, 'Betelgeuse', 'Orion', 'α Orionis Aa', 'HR 2061', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (94, 'Bharani', 'Aries', '41 Arietis Aa', 'HR 838', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (96, 'Botein', 'Aries', 'δ Arietis', 'HR 951', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (100, 'Capella', 'Auriga', 'α Aurigae Aa', 'HR 1708', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (102, 'Castor', 'Gemini', 'α Geminorum Aa', 'HR 2891', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (104, 'Cebalrai', 'Ophiuchus', 'β Ophiuchi', 'HR 6603', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (105, 'Celaeno', 'Taurus', '16 Tauri', 'HR 1140', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (106, 'Cervantes', 'Ara', 'μ Arae', 'HR 6585', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (108, 'Chamukuy', 'Taurus', 'θ2 Tauri Aa', 'HR 1412', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (111, 'Copernicus', 'Cancer', '55 Cancri A', 'HR 3522', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (114, 'Cursa', 'Eridanus', 'β Eridani', 'HR 1666', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (115, 'Dabih', 'Capricornus', 'β1 Capricorni Aa', 'HR 7776', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (118, 'Deneb Algedi', 'Capricornus', 'δ Capricorni Aa', 'HR 8322', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (122, 'Dschubba', 'Scorpius', 'δ Scorpii A', 'HR 5953', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (126, 'Electra', 'Taurus', '17 Tauri', 'HR 1142', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (128, 'Elkurud', 'Columba', 'θ Columbae', 'HR 2177', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (129, 'Elnath', 'Taurus', 'β Tauri Aa', 'HR 1791', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (132, 'Errai', 'Cepheus', 'γ Cephei Aa', 'HR 8974', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (134, 'Fang', 'Scorpius', 'π Scorpii Aa', 'HR 5944', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (137, 'Fomalhaut', 'Piscis Austrinus', 'α Piscis Austrini A', 'HR 8728', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (140, 'Furud', 'Canis Major', 'ζ Canis Majoris Aa', 'HR 2282', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (141, 'Fuyue', 'Scorpius', 'G Scorpii', 'HR 6630', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (142, 'Gacrux', 'Crux', 'γ Crucis', 'HR 4763', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (145, 'Ginan', 'Crux', 'ε Crucis', 'HR 4700', '2017-11-19', 5, 3);
INSERT INTO public.star VALUES (146, 'Gomeisa', 'Canis Minor', 'β Canis Minoris A', 'HR 2845', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (149, 'Guniibuu', 'Ophiuchus', '36 Ophiuchi A', 'HR 6402', '2018-08-10', 4, 3);
INSERT INTO public.star VALUES (151, 'Haedus', 'Auriga', 'η Aurigae', 'HR 1641', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (152, 'Hamal', 'Aries', 'α Arietis', 'HR 617', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (153, 'Hassaleh', 'Auriga', 'ι Aurigae', 'HR 1577', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (154, 'Hatysa', 'Orion', 'ι Orionis Aa', 'HR 1899', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (158, 'Iklil', 'Scorpius', 'ρ Scorpii Aa', 'HR 5928', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (159, 'Imai', 'Crux', 'δ Crucis', 'HR 4656', '2018-08-10', 4, 3);
INSERT INTO public.star VALUES (161, 'Izar', 'Bootes', 'ε Boötis A', 'HR 5506', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (162, 'Jabbah', 'Scorpius', 'ν Scorpii Aa', 'HR 6027', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (163, 'Jishui', 'Gemini', 'ο Geminorum', 'HR 2930', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (169, 'Keid', 'Eridanus', 'ο2 Eridani A', 'HR 1325', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (171, 'Kitalpha', 'Equuleus', 'α Equulei A', 'HR 8131', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (175, 'Kurhah', 'Cepheus', 'ξ Cephei Aa', 'HR 8417', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (177, 'Larawag', 'Scorpius', 'ε Scorpii', 'HR 6241', '2017-11-19', 5, 3);
INSERT INTO public.star VALUES (178, 'Lesath', 'Scorpius', 'υ Scorpii', 'HR 6508', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (179, 'Libertas', 'Aquila', 'ξ Aquilae A', 'HR 7595', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (181, 'Lilii Borea', 'Aries', '39 Arietis', 'HR 824', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (183, 'Mahasim', 'Auriga', 'θ Aurigae A', 'HR 2095', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (184, 'Maia', 'Taurus', '20 Tauri', 'HR 1149', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (185, 'Marfik', 'Ophiuchus', 'λ Ophiuchi A', 'HR 6149', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (187, 'Markeb', 'Vela', 'κ Velorum', 'HR 3734', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (190, 'Mebsuta', 'Gemini', 'ε Geminorum', 'HR 2473', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (192, 'Meissa', 'Orion', 'λ Orionis A', 'HR 1879', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (193, 'Mekbuda', 'Gemini', 'ζ Geminorum Aa', 'HR 2650', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (194, 'Meleph', 'Cancer', 'ε Cancri Aa', 'HR 3429', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (195, 'Menkalinan', 'Auriga', 'β Aurigae Aa', 'HR 2088', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (200, 'Merga', 'Bootes', '38 Boötis', 'HR 5533', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (201, 'Meridiana', 'Corona Australis', 'α Coronae Australis', 'HR 7254', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (202, 'Merope', 'Taurus', '23 Tauri Aa', 'HR 1156', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (203, 'Mesarthim', 'Aries', 'γ1 Arietis A', 'HR 546', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (205, 'Mimosa', 'Crux', 'β Crucis', 'HR 4853', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (208, 'Mintaka', 'Orion', 'δ Orionis Aa', 'HR 1852', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (213, 'Mirzam', 'Canis Major', 'β Canis Majoris', 'HR 2294', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (217, 'Muliphein', 'Canis Major', 'γ Canis Majoris', 'HR 2657', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (218, 'Muphrid', 'Bootes', 'η Boötis Aa', 'HR 5235', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (220, 'Musica', 'Delphinus', '18 Delphini', 'HR 8030', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (221, 'Nahn', 'Cancer', 'ξ Cancri A', 'HR 3627', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (222, 'Naos', 'Puppis', 'ζ Puppis', 'HR 3165', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (223, 'Nashira', 'Capricornus', 'γ Capricorni A', 'HR 8278', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (224, 'Nekkar', 'Bootes', 'β Boötis', 'HR 5602', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (226, 'Nihal', 'Lepus', 'β Leporis A', 'HR 1829', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (228, 'Nusakan', 'Corona Borealis', 'β Coronae Borealis A', 'HR 5747', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (230, 'Okab', 'Aquila', 'ζ Aquilae A', 'HR 7235', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (231, 'Paikauhale', 'Scorpius', 'τ Scorpii A', 'HR 6165', '2018-08-10', 4, 3);
INSERT INTO public.star VALUES (232, 'Peacock', 'Pavo', 'α Pavonis Aa', 'HR 7790', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (233, 'Phact', 'Columba', 'α Columbae', 'HR 1956', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (236, 'Piautos', 'Cancer', 'λ Cancri', 'HR 3268', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (237, 'Pipirima', 'Scorpius', 'μ2 Scorpii A', 'HR 6252', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (238, 'Pleione', 'Taurus', '28 Tauri Aa', 'HR 1180', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (240, 'Polaris Australis', 'Octans', 'σ Octantis', 'HR 7228', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (242, 'Pollux', 'Gemini', 'β Geminorum', 'HR 2990', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (244, 'Praecipua', 'Leo Minor', '46 Leonis Minoris', 'HR 4247', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (245, 'Prima Hyadum', 'Taurus', 'γ Tauri A', 'HR 1346', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (246, 'Procyon', 'Canis Minor', 'α Canis Minoris A', 'HR 2943', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (247, 'Propus', 'Gemini', 'η Geminorum A', 'HR 2216', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (249, 'Ran', 'Eridanus', 'ε Eridani', 'HR 1084', '2015-12-15', 7, 3);
INSERT INTO public.star VALUES (252, 'Rasalhague', 'Ophiuchus', 'α Ophiuchi A', 'HR 6556', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (256, 'Rigel', 'Orion', 'β Orionis A', 'HR 1713', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (258, 'Rotanev', 'Delphinus', 'β Delphini A', 'HR 7882', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (261, 'Sabik', 'Ophiuchus', 'η Ophiuchi A', 'HR 6378', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (262, 'Saclateni', 'Auriga', 'ζ Aurigae A', 'HR 1612', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (268, 'Saiph', 'Orion', 'κ Orionis', 'HR 2004', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (270, 'Sargas', 'Scorpius', 'θ Scorpii A', 'HR 6553', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (272, 'Sceptrum', 'Eridanus', '53 Eridani A', 'HR 1481', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (275, 'Secunda Hyadum', 'Taurus', 'δ Tauri Aa', 'HR 1373', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (277, 'Seginus', 'Bootes', 'γ Boötis Aa', 'HR 5435', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (278, 'Sham', 'Sagitta', 'α Sagittae', 'HR 7479', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (279, 'Shaula', 'Scorpius', 'λ Scorpii Aa', 'HR 6527', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (280, 'Sheliak', 'Lyra', 'β Lyrae Aa1', 'HR 7106', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (281, 'Sheratan', 'Aries', 'β Arietis A', 'HR 553', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (282, 'Sirius', 'Canis Major', 'α Canis Majoris A', 'HR 2491', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (286, 'Sualocin', 'Delphinus', 'α Delphini Aa', 'HR 7906', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (288, 'Suhail', 'Vela', 'λ Velorum', 'HR 3634', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (289, 'Sulafat', 'Lyra', 'γ Lyrae', 'HR 7178', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (291, 'Tabit', 'Orion', 'π3 Orionis', 'HR 1543', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (297, 'Tarazed', 'Aquila', 'γ Aquilae', 'HR 7525', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (298, 'Tarf', 'Cancer', 'β Cancri A', 'HR 3249', '2018-06-01', 4, 3);
INSERT INTO public.star VALUES (299, 'Taygeta', 'Taurus', '19 Tauri Aa', 'HR 1145', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (300, 'Tegmine', 'Cancer', 'ζ1 Cancri A', 'HR 3208', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (301, 'Tejat', 'Gemini', 'μ Geminorum Aa', 'HR 2286', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (303, 'Theemin', 'Eridanus', 'υ2 Eridani', 'HR 1464', '2017-02-01', 5, 3);
INSERT INTO public.star VALUES (306, 'Tianguan', 'Taurus', 'ζ Tauri A', 'HR 1910', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (312, 'Tureis', 'Puppis', 'ρ Puppis A', 'HR 3185', '2016-09-12', 6, 3);
INSERT INTO public.star VALUES (315, 'Unurgunite', 'Canis Major', 'σ Canis Majoris', 'HR 2646', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (316, 'Vega', 'Lyra', 'α Lyrae', 'HR 7001', '2016-06-30', 6, 3);
INSERT INTO public.star VALUES (319, 'Wasat', 'Gemini', 'δ Geminorum Aa', 'HR 2777', '2016-08-21', 6, 3);
INSERT INTO public.star VALUES (320, 'Wazn', 'Columba', 'β Columbae', 'HR 2040', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (321, 'Wezen', 'Canis Major', 'δ Canis Majoris Aa', 'HR 2693', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (323, 'Xamidimura', 'Scorpius', 'μ1 Scorpii Aa', 'HR 6247', '2017-09-05', 5, 3);
INSERT INTO public.star VALUES (324, 'Xuange', 'Bootes', 'λ Boötis', 'HR 5351', '2017-06-30', 5, 3);
INSERT INTO public.star VALUES (325, 'Yed Posterior', 'Ophiuchus', 'ε Ophiuchi', 'HR 6075', '2016-10-05', 6, 3);
INSERT INTO public.star VALUES (326, 'Yed Prior', 'Ophiuchus', 'δ Ophiuchi', 'HR 6056', '2016-10-05', 6, 3);
INSERT INTO public.star VALUES (329, 'Zaurak', 'Eridanus', 'γ Eridani', 'HR 1231', '2016-07-20', 6, 3);
INSERT INTO public.star VALUES (332, 'Zibal', 'Eridanus', 'ζ Eridani Aa', 'HR 984', '2016-09-12', 6, 3);


--
-- Name: constellar_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellar_constellation_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_star_pstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_pstar_id_seq', 49, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellar constellar_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellar
    ADD CONSTRAINT constellar_constellation_id_key UNIQUE (constellar_id);


--
-- Name: constellar constellar_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellar
    ADD CONSTRAINT constellar_pkey PRIMARY KEY (constellar_id);


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
-- Name: planet_star planet_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_pkey PRIMARY KEY (planet_star_id);


--
-- Name: planet_star planet_star_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_star
    ADD CONSTRAINT planet_star_planet_key UNIQUE (planet);


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
-- Name: moon planet_moon_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

