--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-0+deb10u1)
-- Dumped by pg_dump version 12.2

-- Started on 2020-08-31 08:48:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 16526)
-- Name: aluguel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluguel (
    id integer NOT NULL,
    data_emprestimo date NOT NULL,
    data_devolucao_contratada date NOT NULL,
    data_devolucao date,
    valor_total double precision,
    veiculo_id integer NOT NULL
);


ALTER TABLE public.aluguel OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16529)
-- Name: aluguel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluguel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aluguel_id_seq OWNER TO postgres;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 197
-- Name: aluguel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluguel_id_seq OWNED BY public.aluguel.id;


--
-- TOC entry 198 (class 1259 OID 16531)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nascimento date NOT NULL,
    nome text NOT NULL,
    cpf text NOT NULL,
    telefone text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16537)
-- Name: cliente_aluguel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_aluguel (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    aluguel_id integer NOT NULL
);


ALTER TABLE public.cliente_aluguel OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16540)
-- Name: cliente_aluguel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_aluguel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_aluguel_id_seq OWNER TO postgres;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 200
-- Name: cliente_aluguel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_aluguel_id_seq OWNED BY public.cliente_aluguel.id;


--
-- TOC entry 201 (class 1259 OID 16542)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 201
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 202 (class 1259 OID 16544)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    sigla character varying(2) NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16550)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO postgres;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 203
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- TOC entry 204 (class 1259 OID 16552)
-- Name: localidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localidade (
    id integer NOT NULL,
    bairro text NOT NULL,
    logradouro text NOT NULL,
    numero integer NOT NULL,
    nome text NOT NULL,
    municipio_id integer NOT NULL
);


ALTER TABLE public.localidade OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16558)
-- Name: localidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.localidade_id_seq OWNER TO postgres;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 205
-- Name: localidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localidade_id_seq OWNED BY public.localidade.id;


--
-- TOC entry 206 (class 1259 OID 16560)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id integer NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16566)
-- Name: marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_seq OWNER TO postgres;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 207
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;


--
-- TOC entry 208 (class 1259 OID 16568)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id integer NOT NULL,
    nome text NOT NULL,
    ano date NOT NULL,
    versao text NOT NULL,
    marca_id integer NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16574)
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_seq OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 209
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;


--
-- TOC entry 210 (class 1259 OID 16576)
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    codigo_ibge integer NOT NULL,
    estado_id integer NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16582)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculo (
    id integer NOT NULL,
    chassis character varying(17) NOT NULL,
    localidade_id integer NOT NULL,
    modelo_id integer NOT NULL,
    diaria double precision NOT NULL
);


ALTER TABLE public.veiculo OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24612)
-- Name: status_veiculo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.status_veiculo AS
 SELECT v.id,
        CASE
            WHEN (( SELECT aluguel.data_devolucao
               FROM public.aluguel
              WHERE (aluguel.veiculo_id = v.id)
              ORDER BY aluguel.data_emprestimo DESC
             LIMIT 1) IS NULL) THEN 'LIVRE'::text
            ELSE 'OCUPADO'::text
        END AS status
   FROM public.veiculo v;


ALTER TABLE public.status_veiculo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24616)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    "user" character varying NOT NULL,
    passwd character varying NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16585)
-- Name: veiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veiculo_id_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 212
-- Name: veiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veiculo_id_seq OWNED BY public.veiculo.id;


--
-- TOC entry 2836 (class 2604 OID 16587)
-- Name: aluguel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel ALTER COLUMN id SET DEFAULT nextval('public.aluguel_id_seq'::regclass);


--
-- TOC entry 2837 (class 2604 OID 16588)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 16589)
-- Name: cliente_aluguel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel ALTER COLUMN id SET DEFAULT nextval('public.cliente_aluguel_id_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 16590)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- TOC entry 2840 (class 2604 OID 16591)
-- Name: localidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade ALTER COLUMN id SET DEFAULT nextval('public.localidade_id_seq'::regclass);


--
-- TOC entry 2841 (class 2604 OID 16592)
-- Name: marca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);


--
-- TOC entry 2842 (class 2604 OID 16593)
-- Name: modelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);


--
-- TOC entry 2843 (class 2604 OID 16594)
-- Name: veiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo ALTER COLUMN id SET DEFAULT nextval('public.veiculo_id_seq'::regclass);


--
-- TOC entry 3005 (class 0 OID 16526)
-- Dependencies: 196
-- Data for Name: aluguel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluguel VALUES (1, '2020-08-30', '2020-08-30', '2020-08-31', NULL, 14);
INSERT INTO public.aluguel VALUES (4, '2020-08-30', '2020-08-31', '0001-01-01', 0, 23);
INSERT INTO public.aluguel VALUES (2, '2020-08-31', '2020-09-01', '2020-08-31', 0, 14);
INSERT INTO public.aluguel VALUES (5, '2020-09-15', '2020-09-17', NULL, 0, 23);
INSERT INTO public.aluguel VALUES (6, '2020-09-29', '2020-09-30', NULL, 0, 23);


--
-- TOC entry 3007 (class 0 OID 16531)
-- Dependencies: 198
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (11, '2000-01-02', 'Cliente de teste', '100.000.000-00', '(35) 0 0000-0000', 'teste@teste.com');


--
-- TOC entry 3008 (class 0 OID 16537)
-- Dependencies: 199
-- Data for Name: cliente_aluguel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente_aluguel VALUES (2, 11, 1);
INSERT INTO public.cliente_aluguel VALUES (4, 11, 4);
INSERT INTO public.cliente_aluguel VALUES (6, 11, 2);
INSERT INTO public.cliente_aluguel VALUES (7, 11, 5);
INSERT INTO public.cliente_aluguel VALUES (8, 11, 6);


--
-- TOC entry 3011 (class 0 OID 16544)
-- Dependencies: 202
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado VALUES (1, 'MG', 'Minas Gerais');
INSERT INTO public.estado VALUES (2, 'SP', 'São Paulo');
INSERT INTO public.estado VALUES (3, 'PR', 'Paraná');


--
-- TOC entry 3013 (class 0 OID 16552)
-- Dependencies: 204
-- Data for Name: localidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.localidade VALUES (1, 'Artur Bernades', 'Rua cmte. Soares Júnior', 268, 'Unidade Lavras', 3138203);
INSERT INTO public.localidade VALUES (2, 'Vila Andrade', 'Avenidade Alberto Augusto Alves', 50, 'Unidade São Paulo', 3550308);
INSERT INTO public.localidade VALUES (3, 'Batel', 'Rua bispo Dom José', 2435, 'Unidade Curitiba', 4106902);


--
-- TOC entry 3015 (class 0 OID 16560)
-- Dependencies: 206
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.marca VALUES (1, 'CHEVROLET');
INSERT INTO public.marca VALUES (2, 'VOLKSWAGEN');
INSERT INTO public.marca VALUES (3, 'FIAT');
INSERT INTO public.marca VALUES (4, 'MERCEDES-BENZ');
INSERT INTO public.marca VALUES (5, 'CITROEN');
INSERT INTO public.marca VALUES (6, 'CHANA');
INSERT INTO public.marca VALUES (7, 'HONDA');
INSERT INTO public.marca VALUES (8, 'SUBARU');
INSERT INTO public.marca VALUES (9, 'FERRARI');
INSERT INTO public.marca VALUES (10, 'BUGATTI');
INSERT INTO public.marca VALUES (11, 'LAMBORGHINI');
INSERT INTO public.marca VALUES (12, 'FORD');
INSERT INTO public.marca VALUES (13, 'HYUNDAI');
INSERT INTO public.marca VALUES (14, 'JAC');
INSERT INTO public.marca VALUES (15, 'KIA');
INSERT INTO public.marca VALUES (16, 'GURGEL');
INSERT INTO public.marca VALUES (17, 'DODGE');
INSERT INTO public.marca VALUES (18, 'CHRYSLER');
INSERT INTO public.marca VALUES (19, 'BENTLEY');
INSERT INTO public.marca VALUES (20, 'SSANGYONG');
INSERT INTO public.marca VALUES (21, 'PEUGEOT');
INSERT INTO public.marca VALUES (22, 'TOYOTA');
INSERT INTO public.marca VALUES (23, 'RENAULT');
INSERT INTO public.marca VALUES (24, 'ACURA');
INSERT INTO public.marca VALUES (25, 'ADAMO');
INSERT INTO public.marca VALUES (26, 'AGRALE');
INSERT INTO public.marca VALUES (27, 'ALFA ROMEO');
INSERT INTO public.marca VALUES (28, 'AMERICAR');
INSERT INTO public.marca VALUES (29, 'ASTON MARTIN');
INSERT INTO public.marca VALUES (30, 'AUDI');
INSERT INTO public.marca VALUES (31, 'BEACH');
INSERT INTO public.marca VALUES (32, 'BIANCO');
INSERT INTO public.marca VALUES (33, 'BMW');
INSERT INTO public.marca VALUES (34, 'BORGWARD');
INSERT INTO public.marca VALUES (35, 'BRILLIANCE');
INSERT INTO public.marca VALUES (36, 'BUICK');
INSERT INTO public.marca VALUES (37, 'CBT');
INSERT INTO public.marca VALUES (38, 'NISSAN');
INSERT INTO public.marca VALUES (39, 'CHAMONIX');
INSERT INTO public.marca VALUES (40, 'CHEDA');
INSERT INTO public.marca VALUES (41, 'CHERY');
INSERT INTO public.marca VALUES (42, 'CORD');
INSERT INTO public.marca VALUES (43, 'COYOTE');
INSERT INTO public.marca VALUES (44, 'CROSS LANDER');
INSERT INTO public.marca VALUES (45, 'DAEWOO');
INSERT INTO public.marca VALUES (46, 'DAIHATSU');
INSERT INTO public.marca VALUES (47, 'VOLVO');
INSERT INTO public.marca VALUES (48, 'DE SOTO');
INSERT INTO public.marca VALUES (49, 'DETOMAZO');
INSERT INTO public.marca VALUES (50, 'DELOREAN');
INSERT INTO public.marca VALUES (51, 'DKW-VEMAG');
INSERT INTO public.marca VALUES (52, 'SUZUKI');
INSERT INTO public.marca VALUES (53, 'EAGLE');
INSERT INTO public.marca VALUES (54, 'EFFA');
INSERT INTO public.marca VALUES (55, 'ENGESA');
INSERT INTO public.marca VALUES (56, 'ENVEMO');
INSERT INTO public.marca VALUES (57, 'FARUS');
INSERT INTO public.marca VALUES (58, 'FERCAR');
INSERT INTO public.marca VALUES (59, 'FNM');
INSERT INTO public.marca VALUES (60, 'PONTIAC');
INSERT INTO public.marca VALUES (61, 'PORSCHE');
INSERT INTO public.marca VALUES (62, 'GEO');
INSERT INTO public.marca VALUES (63, 'GRANCAR');
INSERT INTO public.marca VALUES (64, 'GREAT WALL');
INSERT INTO public.marca VALUES (65, 'HAFEI');
INSERT INTO public.marca VALUES (66, 'HOFSTETTER');
INSERT INTO public.marca VALUES (67, 'HUDSON');
INSERT INTO public.marca VALUES (68, 'HUMMER');
INSERT INTO public.marca VALUES (69, 'INFINITI');
INSERT INTO public.marca VALUES (70, 'INTERNATIONAL');
INSERT INTO public.marca VALUES (71, 'JAGUAR');
INSERT INTO public.marca VALUES (72, 'JEEP');
INSERT INTO public.marca VALUES (73, 'JINBEI');
INSERT INTO public.marca VALUES (74, 'JPX');
INSERT INTO public.marca VALUES (75, 'KAISER');
INSERT INTO public.marca VALUES (76, 'KOENIGSEGG');
INSERT INTO public.marca VALUES (77, 'LAUTOMOBILE');
INSERT INTO public.marca VALUES (78, 'LAUTOCRAFT');
INSERT INTO public.marca VALUES (79, 'LADA');
INSERT INTO public.marca VALUES (80, 'LANCIA');
INSERT INTO public.marca VALUES (81, 'LAND ROVER');
INSERT INTO public.marca VALUES (82, 'LEXUS');
INSERT INTO public.marca VALUES (83, 'LIFAN');
INSERT INTO public.marca VALUES (84, 'LINCOLN');
INSERT INTO public.marca VALUES (85, 'LOBINI');
INSERT INTO public.marca VALUES (86, 'LOTUS');
INSERT INTO public.marca VALUES (87, 'MAHINDRA');
INSERT INTO public.marca VALUES (88, 'MASERATI');
INSERT INTO public.marca VALUES (89, 'MATRA');
INSERT INTO public.marca VALUES (90, 'MAYBACH');
INSERT INTO public.marca VALUES (91, 'MAZDA');
INSERT INTO public.marca VALUES (92, 'MENON');
INSERT INTO public.marca VALUES (93, 'MERCURY');
INSERT INTO public.marca VALUES (94, 'MITSUBISHI');
INSERT INTO public.marca VALUES (95, 'MG');
INSERT INTO public.marca VALUES (96, 'MINI');
INSERT INTO public.marca VALUES (97, 'MIURA');
INSERT INTO public.marca VALUES (98, 'MORRIS');
INSERT INTO public.marca VALUES (99, 'MP LAFER');
INSERT INTO public.marca VALUES (100, 'MPLM');
INSERT INTO public.marca VALUES (101, 'NEWTRACK');
INSERT INTO public.marca VALUES (102, 'NISSIN');
INSERT INTO public.marca VALUES (103, 'OLDSMOBILE');
INSERT INTO public.marca VALUES (104, 'PAG');
INSERT INTO public.marca VALUES (105, 'PAGANI');
INSERT INTO public.marca VALUES (106, 'PLYMOUTH');
INSERT INTO public.marca VALUES (107, 'PUMA');
INSERT INTO public.marca VALUES (108, 'RENO');
INSERT INTO public.marca VALUES (109, 'REVA-I');
INSERT INTO public.marca VALUES (110, 'ROLLS-ROYCE');
INSERT INTO public.marca VALUES (111, 'ROMI');
INSERT INTO public.marca VALUES (112, 'SEAT');
INSERT INTO public.marca VALUES (113, 'UTILITARIOS AGRICOLAS');
INSERT INTO public.marca VALUES (114, 'SHINERAY');
INSERT INTO public.marca VALUES (115, 'SAAB');
INSERT INTO public.marca VALUES (116, 'SHORT');
INSERT INTO public.marca VALUES (117, 'SIMCA');
INSERT INTO public.marca VALUES (118, 'SMART');
INSERT INTO public.marca VALUES (119, 'SPYKER');
INSERT INTO public.marca VALUES (120, 'STANDARD');
INSERT INTO public.marca VALUES (121, 'STUDEBAKER');
INSERT INTO public.marca VALUES (122, 'TAC');
INSERT INTO public.marca VALUES (123, 'TANGER');
INSERT INTO public.marca VALUES (124, 'TRIUMPH');
INSERT INTO public.marca VALUES (125, 'TROLLER');
INSERT INTO public.marca VALUES (126, 'UNIMOG');
INSERT INTO public.marca VALUES (127, 'WIESMANN');
INSERT INTO public.marca VALUES (128, 'CADILLAC');
INSERT INTO public.marca VALUES (129, 'AM GEN');
INSERT INTO public.marca VALUES (130, 'BUGGY');
INSERT INTO public.marca VALUES (131, 'WILLYS OVERLAND');
INSERT INTO public.marca VALUES (132, 'KASEA');
INSERT INTO public.marca VALUES (133, 'SATURN');
INSERT INTO public.marca VALUES (134, 'SWELL MINI');
INSERT INTO public.marca VALUES (135, 'SKODA');
INSERT INTO public.marca VALUES (136, 'KARMANN GHIA');
INSERT INTO public.marca VALUES (137, 'KART');
INSERT INTO public.marca VALUES (138, 'HANOMAG');
INSERT INTO public.marca VALUES (139, 'OUTROS');
INSERT INTO public.marca VALUES (140, 'HILLMAN');
INSERT INTO public.marca VALUES (141, 'HRG');
INSERT INTO public.marca VALUES (142, 'GAIOLA');
INSERT INTO public.marca VALUES (143, 'TATA');
INSERT INTO public.marca VALUES (144, 'DITALLY');
INSERT INTO public.marca VALUES (145, 'RELY');
INSERT INTO public.marca VALUES (146, 'MCLAREN');
INSERT INTO public.marca VALUES (147, 'GEELY');


--
-- TOC entry 3017 (class 0 OID 16568)
-- Dependencies: 208
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.modelo VALUES (13, 'HB20', '2019-01-01', '1.0 MT', 13);
INSERT INTO public.modelo VALUES (16, 'Bravo', '2011-01-01', '2.0 Turbo MT', 3);


--
-- TOC entry 3019 (class 0 OID 16576)
-- Dependencies: 210
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.municipio VALUES (3138203, 1, 'Lavras');
INSERT INTO public.municipio VALUES (3550308, 2, 'São Paulo');
INSERT INTO public.municipio VALUES (4106902, 3, 'Curitiba');


--
-- TOC entry 3022 (class 0 OID 24616)
-- Dependencies: 214
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES ('admin', '123456');


--
-- TOC entry 3020 (class 0 OID 16582)
-- Dependencies: 211
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veiculo VALUES (14, '32423423432423423', 2, 16, 156.889999389648438);
INSERT INTO public.veiculo VALUES (23, '12312312312312312', 2, 13, 178.589996337890625);


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 197
-- Name: aluguel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluguel_id_seq', 6, true);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 200
-- Name: cliente_aluguel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_aluguel_id_seq', 8, true);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 201
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 11, true);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 203
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_seq', 3, true);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 205
-- Name: localidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.localidade_id_seq', 3, true);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 207
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_seq', 147, true);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 209
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_seq', 17, true);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 212
-- Name: veiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veiculo_id_seq', 23, true);


--
-- TOC entry 2845 (class 2606 OID 16596)
-- Name: aluguel aluguel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_pkey PRIMARY KEY (id);


--
-- TOC entry 2852 (class 2606 OID 16598)
-- Name: cliente_aluguel cliente_aluguel_cliente_id_aluguel_id_9c1a4e56_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_cliente_id_aluguel_id_9c1a4e56_uniq UNIQUE (cliente_id, aluguel_id);


--
-- TOC entry 2854 (class 2606 OID 16600)
-- Name: cliente_aluguel cliente_aluguel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 16602)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 16604)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 16606)
-- Name: localidade localidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade
    ADD CONSTRAINT localidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 16608)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 16610)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 16612)
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (codigo_ibge);


--
-- TOC entry 2870 (class 2606 OID 16614)
-- Name: veiculo veiculo_chassis_76a4484f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_chassis_76a4484f_uniq UNIQUE (chassis);


--
-- TOC entry 2874 (class 2606 OID 16616)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 1259 OID 16617)
-- Name: aluguel_veiculo_id_a26faf33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX aluguel_veiculo_id_a26faf33 ON public.aluguel USING btree (veiculo_id);


--
-- TOC entry 2849 (class 1259 OID 16618)
-- Name: cliente_aluguel_aluguel_id_6b32fc82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_aluguel_aluguel_id_6b32fc82 ON public.cliente_aluguel USING btree (aluguel_id);


--
-- TOC entry 2850 (class 1259 OID 16619)
-- Name: cliente_aluguel_cliente_id_75d8bbb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_aluguel_cliente_id_75d8bbb1 ON public.cliente_aluguel USING btree (cliente_id);


--
-- TOC entry 2857 (class 1259 OID 16620)
-- Name: localidade_municipio_id_0ecf57f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX localidade_municipio_id_0ecf57f6 ON public.localidade USING btree (municipio_id);


--
-- TOC entry 2862 (class 1259 OID 16621)
-- Name: modelo_marca_id_37978a8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX modelo_marca_id_37978a8e ON public.modelo USING btree (marca_id);


--
-- TOC entry 2865 (class 1259 OID 16622)
-- Name: municipio_estado_id_133c0863; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX municipio_estado_id_133c0863 ON public.municipio USING btree (estado_id);


--
-- TOC entry 2868 (class 1259 OID 16623)
-- Name: veiculo_chassis_76a4484f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_chassis_76a4484f_like ON public.veiculo USING btree (chassis varchar_pattern_ops);


--
-- TOC entry 2871 (class 1259 OID 16624)
-- Name: veiculo_localidade_id_22653d67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_localidade_id_22653d67 ON public.veiculo USING btree (localidade_id);


--
-- TOC entry 2872 (class 1259 OID 16625)
-- Name: veiculo_modelo_id_edc93aaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_modelo_id_edc93aaa ON public.veiculo USING btree (modelo_id);


--
-- TOC entry 2875 (class 2606 OID 16626)
-- Name: aluguel aluguel_veiculo_id_a26faf33_fk_veiculo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_veiculo_id_a26faf33_fk_veiculo_id FOREIGN KEY (veiculo_id) REFERENCES public.veiculo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2876 (class 2606 OID 16631)
-- Name: cliente_aluguel cliente_aluguel_aluguel_id_6b32fc82_fk_aluguel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_aluguel_id_6b32fc82_fk_aluguel_id FOREIGN KEY (aluguel_id) REFERENCES public.aluguel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2877 (class 2606 OID 16636)
-- Name: cliente_aluguel cliente_aluguel_cliente_id_75d8bbb1_fk_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_cliente_id_75d8bbb1_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2878 (class 2606 OID 16641)
-- Name: localidade localidade_municipio_id_0ecf57f6_fk_mu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade
    ADD CONSTRAINT localidade_municipio_id_0ecf57f6_fk_mu FOREIGN KEY (municipio_id) REFERENCES public.municipio(codigo_ibge) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2879 (class 2606 OID 16646)
-- Name: modelo modelo_marca_id_37978a8e_fk_marca_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_marca_id_37978a8e_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2880 (class 2606 OID 16651)
-- Name: municipio municipio_estado_id_133c0863_fk_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_estado_id_133c0863_fk_estado_id FOREIGN KEY (estado_id) REFERENCES public.estado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2881 (class 2606 OID 16656)
-- Name: veiculo veiculo_localidade_id_22653d67_fk_localidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_localidade_id_22653d67_fk_localidade_id FOREIGN KEY (localidade_id) REFERENCES public.localidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2882 (class 2606 OID 16661)
-- Name: veiculo veiculo_modelo_id_edc93aaa_fk_modelo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_modelo_id_edc93aaa_fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES public.modelo(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-08-31 08:48:45

--
-- PostgreSQL database dump complete
--

