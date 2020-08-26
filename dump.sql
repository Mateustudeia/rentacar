--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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
-- Name: aluguel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluguel (
    id integer NOT NULL,
    data_emprestimo date NOT NULL,
    data_devolucao_contratada date NOT NULL,
    data_devolucao date,
    valor_total date,
    veiculo_id integer NOT NULL
);


ALTER TABLE public.aluguel OWNER TO postgres;

--
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
-- Name: aluguel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluguel_id_seq OWNED BY public.aluguel.id;


--
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
-- Name: cliente_aluguel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_aluguel (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    aluguel_id integer NOT NULL
);


ALTER TABLE public.cliente_aluguel OWNER TO postgres;

--
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
-- Name: cliente_aluguel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_aluguel_id_seq OWNED BY public.cliente_aluguel.id;


--
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
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    sigla character varying(2) NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
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
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
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
-- Name: localidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localidade_id_seq OWNED BY public.localidade.id;


--
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id integer NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
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
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;


--
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
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipio (
    codigo_ibge integer NOT NULL,
    estado_id integer NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
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
-- Name: veiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veiculo_id_seq OWNED BY public.veiculo.id;


--
-- Name: aluguel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel ALTER COLUMN id SET DEFAULT nextval('public.aluguel_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: cliente_aluguel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel ALTER COLUMN id SET DEFAULT nextval('public.cliente_aluguel_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- Name: localidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade ALTER COLUMN id SET DEFAULT nextval('public.localidade_id_seq'::regclass);


--
-- Name: marca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);


--
-- Name: modelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);


--
-- Name: veiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo ALTER COLUMN id SET DEFAULT nextval('public.veiculo_id_seq'::regclass);


--
-- Data for Name: aluguel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluguel (id, data_emprestimo, data_devolucao_contratada, data_devolucao, valor_total, veiculo_id) FROM stdin;
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nascimento, nome, cpf, telefone, email) FROM stdin;
\.


--
-- Data for Name: cliente_aluguel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_aluguel (id, cliente_id, aluguel_id) FROM stdin;
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id, sigla, nome) FROM stdin;
1	MG	Minas Gerais
2	SP	São Paulo
3	PR	Paraná
\.


--
-- Data for Name: localidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localidade (id, bairro, logradouro, numero, nome, municipio_id) FROM stdin;
1	Artur Bernades	Rua cmte. Soares Júnior	268	Unidade Lavras	3138203
2	Vila Andrade	Avenidade Alberto Augusto Alves	50	Unidade São Paulo	3550308
3	Batel	Rua bispo Dom José	2435	Unidade Curitiba	4106902
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id, nome) FROM stdin;
1	Ford
2	Kia
3	Hyundai
4	Toyota
5	Renault
6	Citroën
\.


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modelo (id, nome, ano, versao, marca_id) FROM stdin;
1	Ka	2020-01-01	SE PLUS 1.5 MT	1
2	EcoSport	2019-01-01	FreeStyle 1.5 AT	1
3	Soul	2018-01-01	EX 1.6 AT U265	2
4	Cerato	2019-01-01	2.0 AT E.473	2
5	HB20	2020-01-01	Sense 1.0 MT	3
6	Creta	2020-01-01	Attitude 1.6 MT	3
7	Corolla	2019-01-01	GLI 2.0L Dual VVT-iE	4
8	Yaris Hatch	2019-01-01	1.3 MT Xl Live Man.	4
9	Kwid	2019-01-01	Intense 1.0 12v MT	5
10	Duster	2019-01-01	Iconic SCe 1.6 16v X-TRONIC CVT	5
11	C4 CACTUS	2020-01-01	Live 1.6 MT	6
12	C3	2019-01-01	Attraction 1.2 MT	6
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipio (codigo_ibge, estado_id, nome) FROM stdin;
3138203	1	Lavras
3550308	2	São Paulo
4106902	3	Curitiba
\.


--
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veiculo (id, chassis, localidade_id, modelo_id, diaria) FROM stdin;
1	47390823434624145	1	1	152.9
2	00442259077349297	1	2	269.9
3	06538453499523903	1	3	254.9
4	60497951984397300	1	4	299.9
5	60441559125338294	2	5	123.85
6	36729371321889203	2	6	299.9
7	31158455258140955	2	7	329.9
8	19475379857486214	2	8	239.9
9	32466088687345039	3	9	130.9
10	35934215608533088	3	10	269.9
11	36047678633303303	3	11	479.9
12	89372872492717436	3	12	239.9
\.


--
-- Name: aluguel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluguel_id_seq', 1, false);


--
-- Name: cliente_aluguel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_aluguel_id_seq', 1, false);


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);


--
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_seq', 3, true);


--
-- Name: localidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.localidade_id_seq', 3, true);


--
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_seq', 6, true);


--
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_seq', 12, true);


--
-- Name: veiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veiculo_id_seq', 12, true);


--
-- Name: aluguel aluguel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_pkey PRIMARY KEY (id);


--
-- Name: cliente_aluguel cliente_aluguel_cliente_id_aluguel_id_9c1a4e56_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_cliente_id_aluguel_id_9c1a4e56_uniq UNIQUE (cliente_id, aluguel_id);


--
-- Name: cliente_aluguel cliente_aluguel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_pkey PRIMARY KEY (id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: localidade localidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade
    ADD CONSTRAINT localidade_pkey PRIMARY KEY (id);


--
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (codigo_ibge);


--
-- Name: veiculo veiculo_chassis_76a4484f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_chassis_76a4484f_uniq UNIQUE (chassis);


--
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id);


--
-- Name: aluguel_veiculo_id_a26faf33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX aluguel_veiculo_id_a26faf33 ON public.aluguel USING btree (veiculo_id);


--
-- Name: cliente_aluguel_aluguel_id_6b32fc82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_aluguel_aluguel_id_6b32fc82 ON public.cliente_aluguel USING btree (aluguel_id);


--
-- Name: cliente_aluguel_cliente_id_75d8bbb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_aluguel_cliente_id_75d8bbb1 ON public.cliente_aluguel USING btree (cliente_id);


--
-- Name: localidade_municipio_id_0ecf57f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX localidade_municipio_id_0ecf57f6 ON public.localidade USING btree (municipio_id);


--
-- Name: modelo_marca_id_37978a8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX modelo_marca_id_37978a8e ON public.modelo USING btree (marca_id);


--
-- Name: municipio_estado_id_133c0863; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX municipio_estado_id_133c0863 ON public.municipio USING btree (estado_id);


--
-- Name: veiculo_chassis_76a4484f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_chassis_76a4484f_like ON public.veiculo USING btree (chassis varchar_pattern_ops);


--
-- Name: veiculo_localidade_id_22653d67; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_localidade_id_22653d67 ON public.veiculo USING btree (localidade_id);


--
-- Name: veiculo_modelo_id_edc93aaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veiculo_modelo_id_edc93aaa ON public.veiculo USING btree (modelo_id);


--
-- Name: aluguel aluguel_veiculo_id_a26faf33_fk_veiculo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluguel
    ADD CONSTRAINT aluguel_veiculo_id_a26faf33_fk_veiculo_id FOREIGN KEY (veiculo_id) REFERENCES public.veiculo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cliente_aluguel cliente_aluguel_aluguel_id_6b32fc82_fk_aluguel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_aluguel_id_6b32fc82_fk_aluguel_id FOREIGN KEY (aluguel_id) REFERENCES public.aluguel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cliente_aluguel cliente_aluguel_cliente_id_75d8bbb1_fk_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_aluguel
    ADD CONSTRAINT cliente_aluguel_cliente_id_75d8bbb1_fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: localidade localidade_municipio_id_0ecf57f6_fk_mu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidade
    ADD CONSTRAINT localidade_municipio_id_0ecf57f6_fk_mu FOREIGN KEY (municipio_id) REFERENCES public.municipio(codigo_ibge) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: modelo modelo_marca_id_37978a8e_fk_marca_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_marca_id_37978a8e_fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: municipio municipio_estado_id_133c0863_fk_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_estado_id_133c0863_fk_estado_id FOREIGN KEY (estado_id) REFERENCES public.estado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veiculo veiculo_localidade_id_22653d67_fk_localidade_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_localidade_id_22653d67_fk_localidade_id FOREIGN KEY (localidade_id) REFERENCES public.localidade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veiculo veiculo_modelo_id_edc93aaa_fk_modelo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_modelo_id_edc93aaa_fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES public.modelo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

