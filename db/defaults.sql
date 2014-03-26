--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgis; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA postgis;


ALTER SCHEMA postgis OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA postgis;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activity_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_categories (
    id integer NOT NULL,
    asset_type_id integer,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.activity_categories OWNER TO postgres;

--
-- Name: activity_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_categories_id_seq OWNER TO postgres;

--
-- Name: activity_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_categories_id_seq OWNED BY activity_categories.id;


--
-- Name: activity_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activity_types (
    id integer NOT NULL,
    activity_category_id integer,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.activity_types OWNER TO postgres;

--
-- Name: activity_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activity_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_types_id_seq OWNER TO postgres;

--
-- Name: activity_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activity_types_id_seq OWNED BY activity_types.id;


--
-- Name: asset_activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asset_activities (
    id integer NOT NULL,
    asset_id integer,
    activity_type_id integer,
    duration integer,
    difficulty character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_rating numeric(5,2),
    difficulty_rating numeric(5,2),
    is_loop boolean,
    distance numeric(5,2),
    dynamic_attributes bytea,
    gpx_link character varying(255),
    topo_link character varying(255),
    min_altitude numeric(6,2),
    max_altitude numeric(6,2),
    nearest_public_transit_location text,
    trail_surface text,
    level_of_maintenance text,
    last_maintenance_date date,
    maintained_by character varying(255)
);


ALTER TABLE public.asset_activities OWNER TO postgres;

--
-- Name: asset_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asset_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_activities_id_seq OWNER TO postgres;

--
-- Name: asset_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE asset_activities_id_seq OWNED BY asset_activities.id;


--
-- Name: asset_category_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asset_category_templates (
    id integer NOT NULL,
    activity_category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.asset_category_templates OWNER TO postgres;

--
-- Name: asset_category_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asset_category_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_category_templates_id_seq OWNER TO postgres;

--
-- Name: asset_category_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE asset_category_templates_id_seq OWNED BY asset_category_templates.id;


--
-- Name: asset_cell_providers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asset_cell_providers (
    id integer NOT NULL,
    asset_id integer,
    cell_provider_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.asset_cell_providers OWNER TO postgres;

--
-- Name: asset_cell_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asset_cell_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_cell_providers_id_seq OWNER TO postgres;

--
-- Name: asset_cell_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE asset_cell_providers_id_seq OWNED BY asset_cell_providers.id;


--
-- Name: asset_term_indices; Type: TABLE; Schema: public; Owner: webbie; Tablespace: 
--

CREATE TABLE asset_term_indices (
    id integer NOT NULL,
    term character varying(255),
    origin_string_size integer,
    asset_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.asset_term_indices OWNER TO webbie;

--
-- Name: asset_term_indices_id_seq; Type: SEQUENCE; Schema: public; Owner: webbie
--

CREATE SEQUENCE asset_term_indices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_term_indices_id_seq OWNER TO webbie;

--
-- Name: asset_term_indices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webbie
--

ALTER SEQUENCE asset_term_indices_id_seq OWNED BY asset_term_indices.id;


--
-- Name: asset_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asset_types (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.asset_types OWNER TO postgres;

--
-- Name: asset_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asset_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_types_id_seq OWNER TO postgres;

--
-- Name: asset_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE asset_types_id_seq OWNED BY asset_types.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE assets (
    id integer NOT NULL,
    asset_type_id integer,
    profile_id integer,
    region_id integer,
    name character varying(255),
    description text,
    lat numeric(9,6),
    lng numeric(9,6),
    created_by integer,
    updated_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_active boolean,
    nearest_city_id integer,
    washrooms boolean,
    parking boolean,
    accessibility_access boolean,
    accessibility_information text,
    time_open character varying(255),
    time_closed character varying(255),
    public_transit boolean,
    closest_stop_location postgis.geometry,
    location postgis.geometry,
    rentals text,
    food text
);


ALTER TABLE public.assets OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assets_id_seq OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assets_id_seq OWNED BY assets.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    province_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    location postgis.geometry
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    shape postgis.geometry
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: revisions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE revisions (
    id integer NOT NULL,
    asset_id integer,
    old_revision_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.revisions OWNER TO postgres;

--
-- Name: revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.revisions_id_seq OWNER TO postgres;

--
-- Name: revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE revisions_id_seq OWNED BY revisions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: template_attributes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE template_attributes (
    id integer NOT NULL,
    asset_category_template_id integer,
    name character varying(255),
    type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.template_attributes OWNER TO postgres;

--
-- Name: template_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE template_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_attributes_id_seq OWNER TO postgres;

--
-- Name: template_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE template_attributes_id_seq OWNED BY template_attributes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_categories ALTER COLUMN id SET DEFAULT nextval('activity_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activity_types ALTER COLUMN id SET DEFAULT nextval('activity_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asset_activities ALTER COLUMN id SET DEFAULT nextval('asset_activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asset_category_templates ALTER COLUMN id SET DEFAULT nextval('asset_category_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asset_cell_providers ALTER COLUMN id SET DEFAULT nextval('asset_cell_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webbie
--

ALTER TABLE ONLY asset_term_indices ALTER COLUMN id SET DEFAULT nextval('asset_term_indices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asset_types ALTER COLUMN id SET DEFAULT nextval('asset_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revisions ALTER COLUMN id SET DEFAULT nextval('revisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY template_attributes ALTER COLUMN id SET DEFAULT nextval('template_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


SET search_path = postgis, pg_catalog;

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: postgis; Owner: webbie
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Data for Name: activity_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activity_categories (id, asset_type_id, name, description, created_at, updated_at) FROM stdin;
1	3	recreation	Generic category for all types	2014-03-20 21:44:45.681676	2014-03-20 21:44:45.681676
\.


--
-- Name: activity_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activity_categories_id_seq', 1, true);


--
-- Data for Name: activity_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activity_types (id, activity_category_id, name, description, created_at, updated_at) FROM stdin;
1	1	hiking	Hiking on a trail	2014-03-20 21:44:45.71365	2014-03-20 21:44:45.71365
\.


--
-- Name: activity_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activity_types_id_seq', 1, true);


--
-- Data for Name: asset_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asset_activities (id, asset_id, activity_type_id, duration, difficulty, created_at, updated_at, user_rating, difficulty_rating, is_loop, distance, dynamic_attributes, gpx_link, topo_link, min_altitude, max_altitude, nearest_public_transit_location, trail_surface, level_of_maintenance, last_maintenance_date, maintained_by) FROM stdin;
1	1	1	45	Moderate	2014-03-20 21:59:37.009765	2014-03-20 21:59:37.009765	10.00	6.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2	1	45	Easy	2014-03-20 22:04:06.075406	2014-03-20 22:04:06.075406	10.00	3.00	\N	2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	3	1	2	Hard	2014-03-20 22:08:03.762967	2014-03-20 22:08:03.762967	8.00	8.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	5	1	2	moderate	2014-03-25 15:47:57.40364	2014-03-25 15:47:57.40364	6.00	6.00	\N	1.40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	6	1	1	hard	2014-03-25 15:48:29.411597	2014-03-25 15:48:29.411597	10.00	7.00	\N	2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	6	1	1	1	2014-03-25 15:48:49.818501	2014-03-25 15:48:49.818501	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	7	1	1	1	2014-03-25 15:49:23.366461	2014-03-25 15:49:23.366461	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	8	1	1	1	2014-03-25 15:49:50.025697	2014-03-25 15:49:50.025697	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	9	1	1	1	2014-03-25 15:50:08.441868	2014-03-25 15:50:08.441868	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	10	1	1	1	2014-03-25 15:51:00.42325	2014-03-25 15:51:00.42325	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	11	1	1	1	2014-03-25 15:51:27.899576	2014-03-25 15:51:27.899576	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	12	1	1	1	2014-03-25 15:51:42.660022	2014-03-25 15:51:42.660022	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	12	1	1	1	2014-03-25 15:52:15.073415	2014-03-25 15:52:15.073415	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	14	1	1	1	2014-03-25 15:52:44.225369	2014-03-25 15:52:44.225369	1.00	1.00	\N	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	15	1	\N	Easy	2014-03-25 16:44:45.581117	2014-03-25 16:44:45.581117	\N	\N	\N	2.50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	12	1	5		2014-03-25 16:49:07.199009	2014-03-25 16:49:07.199009	\N	\N	\N	20.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	16	1	2	Average	2014-03-25 16:58:02.931659	2014-03-25 16:58:02.931659	\N	\N	\N	6.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	17	1	5	Hard	2014-03-25 17:15:11.623835	2014-03-25 17:15:11.623835	\N	\N	\N	32.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	1	1	\N		2014-03-25 17:15:57.48021	2014-03-25 17:15:57.48021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	18	1	\N		2014-03-26 01:45:06.689253	2014-03-26 01:45:06.689253	\N	\N	\N	3.20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	19	1	\N	Easy	2014-03-26 01:50:12.622287	2014-03-26 01:50:12.622287	\N	\N	\N	0.13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	20	1	1		2014-03-26 01:57:15.411295	2014-03-26 01:57:15.411295	\N	\N	\N	1.30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	21	1	\N		2014-03-26 02:12:32.629849	2014-03-26 02:12:32.629849	\N	\N	\N	22.50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	22	1	\N		2014-03-26 02:21:03.754912	2014-03-26 02:21:03.754912	\N	\N	\N	2.60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: asset_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asset_activities_id_seq', 24, true);


--
-- Data for Name: asset_category_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asset_category_templates (id, activity_category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: asset_category_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asset_category_templates_id_seq', 1, false);


--
-- Data for Name: asset_cell_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asset_cell_providers (id, asset_id, cell_provider_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: asset_cell_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asset_cell_providers_id_seq', 1, false);


--
-- Data for Name: asset_term_indices; Type: TABLE DATA; Schema: public; Owner: webbie
--

COPY asset_term_indices (id, term, origin_string_size, asset_id, created_at, updated_at) FROM stdin;
1	the	3	1	2014-03-20 21:58:59.42273	2014-03-20 21:58:59.42273
2	emera	3	1	2014-03-20 21:58:59.430145	2014-03-20 21:58:59.430145
3	oval	3	1	2014-03-20 21:58:59.432978	2014-03-20 21:58:59.432978
4	point	3	2	2014-03-20 22:03:29.090261	2014-03-20 22:03:29.090261
5	pleasant	3	2	2014-03-20 22:03:29.092915	2014-03-20 22:03:29.092915
6	park	3	2	2014-03-20 22:03:29.095544	2014-03-20 22:03:29.095544
7	bluff	3	3	2014-03-20 22:07:22.191344	2014-03-20 22:07:22.191344
8	wilderness	3	3	2014-03-20 22:07:22.19596	2014-03-20 22:07:22.19596
9	trail	3	3	2014-03-20 22:07:22.200506	2014-03-20 22:07:22.200506
10	cabin	3	4	2014-03-25 14:53:33.750112	2014-03-25 14:53:33.750112
11	lake	3	4	2014-03-25 14:53:33.754089	2014-03-25 14:53:33.754089
12	trail	3	4	2014-03-25 14:53:33.756858	2014-03-25 14:53:33.756858
13	frog	3	5	2014-03-25 14:58:59.293448	2014-03-25 14:58:59.293448
14	pond	3	5	2014-03-25 14:58:59.296123	2014-03-25 14:58:59.296123
15	trail	3	5	2014-03-25 14:58:59.298783	2014-03-25 14:58:59.298783
16	hemlock	3	6	2014-03-25 15:03:50.565754	2014-03-25 15:03:50.565754
17	ravine	3	6	2014-03-25 15:03:50.570589	2014-03-25 15:03:50.570589
18	trail	3	6	2014-03-25 15:03:50.575589	2014-03-25 15:03:50.575589
19	kearney	3	7	2014-03-25 15:06:57.147826	2014-03-25 15:06:57.147826
20	lake	3	7	2014-03-25 15:06:57.150942	2014-03-25 15:06:57.150942
21	trail	3	7	2014-03-25 15:06:57.153684	2014-03-25 15:06:57.153684
22	barrington	3	8	2014-03-25 15:15:13.743058	2014-03-25 15:15:13.743058
23	bay	3	8	2014-03-25 15:15:13.747567	2014-03-25 15:15:13.747567
24	trail	3	8	2014-03-25 15:15:13.751039	2014-03-25 15:15:13.751039
25	shelburne	3	9	2014-03-25 15:21:36.372054	2014-03-25 15:21:36.372054
26	rail	3	9	2014-03-25 15:21:36.374775	2014-03-25 15:21:36.374775
27	trail	3	9	2014-03-25 15:21:36.37747	2014-03-25 15:21:36.37747
28	wallace	5	10	2014-03-25 15:26:55.773391	2014-03-25 15:26:55.773391
29	bay	5	10	2014-03-25 15:26:55.776137	2014-03-25 15:26:55.776137
30	national	5	10	2014-03-25 15:26:55.778865	2014-03-25 15:26:55.778865
31	wildlife	5	10	2014-03-25 15:26:55.781558	2014-03-25 15:26:55.781558
32	area	5	10	2014-03-25 15:26:55.7841	2014-03-25 15:26:55.7841
33	five	4	11	2014-03-25 15:39:26.214023	2014-03-25 15:39:26.214023
34	islands	4	11	2014-03-25 15:39:26.218234	2014-03-25 15:39:26.218234
35	provincial	4	11	2014-03-25 15:39:26.221046	2014-03-25 15:39:26.221046
36	park	4	11	2014-03-25 15:39:26.223781	2014-03-25 15:39:26.223781
37	atlantic	3	12	2014-03-25 15:41:46.351386	2014-03-25 15:41:46.351386
38	view	3	12	2014-03-25 15:41:46.355936	2014-03-25 15:41:46.355936
39	trail	3	12	2014-03-25 15:41:46.358656	2014-03-25 15:41:46.358656
40	dynamite	2	13	2014-03-25 15:43:01.487472	2014-03-25 15:43:01.487472
41	trail	2	13	2014-03-25 15:43:01.492127	2014-03-25 15:43:01.492127
42	bull	3	14	2014-03-25 15:46:35.715843	2014-03-25 15:46:35.715843
43	run	3	14	2014-03-25 15:46:35.719553	2014-03-25 15:46:35.719553
44	trail	3	14	2014-03-25 15:46:35.722256	2014-03-25 15:46:35.722256
45	belchers	4	15	2014-03-25 16:41:38.807098	2014-03-25 16:41:38.807098
46	marsh	4	15	2014-03-25 16:41:38.810856	2014-03-25 16:41:38.810856
47	park	4	15	2014-03-25 16:41:38.81355	2014-03-25 16:41:38.81355
48	trail	4	15	2014-03-25 16:41:38.816253	2014-03-25 16:41:38.816253
49	bedford	7	16	2014-03-25 16:56:25.269832	2014-03-25 16:56:25.269832
50	sackville	7	16	2014-03-25 16:56:25.273158	2014-03-25 16:56:25.273158
51	connector	7	16	2014-03-25 16:56:25.275827	2014-03-25 16:56:25.275827
52	greenway	7	16	2014-03-25 16:56:25.278504	2014-03-25 16:56:25.278504
53	fort	7	16	2014-03-25 16:56:25.281108	2014-03-25 16:56:25.281108
54	sackville	7	16	2014-03-25 16:56:25.283694	2014-03-25 16:56:25.283694
55	walkway	7	16	2014-03-25 16:56:25.286339	2014-03-25 16:56:25.286339
56	the	5	17	2014-03-25 17:13:29.72764	2014-03-25 17:13:29.72764
57	bluff	5	17	2014-03-25 17:13:29.734131	2014-03-25 17:13:29.734131
58	wilderness	5	17	2014-03-25 17:13:29.737973	2014-03-25 17:13:29.737973
59	hiking	5	17	2014-03-25 17:13:29.742149	2014-03-25 17:13:29.742149
60	trail	5	17	2014-03-25 17:13:29.746267	2014-03-25 17:13:29.746267
61	cabin	5	18	2014-03-26 01:43:14.775876	2014-03-26 01:43:14.775876
62	lake	5	18	2014-03-26 01:43:14.779819	2014-03-26 01:43:14.779819
63	&	5	18	2014-03-26 01:43:14.782561	2014-03-26 01:43:14.782561
64	fleetview	5	18	2014-03-26 01:43:14.785184	2014-03-26 01:43:14.785184
65	trails	5	18	2014-03-26 01:43:14.787848	2014-03-26 01:43:14.787848
66	clam	4	19	2014-03-26 01:49:38.164949	2014-03-26 01:49:38.164949
67	harbour	4	19	2014-03-26 01:49:38.16817	2014-03-26 01:49:38.16817
68	provincial	4	19	2014-03-26 01:49:38.17101	2014-03-26 01:49:38.17101
69	park	4	19	2014-03-26 01:49:38.174057	2014-03-26 01:49:38.174057
70	cleveland	4	20	2014-03-26 01:56:44.107813	2014-03-26 01:56:44.107813
71	beach	4	20	2014-03-26 01:56:44.113552	2014-03-26 01:56:44.113552
72	provincial	4	20	2014-03-26 01:56:44.117119	2014-03-26 01:56:44.117119
73	park	4	20	2014-03-26 01:56:44.120511	2014-03-26 01:56:44.120511
74	cole	4	21	2014-03-26 02:12:08.593966	2014-03-26 02:12:08.593966
75	harbour	4	21	2014-03-26 02:12:08.598496	2014-03-26 02:12:08.598496
76	heritage	4	21	2014-03-26 02:12:08.602201	2014-03-26 02:12:08.602201
77	park	4	21	2014-03-26 02:12:08.606009	2014-03-26 02:12:08.606009
78	dartmouth	3	22	2014-03-26 02:20:39.518507	2014-03-26 02:20:39.518507
79	multi-use	3	22	2014-03-26 02:20:39.523367	2014-03-26 02:20:39.523367
80	trail	3	22	2014-03-26 02:20:39.52775	2014-03-26 02:20:39.52775
\.


--
-- Name: asset_term_indices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webbie
--

SELECT pg_catalog.setval('asset_term_indices_id_seq', 80, true);


--
-- Data for Name: asset_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asset_types (id, name, description, created_at, updated_at) FROM stdin;
1	venue	\N	2014-03-20 21:44:45.651034	2014-03-20 21:44:45.651034
3	trail	\N	2014-03-20 21:44:45.662131	2014-03-20 21:44:45.662131
2	space	\N	2014-03-20 21:44:45.659792	2014-03-20 21:44:45.659792
\.


--
-- Name: asset_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asset_types_id_seq', 3, true);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assets (id, asset_type_id, profile_id, region_id, name, description, lat, lng, created_by, updated_by, created_at, updated_at, is_active, nearest_city_id, washrooms, parking, accessibility_access, accessibility_information, time_open, time_closed, public_transit, closest_stop_location, location, rentals, food) FROM stdin;
3	2	\N	30	bluff wilderness trail	Rugged and littered with ancient granite lakes formed by glaciers in the early Holocene.	44.747890	-63.928840	2	\N	2014-03-20 22:07:22.184007	2014-03-20 22:07:22.184007	\N	81	f	f	f	Not recommended for those who are not very mobile.	Dawn		f	\N	\N	\N	\N
1	2	\N	30	the emera oval	The Emera Oval is an outdoor skating rink that can be used for ice skating in the winter and rollerskating in the summer.	44.649179	-63.588025	2	\N	2014-03-20 21:58:59.399641	2014-03-20 21:58:59.399641	\N	85	t	t	t	There are no stairs so the venue is easily wheelchair accessible. The Emera Oval is also on several major bus routes.	9am	9pm	t	\N	\N	\N	\N
2	3	\N	30	point pleasant park	A wonderful park with many walking paths. Also offers a breathtaking view of the Atlantic Ocean as it crashes upon the rocky shores. A prime location for nautical enthusiasts who enjoy ship spotting.	44.626902	-63.571645	2	\N	2014-03-20 22:03:29.085799	2014-03-20 22:03:29.085799	\N	85	t	t	f	Dirt and gravel paths are not ideal for those with mobility issues. Walk is light and pleasant. 	Dawn	Dusk	f	\N	\N	\N	\N
4	3	\N	30	cabin lake trail	Family-friendly woodland trail. Located behind single family homes to the north with woodland and forest to the South. Diverse plant and wildlife.	44.418290	-63.400370	2	\N	2014-03-25 14:53:33.727151	2014-03-25 14:53:33.727151	\N	85	f	f	f	Trail is not accessible to those with mobility issues.	Dawn	Dusk	f	\N	\N	\N	\N
5	3	\N	30	frog pond trail	Gravel paths that extend from the Dingle to the Frog Pond. Trail follows the edge of the pond. There are many ducks and other form of water foul, as well as a diverse array of plant life.	44.625923	-63.302732	2	\N	2014-03-25 14:58:59.28742	2014-03-25 14:58:59.28742	\N	85	f	t	f	Not accessible to those with mobility issues	Dawn	Dusk	t	\N	\N	\N	\N
6	3	\N	30	hemlock ravine trail	225 acres of wilderness. 8 trails networked together with varying difficulty, terrain and accessibility. Vast amounts of plant life. Lots of parking and picnic area.	44.413130	-63.398080	2	\N	2014-03-25 15:03:50.558422	2014-03-25 15:03:50.558422	\N	85	f	t	f	Some trails are accessible to those with reduced mobility.	Dawn	Dusk	t	\N	\N	\N	\N
7	3	\N	30	kearney lake trail	Rough terrain challenges hikers, mountain bikers and skiers alike. The path is extremely rocky and unforgiving. Trail is home to a wide variety of birds. Extreme caution is recommended for those who wish to venture off the trail path. 	44.415090	-63.416160	2	\N	2014-03-25 15:06:57.141868	2014-03-25 15:06:57.141868	\N	85	t	t	f	Area is not accessible to those with reduced mobility	Dawn	Dusk	t	\N	\N	\N	\N
8	2	\N	42	barrington bay trail	A trail designed for recreational walking. Provides a spectacular ocean view. Provides a home to a diverse array of wild life, specifically many different types of birds. Leads to salt marshes and meadows. Some heritage buildings are visible during the hike. 	43.568949	-65.560970	2	\N	2014-03-25 15:15:13.664493	2014-03-25 15:15:13.664493	\N	5	f	f	f	Trail is not accessible to those with mobility issues.	Dawn	Dusk	f	\N	\N	\N	\N
9	3	\N	42	shelburne rail trail	Old rail line converted into walking trails by the town of Shulburne. The rail lines were abandoned in 1969 and were converted into walking trails in the late 90's.	43.830564	-65.336609	2	\N	2014-03-25 15:21:36.36584	2014-03-25 15:21:36.36584	\N	12	f	f	f	Not accessible to those who have reduced mobility	Dawn	Dusk	f	\N	\N	\N	\N
10	2	\N	33	wallace bay national wildlife area	A beautiful trail that offers an uncountable number of breathtaking ocean views. Home to a diverse array of birds and other wildlife. Wild roses and other flowers grow along the path edges. The wearing of hunter orange during hunting season is strongly recommended. 	45.826407	-63.579311	2	\N	2014-03-25 15:26:55.768702	2014-03-25 15:26:55.768702	\N	324	f	f	f	Not accessible to those with reduced mobility	Dawn	Dusk	f	\N	\N	\N	\N
11	2	\N	68	five islands provincial park	A collection of diverse trails leading from tidal flats to 100 meter cliffs. The area is geologically very interesting, with the rocks and sediment containing many different types of minerals and fossils. 	45.392860	-64.055918	2	\N	2014-03-25 15:39:26.189298	2014-03-25 15:39:26.189298	\N	220	f	t	f		Dawn	Dusk	f	\N	\N	\N	\N
12	3	\N	66	atlantic view trail	This trail travels along and abandoned rail line from Three Fathom Harbour  \r\nRoad to the end of the Salt Marsh Trail at West Lawrencetown Road.  Pets must be on leash.  Please clean up after your pet!  Pack it in, pack it out. The\r\ntrail is well-marked with signs, letting the user know that a road crossing\r\nis coming up.	44.652630	-63.301492	5	\N	2014-03-25 15:41:46.343083	2014-03-25 15:41:46.343083	\N	15	f	f	t	Wheelchair Accessible	06:00	23:00	t	\N	\N	\N	\N
13	3	\N	65	dynamite trail	This 9km trail is a walking path that has been converted from an abandoned rail line. Expect to see lots of wildlife, specifically beavers and deer. Trail runs along the edges of several lakes, including the lake that supplies water to Mahone Bay.	44.451964	-64.345533	2	\N	2014-03-25 15:43:01.459487	2014-03-25 15:43:01.459487	\N	58	f	f	f		Dawn	Dusk	f	\N	\N	\N	\N
14	2	\N	65	bull run trail	23 km of scenic trail. Connects several towns and suburbs. Additional trails are being developed in the area.	44.365588	-64.507113	2	\N	2014-03-25 15:46:35.695163	2014-03-25 15:46:35.695163	\N	49	f	f	f		Dawn	Dusk	f	\N	\N	\N	\N
15	3	\N	66	belchers marsh park trail	These trails were built as part of Parkland contribution in the 1990's when the area was developed for mixed housing. Access is from Parkland Drive or any of the many linking pathways. The park may also be readily accessed from the Mainland North Linear Parkway via Langbrae or Farnham Gate Roads. The trail follows a route around the Marsh and the smaller pond visible from Parkland Drive. The two are linked by a wooded trail along the stream and crossing Parkland Drive. The complete loop is approximately 2.5 km.\r\n\r\nHistorically, this area has been used as an outdoor recreation resource in all seasons over the years. It is named after Andrew Belcher (1763-1841), son of Nova Scotia's first lieutenant governor Jonathan Belcher. Andrew was a successful merchant and landowner in his time. Hunting, fishing and skating were common in those early days. A traditional log cabin overlooking the marsh was the most recent evidence of the parks’ early use.\r\n\r\nCurrent users are walkers enroute to school or work, using the trail to walk or jog for fitness, or those enjoying the parks many natural assets. Water levels vary with the season and skating is possible on both pond and marsh for most winters. You may spot spring wildflowers or blueberries along the trail, or see and hear migrating warblers or a fishing osprey, depending on the time of your visit. Interpretive panels are located at the fish ladder near the viewing tower at the Marsh. The local residents organize an annual cleanup each spring. 	44.671581	-63.675937	5	\N	2014-03-25 16:41:38.779628	2014-03-25 16:41:38.779628	\N	1	f	t	t	Wheelchair Accessible			t	\N	\N	\N	\N
16	3	\N	66	bedford sackville connector greenway fort sackville walkway	The Sackville River Trail features the riparian habitat of a fast-moving river in the urban environment.  It winds through various stages of mixed woods and up over a drumlin landscape forested in spruce and fir. The lush ecosystem in the middle of an urban centre is created by rich floodplain soils and glacial till, consistent moisture, and shelter.	44.735151	-63.655920	5	\N	2014-03-25 16:56:25.263452	2014-03-25 16:56:25.263452	\N	341	f	t	f				t	\N	\N	\N	\N
17	2	\N	63	the bluff wilderness hiking trail 	It is arranged in four stacked loops. The trailhead is joined to the first loop by a 15 minute hike. Each of the four loops takes on average 3-4 hours return. The remote loops are difficult. Hikers should take water, map (from The Trail Shop, MEC, St. Margaret’s Bay Tourism), compass, first aid kit, rain jacket and pants, change of clothing, knife, matches, flashlight, whistle, and emergency gear.	44.666577	-63.762932	5	\N	2014-03-25 17:13:29.698395	2014-03-25 17:13:29.698395	\N	78	f	t	f				t	\N	\N	\N	\N
18	3	\N	66	cabin lake & fleetview trails	This trail travels up the southern ridge of the new Royal Hemlocks subdivision accessed off Larry Uteck Drive to Starboard Drive. The lower access is on Starboard Drive, opposite a small playground and parking lot and a row of Canada Post Boxes. There is an additional short (270 m) trail behind the playground (Fleetview), to be extended to the High School as development proceeds.	44.697322	-63.667297	5	\N	2014-03-26 01:43:14.756166	2014-03-26 01:43:14.756166	\N	96	f	t	f				t	\N	\N	\N	\N
19	3	\N	77	clam harbour provincial park	This is an unofficial trail along the coast at a popular ocean beach which can \r\nbe explored by foot. The defined wooden boardwalk offers easy access to the beach and other facilities.  There is a complex here with a canteen, washrooms, change houses and showers.  Also in the park are charcoal pits, picnic tables and garbage cans.  \r\nThe beach is open in the summer, and is guarded on the weekends.  People like to come here for rock collecting, shells and photography. Every day every year, thousands flock to the beach for the Nova Scotia Annual Sand Sculpture Contest. This is when grownups get the chance to show off their stuff in the sand.	44.719473	-62.877810	5	\N	2014-03-26 01:49:38.15685	2014-03-26 01:49:38.15685	\N	207	f	f	t	Wheelchair Assisted			f	\N	\N	\N	\N
20	3	\N	66	cleveland beach provincial park	A short informal footpath created by park visitors along a beach to a headland.\r\nAlong the trail you will find a variety of flowering plants species including\r\nQueen Anne's Lace, Wild Pea, Wild Rose and Thistle.  The headland itself offers views of the Aspetogen Peninsula and  surrounding islands as well as a variety of water fowl.  The trail is wide enough for one person to walk comfortably but beware of angry bumble bees when traveling through the wild roses. This trail is not maintained in any way.	44.649917	-63.998634	5	\N	2014-03-26 01:56:44.100225	2014-03-26 01:56:44.100225	\N	291	f	f	f				f	\N	\N	\N	\N
21	3	\N	66	cole harbour heritage park	Cole Harbour Heritage Park Trails are situated in the Halifax Metro region. There are 7 main trails (22.5 km total) which highlight the area’s heritage and natural flora and fauna, as well as woodlands, field and salt marsh shoreline.  Eagle nests are in the area. The trailhead and parking is located by the historical barn on Bissett Road in Cole Harbour. The trails running from this main trailhead interconnect; each trail has its own character.  The trails are open year-round (no winter maintenance) for all to explore the area’s wildlife, including bird watching, while hiking, cycling, skiing, and snowshoeing along the trails. Visit our web site for additional information, as well as a trail map to plan your route.	44.465386	-63.713661	5	\N	2014-03-26 02:12:08.585642	2014-03-26 02:12:08.585642	\N	59	f	f	f				f	\N	\N	\N	\N
22	3	\N	66	dartmouth multi-use trail	The Dartmouth Multi-Use Trail is part of the Trans Canada Trail. Beginning at the southern tip of Sullivans Pond, this asphalt trail is well used by locals for all kinds of activities including walking, hiking, bicycling, and swimming. Many ducks stop here on their migration journey south for the winter. Signs are posted asking trail users not to feed the ducks, as it might interfere with their migration patterns. There are interpretive panels that give some history of the Shubenacadie Canal on this section of the trail.	44.676420	-63.558636	5	\N	2014-03-26 02:20:39.510671	2014-03-26 02:20:39.510671	\N	88	f	f	t	Wheelchair Assisted			t	\N	\N	\N	\N
\.


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assets_id_seq', 22, true);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cities (id, province_id, name, created_at, updated_at, location) FROM stdin;
1	1	dorchester	\N	\N	01010000003BDF4F8D977E4540C1CAA145B64354C0
2	1	lower woods harbour	\N	\N	0101000000EEEBC03923C24540098A1F63EE6E50C0
3	1	woods harbour	\N	\N	01010000002497FF907EC34540894160E5D06E50C0
4	1	barrington passage	\N	\N	01010000006B9A779CA2C34540DE02098A1F6750C0
5	1	barrington	\N	\N	0101000000C5FEB27BF2C84540BE9F1A2FDD6450C0
6	1	port clyde	\N	\N	0101000000CDCCCCCCCCCC4540C442AD69DE5D50C0
7	1	clyde river	\N	\N	0101000000454772F90FD14540098A1F63EE5E50C0
8	1	west pubnico	\N	\N	010100000013F241CF66D54540D734EF38457350C0
9	1	lockeport	\N	\N	010100000061545227A0D945400F0BB5A6794750C0
10	1	pubnico	\N	\N	01010000001973D712F2D94540F5DBD781737250C0
11	1	wedgeport	\N	\N	0101000000AC8BDB6800DF4540D712F241CF7E50C0
12	1	shelburne	\N	\N	0101000000386744696FE04540EBE2361AC04F50C0
13	1	argyle	\N	\N	01010000003CBD529621E64540986E1283C07650C0
14	1	jordan falls	\N	\N	010100000062105839B4E84540BA490C022B4F50C0
15	1	arcadia	\N	\N	010100000027A089B0E1E94540B22E6EA3018450C0
16	1	yarmouth	\N	\N	0101000000986E1283C0EA4540ECC039234A8750C0
17	1	sable river	\N	\N	01010000006ABC749318EC4540401361C3D34350C0
18	1	tusket	\N	\N	010100000012143FC6DCED454075931804567E50C0
19	1	hebron	\N	\N	0101000000454772F90FF145406FF085C9548550C0
20	1	sandford	\N	\N	0101000000E78C28ED0DF6454061C3D32B658950C0
21	1	port mouton	\N	\N	01010000003B70CE88D2F645400A68226C783650C0
22	1	maitland	\N	\N	01010000000B24287E8CF94540545227A0898C50C0
23	1	port maitland	\N	\N	01010000000B24287E8CF94540545227A0898C50C0
24	1	wellington	\N	\N	010100000051DA1B7C61FA45403BDF4F8D975653C0
25	1	liverpool	\N	\N	01010000004D158C4AEA044640925CFE43FA2D50C0
26	1	kemptville	\N	\N	010100000003098A1F630646402041F163CC7550C0
27	1	salmon river	\N	\N	01010000006666666666064640910F7A36AB8A50C0
28	1	brooklyn	\N	\N	0101000000567DAEB66207464024B9FC87F42B50C0
29	1	milton	\N	\N	0101000000D5E76A2BF607464095D40968223050C0
30	1	port medway	\N	\N	010100000088855AD3BC0B46404ED1915CFE2350C0
31	1	mill village	\N	\N	010100000076711B0DE00D46408C4AEA04342950C0
32	1	meteghan	\N	\N	0101000000EA95B20C711446401E166A4DF38A50C0
33	1	meteghan river	\N	\N	0101000000E5F21FD26F174640BA6B09F9A08B50C0
34	1	westport	\N	\N	0101000000F7065F984C1D464068B3EA73B59950C0
35	1	saulnierville	\N	\N	010100000013F241CF661D464050FC1873D78A50C0
36	1	freeport	\N	\N	01010000009E5E29CB101F4640EBE2361AC09750C0
37	1	riverport	\N	\N	01010000001D5A643BDF1F4640075F984C151450C0
38	1	italy cross	\N	\N	0101000000000000000020464033333333332350C0
39	1	la have	\N	\N	0101000000C74B3789412046400BB5A679C71550C0
40	1	camperdown	\N	\N	0101000000EEEBC0392322464066666666662650C0
41	1	little brook	\N	\N	01010000000A68226C78224640C3D32B65198A50C0
42	1	greenfield	\N	\N	0101000000DE718A8EE422464092CB7F48BF3550C0
43	1	east lahave	\N	\N	010100000066666666662646405DDC4603781750C0
44	1	church point	\N	\N	01010000002D211FF46C264640D26F5F07CE8950C0
45	1	clare	\N	\N	01010000002D211FF46C264640D26F5F07CE8950C0
46	1	west lahave	\N	\N	0101000000545227A089284640910F7A36AB1A50C0
47	1	first south	\N	\N	0101000000B537F8C2642A4640295C8FC2F51450C0
48	1	pointe-de-l'eglise	\N	\N	0101000000DFE00B93A92A46405DDC4603788750C0
49	1	bridgewater	\N	\N	0101000000DE718A8EE42A46402B1895D4092050C0
50	1	dayspring	\N	\N	0101000000098A1F63EE2A46401973D712F21D50C0
51	1	lunenburg	\N	\N	0101000000CFF753E3A52B464026E4839ECD1250C0
52	1	tiverton	\N	\N	01010000009487855AD32C46406ADE718A8E9050C0
53	1	caledonia	\N	\N	01010000006688635DDC2E46407B14AE47E14650C0
54	1	weymouth	\N	\N	0101000000D7A3703D0A2F464092CB7F48BF8150C0
55	1	chelsea	\N	\N	0101000000E5F21FD26F2F4640E3A59BC4203050C0
56	1	south brookfield	\N	\N	0101000000B9FC87F4DB2F464075931804563E50C0
57	1	little river	\N	\N	0101000000234A7B832F344640D656EC2FBB8B50C0
58	1	mahone bay	\N	\N	010100000014AE47E17A344640107A36AB3E1750C0
59	1	terence bay	\N	\N	01010000000F9C33A2B43746400F9C33A2B4D74FC0
60	1	pleasant river	\N	\N	01010000009CC420B0723846408D976E12833850C0
61	1	sambro	\N	\N	0101000000FED478E926394640545227A089C84FC0
62	1	colpton	\N	\N	01010000009A9999999939464066666666663650C0
63	1	blandford	\N	\N	0101000000C364AA60543A46405396218E750550C0
64	1	prospect	\N	\N	010100000088855AD3BC3B46406666666666E64FC0
65	1	indian harbour	\N	\N	0101000000D9CEF753E33D46407A36AB3E57F34FC0
66	1	western shore	\N	\N	0101000000D8817346943E46401F85EB51B81250C0
67	1	chester	\N	\N	010100000071AC8BDB68404640431CEBE2360E50C0
68	1	centreville	\N	\N	01010000000DE02D90A040464082E2C798BB8250C0
69	1	upper northfield	\N	\N	01010000009A779CA223414640401361C3D32750C0
70	1	chester basin	\N	\N	0101000000B29DEFA7C6434640029A081B9E1250C0
71	1	bear river	\N	\N	01010000008716D9CEF74346403BDF4F8D976A50C0
72	1	hacketts cove	\N	\N	0101000000787AA52C43444640A7E8482EFFF14FC0
73	1	herring cove	\N	\N	0101000000CB10C7BAB8454640C364AA6054C24FC0
74	1	new germany	\N	\N	01010000002BF697DD934746409A999999993150C0
75	1	digby	\N	\N	0101000000355EBA490C4A4640A01A2FDD247250C0
76	1	mill cove	\N	\N	0101000000DFE00B93A94A46402AA913D0440450C0
77	1	springfield	\N	\N	010100000088635DDC464B46405EBA490C023750C0
78	1	beechville	\N	\N	01010000006744696FF04D4640DDB5847CD0D34FC0
79	1	cornwallis	\N	\N	0101000000CBA145B6F34D4640AF946588636950C0
80	1	eastern passage	\N	\N	0101000000BBB88D06F04E464012143FC6DCBD4FC0
81	1	timberlea	\N	\N	01010000001CEBE2361A504640D122DBF97EDA4FC0
82	1	deep brook	\N	\N	0101000000454772F90F5146409A999999996950C0
83	1	hubbards	\N	\N	0101000000454772F90F51464033333333330350C0
84	1	lawrencetown	\N	\N	0101000000454772F90F514640CDCCCCCCCCAC4FC0
85	1	halifax	\N	\N	01010000003333333333534640CDCCCCCCCCCC4FC0
86	1	seaforth	\N	\N	01010000003333333333534640EEEBC03923A24FC0
631	1	lorne	\N	\N	010100000039B4C876BEEF4740075F984C158850C0
87	1	seal cove	\N	\N	010100000033333333335346406666666666B650C0
88	1	dartmouth	\N	\N	0101000000211FF46C56554640545227A089C84FC0
89	1	ingramport	\N	\N	0101000000211FF46C565546409A99999999F94FC0
90	1	new ross	\N	\N	010100000061C3D32B655946407FD93D79581C50C0
91	1	french village	\N	\N	01010000009A99999999594640454772F90FF14FC0
92	1	lake echo	\N	\N	0101000000265305A3925A4640BE30992A18AD4FC0
93	1	porters lake	\N	\N	0101000000FA7E6ABC745B4640ECC039234AA34FC0
94	1	dalhousie east	\N	\N	010100000088855AD3BC5B464033333333333350C0
95	1	east chezzetcook	\N	\N	010100000088855AD3BC5B464012143FC6DC9D4FC0
96	1	bedford	\N	\N	0101000000F7065F984C5D464030BB270F0BD54FC0
97	1	annapolis royal	\N	\N	010100000012143FC6DC5D4640F775E09C116150C0
98	1	dalhousie road	\N	\N	010100000012143FC6DC5D4640CDCCCCCCCC2C50C0
99	1	granville ferry	\N	\N	01010000000000000000604640F775E09C116150C0
100	1	head of jeddore	\N	\N	01010000001B9E5E29CB604640083D9B559F834FC0
101	1	musquodoboit harbour	\N	\N	010100000036CD3B4ED1614640DAACFA5C6D8D4FC0
102	1	tangier	\N	\N	010100000069006F81046546403480B74082524FC0
103	1	lower sackville	\N	\N	010100000085EB51B81E6546407B14AE47E1DA4FC0
104	1	ship harbour	\N	\N	01010000004CA60A4625654640986E1283C06A4FC0
105	1	bridgetown	\N	\N	010100000083C0CAA1456646401E166A4DF35250C0
106	1	albany	\N	\N	0101000000666666666666464033333333334350C0
107	1	beaver bank	\N	\N	01010000006666666666664640B81E85EB51D84FC0
108	1	vaughan	\N	\N	010100000058CA32C4B1664640B6847CD0B30D50C0
109	1	hampton	\N	\N	0101000000BDE3141DC96D46409FCDAACFD55650C0
110	1	lake george	\N	\N	0101000000AA8251499D704640E3361AC05B2C50C0
111	1	campo bello	\N	\N	0101000000454772F90F714640CDCCCCCCCCBC50C0
112	1	mount uniacke	\N	\N	0101000000454772F90F714640DFE00B93A9EA4FC0
113	1	welshpool	\N	\N	0101000000454772F90F714640CDCCCCCCCCBC50C0
114	1	middleton	\N	\N	01010000004260E5D022734640D49AE61DA74450C0
115	1	beaver harbour	\N	\N	01010000003333333333734640211FF46C56354FC0
116	1	enfield	\N	\N	0101000000CEAACFD5567446400E4FAF9465C04FC0
117	1	sheet harbour	\N	\N	01010000005BB1BFEC9E744640764F1E166A3D4FC0
118	1	meagher grant	\N	\N	0101000000211FF46C5675464012143FC6DC9D4FC0
119	1	meaghers grant	\N	\N	0101000000211FF46C5675464012143FC6DC9D4FC0
120	1	port dufferin	\N	\N	0101000000211FF46C56754640454772F90F314FC0
121	1	elmsdale	\N	\N	0101000000B98D06F0167846400612143FC6BC4FC0
122	1	lake egmont	\N	\N	01010000007E1D386744794640894160E5D0A24FC0
123	1	port lorne	\N	\N	01010000009A999999997946403E7958A8355150C0
124	1	port williams	\N	\N	01010000009A999999997946403E7958A8355150C0
125	1	lantz	\N	\N	01010000007C613255307A464052B81E85EBB94FC0
126	1	windsor	\N	\N	0101000000986E1283C07A46407E1D3867440950C0
127	1	new port conner	\N	\N	010100000088855AD3BC7B464088855AD3BCFB4FC0
128	1	newport corner	\N	\N	010100000088855AD3BC7B464088855AD3BCFB4FC0
129	1	auburn	\N	\N	0101000000E9263108AC7C46401DC9E53FA43750C0
130	1	greenwood	\N	\N	010100000012143FC6DC7D46409A999999993950C0
131	1	aylesford	\N	\N	010100000003098A1F637E46403D0AD7A3703550C0
132	1	kingston	\N	\N	01010000001F85EB51B87E4640CDCCCCCCCC3C50C0
133	1	richardson	\N	\N	0101000000C976BE9F1A7F4640E9263108ACBC50C0
134	1	margaretsville	\N	\N	010100000064CC5D4BC87F46409C33A2B4374450C0
135	1	berwick	\N	\N	0101000000569FABADD87F464074B515FBCB2E50C0
136	1	gays river	\N	\N	01010000000E4FAF94658046409A99999999A94FC0
137	1	hardwood lands	\N	\N	0101000000D49AE61DA780464004E78C28EDBD4FC0
138	1	nine mile river	\N	\N	01010000009BE61DA7E8804640D8F0F44A59C64FC0
139	1	liscomb	\N	\N	0101000000787AA52C438446400000000000004FC0
140	1	kentville	\N	\N	0101000000A1D634EF3885464082734694F61E50C0
141	1	coldstream	\N	\N	01010000004C3789416085464007F0164850A44FC0
142	1	wolfville	\N	\N	0101000000925CFE43FA854640CAC342AD691650C0
143	1	l'etete	\N	\N	010100000066666666668646409A99999999B950C0
144	1	middle musquodoboit	\N	\N	01010000006666666666864640454772F90F914FC0
145	1	musquodoboit	\N	\N	01010000006666666666864640454772F90F914FC0
146	1	shubenacadie	\N	\N	0101000000492EFF21FD86464062105839B4B04FC0
147	1	elmsvale	\N	\N	01010000004703780B2488464024B9FC87F4834FC0
148	1	lakeville	\N	\N	010100000055C1A8A44E8846403B70CE88D22650C0
149	1	cambridge station	\N	\N	0101000000545227A089884640A323B9FC872850C0
150	1	hantsport	\N	\N	0101000000545227A089884640D656EC2FBB0B50C0
151	1	mosherville	\N	\N	0101000000545227A0898846409A99999999F94FC0
152	1	saint andrews	\N	\N	0101000000545227A0898846403CBD529621C250C0
153	1	weston	\N	\N	0101000000545227A08988464033333333333350C0
154	1	wittenburg	\N	\N	01010000006FF085C954894640D3BCE3141D994FC0
155	1	pennfield	\N	\N	0101000000273108AC1C8A46402497FF907EAF50C0
156	1	gore	\N	\N	0101000000C3F5285C8F8A464029ED0DBE30D94FC0
157	1	dipper harbour	\N	\N	0101000000DFE00B93A98A4640910F7A36AB9A50C0
158	1	wolfville	\N	\N	0101000000DFE00B93A98A46405DDC4603781750C0
159	1	avonport	\N	\N	0101000000CDCCCCCCCC8C464000000000001050C0
160	1	barr settlement	\N	\N	01010000005BD3BCE3148D46402F6EA301BCCD4FC0
161	1	fort ellis	\N	\N	0101000000F5B9DA8AFD8D464062A1D634EFA84FC0
162	1	upper musquodoboit	\N	\N	0101000000D8817346948E464014D044D8F0744FC0
163	1	canning	\N	\N	0101000000492EFF21FD8E4640FB3A70CE881A50C0
164	1	cheverie	\N	\N	01010000004850FC18738F4640B6F3FDD4780950C0
165	1	saint george	\N	\N	0101000000E3361AC05B904640AA8251499DB450C0
166	1	lepreau	\N	\N	010100000038F8C264AA9046404182E2C7989F50C0
167	1	sherbrooke	\N	\N	0101000000454772F90F91464012143FC6DCFD4EC0
168	1	stewiacke	\N	\N	0101000000454772F90F914640CDCCCCCCCCAC4FC0
169	1	pocologan	\N	\N	01010000007DD0B359F59146408E06F01648A850C0
170	1	kennetcook	\N	\N	01010000008A8EE4F21F924640D200DE0209DA4FC0
171	1	musquash	\N	\N	01010000002575029A08934640508D976E129750C0
172	1	chäverie	\N	\N	01010000003333333333934640910F7A36AB0A50C0
173	1	halls harbour	\N	\N	0101000000ECC039234A934640D7A3703D0A2750C0
174	1	prince of wales	\N	\N	01010000004ED1915CFE934640C286A757CA9250C0
175	1	saint stephen	\N	\N	010100000005A3923A0195464063EE5A423ED450C0
176	1	kingsport	\N	\N	0101000000211FF46C569546405DDC4603781750C0
177	1	milltown	\N	\N	0101000000211FF46C569546403333333333D350C0
178	1	upper kennetcook	\N	\N	0101000000DAACFA5C6D9546408D28ED0DBED04FC0
179	1	walton	\N	\N	0101000000E5F21FD26F974640BBB88D06F0FE4FC0
180	1	goldboro	\N	\N	0101000000ACADD85F769746403333333333D34EC0
181	1	oxford junction	\N	\N	0101000000ACADD85F76974640454772F90FF14FC0
182	1	new harbour	\N	\N	0101000000F241CF66D59746403411363CBDB24EC0
183	1	waweig	\N	\N	0101000000705F07CE199946405F984C158CCA50C0
184	1	oak bay	\N	\N	0101000000FE65F7E46199464050FC1873D7CE50C0
185	1	cambridge	\N	\N	01010000009A999999999946405DDC4603780750C0
186	1	petite	\N	\N	010100000088855AD3BC9B4640F775E09C110150C0
187	1	tenecape	\N	\N	01010000004D840D4FAF9C4640AE47E17A14EE4FC0
188	1	saint john	\N	\N	01010000005AF5B9DA8A9D4640C3D32B65198650C0
189	1	whitehead	\N	\N	010100000012143FC6DC9D46409A99999999994EC0
190	1	larrys river	\N	\N	01010000009FABADD85F9E46400D71AC8BDBA84EC0
191	1	brookfield	\N	\N	01010000000000000000A04640787AA52C43A44FC0
192	1	south maitland	\N	\N	01010000000000000000A0464088855AD3BCBB4FC0
193	1	scots bay	\N	\N	0101000000C6DCB5847CA0464029CB10C7BA1850C0
194	1	noel	\N	\N	0101000000C5FEB27BF2A04640DBF97E6ABCDC4FC0
195	1	grand bay	\N	\N	0101000000A835CD3B4EA14640CBA145B6F38D50C0
196	1	densmores mills	\N	\N	0101000000273108AC1CA24640E5F21FD26FD74FC0
197	1	saint john	\N	\N	0101000000EEEBC03923A246402AA913D0448450C0
198	1	hilden	\N	\N	01010000006B9A779CA2A346400B46257502A24FC0
199	1	cross roads country harbour	\N	\N	0101000000C05B2041F1A34640FB5C6DC5FEEA4EC0
200	1	fairfield	\N	\N	01010000006891ED7C3FA54640DBF97E6ABC6C50C0
201	1	moores mills	\N	\N	0101000000A167B3EA73A54640D3DEE00B93D150C0
202	1	aspen	\N	\N	01010000002EFF21FDF6A54640FFB27BF2B0004FC0
203	1	saint martins	\N	\N	01010000001D38674469A746401D386744696350C0
204	1	clifton	\N	\N	0101000000ACADD85F76A74640D3DEE00B93B14FC0
205	1	tower hill	\N	\N	0101000000545227A089A84640CDCCCCCCCCCC50C0
206	1	black rock	\N	\N	01010000000AD7A3703DAA4640B6F3FDD4781950C0
207	1	advocate harbour	\N	\N	0101000000DFE00B93A9AA46403CBD5296213250C0
208	1	truro	\N	\N	010100000017B7D100DEAA464066666666669E4FC0
209	1	nerepis	\N	\N	0101000000A54E401361AB464096218E75719350C0
210	1	economy	\N	\N	010100000079E9263108AC464088F4DBD781F34FC0
211	1	rothesay	\N	\N	01010000003108AC1C5AAC4640645DDC46038050C0
212	1	rollingdam	\N	\N	010100000014AE47E17AAC464004E78C28EDC550C0
213	1	westfield beach	\N	\N	0101000000CDCCCCCCCCAC4640098A1F63EE8E50C0
214	1	upper economy	\N	\N	0101000000BE30992A18AD4640E17A14AE47E94FC0
215	1	valley	\N	\N	010100000085EB51B81EAD46404C37894160954FC0
216	1	parrsboro	\N	\N	0101000000D95F764F1EAE46408638D6C56D1450C0
217	1	diligent river	\N	\N	010100000082E2C798BBAE4640F775E09C111D50C0
218	1	canso	\N	\N	0101000000ADFA5C6DC5AE4640B8AF03E78C784EC0
219	1	truro	\N	\N	0101000000BBB88D06F0AE46406666666666A64FC0
220	1	five islands	\N	\N	010100000057EC2FBB27AF46402E90A0F8310250C0
221	1	bass river	\N	\N	01010000001D5A643BDFAF4640E0BE0E9C33E24FC0
222	1	goshen	\N	\N	0101000000454772F90FB1464012143FC6DCFD4EC0
223	1	belmont	\N	\N	0101000000D1915CFE43B2464082734694F6AE4FC0
224	1	portapique	\N	\N	01010000003333333333B346409A99999999D94FC0
225	1	sunnybrae	\N	\N	01010000003333333333B346400000000000404FC0
226	1	guysborough	\N	\N	0101000000A4703D0AD7B34640516B9A779CBA4EC0
227	1	welsford	\N	\N	010100000040A4DFBE0EB446402CD49AE61D9750C0
228	1	quispamsis	\N	\N	010100000014AE47E17AB446403D0AD7A3707D50C0
229	1	great village	\N	\N	0101000000211FF46C56B54640CDCCCCCCCCCC4FC0
230	1	port greville	\N	\N	0101000000211FF46C56B5464033333333332350C0
231	1	nauwigewauk	\N	\N	0101000000F54A598638B646408A1F63EE5A7A50C0
232	1	lawrence station	\N	\N	01010000009F3C2CD49AB64640CA54C1A8A4CA50C0
233	1	lorne	\N	\N	010100000058CA32C4B1B646407D3F355EBA594FC0
234	1	debert	\N	\N	0101000000ACADD85F76B7464088855AD3BCBB4FC0
235	1	londonderry	\N	\N	0101000000E3A59BC420B84640ED9E3C2CD4CA4FC0
236	1	riversdale	\N	\N	01010000001B2FDD2406B94640C976BE9F1A874FC0
237	1	kemptown	\N	\N	0101000000BF7D1D3867BC4640A8C64B3789894FC0
238	1	oak point	\N	\N	0101000000EA95B20C71BC46400A68226C788650C0
239	1	hopewell	\N	\N	0101000000A1D634EF38BD464027A089B0E1594FC0
240	1	hampton	\N	\N	010100000082734694F6BE464027C286A7577650C0
241	1	blue mountain	\N	\N	010100000065AA605452BF4640E25817B7D1384FC0
242	1	enniskillen	\N	\N	0101000000AA60545227C0464029CB10C7BAA050C0
243	1	newville	\N	\N	0101000000EEEBC03923C246406FF085C9541550C0
244	1	nuttby	\N	\N	01010000008716D9CEF7C346407DD0B359F5994FC0
245	1	petit-de-grat	\N	\N	0101000000226C787AA5C4464096438B6CE7734EC0
246	1	arichat	\N	\N	0101000000CCEEC9C342C546405C2041F1637C4EC0
247	1	folly lake	\N	\N	01010000006666666666C646406666666666C64FC0
248	1	westville	\N	\N	0101000000AC1C5A643BC74640A4DFBE0E9C5B4FC0
249	1	james river	\N	\N	0101000000E3A59BC420C84640BE30992A180D4FC0
250	1	dalhousie settlement	\N	\N	0101000000545227A089C846400000000000804FC0
251	1	stellarton	\N	\N	0101000000545227A089C846403333333333534FC0
252	1	hampstead	\N	\N	0101000000454772F90FC9464058A835CD3B8650C0
253	1	alma	\N	\N	01010000001973D712F2C94640A857CA32C4614FC0
254	1	jeffries corner	\N	\N	010100000099BB96900FCA46409D11A5BDC15F50C0
255	1	earltown	\N	\N	010100000052499D8026CA464036AB3E575B914FC0
256	1	marshy hope	\N	\N	0101000000DFE00B93A9CA4640ACADD85F76174FC0
257	1	new glasgow	\N	\N	0101000000DFE00B93A9CA4640454772F90F514FC0
258	1	norton	\N	\N	0101000000B30C71AC8BCB46405396218E756D50C0
259	1	mcadam	\N	\N	01010000005C8FC2F528CC4640F853E3A59BD450C0
260	1	point tupper	\N	\N	0101000000CDCCCCCCCCCC4640BBB88D06F0AE4EC0
261	1	westchester station	\N	\N	010100000003098A1F63CE4640E17A14AE47C94FC0
262	1	d'escousse	\N	\N	0101000000F4FDD478E9CE464068226C787A754EC0
263	1	antigonish	\N	\N	0101000000BBB88D06F0CE464088855AD3BCFB4EC0
264	1	evanston	\N	\N	0101000000BBB88D06F0CE464012143FC6DC9D4EC0
265	1	mulgrave	\N	\N	0101000000BBB88D06F0CE46403333333333B34EC0
266	1	tracadie	\N	\N	0101000000BBB88D06F0CE46403333333333D34EC0
267	1	trenton	\N	\N	0101000000BBB88D06F0CE4640BBB88D06F04E4FC0
268	1	fredericton junction	\N	\N	01010000004850FC1873CF46403108AC1C5AA850C0
269	1	port hawkesbury	\N	\N	0101000000AA60545227D04640E3C798BB96A84EC0
270	1	springfield	\N	\N	01010000000DE02D90A0D04640DBF97E6ABC7450C0
271	1	merigomish	\N	\N	0101000000E2E995B20CD146401E166A4DF3364FC0
272	1	bailey	\N	\N	0101000000454772F90FD146406FF085C954A550C0
273	1	central blissville	\N	\N	0101000000454772F90FD146406FF085C954A550C0
274	1	grand river	\N	\N	0101000000454772F90FD14640211FF46C56554EC0
275	1	port hastings	\N	\N	0101000000454772F90FD146403333333333B34EC0
276	1	tracy	\N	\N	010100000045D8F0F44AD14640B1E1E995B2AC50C0
277	1	queenstown	\N	\N	0101000000C4B12E6EA3D146400EBE30992A8850C0
278	1	greenville	\N	\N	0101000000EE5A423EE8D146404A7B832F4CD64FC0
279	1	west new annan	\N	\N	01010000001973D712F2D146404A0C022B87AE4FC0
280	1	springhill	\N	\N	0101000000894160E5D0D24640B30C71AC8B0350C0
281	1	apohaqui	\N	\N	0101000000B459F5B9DAD24640F46C567DAE6650C0
282	1	granville	\N	\N	01010000003333333333D3464012143FC6DC9D4EC0
283	1	scotsburn	\N	\N	01010000003333333333D34640CDCCCCCCCC6C4FC0
284	1	plainfield	\N	\N	01010000005C2041F163D446401FF46C567D764FC0
285	1	sussex	\N	\N	01010000002FDD240681D5464061C3D32B656150C0
286	1	frankville	\N	\N	0101000000933A014D84D54640744694F606BF4EC0
287	1	pictou	\N	\N	0101000000C9E53FA4DFD64640DE9387855A5B4FC0
288	1	cork	\N	\N	0101000000ACADD85F76D74640910F7A36ABBA50C0
289	1	river hã©bert	\N	\N	0101000000ACADD85F76D74640A323B9FC871850C0
290	1	wentworth centre	\N	\N	0101000000ACADD85F76D746406666666666C64FC0
291	1	cleveland	\N	\N	0101000000C74B378941D8464036AB3E575B994EC0
292	1	havre boucher	\N	\N	010100000071AC8BDB68D846402A3A92CB7FC04EC0
293	1	saint peters	\N	\N	0101000000C6DCB5847CD846407A36AB3E576B4EC0
294	1	river hebert	\N	\N	0101000000F1F44A5986D846406ADE718A8E1850C0
295	1	beaver brook	\N	\N	0101000000287E8CB96BD9464058CA32C4B13250C0
296	1	joggins	\N	\N	01010000009A99999999D94640D656EC2FBB1B50C0
297	1	lismore	\N	\N	01010000009A99999999D94640EEEBC03923224FC0
298	1	soldier cove	\N	\N	01010000009A99999999D9464012143FC6DC5D4EC0
299	1	birchwood	\N	\N	010100000035EF384547DA4640228E75711BE54FC0
300	1	troy	\N	\N	0101000000FB3A70CE88DA4640CD3B4ED191B44EC0
301	1	denmark	\N	\N	01010000005F29CB10C7DA46406A4DF38E53944FC0
302	1	tatamagouche	\N	\N	0101000000B3EA73B515DB4640A167B3EA73A54FC0
303	1	west bay road	\N	\N	010100000088855AD3BCDB46400000000000A04EC0
304	1	harvey	\N	\N	010100000031992A1895DC4640211FF46C562D50C0
305	1	maccan	\N	\N	0101000000143FC6DCB5DC4640B22E6EA3011050C0
306	1	berwick	\N	\N	0101000000B003E78C28DD46400A68226C786650C0
307	1	harvey station	\N	\N	01010000006891ED7C3FDD46401CEBE2361AC050C0
308	1	west bay	\N	\N	0101000000D93D7958A8DD464052499D8026924EC0
309	1	gagetown	\N	\N	010100000012143FC6DCDD46407C613255308A50C0
310	1	oxford	\N	\N	0101000000E78C28ED0DDE464011C7BAB88DEE4FC0
311	1	riverside	\N	\N	01010000000000000000E04640C442AD69DE2D50C0
312	1	river john	\N	\N	0101000000B8AF03E78CE0464046B6F3FDD4884FC0
313	1	malagash	\N	\N	0101000000FB5C6DC5FEE246408E75711B0DB04FC0
314	1	penobsquis	\N	\N	010100000033C4B12E6EE346405C2041F1635850C0
315	1	highfield	\N	\N	010100000024287E8CB9E34640D578E926317050C0
316	1	jemseg	\N	\N	0101000000234A7B832FE44640083D9B559F8750C0
317	1	roberta	\N	\N	0101000000304CA60A46E5464072F90FE9B76F4EC0
318	1	pugwash junction	\N	\N	0101000000933A014D84E54640C66D3480B7D04FC0
319	1	upper gagetown	\N	\N	0101000000933A014D84E546404182E2C7988F50C0
320	1	oromocto	\N	\N	01010000002041F163CCE54640516B9A779C9E50C0
321	1	elgin	\N	\N	01010000002EFF21FDF6E54640C976BE9F1A4750C0
322	1	long point	\N	\N	01010000006666666666E6464012143FC6DCBD4EC0
323	1	mansfield	\N	\N	01010000009FCDAACFD5E646409CA223B9FCF74FC0
324	1	wallace	\N	\N	0101000000B9FC87F4DBE74640956588635DBC4FC0
325	1	codys	\N	\N	0101000000B6847CD0B3E94640D3BCE3141D7550C0
326	1	newtown	\N	\N	0101000000355EBA490CEA4640228E75711B5D50C0
327	1	amherst	\N	\N	01010000000AD7A3703DEA46403D0AD7A3700D50C0
328	1	gabarus	\N	\N	0101000000DFE00B93A9EA4640454772F90F114EC0
329	1	river denys	\N	\N	01010000005EBA490C02EB46401E166A4DF3964EC0
330	1	pugwash	\N	\N	010100000014AE47E17AEC464094F6065F98D44FC0
331	1	hopewell cape	\N	\N	0101000000CC5D4BC807ED46405BD3BCE3142550C0
332	1	port howe	\N	\N	0101000000BEC1172653ED4640454772F90FE14FC0
333	1	melford	\N	\N	010100000039B4C876BEEF4640D3DEE00B93A14EC0
334	1	linden	\N	\N	01010000004694F6065FF0464061C3D32B65E94FC0
335	1	canterbury station	\N	\N	0101000000454772F90FF14640C442AD69DEDD50C0
336	1	kingsclear	\N	\N	0101000000454772F90FF146409A99999999B950C0
337	1	sheffield	\N	\N	0101000000454772F90FF1464033333333339350C0
338	1	judique	\N	\N	01010000005396218E75F146406A4DF38E53BC4EC0
339	1	head of millstream	\N	\N	0101000000FD87F4DBD7F14640F6285C8FC26150C0
340	1	canterbury	\N	\N	0101000000C364AA6054F2464021B0726891DD50C0
341	1	sackville	\N	\N	0101000000C1A8A44E40F34640D656EC2FBB1750C0
342	1	fredericton	\N	\N	01010000006ADE718A8EF4464052499D8026AA50C0
343	1	fredericton	\N	\N	01010000006ADE718A8EF4464052499D8026AA50C0
344	1	perry settlement	\N	\N	010100000094F6065F98F44640789CA223B95C50C0
345	1	cornhill	\N	\N	0101000000789CA223B9F4464075029A081B5650C0
346	1	prince william	\N	\N	01010000005A643BDF4FF54640C0EC9E3C2CC450C0
347	1	louisbourg	\N	\N	0101000000211FF46C56F5464012143FC6DCFD4DC0
348	1	hillsborough	\N	\N	0101000000910F7A36ABF6464076E09C11A52950C0
349	1	orangedale	\N	\N	0101000000ADFA5C6DC5F64640448B6CE7FB894EC0
350	1	petitcodiac	\N	\N	0101000000F2B0506B9AF746405E4BC8073D4B50C0
351	1	ripples	\N	\N	0101000000F085C954C1F84640355EBA490C8E50C0
352	1	dawson	\N	\N	010100000054742497FFF84640E09C11A5BD3150C0
353	1	nackawic	\N	\N	010100000036AB3E575BF94640075F984C15D050C0
354	1	fredericton	\N	\N	01010000009A99999999F94640A323B9FC87A850C0
355	1	grand narrows	\N	\N	01010000009A99999999F94640787AA52C43644EC0
356	1	saint-jacques	\N	\N	01010000009A99999999F946406FF085C9546552C0
357	1	weldon	\N	\N	01010000009A99999999F94640D656EC2FBB2B50C0
358	1	keswick	\N	\N	0101000000A52C431CEBFA464021B0726891B550C0
359	1	turtle creek	\N	\N	010100000096218E7571FB4640713D0AD7A33850C0
360	1	iona	\N	\N	010100000088855AD3BCFB4640545227A089684EC0
361	1	lower southampton	\N	\N	010100000088855AD3BCFB4640098A1F63EECE50C0
362	1	otis	\N	\N	010100000088855AD3BCFB4640098A1F63EECE50C0
363	1	white sands	\N	\N	010100000088855AD3BCFB4640545227A089484FC0
364	1	cumberland bay	\N	\N	0101000000D93D7958A8FD4640EBE2361AC07750C0
365	1	belle river	\N	\N	01010000009FABADD85FFE4640B3EA73B5156B4FC0
366	1	benton	\N	\N	0101000000029A081B9EFE4640BBB88D06F0E650C0
367	1	penniac	\N	\N	0101000000910F7A36ABFE464030BB270F0BA550C0
368	1	meductic	\N	\N	010100000065AA605452FF46401D38674469DF50C0
369	1	whycocomagh	\N	\N	01010000008FC2F5285CFF464012A5BDC1178E4EC0
370	1	havelock	\N	\N	0101000000736891ED7CFF4640158C4AEA045450C0
371	1	butternut ridge	\N	\N	010100000000000000000047402AA913D0445450C0
372	1	main-å•-dieu	\N	\N	01010000000000000000004740CDCCCCCCCCEC4DC0
373	1	memramcook	\N	\N	0101000000000000000000474033333333332350C0
374	1	murray harbour	\N	\N	010100000037894160E50047403333333333434FC0
375	1	temperance vale	\N	\N	0101000000371AC05B2001474055302AA913D050C0
376	1	little narrows	\N	\N	010100000027A089B0E1014740075F984C157C4EC0
377	1	zealand	\N	\N	0101000000FC1873D712024740C05B2041F1BB50C0
378	1	beach point	\N	\N	0101000000EEEBC0392302474012143FC6DC3D4FC0
379	1	flat river	\N	\N	0101000000EEEBC03923024740454772F90F714FC0
380	1	shenacadie	\N	\N	0101000000EEEBC039230247403333333333534EC0
381	1	burtts corner	\N	\N	0101000000B537F8C2640247400EBE30992AB850C0
382	1	murray river	\N	\N	0101000000DF4F8D976E0247401F85EB51B84E4FC0
383	1	port hood	\N	\N	0101000000FB5C6DC5FE024740C3F5285C8FC24EC0
384	1	minto	\N	\N	010100000041F163CC5D034740D3BCE3141D8550C0
385	1	newcastle creek	\N	\N	0101000000CE88D2DEE003474001DE02098A8350C0
386	1	salisbury	\N	\N	01010000004ED1915CFE0347407B832F4CA64250C0
387	1	mira	\N	\N	0101000000787AA52C4304474012143FC6DCFD4DC0
388	1	forks	\N	\N	0101000000666666666606474033333333336350C0
389	1	riverview	\N	\N	01010000006666666666064740A4703D0AD73350C0
390	1	port elgin	\N	\N	0101000000BB270F0BB506474061545227A00550C0
391	1	debec	\N	\N	0101000000545227A089084740D656EC2FBBEB50C0
392	1	harewood	\N	\N	0101000000FFB27BF2B00847408D976E12835050C0
393	1	durham	\N	\N	01010000006E3480B7400A4740575BB1BFECA650C0
394	1	durham bridge	\N	\N	01010000006E3480B7400A4740575BB1BFECA650C0
395	1	homeville	\N	\N	0101000000DFE00B93A90A4740ACADD85F76F74DC0
396	1	newcastle bridge	\N	\N	0101000000DFE00B93A90A474033333333338350C0
397	1	mabou	\N	\N	0101000000091B9E5E290B4740736891ED7CAF4EC0
398	1	millville	\N	\N	010100000096218E75710B474077BE9F1A2FCD50C0
399	1	eldon	\N	\N	01010000006A4DF38E530C4740A7E8482EFF714FC0
400	1	moncton	\N	\N	01010000003108AC1C5A0C474089D2DEE00B3350C0
401	1	baddeck	\N	\N	0101000000CDCCCCCCCC0C47400000000000604EC0
402	1	boisdale	\N	\N	0101000000CDCCCCCCCC0C47400000000000404EC0
403	1	dieppe	\N	\N	0101000000CDCCCCCCCC0C474000000000003050C0
404	1	lakeburn	\N	\N	0101000000CDCCCCCCCC0C4740910F7A36AB2A50C0
405	1	melrose	\N	\N	0101000000CDCCCCCCCC0C4740ACADD85F76F74FC0
406	1	hardwood ridge	\N	\N	010100000069006F81040D4740FB3A70CE888250C0
407	1	woodstock	\N	\N	0101000000D95F764F1E0E474061C3D32B65E550C0
408	1	berry mills	\N	\N	0101000000BBB88D06F00E4740CDCCCCCCCC3C50C0
409	1	cape tormentine	\N	\N	0101000000BBB88D06F00E4740787AA52C43E44FC0
410	1	coxheath	\N	\N	0101000000BBB88D06F00E474012143FC6DC1D4EC0
411	1	southampton	\N	\N	0101000000BBB88D06F00E47409A99999999C950C0
412	1	sydney river	\N	\N	0101000000BBB88D06F00E474088855AD3BC1B4EC0
413	1	chipman	\N	\N	0101000000C976BE9F1A0F4740956588635D7850C0
414	1	cow bay	\N	\N	0101000000454772F90F114740454772F90FF14DC0
415	1	port morien	\N	\N	0101000000454772F90F114740454772F90FF14DC0
416	1	taymouth	\N	\N	0101000000E17A14AE4711474082734694F6A650C0
417	1	north west arm	\N	\N	01010000003333333333134740787AA52C43244EC0
418	1	sydney	\N	\N	01010000003333333333134740211FF46C56154EC0
419	1	newburg	\N	\N	010100000088855AD3BC1347406DC5FEB27BE250C0
420	1	bristol	\N	\N	010100000024B9FC87F4134740D5E76A2BF60B50C0
421	1	shemogue	\N	\N	010100000024B9FC87F4134740D5E76A2BF60B50C0
422	1	scoudouc	\N	\N	0101000000931804560E1547402B8716D9CE2350C0
423	1	cherry valley	\N	\N	0101000000211FF46C56154740211FF46C56754FC0
424	1	edwardsville	\N	\N	0101000000211FF46C5615474012143FC6DC1D4EC0
425	1	montague	\N	\N	0101000000AF94658863154740C139234A7B534FC0
426	1	donkin	\N	\N	0101000000ACADD85F76174740BBB88D06F0EE4DC0
427	1	strathlorne	\N	\N	0101000000ACADD85F76174740EEEBC03923A24EC0
428	1	vernon	\N	\N	0101000000ACADD85F76174740454772F90F714FC0
429	1	vernon bridge	\N	\N	0101000000ACADD85F76174740454772F90F714FC0
430	1	georgetown	\N	\N	010100000072F90FE9B717474007F0164850444FC0
431	1	nashwaak bridge	\N	\N	010100000036AB3E575B194740575BB1BFECA650C0
432	1	glace bay	\N	\N	01010000009A9999999919474088855AD3BCFB4DC0
433	1	north sydney	\N	\N	01010000009A999999991947400000000000204EC0
434	1	vernon river	\N	\N	01010000005F29CB10C71A4740B459F5B9DA6A4FC0
435	1	scotsville	\N	\N	0101000000174850FC181B4740DC4603780B944EC0
436	1	cap pele	\N	\N	0101000000B30C71AC8B1B4740211FF46C561150C0
437	1	dominion	\N	\N	010100000088855AD3BC1B4740EEEBC03923024EC0
438	1	hampton	\N	\N	010100000088855AD3BC1B474088855AD3BCBB4FC0
439	1	victoria	\N	\N	010100000088855AD3BC1B474012143FC6DCBD4FC0
440	1	stratford	\N	\N	01010000005C8FC2F5281C4740CDCCCCCCCC8C4FC0
441	1	shediac	\N	\N	010100000007F01648501C474026E4839ECD2250C0
442	1	bas cap pele	\N	\N	0101000000A1F831E6AE1D47403F575BB1BF1050C0
443	1	inverness	\N	\N	0101000000BDE3141DC91D4740AC8BDB6800A74EC0
444	1	covered bridge	\N	\N	010100000012143FC6DC1D47405DDC460378A750C0
445	1	little bras d'or	\N	\N	010100000012143FC6DC1D4740787AA52C43244EC0
446	1	sydney mines	\N	\N	010100000012143FC6DC1D474088855AD3BC1B4EC0
447	1	stanley	\N	\N	0101000000925CFE43FA1D47406C09F9A067AF50C0
448	1	cardigan	\N	\N	010100000075931804561E4740736891ED7C4F4FC0
449	1	crapaud	\N	\N	010100000066666666661E4740F38E537424BF4FC0
450	1	pointe-du-chä™ne	\N	\N	0101000000917EFB3A701E474077BE9F1A2F2150C0
451	1	charlottetown	\N	\N	01010000001FF46C567D1E474060E5D022DB914FC0
452	1	cornwall	\N	\N	01010000001F85EB51B81E47407B14AE47E19A4FC0
453	1	tryon	\N	\N	01010000003B70CE88D21E4740857CD0B359C54FC0
454	1	borden-carleton	\N	\N	01010000000000000000204740211FF46C56D54FC0
455	1	canaan station	\N	\N	010100000000000000002047402AA913D0444450C0
456	1	carleton	\N	\N	01010000000000000000204740211FF46C56D54FC0
457	1	lindsay	\N	\N	01010000000000000000204740D656EC2FBBEB50C0
458	1	new waterford	\N	\N	01010000000000000000204740DFE00B93A90A4EC0
459	1	port borden	\N	\N	010100000000000000002047409A99999999D94FC0
460	1	saint ann	\N	\N	01010000000000000000204740BBB88D06F04E4EC0
461	1	saint anns	\N	\N	01010000000000000000204740BBB88D06F04E4EC0
462	1	borden	\N	\N	01010000009CC420B0722047401AC05B2041D94FC0
463	1	cloverdale	\N	\N	01010000006F8104C58F21474009F9A067B3D650C0
464	1	hartland	\N	\N	0101000000A7E8482EFF2147400C93A98251E150C0
465	1	cross creek station	\N	\N	0101000000EEEBC03923224740A323B9FC87A850C0
466	1	sherwood	\N	\N	0101000000787AA52C43244740454772F90F914FC0
467	1	milton	\N	\N	0101000000666666666626474088855AD3BC9B4FC0
468	1	notre dame	\N	\N	01010000006666666666264740C442AD69DE2D50C0
469	1	peakes	\N	\N	01010000006666666666264740787AA52C43644FC0
470	1	south west margaree	\N	\N	0101000000744694F60627474097FF907EFB924EC0
471	1	bourgeois	\N	\N	0101000000F2D24D6210284740D93D7958A82150C0
472	1	mcgivney	\N	\N	0101000000637FD93D79284740C0EC9E3C2CA450C0
473	1	saint paul	\N	\N	0101000000A857CA32C4294740F0164850FC4050C0
474	1	central bedeque	\N	\N	0101000000FA7E6ABC742B474019E25817B7D94FC0
475	1	pisquid	\N	\N	0101000000EC51B81E852B474021B07268916D4FC0
476	1	tracadie	\N	\N	0101000000CDCCCCCCCC2C474088855AD3BC7B4FC0
477	1	margaree forks	\N	\N	01010000004D158C4AEA2C4740598638D6C58D4EC0
478	1	hunter river	\N	\N	01010000002FDD2406812D47404D840D4FAFAC4FC0
479	1	souris	\N	\N	0101000000CB10C7BAB82D4740F241CF66D51F4FC0
480	1	astle	\N	\N	010100000004E78C28ED2D474099BB96900F9E50C0
481	1	emerald	\N	\N	0101000000BBB88D06F02E47406666666666C64FC0
482	1	indian brook	\N	\N	0101000000BBB88D06F02E4740EEEBC03923424EC0
483	1	saint anthony	\N	\N	0101000000BBB88D06F02E474000000000003050C0
484	1	mount stewart	\N	\N	010100000048BF7D1D382F47403A234A7B836F4FC0
485	1	freetown	\N	\N	01010000002B1895D40930474091ED7C3F35CE4FC0
486	1	margaree valley	\N	\N	010100000029CB10C7BA304740CBA145B6F37D4EC0
487	1	east margaree	\N	\N	0101000000454772F90F314740545227A089884EC0
488	1	margaree	\N	\N	0101000000454772F90F314740545227A089884EC0
489	1	centerville	\N	\N	01010000002575029A08334740772D211FF4EC50C0
490	1	centreville	\N	\N	01010000002575029A08334740772D211FF4EC50C0
491	1	summerside	\N	\N	010100000089D2DEE00B3347405A643BDF4FE54FC0
492	1	mount pleasant	\N	\N	01010000003333333333334740098A1F63EEDE50C0
493	1	napadogan	\N	\N	01010000003333333333334740910F7A36ABBA50C0
494	1	summerside	\N	\N	01010000003333333333334740787AA52C43E44FC0
495	1	boiestown	\N	\N	01010000005DFE43FAED334740E0BE0E9C339A50C0
496	1	florenceville	\N	\N	0101000000F8C264AA603447408AB0E1E995E650C0
497	1	rustico	\N	\N	0101000000A1D634EF38354740228E75711BA54FC0
498	1	saint eleanors	\N	\N	0101000000211FF46C56354740545227A089E84FC0
499	1	selkirk	\N	\N	0101000000211FF46C56354740ACADD85F76374FC0
500	1	morell	\N	\N	0101000000A167B3EA733547403480B740825A4FC0
501	1	saint peter	\N	\N	0101000000AF25E4839E354740516B9A779C4A4FC0
502	1	saint peters bay	\N	\N	0101000000AF25E4839E354740516B9A779C4A4FC0
503	1	miscouche	\N	\N	010100000065AA605452374740D734EF3845EF4FC0
504	1	kensington	\N	\N	0101000000B9FC87F4DB3747408BFD65F7E4D14FC0
505	1	glassville	\N	\N	0101000000613255302A3947408351499D80DA50C0
506	1	margaree harbour	\N	\N	0101000000EF3845477239474029CB10C7BA904EC0
507	1	stanley bridge	\N	\N	01010000009A999999993947409A99999999B94FC0
508	1	wellington	\N	\N	0101000000448B6CE7FB39474000000000000050C0
509	1	wellington station	\N	\N	0101000000448B6CE7FB39474000000000000050C0
510	1	north rustico	\N	\N	010100000017B7D100DE3A4740AA60545227A84FC0
511	1	new london	\N	\N	01010000006C09F9A0673B47401A51DA1B7CC14FC0
512	1	buctouche	\N	\N	010100000088855AD3BC3B4740098A1F63EE2E50C0
513	1	harcourt	\N	\N	010100000088855AD3BC3B474000000000005050C0
514	1	bath	\N	\N	0101000000BE9F1A2FDD3C4740462575029AE450C0
515	1	holtville	\N	\N	01010000006891ED7C3F3D4740C4B12E6EA39D50C0
516	1	shinnickburn	\N	\N	010100000065AA6054523F474045D8F0F44A7550C0
517	1	doaktown	\N	\N	01010000000E4FAF94654047408716D9CEF78750C0
518	1	richmond	\N	\N	0101000000D42B6519E24047403B70CE88D2FE4FC0
519	1	juniper	\N	\N	01010000008C4AEA04344147402FDD240681CD50C0
520	1	harmony	\N	\N	0101000000787AA52C4344474033333333330350C0
521	1	princetown	\N	\N	0101000000787AA52C43444740ACADD85F76D74FC0
522	1	holmesville	\N	\N	010100000085EB51B81E4547406F8104C58FE550C0
523	1	weaver siding	\N	\N	0101000000ABCFD556EC4747408B6CE7FBA97D50C0
524	1	tyne valley	\N	\N	0101000000C4B12E6EA3494740F4FDD478E9F64FC0
525	1	kent junction	\N	\N	0101000000DFE00B93A94A47406FF085C9545550C0
526	1	river de chute	\N	\N	0101000000CDCCCCCCCC4C4740098A1F63EEEE50C0
527	1	ellerslie	\N	\N	010100000069006F81044D4740D42B6519E2F84FC0
528	1	howard	\N	\N	010100000058CA32C4B14E4740E09C11A5BD7150C0
529	1	aldouane	\N	\N	0101000000BBB88D06F04E474033333333334350C0
530	1	chã©ticamp	\N	\N	0101000000BBB88D06F04E4740EEEBC03923824EC0
531	1	rexton	\N	\N	0101000000454772F90F5147405DDC4603783750C0
532	1	kingston	\N	\N	01010000008A1F63EE5A5247408FE4F21FD23750C0
533	1	rexton	\N	\N	01010000008A1F63EE5A5247408FE4F21FD23750C0
534	1	bon accord	\N	\N	010100000033333333335347406FF085C954E550C0
535	1	petit-etang	\N	\N	0101000000333333333353474088855AD3BC7B4EC0
536	1	upper blackville	\N	\N	010100000033333333335347405DDC4603787750C0
537	1	portage	\N	\N	0101000000211FF46C565547402AA913D0440450C0
538	1	blackville	\N	\N	010100000011363CBD52564740DBF97E6ABC7450C0
539	1	ingonish	\N	\N	0101000000ACADD85F76574740BBB88D06F02E4EC0
540	1	richibucto	\N	\N	010100000072F90FE9B75747406B9A779CA23750C0
541	1	coleman	\N	\N	0101000000D49AE61DA7584740E02D90A0F80950C0
542	1	perth	\N	\N	01010000000C93A982515947407AA52C431CEB50C0
543	1	perth-andover	\N	\N	01010000000C93A982515947407AA52C431CEB50C0
544	1	o'leary	\N	\N	01010000007B14AE47E15A47403BDF4F8D970E50C0
545	1	rogersville	\N	\N	01010000005917B7D1005E4740D6C56D34805B50C0
546	1	saint louis	\N	\N	0101000000E6AE25E4835E4740AE47E17A143E50C0
547	1	saint louis de kent	\N	\N	0101000000E6AE25E4835E4740AE47E17A143E50C0
548	1	aroostook junction	\N	\N	0101000000D0B359F5B9624740FFB27BF2B0EC50C0
549	1	collette	\N	\N	0101000000401361C3D3634740F7065F984C5D50C0
550	1	red rapids	\N	\N	0101000000787AA52C436447400000000000E050C0
551	1	saint almo	\N	\N	0101000000B9FC87F4DB674740857CD0B359D950C0
552	1	alberton	\N	\N	0101000000B81E85EB516847408048BF7D1D0450C0
553	1	renous	\N	\N	0101000000545227A08968474033333333337350C0
554	1	elmsdale	\N	\N	0101000000A835CD3B4E694740454772F90F0950C0
555	1	quarryville	\N	\N	0101000000DFE00B93A96A47403CBD5296217250C0
556	1	plaster rock	\N	\N	010100000075931804566E4740FB5C6DC5FED650C0
557	1	mckinleyville	\N	\N	01010000009E5E29CB106F474026E4839ECD6A50C0
558	1	montrose	\N	\N	01010000008FC2F5285C6F47405C8FC2F5280450C0
559	1	barnaby	\N	\N	0101000000454772F90F714740F775E09C116150C0
560	1	barnaby river	\N	\N	0101000000454772F90F714740F775E09C116150C0
561	1	miminegash	\N	\N	01010000006FF085C95471474098DD9387850E50C0
562	1	saint louis	\N	\N	01010000007D3F355EBA71474014D044D8F00850C0
563	1	limestone	\N	\N	0101000000A7E8482EFF714740ACADD85F76EB50C0
564	1	dingwall	\N	\N	0101000000333333333373474088855AD3BC3B4EC0
565	1	millerton	\N	\N	01010000003333333333734740A323B9FC876850C0
566	1	saint margaret bay	\N	\N	01010000003333333333734740D656EC2FBB4B50C0
567	1	whitney	\N	\N	01010000008638D6C56D744740F54A5986386E50C0
568	1	saint margarets	\N	\N	010100000094F6065F98744740B1E1E995B24C50C0
569	1	exmoor	\N	\N	0101000000E6AE25E483764740EA95B20C717450C0
570	1	tignish	\N	\N	0101000000EEEBC039237A47401904560E2D0250C0
571	1	pointe au sapin	\N	\N	01010000006ABC7493187C47407E1D3867443550C0
572	1	pointe-sapin	\N	\N	01010000006ABC7493187C47407E1D3867443550C0
573	1	black river	\N	\N	0101000000956588635D7C4740228E75711B5550C0
574	1	south nelson	\N	\N	010100000012143FC6DC7D474033333333336350C0
575	1	newcastle	\N	\N	01010000001D5A643BDF7F4740956588635D6450C0
576	1	grand falls	\N	\N	0101000000705F07CE198147401361C3D32BED50C0
577	1	grand-sault	\N	\N	0101000000705F07CE198147401361C3D32BED50C0
578	1	oxbow	\N	\N	0101000000D34D6210588147409E5E29CB10D350C0
579	1	chatham	\N	\N	0101000000787AA52C43844740D656EC2FBB5B50C0
580	1	miramichi	\N	\N	0101000000A323B9FC87844740107A36AB3E4B50C0
581	1	saint andre	\N	\N	0101000000AAF1D24D62884740D95F764F1EEE50C0
582	1	escuminac	\N	\N	01010000000B24287E8C8947404A7B832F4C3A50C0
583	1	bellefond	\N	\N	01010000003C4ED1915C8E4740E10B93A9826950C0
584	1	saint leonard	\N	\N	01010000001AC05B204191474039D6C56D34F850C0
585	1	barryville	\N	\N	0101000000F9A067B3EA934740A4703D0AD74F50C0
586	1	siegas	\N	\N	01010000008126C286A797474033C4B12E6EFB50C0
587	1	burnt church	\N	\N	01010000009A081B9E5E994740053411363C4950C0
588	1	lavillette	\N	\N	0101000000C4B12E6EA3994740386744696F5450C0
589	1	neguac	\N	\N	01010000009031772D219F4740FC1873D7124650C0
590	1	clair	\N	\N	010100000046B6F3FDD4A04740E5D022DBF92651C0
591	1	fairisle	\N	\N	0101000000A52C431CEBA24740B1506B9A774850C0
592	1	bartibog	\N	\N	0101000000787AA52C43A447405DDC4603786750C0
593	1	saint-hilaire	\N	\N	010100000068B3EA73B5A547404B598638D61951C0
594	1	lac baker	\N	\N	01010000005F984C158CAA474070CE88D2DE2851C0
595	1	saint basile	\N	\N	010100000012A5BDC117AE4740D734EF38450F51C0
596	1	saint-basile	\N	\N	010100000012A5BDC117AE4740D734EF38450F51C0
597	1	edmundston	\N	\N	01010000009FABADD85FAE4740F0164850FC1451C0
598	1	brantville	\N	\N	0101000000AB3E575BB1AF4740A7E8482EFF3D50C0
599	1	saint jacques	\N	\N	0101000000D712F241CFB64740DBF97E6ABC1851C0
600	1	saint-jacques	\N	\N	0101000000D712F241CFB64740DBF97E6ABC1851C0
601	1	allardville	\N	\N	0101000000789CA223B9BC47402497FF907E5F50C0
602	1	sheila	\N	\N	01010000005A643BDF4FBD47409FCDAACFD53A50C0
603	1	saint quentin	\N	\N	01010000000000000000C04740A323B9FC87D850C0
604	1	saint quentin	\N	\N	01010000000B24287E8CC1474085EB51B81ED950C0
605	1	saint-quentin	\N	\N	01010000000B24287E8CC1474085EB51B81ED950C0
606	1	tracadie	\N	\N	0101000000FD87F4DBD7C147409FABADD85F3A50C0
607	1	tilley road	\N	\N	0101000000DD24068195C3474096218E75714350C0
608	1	saint isidore	\N	\N	010100000002BC051214C7474088635DDC464350C0
609	1	bathurst	\N	\N	01010000000F0BB5A679C74740BC749318046A50C0
610	1	duguayville	\N	\N	01010000004CA60A4625CD47400DE02D90A04450C0
611	1	val doucet	\N	\N	010100000091ED7C3F35CE4740B515FBCBEE4D50C0
612	1	kedgwick	\N	\N	01010000006D567DAEB6D247408A1F63EE5AD650C0
613	1	saint-andrã©	\N	\N	0101000000211FF46C56D54740098A1F63EE6E51C0
614	1	paquetville	\N	\N	0101000000857CD0B359D54740E5D022DBF94650C0
615	1	inkerman	\N	\N	010100000013F241CF66D54740772D211FF43450C0
616	1	janeville	\N	\N	0101000000ACADD85F76D74740D656EC2FBB5B50C0
617	1	robertville	\N	\N	0101000000A9A44E4013D947400B24287E8C7150C0
618	1	burnsville	\N	\N	01010000009A99999999D94740910F7A36AB4A50C0
619	1	nickadow	\N	\N	010100000012143FC6DCDD4740C442AD69DE6D50C0
620	1	chiasson	\N	\N	0101000000E6AE25E483DE4740956588635D2850C0
621	1	caraquet	\N	\N	01010000005B423EE8D9E447405B423EE8D93C50C0
622	1	petit rocher	\N	\N	0101000000CC7F48BF7DE547402D211FF46C6E50C0
623	1	nigadoo	\N	\N	01010000006744696FF0E54740098A1F63EE6E50C0
624	1	pokesudie	\N	\N	010100000066F7E461A1E64740FED478E9263150C0
625	1	grande anse	\N	\N	0101000000545227A089E84740D656EC2FBB4B50C0
626	1	upsalquitch	\N	\N	0101000000545227A089E84740A323B9FC87B850C0
627	1	maisonnette	\N	\N	01010000008CB96B09F9E847402AA913D0444050C0
628	1	green point	\N	\N	0101000000CDCCCCCCCCEC4740F775E09C117150C0
629	1	pointe verte	\N	\N	0101000000E9482EFF21ED47404CA60A46257150C0
630	1	petite-riviere-de-l'ile	\N	\N	0101000000D6C56D3480EF47401B9E5E29CB2850C0
632	1	belledune	\N	\N	0101000000D3BCE3141DF147408048BF7D1D7450C0
633	1	jacquet river	\N	\N	0101000000211FF46C56F5474000000000008050C0
634	1	nash creek	\N	\N	010100000020D26F5F07F6474069006F81048550C0
635	1	matapedia	\N	\N	010100000088855AD3BCFB4740D656EC2FBBBB50C0
636	1	river charlo	\N	\N	010100000088855AD3BCFB47403CBD5296219250C0
637	1	new mills	\N	\N	010100000032772D211FFC4740B1BFEC9E3C8C50C0
638	1	balmoral	\N	\N	0101000000A323B9FC87FC47403F355EBA499C50C0
639	1	tidehead	\N	\N	0101000000AEB6627FD9FD474068B3EA73B5B150C0
640	1	dalhousie	\N	\N	01010000000EBE30992A0048401361C3D32B9550C0
641	1	campbellton	\N	\N	01010000009C33A2B437004840EC51B81E85AB50C0
642	1	dalhousie junction	\N	\N	010100000005C58F31770548405EBA490C029F50C0
643	1	thunder bay	\N	\N	01010000003333333333334840098A1F63EE4E56C0
644	1	jonquiäre	\N	\N	0101000000211FF46C563548400000000000D051C0
645	1	frederickton	\N	\N	0101000000211FF46C56B54840BBB88D06F02E4BC0
646	1	winnipeg	\N	\N	0101000000454772F90FF14840910F7A36AB4A58C0
647	1	edmonton	\N	\N	01010000006666666666C64A400000000000605CC0
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 647, true);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (id, name, description, created_at, updated_at, shape) FROM stdin;
63	yarmouth	\N	\N	\N	01030000000100000008000000C0380B0F4E15464000000000005950C030FADD3731E2454000000000726E50C0D5B021D17CD5454000000000F67150C0C0ADCE8113BF4540000000003C7750C0D5BD93C053CC4540000000003E8450C06B143B1A39E4454000000000A08B50C0E23B1BF48CFC454000000000AE8C50C0C0380B0F4E15464000000000005950C0
64	kings	\N	\N	\N	0103000000010000000800000032E3186D1656464000000000F22A50C0A2B5B86FED86464000000000240850C0E2CD218A24A7464000000000641350C098CED7758BAF464000000000362350C078FFF770ABA4464000000000062650C0807655B3439B464000000000543250C0B421EFB8E28C464000000000D44850C032E3186D1656464000000000F22A50C0
65	lunenburg	\N	\N	\N	01030000000100000008000000CF5B688D3FF8454000000000AB3550C0966CB413F328464000000000854C50C07622B32B1364464000000000201B50C0228E27C01550464000000000920350C06FDA7FAAC032464000000000E4FB4FC055A6260490FD454000000000691D50C040AD11AFB0F3454000000000E42950C0CF5B688D3FF8454000000000AB3550C0
66	halifax	\N	\N	\N	01030000000100000017000000228E27C015504640000000002A0250C091EAD2D79362464000000000D20E50C04CB1907251674640000000005EEB4FC05F6C9A37CB6F464000000000EEE24FC06CD26551C575464000000000E6DB4FC015794F13C377464000000000E4CE4FC021F08E9A0179464000000000E2C14FC04F178209358246400000000094B54FC069809970AA88464000000000AC9D4FC0E31796B8B28346400000000066984FC02CED7D2DFB7D46400000000066984FC021F08E9A017946400000000098A24FC0502C447E4278464000000000AC9D4FC0D0D0FD51CA704640000000009E9C4FC0DD0D7A810D6D46400000000074994FC0BC35605E1069464000000000C6924FC0507B11701461464000000000C6924FC0355E4B4C1659464000000000B2974FC098CD69FE5551464000000000449C4FC0287E1E55782C4640000000001AC64FC0825914B1B82C464000000000C0F24FC07779C54AC5364640000000004CFD4FC0228E27C015504640000000002A0250C0
67	hants	\N	\N	\N	0103000000010000001A000000507B117014614640000000004B0E50C0D0D0FD51CA70464000000000B51C50C0ADB58C46B7804640000000009A0A50C0E140940EA58B464000000000E30C50C0A5A44F603C9E464000000000D50B50C0A6EDADCF6EA3464000000000840250C06A3A864BA0A846400000000020ED4FC071E5AB9297AB4640000000001CD34FC01C95C74F58AB46400000000036C84FC054B5B03E5BAA4640000000005EBE4FC09D9E907A2FA3464000000000DABA4FC0914578C07B9E46400000000026BA4FC09DC73F248A984640000000002CB44FC01F0CF34997924640000000005CB14FC0A168B84BA18D46400000000094B54FC0795E6CE8F68046400000000004BE4FC0231E0014407A4640000000004AC34FC0365CE1B1C0794640000000003ECF4FC0039EC536C47646400000000040DC4FC0DA3C35170A714640000000000AE54FC0A0E9A9154E6C4640000000008EE84FC04D416A26D16746400000000096EF4FC04CB19072516746400000000052F74FC0FCA781BCD166464000000000B4FE4FC08A62140D5364464000000000730450C0507B117014614640000000004B0E50C0
68	colchester	\N	\N	\N	01030000000100000009000000CF9F36AAD3BF4640E4F736FDD9E74FC022895E46B1C84640A774B0FECFD34FC00685419946C34640BADA8AFD65C54FC024287E8CB9D54640A12FBDFDB99E4FC0D9791B9B1DBD4640A774B0FECF794FC087E123624AC24640813FFCFCF7424FC08733BF9A03B246401366DAFE953B4FC0DD41EC4CA18D4640DF1B430070AC4FC0CF9F36AAD3BF4640E4F736FDD9E74FC0
69	cumberland	\N	\N	\N	01030000000100000017000000C77B4D8A8EAE46400000000020ED4FC02F904DD251C0464000000000C6EC4FC08E05DF2CA5CB4640000000005AD14FC02A5CBE25B9C64640000000007AC04FC06968E8118CD146400000000062AB4FC005BF555320E846400000000074994FC0C0F23B094603474000000000A30150C0A43D005BF2FB464000000000650350C028A695A569FD464000000000C70A50C0DE1423ED10EB464000000000291250C0014F07F97CE2464000000000B51C50C0DBEF7215B5D64640000000002B1F50C08E05DF2CA5CB4640000000000E2D50C0FA1DD88FC7B04640000000000A4050C0CB2A5A80C29B464000000000344350C06D184870B3A1464000000000CD3150C025F64C3DE5A6464000000000222850C0C77B4D8A8EAE464000000000822250C02589B79894AC4640000000007A1B50C0A09509F91BAA464000000000291250C06A3A864BA0A846400000000090F54FC06A3A864BA0A8464000000000C6EC4FC0C77B4D8A8EAE46400000000020ED4FC0
70	pictou	\N	\N	\N	01030000000100000007000000AC6FD2C79DE8464000000000EA9B4FC00C10F9EB09D2464000000000E88E4FC024F9F64ED7BE4640000000006E724FC004FD589D46C34640000000007E534FC004FD589D46C3464000000000D4394FC0844A6DAB86E046400000000052434FC0AC6FD2C79DE8464000000000EA9B4FC0
71	antigonish	\N	\N	\N	0103000000010000000B000000E26FF2A968D946400000000090414FC02DD902D5D6AB4640000000000A314FC096FF4985D3CF464000000000B8B04EC09DE0D89F20DB4640000000007CBF4EC0F77D8078EFD7464000000000F6DB4EC0014F07F97CE2464000000000BAEA4EC092AB3DF5C4F8464000000000D0F24EC025CCA3DCA2E74640000000001A124FC0A680C7F494DD4640000000001E2C4FC0CD68F82156DD46400000000028404FC0E26FF2A968D946400000000090414FC0
72	richmond	\N	\N	\N	01030000000100000009000000D1B4F1031FCD46400000000012B14EC0924391308DC1464000000000FA9B4EC03C3E9C09E9B9464000000000DE994EC05A581E9394BF464000000000AC624EC06EC7AD60E6D94640000000004E1B4EC0BC27CD3E79EF46400000000012574EC000F6AA0C43E1464000000000B4694EC099580B9CF5E346400000000042814EC0D1B4F1031FCD46400000000012B14EC0
73	inverness	\N	\N	\N	01030000000100000008000000E92224C798CE464000000000A4B54EC021B54732F1F046400000000040744EC0E998029F5F09474000000000546F4EC037BD004A0F874740000000008C464EC070E135CA488D4740000000000C5D4EC0ECBC360B530B4740000000002CD34EC07E96BC6325E746400000000008CA4EC0E92224C798CE464000000000A4B54EC0
74	guysborough	\N	\N	\N	010300000001000000050000003FC6A1B6559346400000000058974FC0F81A391A954D464000000000485C4FC09D9E907A2FA346400000000018514EC05FA12E3376D6464000000000C0B74EC03FC6A1B6559346400000000058974FC0
75	queens	\N	\N	\N	01030000000100000005000000D994A2BEFEF7454000000000EA2350C053F3E0D3FB2E464000000000664D50C0FDD004E32505464000000000545F50C070B95448B9C6454000000000584C50C0D994A2BEFEF7454000000000EA2350C0
76	digby	\N	\N	\N	01030000000100000006000000D40A4BABD518464000000000E45650C020B17B4B08FB454000000000D88F50C086D1414CE721464000000000B2A650C09044DB239246464000000000388A50C075E8A5C1792D464000000000FA5E50C0D40A4BABD518464000000000E45650C0
77	annapolis	\N	\N	\N	0103000000010000000600000040611BDBDB1B464000000000685A50C05C9A34807C2F4640000000000C4D50C0C8A9A26696574640000000008A2950C0B845CD00EA884640000000004A4B50C0E215A6E091664640000000006C7450C040611BDBDB1B464000000000685A50C0
78	shelbourne	\N	\N	\N	0103000000010000000A0000005505A7354CE94540000000002C3C50C0BB44C8B85619464000000000A65850C01A49C239AFE1454000000000E06950C02C01DD2DEDD14540000000006A6750C0DADD5F3F4ACA4540000000009C7150C05D9B5B3D50B24540000000009C7150C0BE7A166C9FA9454000000000B66650C0BE7A166C9FA94540000000006E5450C016A04E07C3C8454000000000E84350C05505A7354CE94540000000002C3C50C0
79	victoria	\N	\N	\N	01030000000100000005000000FA788C87448247400000000038404EC0B7A393BF9B25474000000000386D4EC05D5312B44C0C474000000000285F4EC09397A4DD4930474000000000202B4EC0FA788C87448247400000000038404EC0
80	cape breton	\N	\N	\N	010300000001000000050000002D82CB13A1CC464000000000B0A94EC029E8550C19AB464000000000A0414EC0E998029F5F0947400000000000B54DC0C7033E7CD33E474000000000401A4EC02D82CB13A1CC464000000000B0A94EC0
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_id_seq', 80, true);


--
-- Data for Name: revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY revisions (id, asset_id, old_revision_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('revisions_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140121181435
20140128153325
20140128201503
20140202224418
20140203092814
20140203093023
20140203100532
20140227172720
20140302204639
20140302205900
20140310005028
20140310123442
20140313231816
20140313232348
20140313233455
20140313234808
20140313234923
20140313235100
20140316233621
20140318224502
\.


--
-- Data for Name: template_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY template_attributes (id, asset_category_template_id, name, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: template_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('template_attributes_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	richard.pannell@gmail.com	$2a$10$lGp5HTyTy9gVptFyz9dKT.73eJRa1/XiTa/Jb7jMyZLwTxAxhTvUq	\N	\N	\N	3	2014-03-21 15:45:02.906864	2014-03-20 21:44:15.463853	216.218.29.223	134.190.168.42	2014-03-16 19:50:53.981869	2014-03-21 15:45:02.908442
3	smohamed@recreationns.ns.ca	$2a$10$sl/UDLVxlAfWAjeEaeGMuOv2proAJe7eZvcEj67fGu9MJIutCuUru	\N	\N	\N	1	2014-03-22 00:19:34.418026	2014-03-22 00:19:34.418026	208.103.224.239	208.103.224.239	2014-03-22 00:19:34.404838	2014-03-22 00:19:34.420633
4	sss@sss.com	$2a$10$eRwz47AMimAjAXDvI4CKKecOC3f6aL2ZaZi0WuKTrhmayXsT/CIv6	\N	\N	\N	1	2014-03-22 20:07:03.301263	2014-03-22 20:07:03.301263	142.68.27.229	142.68.27.229	2014-03-22 20:07:03.294963	2014-03-22 20:07:03.301906
2	robert@cs.dal.ca	$2a$10$HYMONEwH.Jh80KyP2iquu.XrExEZnK33vf2EgxKXxMPexcuToREq.	\N	\N	\N	2	2014-03-25 14:48:18.538373	2014-03-20 21:49:57.68783	134.190.130.164	134.190.131.167	2014-03-20 21:49:57.682596	2014-03-25 14:48:18.539469
5	admin@admin.com	$2a$10$QpGM58/u8G7MZxocztMxLed0MmMKvoIUZ17XOICsCTOIMuDIPBwie	\N	\N	2014-03-25 14:54:51.497981	4	2014-03-26 01:33:21.386527	2014-03-25 15:17:59.445637	208.103.233.167	134.190.132.130	2014-03-23 18:30:38.622755	2014-03-26 01:33:21.39023
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Name: activity_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_categories
    ADD CONSTRAINT activity_categories_pkey PRIMARY KEY (id);


--
-- Name: activity_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activity_types
    ADD CONSTRAINT activity_types_pkey PRIMARY KEY (id);


--
-- Name: asset_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asset_activities
    ADD CONSTRAINT asset_activities_pkey PRIMARY KEY (id);


--
-- Name: asset_category_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asset_category_templates
    ADD CONSTRAINT asset_category_templates_pkey PRIMARY KEY (id);


--
-- Name: asset_cell_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asset_cell_providers
    ADD CONSTRAINT asset_cell_providers_pkey PRIMARY KEY (id);


--
-- Name: asset_term_indices_pkey; Type: CONSTRAINT; Schema: public; Owner: webbie; Tablespace: 
--

ALTER TABLE ONLY asset_term_indices
    ADD CONSTRAINT asset_term_indices_pkey PRIMARY KEY (id);


--
-- Name: asset_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asset_types
    ADD CONSTRAINT asset_types_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY revisions
    ADD CONSTRAINT revisions_pkey PRIMARY KEY (id);


--
-- Name: template_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY template_attributes
    ADD CONSTRAINT template_attributes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_activity_categories_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_activity_categories_on_name ON activity_categories USING btree (name);


--
-- Name: index_activity_types_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_activity_types_on_name ON activity_types USING btree (name);


--
-- Name: index_asset_term_indices_on_term; Type: INDEX; Schema: public; Owner: webbie; Tablespace: 
--

CREATE INDEX index_asset_term_indices_on_term ON asset_term_indices USING btree (term);


--
-- Name: index_asset_types_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_asset_types_on_name ON asset_types USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


SET search_path = postgis, pg_catalog;

--
-- Name: geometry_columns_delete; Type: RULE; Schema: postgis; Owner: webbie
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_insert; Type: RULE; Schema: postgis; Owner: webbie
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_update; Type: RULE; Schema: postgis; Owner: webbie
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


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

