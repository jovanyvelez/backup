--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: ecommerce
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO ecommerce;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: ecommerce
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AuthUser; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."AuthUser" (
    id text NOT NULL,
    email text NOT NULL,
    "passwordHash" text NOT NULL,
    "userAuthToken" text NOT NULL
);


ALTER TABLE public."AuthUser" OWNER TO ecommerce;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    name text NOT NULL,
    "padreId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Category" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."CcostoZoneCategories" (
    id integer NOT NULL,
    zone text NOT NULL,
    "categoryId" text NOT NULL,
    ccosto text NOT NULL
);


ALTER TABLE public."CcostoZoneCategories" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."CcostoZoneCategories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CcostoZoneCategories_id_seq" OWNER TO ecommerce;

--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."CcostoZoneCategories_id_seq" OWNED BY public."CcostoZoneCategories".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Image" (
    id text NOT NULL,
    "publicId" text NOT NULL,
    "secureUrl" text NOT NULL,
    "productId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Image" OWNER TO ecommerce;

--
-- Name: OrdenDePedido; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."OrdenDePedido" (
    id integer NOT NULL,
    fecha timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" integer NOT NULL,
    "direccionEntrega" text NOT NULL,
    "ciudadEnt" text NOT NULL,
    "departamentoEnt" text NOT NULL,
    "metodoPago" text,
    estado text,
    "fechaDespacho" timestamp(3) without time zone,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    notes text,
    valor double precision,
    "Procesado" boolean DEFAULT false NOT NULL,
    "codMunicipio" text,
    "codVendedor" text
);


ALTER TABLE public."OrdenDePedido" OWNER TO ecommerce;

--
-- Name: OrdenDePedidoProducto; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."OrdenDePedidoProducto" (
    "ordenDePedidoId" integer NOT NULL,
    "productoId" text NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL,
    ccosto text NOT NULL,
    category text NOT NULL,
    "rootCategory" text NOT NULL
);


ALTER TABLE public."OrdenDePedidoProducto" OWNER TO ecommerce;

--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."OrdenDePedido_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrdenDePedido_id_seq" OWNER TO ecommerce;

--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."OrdenDePedido_id_seq" OWNED BY public."OrdenDePedido".id;


--
-- Name: Price; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Price" (
    id text NOT NULL,
    price1 double precision NOT NULL,
    price2 double precision,
    price3 double precision,
    price4 double precision,
    price5 double precision,
    price6 double precision,
    "productId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Price" OWNER TO ecommerce;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    brand text NOT NULL,
    code text NOT NULL,
    eancode text,
    quantity double precision NOT NULL,
    promo boolean NOT NULL,
    active boolean NOT NULL,
    "categoryId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    tax double precision DEFAULT 19.0 NOT NULL,
    "rootCategory" text
);


ALTER TABLE public."Product" OWNER TO ecommerce;

--
-- Name: Roles; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Roles" OWNER TO ecommerce;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO ecommerce;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: Usuario; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Usuario" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    "docType" text NOT NULL,
    "numDoc" text NOT NULL,
    "Departament" text NOT NULL,
    city text NOT NULL,
    address text NOT NULL,
    "bussinessUnit" text,
    zoneid integer NOT NULL,
    asesor text NOT NULL,
    discount double precision DEFAULT 0,
    "codVendedor" text NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO ecommerce;

--
-- Name: Usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Usuario_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuario_id_seq" OWNER TO ecommerce;

--
-- Name: Usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Usuario_id_seq" OWNED BY public."Usuario".id;


--
-- Name: Zones; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public."Zones" (
    id integer NOT NULL,
    name text NOT NULL,
    zone text NOT NULL
);


ALTER TABLE public."Zones" OWNER TO ecommerce;

--
-- Name: Zones_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public."Zones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Zones_id_seq" OWNER TO ecommerce;

--
-- Name: Zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public."Zones_id_seq" OWNED BY public."Zones".id;


--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.ciudades (
    id text NOT NULL,
    ciudad text NOT NULL,
    codigo text NOT NULL,
    "departamentoId" text NOT NULL
);


ALTER TABLE public.ciudades OWNER TO ecommerce;

--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.departamentos (
    id text NOT NULL,
    departamento text NOT NULL,
    codigo text NOT NULL
);


ALTER TABLE public.departamentos OWNER TO ecommerce;

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    code text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.sellers OWNER TO ecommerce;

--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.sellers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellers_id_seq OWNER TO ecommerce;

--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: CcostoZoneCategories id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories" ALTER COLUMN id SET DEFAULT nextval('public."CcostoZoneCategories_id_seq"'::regclass);


--
-- Name: OrdenDePedido id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido" ALTER COLUMN id SET DEFAULT nextval('public."OrdenDePedido_id_seq"'::regclass);


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: Usuario id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN id SET DEFAULT nextval('public."Usuario_id_seq"'::regclass);


--
-- Name: Zones id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Zones" ALTER COLUMN id SET DEFAULT nextval('public."Zones_id_seq"'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Data for Name: AuthUser; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."AuthUser" (id, email, "passwordHash", "userAuthToken") FROM stdin;
a0f81bc0-9cb7-4cf3-ba96-b088c59f15e1	compras@e-skids.com	$2b$10$1RqFj47nPHKCU9O3btrAv.kvrWGDcFmZ.grX6EMsNxG2aUOCqL6FC	a19c75ab-c707-4506-aa9d-a86ed2529940
4c2a8ede-676c-4e27-868f-dca77b0c9a5c	compras@combustionycontrol.com	$2b$10$J4Z59z55N6stlPPodE2Uz.SQ8XSEtfcj5QE2LVuyJssR7oz3MBzO.	e3526429-3932-44b9-8d34-e3f222227935
9c7d4ed0-517f-4966-b899-ed428b86badf	jovany.test@gmail.com	$2b$10$d9d/w0wYUhhNQ69u6cpCJ.KyWU6SBbbYDf.o4H.TUWlKQi7.ixD72	2d4b897b-5318-4b2c-915b-21603f047879
458de0e6-d0da-4ea0-b6a6-e6d572d924c9	jovany.velez@gmail.com	$2b$10$1wI/zWcCEj3xXVGckd2bfObIDE3e04XkeVc3Czi5/gpiGE5L8pN4a	5a07a525-d821-48af-b863-4522ba683723
b9f52fdf-6cc2-4ff9-a3a8-815405d82bae	ejara461@gmail.com	$2b$10$E7Qy22SaL69c6LSiqzEbYu5cz1xUM6ZraDeVBCUqqz1WQ77Cob.w2	1ba9715f-87ac-4c1f-8ec6-9752ac833b53
ebef68cd-e3be-4680-b998-46cb80ecabf6	oscar.padilla@equisol.com.co	$2b$10$5cK1wB0a.g5zxxQdX3Yxo.rb9qmObJESrksGskZ8J09HR3VjBZaK2	61f28dcb-5c3b-48ff-902e-1ca87cb93557
cc26b23a-7e4b-447a-9608-e0f0bcb53db3	jairo.rivera@equisol.com.co	$2b$10$iO2FNS.zgAn2wrC5R7tlmO13XdeouqKERAyhYeXZYJ3aEokeoFCKW	b08c080a-7936-428a-b8d1-f89e68cb560a
942aee7d-f88d-453e-a5fb-c6fb61dbf354	oscar.gonzalez@equisol.com.co	$2b$10$Bi.Ha9E/CRzyRU74WNHB..VxaDCiaRAz5ZsU4OHyDxoU6k0h/ryf6	8361e847-4a0c-493b-ac1c-654b0c1d8583
ccd6aee9-b586-4511-8daa-c4129a542589	wilfer.castano@equisol.com.co	$2b$10$AJgzhNXQkSZsy2Gfi/Fpq.wvCjFMIXxaB0ktQNO9zIK3dMrKX0.we	ca910f8e-28fd-4bff-917f-4806f4854906
8a1e6285-2a83-495a-97dc-8dc41b2d4d7b	jvelez23@misena.edu.co	$2b$10$WtWhMd8KQgU1Q9WFtXl5suuSa4oFCweYpdYviuOovMn1C0t3GbvEK	525ab359-cb7b-4ba9-9df1-97efdfa6312c
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Category" (id, name, "padreId", "createdAt", "updatedAt") FROM stdin;
d1eefb93-05f4-45f0-b72b-47ad6a256c0b	PARKER	\N	2023-06-27 14:23:24.949	2023-06-27 14:23:24.949
ba995de7-03f8-4845-ab54-a42f221e3e5e	HIDRÁULICA	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	2023-06-27 14:24:43.013	2023-06-27 14:24:43.013
a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	PERIFÉRICO	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-06-27 14:28:05.265	2023-06-27 14:28:05.265
78d1c025-de60-4a70-85a6-f18fc1f70b7e	MOTORES	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-06-28 13:37:13.343	2023-06-28 13:37:13.343
c0d01dab-9929-4e05-a474-b31c29a5f239	BOMBAS	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-06-28 13:39:02.958	2023-06-28 13:39:02.958
3a049adb-2967-4247-a7d3-79c98b83a70e	REPUESTOS	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-06-28 23:52:41.943	2023-06-28 23:52:41.943
f8d5654d-b981-498b-adf8-d05e718bdec4	VÁLVULAS	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-07-01 17:59:23.609	2023-07-01 17:59:23.609
ac74355c-cdba-4cb5-9d55-5edb0e98db1e	FILTRACIÓN HIDRÁULICA	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	2023-07-03 14:34:44.499	2023-07-03 14:34:44.499
03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	ELEMENTOS DE FILTRO	ac74355c-cdba-4cb5-9d55-5edb0e98db1e	2023-07-03 14:36:13.355	2023-07-03 14:36:13.355
5d81e12c-846f-435c-9d10-147f67862852	ACCESORIOS	ac74355c-cdba-4cb5-9d55-5edb0e98db1e	2023-07-03 16:53:33.837	2023-07-03 16:53:33.837
e5872bae-4418-423c-bdf8-b58fb0cf6b77	FILTROS	ac74355c-cdba-4cb5-9d55-5edb0e98db1e	2023-07-03 17:06:15.477	2023-07-03 17:06:15.477
202d3221-94af-42e3-8945-bc2f12e3a509	NEUMÁTICA	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	2023-07-03 17:19:51.467	2023-07-03 17:19:51.467
ebf8bc4a-6c95-4cc4-951a-650c31ff76ea	ELEMENTOS DE FILTRO	202d3221-94af-42e3-8945-bc2f12e3a509	2023-07-03 17:20:29.706	2023-07-03 17:20:29.706
7798e3e4-5f1b-46f4-b8ee-78472e62dff0	F-R-L	202d3221-94af-42e3-8945-bc2f12e3a509	2023-07-03 17:20:42.583	2023-07-03 17:20:42.583
b179eb91-0cd4-43ef-a16e-b73e67ddcb86	RIELLO	\N	2023-07-20 20:49:47.625	2023-07-20 20:49:47.625
fc308c96-7e8e-4381-8c4d-8d5d71f5d484	PIETRO	\N	2023-07-20 20:52:44.953	2023-07-20 20:52:44.953
e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	ALFA LAVAL	\N	2023-07-20 20:55:07.617	2023-07-20 20:55:07.617
6573ece3-c5e5-4c21-aaa9-93b89f3a1aa9	ACPM	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-08-22 21:14:59.371	2023-08-22 21:14:59.371
3b9f7a3c-fe52-429a-8644-2c53cdc67065	ACCESORIOS	ba995de7-03f8-4845-ab54-a42f221e3e5e	2023-08-22 21:17:00.803	2023-08-22 21:17:00.803
643c93e7-bd11-4222-b40d-ccbd4b16305d	ACCESORIOS	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	2023-08-22 21:18:00.151	2023-08-22 21:18:00.151
7ae3a3fe-105a-4800-8772-a16d84b55b06	QUEMADORES	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	2023-08-22 21:19:51.15	2023-08-22 21:19:51.15
947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	ACPM	7ae3a3fe-105a-4800-8772-a16d84b55b06	2023-08-22 21:21:15.648	2023-08-22 21:21:15.648
a8c336f9-3cb0-433e-b906-720abec49f13	ON-OFF	7ae3a3fe-105a-4800-8772-a16d84b55b06	2023-08-22 21:22:17.123	2023-08-22 21:22:17.123
9d983b5a-9fef-4a23-ad09-4128ec5dae09	ALTO-BAJO	7ae3a3fe-105a-4800-8772-a16d84b55b06	2023-08-22 21:22:33.714	2023-08-22 21:22:33.714
30e8a911-cf68-44f5-a2cc-382cd3597ac3	MODULADOS	7ae3a3fe-105a-4800-8772-a16d84b55b06	2023-08-22 21:22:54.078	2023-08-22 21:22:54.078
cba46e2c-a0ac-413c-a475-a93d2e8ea925	DUALES	7ae3a3fe-105a-4800-8772-a16d84b55b06	2023-08-22 21:23:14.596	2023-08-22 21:23:14.596
0f886436-dcdb-4f10-a851-24235ea9941b	FILTROS	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	2023-08-28 19:23:49.617	2023-08-28 19:23:49.617
4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	MEDIDORES	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	2023-08-28 19:56:49.258	2023-08-28 19:56:49.258
\.


--
-- Data for Name: CcostoZoneCategories; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."CcostoZoneCategories" (id, zone, "categoryId", ccosto) FROM stdin;
18	1	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0408
19	3	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0410
20	2	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0409
21	5	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0412
22	6	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0413
23	4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	0411
24	1	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0113
25	3	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0115
26	2	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0114
27	5	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0117
28	6	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0118
29	4	b179eb91-0cd4-43ef-a16e-b73e67ddcb86	0116
30	1	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0120
31	3	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0122
32	2	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0121
33	5	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0124
34	6	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0125
35	4	fc308c96-7e8e-4381-8c4d-8d5d71f5d484	0123
36	1	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0308
37	3	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0310
38	2	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0309
39	5	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0312
40	6	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0313
41	4	e822fef6-6f74-4de7-9c42-9ce9b03ce6b8	0311
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Image" (id, "publicId", "secureUrl", "productId", "createdAt", "updatedAt", name) FROM stdin;
25b5f4c3-1296-4a33-b0fe-721a341c066b	tienda/hddgd5skrcjlnyz9aklf.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687876232/tienda/hddgd5skrcjlnyz9aklf.png	69827d7b-ef80-43b2-9001-b1836a6f6df1	2023-06-27 14:30:32.645	2023-06-27 14:30:32.645	main
21550fa4-1ab4-4c07-bcbc-2b22a3439144	tienda/kffxt5cijjoumc1wvpcf.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687958127/tienda/kffxt5cijjoumc1wvpcf.png	811927e4-df83-41e6-8408-6af91e5add25	2023-06-28 13:15:27.74	2023-06-28 13:15:27.74	main
f13a64a6-b2d7-4e6c-bdf4-27513383a5e0	tienda/mg4wdryxesrhddpmckg5.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687958626/tienda/mg4wdryxesrhddpmckg5.png	784cdb4a-5450-47ed-86a6-112036e3771a	2023-06-28 13:23:46.802	2023-06-28 13:23:46.802	main
6f36aa66-a5c9-4a99-aa76-287cc9eb5fbe	tienda/q3i2g1qk4ajueircniwe.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687958759/tienda/q3i2g1qk4ajueircniwe.png	c3688b74-ed68-4a70-8baa-603f31331f3e	2023-06-28 13:25:59.866	2023-06-28 13:25:59.866	main
2c7c6122-6b10-44ca-98b1-572dacda704d	tienda/rklzm3cwu4eoxoqpkysn.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687959792/tienda/rklzm3cwu4eoxoqpkysn.png	1e299b68-cfa3-4442-8229-6217ea32be96	2023-06-28 13:43:12.907	2023-06-28 13:43:12.907	main
636ddf72-0227-4e41-b212-47fe6d61f292	tienda/qzky7hrakhq1cmpjuaeu.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687992951/tienda/qzky7hrakhq1cmpjuaeu.png	859ecb2a-5710-4431-98aa-b546f9cbb7c8	2023-06-28 22:55:52.231	2023-06-28 22:55:52.231	main
15094845-3b17-4626-8e1a-7ff17ed42165	tienda/t531nreeujfebmrnbc0v.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687993187/tienda/t531nreeujfebmrnbc0v.png	ea20bd56-a792-4287-9f97-f09538450dcf	2023-06-28 22:59:48.143	2023-06-28 22:59:48.143	main
15c5cd4f-d229-4f4b-bb6c-8b8ca17e2cef	tienda/plpurcumjtfw1ejepalj.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687993540/tienda/plpurcumjtfw1ejepalj.png	5622da38-3729-4d21-b589-19f6f6e930a4	2023-06-28 23:05:41.022	2023-06-28 23:05:41.022	main
de68ae4c-ff55-488b-8790-f1d40eead6b2	tienda/smfzzgnn21wjqvxwupyx.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687994379/tienda/smfzzgnn21wjqvxwupyx.png	8a875eef-f92b-4a38-939f-1df3d5949386	2023-06-28 23:19:40.23	2023-06-28 23:19:40.23	main
2dc8d2be-ae70-4af4-b4cb-4ecf8696d7c4	tienda/eovb4z8yeshmblskus1f.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687994525/tienda/eovb4z8yeshmblskus1f.png	9e0e36b2-e0ad-4ae0-8bd9-477225c4be1e	2023-06-28 23:22:06.148	2023-06-28 23:22:06.148	main
fb4e9225-00a4-4bdf-bede-d7532617ebca	tienda/gvwyzjayqph91sb2n2nh.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687994966/tienda/gvwyzjayqph91sb2n2nh.png	8bcde4cd-7c31-424e-b961-0307a4764c51	2023-06-28 23:29:26.974	2023-06-28 23:29:26.974	main
99fa3ae2-bc4b-4bf7-8810-b0d0c3b0f918	tienda/q5c6b3hha2wxg00i9rjw.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687995173/tienda/q5c6b3hha2wxg00i9rjw.png	d298936c-301c-4be4-94c4-b7b926d23399	2023-06-28 23:32:54.409	2023-06-28 23:32:54.409	main
fbecbc71-3c4b-46a2-89cb-215bfa228ce2	tienda/qc7bieaz7xilufnre9bj.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687995411/tienda/qc7bieaz7xilufnre9bj.png	f2f86739-bb89-493e-9707-8510f5ba4bc2	2023-06-28 23:36:51.856	2023-06-28 23:36:51.856	main
77df374b-7180-43b8-804e-417abd42eaef	tienda/ci9e0lhkrxxrl6mbz2bl.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687995568/tienda/ci9e0lhkrxxrl6mbz2bl.png	d0c0689d-1bfd-488b-b8ac-79c6ba186d28	2023-06-28 23:39:29.448	2023-06-28 23:39:29.448	main
3b0c8979-d99a-4e54-bde9-9838d73e2a0d	tienda/lbjhjtyxk2cxbeysrvy4.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687995774/tienda/lbjhjtyxk2cxbeysrvy4.png	55050e9c-5b58-4ce5-873d-ca77388bf4ea	2023-06-28 23:42:54.456	2023-06-28 23:42:54.456	main
a1c41890-7810-4b83-8d32-ae2624f70031	tienda/egmuqsjl7k61ocv2oauj.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687995948/tienda/egmuqsjl7k61ocv2oauj.png	272daa61-8d98-49c2-ae32-8b4d7b9fc643	2023-06-28 23:45:48.597	2023-06-28 23:45:48.597	main
8b5b1375-c653-47b7-92d5-aba0d2396d3a	tienda/pqszw0t1gsdircbhf5m8.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687996177/tienda/pqszw0t1gsdircbhf5m8.png	8519678a-cf0c-4c8f-8ca5-cc91b2d78127	2023-06-28 23:49:38.422	2023-06-28 23:49:38.422	main
dee9c076-20df-458b-bb0c-82f662ebd162	tienda/zywflesdzpj5znb0knzk.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687997572/tienda/zywflesdzpj5znb0knzk.png	0fd72815-6fb5-4388-a8d5-4dd41f01e539	2023-06-29 00:12:52.736	2023-06-29 00:12:52.736	main
5fb7b034-a642-428c-b320-f73a920320ce	tienda/yqagkqt2whcbjzgnudgq.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1687997842/tienda/yqagkqt2whcbjzgnudgq.png	3ce1743a-a1d6-4ea5-a433-8bded16fcef9	2023-06-29 00:17:22.596	2023-06-29 00:17:22.596	main
72ac5267-5fd9-44fd-8f49-8c1c6f539cb6	tienda/rbwflkofjvcywgqndzf0.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688224507/tienda/rbwflkofjvcywgqndzf0.png	0a69319f-e801-45c6-8ae8-b43efa8452fe	2023-07-01 15:15:08.376	2023-07-01 15:15:08.376	main
959a619c-3b6b-42b3-ae55-79a6772324d1	tienda/a6j80vqxvb8ttvmkidtt.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688224860/tienda/a6j80vqxvb8ttvmkidtt.png	f597fe05-f745-4137-a870-d9f0ddf9f0ca	2023-07-01 15:21:01.254	2023-07-01 15:21:01.254	main
45eff679-e914-4163-b9e6-d9dd6ebc198c	tienda/eqomjh7o1umuztivifai.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688225144/tienda/eqomjh7o1umuztivifai.png	5ed353b4-7e13-4685-b44a-59610b208800	2023-07-01 15:25:44.512	2023-07-01 15:25:44.512	main
484c0ece-a2b8-4ad7-8548-4e8960722cfa	tienda/dd1srzucfbshx6dlbcbi.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688225531/tienda/dd1srzucfbshx6dlbcbi.png	cf201e2d-4361-49f3-8d71-83a39e4a684f	2023-07-01 15:32:12.322	2023-07-01 15:32:12.322	main
caac6cd9-9652-4563-af1f-3fb395355496	tienda/fgfvkyph4kjf15wewcrv.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688225701/tienda/fgfvkyph4kjf15wewcrv.png	6ccf3a1b-376e-479d-aa4d-fafed00ae8c3	2023-07-01 15:35:01.928	2023-07-01 15:35:01.928	main
ec0c1a19-258f-46bf-8d71-2c00feceb647	tienda/o4jmdg85wvxdr1o61hpz.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688225918/tienda/o4jmdg85wvxdr1o61hpz.png	5c4c1796-ab62-409d-8d15-21c5818306d0	2023-07-01 15:38:39	2023-07-01 15:38:39	main
313dd566-31e8-4867-97b4-225324a34645	tienda/bv3ten5kve400luwo19k.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688226124/tienda/bv3ten5kve400luwo19k.png	f032c2e9-cb61-410a-8087-851e27f1be69	2023-07-01 15:42:05.147	2023-07-01 15:42:05.147	main
df1605f7-a6fe-410f-a9b7-0ae86906c2e3	tienda/n0gf2ip7pboox02muj10.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688231660/tienda/n0gf2ip7pboox02muj10.png	33e19cea-619a-490e-ab8a-71ef1be53abc	2023-07-01 17:14:20.862	2023-07-01 17:14:20.862	main
3fe41c68-e6d7-4e9f-937e-107024b4c9bc	tienda/n3seiuviksteg0rc1tgu.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688231851/tienda/n3seiuviksteg0rc1tgu.png	19e10d98-4dc5-463a-9010-8825070609fa	2023-07-01 17:17:32.017	2023-07-01 17:17:32.017	main
eb87d643-eaba-487f-893e-d0ef1ecb75b5	tienda/macreputhfeg5blpruj6.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688232330/tienda/macreputhfeg5blpruj6.png	0c2cf883-1e9c-436a-b074-0c42228845d6	2023-07-01 17:25:30.655	2023-07-01 17:25:30.655	main
c6a3eb9c-1771-4dea-a83b-d3ed8a59ecfb	tienda/z7lxr8vvwgpbpnofhrhn.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688232761/tienda/z7lxr8vvwgpbpnofhrhn.png	072f17b7-b36c-489e-988d-8adfac32ebfb	2023-07-01 17:32:42.601	2023-07-01 17:32:42.601	main
cccb2228-8926-4f27-9419-5d57bd06a3bd	tienda/xanqqfxhswzgejvrvol5.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233067/tienda/xanqqfxhswzgejvrvol5.png	652b6edc-33b1-4105-b315-adf852c31973	2023-07-01 17:37:47.768	2023-07-01 17:37:47.768	main
14b6a2aa-970e-4963-9640-525f8172340f	tienda/qlipecylrgelr2hkcjna.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233221/tienda/qlipecylrgelr2hkcjna.png	09ff2a2a-b59c-489b-88e8-f9be47f48b31	2023-07-01 17:40:22.221	2023-07-01 17:40:22.221	main
628a8aa6-bc28-448b-9478-7720e109f11b	tienda/jahqclrb2fkt267gsuns.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233352/tienda/jahqclrb2fkt267gsuns.png	14a1b555-9a63-46c7-b437-b28f92cb58b0	2023-07-01 17:42:33.051	2023-07-01 17:42:33.051	main
22cc3da0-3b86-4b2e-aa32-94e4e026b9b8	tienda/aahoxr5ljri5kzgdzuda.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233516/tienda/aahoxr5ljri5kzgdzuda.png	187f2a25-b579-43e4-b3df-71b6e8da67d3	2023-07-01 17:45:17.626	2023-07-01 17:45:17.626	main
c74e59f1-a816-46f6-bc52-7811173eaadc	tienda/gdm9gj0lvyhuplastyux.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233725/tienda/gdm9gj0lvyhuplastyux.png	904f23f4-f717-4c4f-9b8d-4cdc7232002a	2023-07-01 17:48:46.526	2023-07-01 17:48:46.526	main
96ceeab8-3c10-4260-85c6-f6894e893b82	tienda/k78hklyjrc387w4lbl5r.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688233991/tienda/k78hklyjrc387w4lbl5r.png	48c2bc88-3aa9-4c57-b99f-c8f5beeeeabc	2023-07-01 17:53:11.584	2023-07-01 17:53:11.584	main
f6287994-0e5e-40f0-8d23-c6133658bec5	tienda/dyg9ywwqlrjrcbywur0v.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688234213/tienda/dyg9ywwqlrjrcbywur0v.png	c53c79a0-be7e-42f1-8996-bb2df1a08219	2023-07-01 17:56:54.239	2023-07-01 17:56:54.239	main
d70b848e-aa6b-45b9-81f6-3e9558751092	tienda/omdmkvwqvmpvtvd2mwpm.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688234645/tienda/omdmkvwqvmpvtvd2mwpm.png	47e21bdb-442b-4964-885e-54a34ac998b8	2023-07-01 18:04:06.351	2023-07-01 18:04:06.351	main
c1cb750e-346c-4da3-ae27-e8cbb3ae7f08	tienda/tbyyccy68tjw732kuyqw.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688234964/tienda/tbyyccy68tjw732kuyqw.png	71ca3df3-6467-4960-8be8-28fc0db5e748	2023-07-01 18:09:25.333	2023-07-01 18:09:25.333	main
d31cf834-f63a-4a55-b6c6-caba4bba419c	tienda/rd7uldbohjtm3duv9o69.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688235116/tienda/rd7uldbohjtm3duv9o69.png	817bfb09-8fe1-45a3-9810-efeebe574f49	2023-07-01 18:11:56.741	2023-07-01 18:11:56.741	main
5d0ffb3d-6899-41a5-a805-f52366614f56	tienda/n41cd7jgl4cvkbxrhdjh.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688235283/tienda/n41cd7jgl4cvkbxrhdjh.png	50086adc-f8ba-40cf-a792-73c61960265e	2023-07-01 18:14:44.328	2023-07-01 18:14:44.328	main
8001b1f6-cb11-4b39-baa6-66dc4a6c2d6c	tienda/smwfiusflmouqdp5cngp.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688235539/tienda/smwfiusflmouqdp5cngp.png	926eae18-e7ae-497e-b22a-f23054492084	2023-07-01 18:19:00.282	2023-07-01 18:19:00.282	main
865d3804-a1c8-479b-806d-65d0b3d1e307	tienda/l4qzkh0qut2yusg8lsxd.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688235589/tienda/l4qzkh0qut2yusg8lsxd.png	eecf1032-3b32-4a12-b03f-2d0c160fa6ca	2023-07-01 18:19:50.503	2023-07-01 18:19:50.503	main
4c5d36a7-f53d-41af-a5da-df3bfe52f9a2	tienda/gn8hwms4o98io2lolcch.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688235794/tienda/gn8hwms4o98io2lolcch.png	227bb4ed-2ebd-4085-81ee-c60fe445553b	2023-07-01 18:23:14.827	2023-07-01 18:23:14.827	main
d5ed8475-1725-45cf-947f-97088493f9fe	tienda/bu84zq2174dhsaad6hd9.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236078/tienda/bu84zq2174dhsaad6hd9.png	9791f231-65a5-48b3-921f-bec9cddd046c	2023-07-01 18:27:58.599	2023-07-01 18:27:58.599	main
ca0f2cf4-d53b-4aa6-81cd-8fb26ec025c3	tienda/byzrv9ip8e4khmbrah1p.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236223/tienda/byzrv9ip8e4khmbrah1p.png	99932e44-58a8-4033-a473-03e0b2658654	2023-07-01 18:30:23.868	2023-07-01 18:30:23.868	main
5afb2c60-5216-4a29-94d0-aa15e7dae6b1	tienda/kxeydfdx3ig1ndw8tzg1.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236308/tienda/kxeydfdx3ig1ndw8tzg1.png	ef24cfa3-e34d-4979-b1fb-324224d176b5	2023-07-01 18:31:49.265	2023-07-01 18:31:49.265	main
05fd72c2-0c63-4e09-bfb5-252395aa9b30	tienda/zwzile1uhx7zmud1bs8h.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236484/tienda/zwzile1uhx7zmud1bs8h.png	377650de-d351-4048-aa6d-151e0fc69970	2023-07-01 18:34:45.336	2023-07-01 18:34:45.336	main
b104bed5-244d-488d-9b1e-1f7a51c1a0c0	tienda/hg4igsg7rkgxoln6vrfu.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236574/tienda/hg4igsg7rkgxoln6vrfu.png	d8ec9521-2f54-4658-818b-50e68f0d52a1	2023-07-01 18:36:15.212	2023-07-01 18:36:15.212	main
4c9e3d7e-be54-4e6e-a178-29b7149a634d	tienda/ks3lzzsskyhtpan2qanh.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236676/tienda/ks3lzzsskyhtpan2qanh.png	9350dff9-0874-4ccb-b8f6-4c5f76cf76d8	2023-07-01 18:37:56.661	2023-07-01 18:37:56.661	main
fc008532-e682-49cb-83fc-edd90774a9f4	tienda/x6nmurpf46phh0kgjopp.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688236794/tienda/x6nmurpf46phh0kgjopp.png	da82268e-96ce-4230-a558-d14fc9ebbf13	2023-07-01 18:39:55.435	2023-07-01 18:39:55.435	main
e68b3b23-bcaa-4913-8ee0-cc7e4b6d3974	tienda/ujkgcjkgtpdksbwnr7fm.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237212/tienda/ujkgcjkgtpdksbwnr7fm.png	f0bf85fc-5f84-4108-bed3-8a70046f6187	2023-07-01 18:46:52.77	2023-07-01 18:46:52.77	main
7aeb54ac-18f6-4950-b9dd-9850cec2a316	tienda/r3eafew49q1qmby4wtxz.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237443/tienda/r3eafew49q1qmby4wtxz.png	bd9286d8-7a25-47a3-bec1-729a1792b063	2023-07-01 18:50:43.778	2023-07-01 18:50:43.778	main
982b11cd-1dc1-455e-843d-9b3d2865f07c	tienda/occumxyp8emylhczbbun.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237509/tienda/occumxyp8emylhczbbun.png	debb43ae-3e59-4587-8169-99150434fede	2023-07-01 18:51:49.625	2023-07-01 18:51:49.625	main
d615fe31-5a5b-46c7-af1c-9e8715f89b41	tienda/lmfpwfyxoa3f19rfek85.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237558/tienda/lmfpwfyxoa3f19rfek85.png	475ff4dd-1665-4668-822a-cb64edc12515	2023-07-01 18:52:39.116	2023-07-01 18:52:39.116	main
9b173d2b-10df-480b-9e65-f7b07391e916	tienda/lhvr8bh3ja9gqcbuep88.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237804/tienda/lhvr8bh3ja9gqcbuep88.png	aeefe8a9-07ef-4add-9ae0-fc92b9c177ea	2023-07-01 18:56:45.225	2023-07-01 18:56:45.225	main
0f746fa8-c573-40c7-b5ce-2b3280cd9982	tienda/ohjvv0xn66ubtikrfeum.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688237972/tienda/ohjvv0xn66ubtikrfeum.png	4c372554-449d-4666-b15f-a26a839332a9	2023-07-01 18:59:32.66	2023-07-01 18:59:32.66	main
a00dbbfc-e520-42f6-8cbb-0d7571b853c5	tienda/up1f0adadsalskqxu6m4.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688238158/tienda/up1f0adadsalskqxu6m4.png	6a42c3cd-5421-45c2-8261-789255786ac6	2023-07-01 19:02:39.039	2023-07-01 19:02:39.039	main
0b59846b-9491-4fa4-a193-a688b9f13f65	tienda/dakassxhvfeh8vtfqfab.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688238441/tienda/dakassxhvfeh8vtfqfab.png	822dba01-ad64-421a-8724-79b2f4203999	2023-07-01 19:07:22.34	2023-07-01 19:07:22.34	main
cf8860ae-93f9-4388-bde0-282a358af0cb	tienda/pug084gqfrujmbqowez8.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688240090/tienda/pug084gqfrujmbqowez8.png	674fc149-afa4-4462-ba4d-7683b0c765e1	2023-07-01 19:34:51.189	2023-07-01 19:34:51.189	main
a16d4848-98dc-411d-a3b4-ba58bfbbfc7a	tienda/g346vfjllao88kjmbtxd.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688240174/tienda/g346vfjllao88kjmbtxd.png	4b7fe176-67f7-4bdd-b84d-96972d9ff69d	2023-07-01 19:36:14.804	2023-07-01 19:36:14.804	main
72710cd6-874c-47bb-a50d-20a7906bc561	tienda/z7xqmfkisphhjdme0cvi.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688240329/tienda/z7xqmfkisphhjdme0cvi.png	5a24bcad-92e0-441c-997c-8c63aa127988	2023-07-01 19:38:49.619	2023-07-01 19:38:49.619	main
524e45af-3160-4e08-9ffb-d76a7da88175	tienda/i8tllgnfq2ue9tbuqi7a.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688240516/tienda/i8tllgnfq2ue9tbuqi7a.png	850240e0-c07e-4cc6-8f63-886c29c6059e	2023-07-01 19:41:56.715	2023-07-01 19:41:56.715	main
eaf9ff28-782a-41c5-b7df-a223820901a0	tienda/upocwmswuldfm2tskvp3.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688240705/tienda/upocwmswuldfm2tskvp3.png	3cccb670-2e9b-4918-ab73-042af0e4518d	2023-07-01 19:45:05.77	2023-07-01 19:45:05.77	main
83deeac4-869b-4e05-8708-654b36d21f69	tienda/qyya1rfu2qx0vrz9embz.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688241286/tienda/qyya1rfu2qx0vrz9embz.png	37016c30-4403-4a7e-93e7-7937aec8e878	2023-07-01 19:54:47.073	2023-07-01 19:54:47.073	main
d540ca7f-8018-43eb-8f58-d2253ad5ba9b	tienda/jug8cb4cnjmvnx5fbhal.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688241449/tienda/jug8cb4cnjmvnx5fbhal.png	6a258fcc-dad5-4214-92e3-24cfbbe473b5	2023-07-01 19:57:30.271	2023-07-01 19:57:30.271	main
90f3765a-5539-441b-a1bd-03a161a69786	tienda/mvxcl3dpkpuftvgwdhtn.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688241712/tienda/mvxcl3dpkpuftvgwdhtn.png	24ed9e25-8434-4d07-b441-5116b2597826	2023-07-01 20:01:52.508	2023-07-01 20:01:52.508	main
ef1c6d48-c871-4de6-98c9-6005dac4cf9c	tienda/xscowhzfygzbqcakmdct.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688393177/tienda/xscowhzfygzbqcakmdct.png	4c580310-fa0e-4e2a-a56e-948e18c72fc8	2023-07-03 14:06:18.071	2023-07-03 14:06:18.071	main
ccd7cf09-8eda-4e16-a460-c944da38432d	tienda/nxo3b9ngf7rqhfq9bjz2.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688393307/tienda/nxo3b9ngf7rqhfq9bjz2.png	6b6525c2-d59b-43ea-a219-cb8dd7b96596	2023-07-03 14:08:28.359	2023-07-03 14:08:28.359	main
d9bd7caf-33f5-47a8-9c93-e747642de5da	tienda/eeequxi66it67kvpq2pu.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688393552/tienda/eeequxi66it67kvpq2pu.png	b5fb324c-e5f7-49f5-8c89-3ee6352a8aba	2023-07-03 14:12:33.293	2023-07-03 14:12:33.293	main
292a4afc-f50f-4230-ad48-3429b5a78930	tienda/ljt7cvonzyzejk2lgomq.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688393815/tienda/ljt7cvonzyzejk2lgomq.png	ef1da8d2-e0d5-483d-981b-94e7e4a69465	2023-07-03 14:16:56.802	2023-07-03 14:16:56.802	main
f8289f4e-711e-471f-93fa-65b0c634e9c7	tienda/shzgaerxz6cn15njbmbg.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688393976/tienda/shzgaerxz6cn15njbmbg.png	e4937bdc-c9d3-4424-a95a-481a5fb65464	2023-07-03 14:19:37.236	2023-07-03 14:19:37.236	main
40253f03-5fb5-4d16-ad3d-d2ed570d92d3	tienda/concfg72fuaizr0bvfr0.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688395045/tienda/concfg72fuaizr0bvfr0.png	43f093fa-7f33-4913-a018-da1719ecdfc9	2023-07-03 14:37:25.733	2023-07-03 14:37:25.733	main
7b3d6691-b32e-4fa7-888d-9328f1416e30	tienda/ocyjupjgoacjbskjnorm.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688396287/tienda/ocyjupjgoacjbskjnorm.png	3f9608cc-c7e7-434d-84ac-a1444bd84674	2023-07-03 14:58:08.035	2023-07-03 14:58:08.035	main
551a738e-702d-4ee4-a26e-0e9a688ae07a	tienda/adenooaqrxpdn83r65dv.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688396347/tienda/adenooaqrxpdn83r65dv.png	4f4dd321-83cc-458a-81e0-81feedc2c5d8	2023-07-03 14:59:08.174	2023-07-03 14:59:08.174	main
0cf80bcf-ead5-473e-af74-747a5c0da4e9	tienda/bra6jorrmg0rvhy0jszx.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688396537/tienda/bra6jorrmg0rvhy0jszx.png	4b98c3fc-4a7c-4fb6-a3f1-2d4520b4218d	2023-07-03 15:02:17.988	2023-07-03 15:02:17.988	main
326ebb58-6784-4574-9be5-75f793990347	tienda/ao7ri4tpvkx260nty7uy.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688396918/tienda/ao7ri4tpvkx260nty7uy.png	36cd21bf-a39d-4c8b-a496-112bb73f86f1	2023-07-03 15:08:39.064	2023-07-03 15:08:39.064	main
cf58c26b-361a-4a83-bc57-75f8a055b213	tienda/o6afrk3ar2dnjdfdmlvc.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688396993/tienda/o6afrk3ar2dnjdfdmlvc.png	6ba4cc00-0405-4904-a4a7-cdbb57eeaa08	2023-07-03 15:09:54.116	2023-07-03 15:09:54.116	main
c6b3ac64-b0ed-4b33-909d-1e5c5e0f41c5	tienda/yk3pub7t2f8j9brpmt2t.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688397038/tienda/yk3pub7t2f8j9brpmt2t.png	9406d229-8e04-4f26-82c9-4756b4e39294	2023-07-03 15:10:38.661	2023-07-03 15:10:38.661	main
007ee9fd-395c-48e6-a755-d55062c491d8	tienda/se06j1aga1bsuvoqixlg.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688397690/tienda/se06j1aga1bsuvoqixlg.png	83b1208d-0c83-448d-b87c-2d27da9b331d	2023-07-03 15:21:30.615	2023-07-03 15:21:30.615	main
8685a110-59a9-45f0-9982-07919ae1157d	tienda/zvnrxhhyt3lajivpoq6q.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398009/tienda/zvnrxhhyt3lajivpoq6q.png	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	2023-07-03 15:26:49.524	2023-07-03 15:26:49.524	main
de80526e-1c95-497f-af4a-76fbe214642d	tienda/ont2ptrs5z0tnvl1ooxg.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398159/tienda/ont2ptrs5z0tnvl1ooxg.png	ae73395a-0804-4f96-bdb2-a30fe09af344	2023-07-03 15:29:19.857	2023-07-03 15:29:19.857	main
2ba1e47c-503c-44a6-ab49-f8d0543ad953	tienda/tpbjgg0fuo8qwr9hvvxl.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398272/tienda/tpbjgg0fuo8qwr9hvvxl.png	59762fdb-46bb-4706-83ef-9c630c6c75d4	2023-07-03 15:31:12.52	2023-07-03 15:31:12.52	main
e2fa0167-8bfa-4abe-a942-3b86cfa99db4	tienda/w2rahmwygbuh4krywikt.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398528/tienda/w2rahmwygbuh4krywikt.png	b4761d8f-2ffa-472e-b597-5e666d66e0a6	2023-07-03 15:35:28.799	2023-07-03 15:35:28.799	main
c1036c1d-76f2-4ce4-a2fb-d2a5f805befb	tienda/ua8vbauzrk2t70cj7d57.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398580/tienda/ua8vbauzrk2t70cj7d57.png	70e15217-ab8e-400a-a63b-70c0f4d30249	2023-07-03 15:36:20.631	2023-07-03 15:36:20.631	main
6a36f346-bd54-473b-917a-b52fc787c52b	tienda/ghhmrrvl9qgvcpqa0yce.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398642/tienda/ghhmrrvl9qgvcpqa0yce.png	8d60ded1-1c06-42d5-a609-40ffcd4d4bfa	2023-07-03 15:37:23.367	2023-07-03 15:37:23.367	main
f108cde1-8ba7-4d42-afb5-2baca38543f2	tienda/dhmhp116u7tse3r67hkw.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688398687/tienda/dhmhp116u7tse3r67hkw.png	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2023-07-03 15:38:08.125	2023-07-03 15:38:08.125	main
faf2977b-ee2b-4716-be7e-5b368dc88bf0	tienda/cpaxoifvebmfl4dc8v2w.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399102/tienda/cpaxoifvebmfl4dc8v2w.png	93ff20f1-e008-4efc-ab71-e98da94cdfd2	2023-07-03 15:45:03.42	2023-07-03 15:45:03.42	main
066f471d-0eff-4a64-b990-2c9773611599	tienda/kpcffhyn3utlpwfr5ge9.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399148/tienda/kpcffhyn3utlpwfr5ge9.png	34fc2e7d-513b-4117-b33d-3934093dd93a	2023-07-03 15:45:48.602	2023-07-03 15:45:48.602	main
3a1923d0-ae92-4406-90f8-96dc8ee9922b	tienda/iffffevqw2qcsxswg0fx.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399195/tienda/iffffevqw2qcsxswg0fx.png	080c38e2-393f-4569-8336-fd9bac065573	2023-07-03 15:46:35.968	2023-07-03 15:46:35.968	main
77a489dd-538d-4ec4-a6b9-578477cb20ae	tienda/cr5xolvltnhlnegz0yrd.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399261/tienda/cr5xolvltnhlnegz0yrd.png	9bd2368c-f6a4-432e-a90e-65ee33900e07	2023-07-03 15:47:41.969	2023-07-03 15:47:41.969	main
a70e5047-dbc4-4f55-8cb1-211559a2936c	tienda/lzz1cxbhlizle3c3whs5.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399879/tienda/lzz1cxbhlizle3c3whs5.png	f33e77e7-a9d6-463b-8919-178df2e4e3ba	2023-07-03 15:58:00.374	2023-07-03 15:58:00.374	main
5f4c4e03-a9f0-4761-8969-cfac638b74aa	tienda/erd6obeos3wy8hcrxnox.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399924/tienda/erd6obeos3wy8hcrxnox.png	3995e461-7fcc-4292-9e54-5f5b7dc12acc	2023-07-03 15:58:44.82	2023-07-03 15:58:44.82	main
923b7047-ec54-470f-a41c-9d2dfbf60e2e	tienda/llp25edvxndvb2l0d9wz.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688399973/tienda/llp25edvxndvb2l0d9wz.png	839025a4-88cc-4468-8141-c1e78cd3fdcf	2023-07-03 15:59:33.518	2023-07-03 15:59:33.518	main
8543f4cb-1684-4972-b922-0be50b325c04	tienda/qprdr1gxkmeikxm8a1al.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688400072/tienda/qprdr1gxkmeikxm8a1al.png	13d004fb-a626-43d0-8ddc-81bff70a5567	2023-07-03 16:01:12.944	2023-07-03 16:01:12.944	main
2f9d91a3-0f26-4507-a866-39738d3aacad	tienda/imkhivxqwbzs1jtybv3d.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688400178/tienda/imkhivxqwbzs1jtybv3d.png	08aa63f9-0001-4304-9707-f2312f46b8ea	2023-07-03 16:02:58.469	2023-07-03 16:02:58.469	main
a0b5348f-e9f2-4127-9abb-5e83b31ab54e	tienda/kyya0bj8hbcfiih8x8w1.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688400545/tienda/kyya0bj8hbcfiih8x8w1.png	92c139a2-d244-486f-8320-c534f73399eb	2023-07-03 16:09:05.392	2023-07-03 16:09:05.392	main
c7b95e30-9711-4423-bd5d-432030ef3b2a	tienda/bbmbknicuz70rtmdkea2.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688400662/tienda/bbmbknicuz70rtmdkea2.png	b559315a-b66d-4781-b74f-c9cdd098848e	2023-07-03 16:11:03.253	2023-07-03 16:11:03.253	main
d3320767-6d5a-475b-a4ea-91fa8665cd10	tienda/xzveslxqptingvm08zim.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688400766/tienda/xzveslxqptingvm08zim.png	fdb4ad67-b203-4453-b6da-87df913f1c68	2023-07-03 16:12:47.568	2023-07-03 16:12:47.568	main
a7349ca0-3ca2-4933-a69c-d745bd2cf35c	tienda/ovwfhcfnjyx7vpsz5tdm.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401297/tienda/ovwfhcfnjyx7vpsz5tdm.png	8e0a31ea-fe50-4173-bde5-d4011ec07687	2023-07-03 16:21:37.893	2023-07-03 16:21:37.893	main
1687ebd8-8e05-49f1-ba2a-9b644d84a1cd	tienda/o4dvxc71wd1bcwrcbknp.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401341/tienda/o4dvxc71wd1bcwrcbknp.png	168d0fd5-814f-4f1d-806f-04dc918c2b22	2023-07-03 16:22:22.043	2023-07-03 16:22:22.043	main
84414999-2db5-4f74-b5a4-f9aba193409d	tienda/yfja5renvrxudu4jvo7r.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401386/tienda/yfja5renvrxudu4jvo7r.png	44b97127-9687-4310-b936-b48e36b8388f	2023-07-03 16:23:06.917	2023-07-03 16:23:06.917	main
dacd3f5c-a559-4bf8-b250-eacd82089d35	tienda/dhyjg1wxo4jp0fqhseva.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401426/tienda/dhyjg1wxo4jp0fqhseva.png	a708a0cd-4236-465c-91ab-394afb375bc5	2023-07-03 16:23:47	2023-07-03 16:23:47	main
33916742-59fb-4c55-986d-5bfce93cff2d	tienda/ipqbu9f1wrtzg5xnd3zh.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401463/tienda/ipqbu9f1wrtzg5xnd3zh.png	b4b410a4-586d-4cc3-ae20-55ac97578089	2023-07-03 16:24:24.397	2023-07-03 16:24:24.397	main
24941366-98fc-4db1-904c-94d411d62b25	tienda/e7szefyrlttonncw5ot0.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401576/tienda/e7szefyrlttonncw5ot0.png	97da7731-f76e-42c0-b0fb-7e5d9cbcfc4c	2023-07-03 16:26:17.724	2023-07-03 16:26:17.724	main
6c1e7016-31d1-4847-b65c-e03792737399	tienda/wzniwzij5teonxawfvpp.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688401610/tienda/wzniwzij5teonxawfvpp.png	34471605-c34f-4616-a7e8-2d3f7fb0b956	2023-07-03 16:26:50.968	2023-07-03 16:26:50.968	main
4189cea6-67e3-4be2-83b0-36e788f523fd	tienda/uyxqabqhbq8dfvfcllcr.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688403256/tienda/uyxqabqhbq8dfvfcllcr.png	a18c67b9-302c-4f7a-8167-25bc88763cf7	2023-07-03 16:54:16.87	2023-07-03 16:54:16.87	main
fd693c87-5357-4551-960e-3a42f71017aa	tienda/ysdc4hqs4qks0c8rodyz.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688403323/tienda/ysdc4hqs4qks0c8rodyz.png	7b96a010-c5a4-45df-b9b6-e218a3202b88	2023-07-03 16:55:23.788	2023-07-03 16:55:23.788	main
22be6c38-1620-41df-9bc7-244dfc888867	tienda/q1pyw7m0zno7beo9zkig.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688403415/tienda/q1pyw7m0zno7beo9zkig.png	92ad74e4-3aea-4ce1-994c-20cfcc0b3016	2023-07-03 16:56:56.277	2023-07-03 16:56:56.277	main
c9cf3156-800b-4b12-8f2c-486af56b4552	tienda/bladz8zf25qbp9k9tsp1.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688403486/tienda/bladz8zf25qbp9k9tsp1.png	291b5eac-5b1d-496b-8260-d0a085cc6167	2023-07-03 16:58:06.989	2023-07-03 16:58:06.989	main
f3438082-6bfe-4ada-bbc8-640ae7d49189	tienda/dlkwnqn3tpnyulh1omnw.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688403620/tienda/dlkwnqn3tpnyulh1omnw.png	3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	2023-07-03 17:00:21.204	2023-07-03 17:00:21.204	main
b95f1803-cc58-4c15-b537-33b6f5333274	tienda/qzfurfuewlnrgdweyzug.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688404043/tienda/qzfurfuewlnrgdweyzug.png	b5abaf7f-adc4-4d50-a760-05f7b0622bd7	2023-07-03 17:07:23.551	2023-07-03 17:07:23.551	main
d74c2b9c-0f8e-4e0b-b8b3-a2e6d2f3da78	tienda/kj5tutostum1tzxiresb.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688404215/tienda/kj5tutostum1tzxiresb.png	a101363f-98c6-469b-b7ca-a56366e99cc5	2023-07-03 17:10:16.571	2023-07-03 17:10:16.571	main
d2a0cc96-f987-4fc5-a51e-7cc0700d8ecf	tienda/brfamp7imlnkc8a5auvo.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688404261/tienda/brfamp7imlnkc8a5auvo.png	7bcdc197-2923-400c-9e95-e2a0f6e3e147	2023-07-03 17:11:01.711	2023-07-03 17:11:01.711	main
7cb05d97-6bd8-426f-8908-0f84a100dd4f	tienda/oqaot9tyabx33s7tksct.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688404891/tienda/oqaot9tyabx33s7tksct.png	18c84c5e-8e87-412d-a57e-3cc4ecc2c72a	2023-07-03 17:21:31.951	2023-07-03 17:21:31.951	main
d4a35321-2a51-41f8-ac04-bab3b806bba4	tienda/s0wilnxl2xuycy72s54f.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688404930/tienda/s0wilnxl2xuycy72s54f.png	9d8c66a7-c358-46d7-b95d-84256445e0a6	2023-07-03 17:22:10.899	2023-07-03 17:22:10.899	main
04b4d24f-ba6a-4ca2-8a7c-ab0261db1d87	tienda/cglihb9wr8as7dqyxsun.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688405071/tienda/cglihb9wr8as7dqyxsun.png	8bc0815f-9353-474b-ad06-4c49af691c37	2023-07-03 17:24:32.35	2023-07-03 17:24:32.35	main
67282c50-a342-430e-8602-f3502801709c	tienda/ohu79bmoksc1lzto4du3.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1688405225/tienda/ohu79bmoksc1lzto4du3.png	9da35227-65b0-4d1f-958d-e69e0d3853d5	2023-07-03 17:27:05.683	2023-07-03 17:27:05.683	main
32a92afc-1f0c-404d-9a4a-4d402d82e94d	tienda/n8bparaj7mozi8go4z8i.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1692740494/tienda/n8bparaj7mozi8go4z8i.png	f8884836-97ad-4e95-b5af-dfd8f4ce7aa7	2023-08-22 21:41:34.863	2023-08-22 21:41:34.863	main
6c49240f-5aed-47f5-8cdf-3605e8bd2f6b	tienda/mtjasxzwvp5hzg1m1orb.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1692740873/tienda/mtjasxzwvp5hzg1m1orb.png	37a007b5-7039-4e78-8979-904e9bb856f0	2023-08-22 21:47:54.239	2023-08-22 21:47:54.239	main
7d1ddf34-9a8a-4930-b686-a65a5e7e6be0	tienda/hu0owmp0rkvpr5vesex2.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1692741232/tienda/hu0owmp0rkvpr5vesex2.png	4e97b052-21f5-45c7-b1d6-87200c060c91	2023-08-22 21:53:52.586	2023-08-22 21:53:52.586	main
11bd3a37-e3d2-4e6b-83cc-1f562c788436	tienda/r1azrmeqbceooqo7alfg.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1692741382/tienda/r1azrmeqbceooqo7alfg.png	9005a2ad-4547-4acd-b475-f421cd01d24f	2023-08-22 21:56:23.066	2023-08-22 21:56:23.066	main
f4e36b26-d2b6-4bb8-a733-4ecbd60c963b	tienda/yzitvpu7zqpmz8xomouk.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693251252/tienda/yzitvpu7zqpmz8xomouk.png	6a23d22a-41c5-40d6-8521-e70988699b05	2023-08-28 19:34:12.877	2023-08-28 19:34:12.877	main
cabd2146-4375-4686-ae08-6ed930c6f43b	tienda/jypfhwkh4uuwczpbcue1.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693251348/tienda/jypfhwkh4uuwczpbcue1.png	f63e8734-6a61-45f4-8ae4-b33d7b25ba3f	2023-08-28 19:35:49.122	2023-08-28 19:35:49.122	main
828cd64e-d593-4d0f-b7a7-adac4d5af270	tienda/wxurdkxqdeu6a6yaoabi.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693251432/tienda/wxurdkxqdeu6a6yaoabi.png	6552c8b6-e3fa-4e2d-aa33-f6625ad55739	2023-08-28 19:37:13.402	2023-08-28 19:37:13.402	main
22f00862-6e21-4607-bdf1-6aca0595923a	tienda/ecopdlqiku50iwhvxhoy.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693251635/tienda/ecopdlqiku50iwhvxhoy.png	ca357e92-4816-4dd6-82ad-8b0c1b018ccf	2023-08-28 19:40:36.075	2023-08-28 19:40:36.075	main
266b2eff-db31-4521-b057-3a4ed9405206	tienda/m5pfnyzydbx6vnnnviuv.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693251853/tienda/m5pfnyzydbx6vnnnviuv.png	19b88797-be2b-4f30-87ac-4e8ef103f721	2023-08-28 19:44:13.701	2023-08-28 19:44:13.701	main
37149367-a340-4dc3-8246-a194090dc830	tienda/u6kmgbjnrqzqgeuxgpme.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693252056/tienda/u6kmgbjnrqzqgeuxgpme.png	d24ec077-7625-4df6-af0c-16e6c16d3300	2023-08-28 19:47:36.973	2023-08-28 19:47:36.973	main
2717b0f7-34ba-4671-aa1d-af6b06e5a578	tienda/wpe4ow9qovww8mm5uwbq.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693252882/tienda/wpe4ow9qovww8mm5uwbq.png	494fd335-9777-4055-a990-130bb6a6ca18	2023-08-28 20:01:23.114	2023-08-28 20:01:23.114	main
704da511-32cf-4bcc-900e-3b601ea3f8fc	tienda/i3ll41qxn0ngy8tpeva8.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693252986/tienda/i3ll41qxn0ngy8tpeva8.png	26a8762e-13b7-44aa-8a2b-1db34b8d7e79	2023-08-28 20:03:06.984	2023-08-28 20:03:06.984	main
1aae5eb3-e178-4f54-911e-8f85bca3390b	tienda/th5aj30dsiytaablfkqh.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693253137/tienda/th5aj30dsiytaablfkqh.png	e2f3bc96-79cd-48a8-ac70-3ce13bbbf952	2023-08-28 20:05:37.749	2023-08-28 20:05:37.749	main
e4ae661d-91f4-43d2-8688-6e13c8318c4b	tienda/ye7alhprtgqhhr2b7g0e.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693253256/tienda/ye7alhprtgqhhr2b7g0e.png	d3578bed-d526-4687-868d-d77970fb8c12	2023-08-28 20:07:36.602	2023-08-28 20:07:36.602	main
42513dc2-795c-4a03-b651-45f748d90a8d	tienda/r0ck9qvjdzebewjc1of9.png	https://res.cloudinary.com/dp3chcqsm/image/upload/v1693253598/tienda/r0ck9qvjdzebewjc1of9.png	0bdf37b6-3433-4080-9101-a196d48eeecb	2023-08-28 20:13:19.009	2023-08-28 20:13:19.009	main
\.


--
-- Data for Name: OrdenDePedido; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedido" (id, fecha, "userId", "direccionEntrega", "ciudadEnt", "departamentoEnt", "metodoPago", estado, "fechaDespacho", "updatedAt", notes, valor, "Procesado", "codMunicipio", "codVendedor") FROM stdin;
64	2023-08-22 20:48:43.034	6	Manzana Envigado # 55-12	Córdoba	Bolívar	\N	\N	\N	2023-08-22 20:48:43.034		525551.73115	f	13.212	17
66	2023-08-25 14:49:34.763	3	Avenida 23 # 20-42	Anza	Antioquia	\N	\N	\N	2023-08-25 14:49:34.763	Barrio Alto, Cerca al río	3218.77864	f	5.044	17
68	2023-08-25 17:14:21.436	3	Transversal 21 # 23-32	Miriti Paraná	Amazonas	\N	\N	\N	2023-08-25 17:14:21.436	qee	304.00216	f	91.46	17
70	2023-08-28 22:01:21.921	6	Manzana 66 # 45-23	Piojó	Atlántico	\N	\N	\N	2023-08-28 22:01:21.921		625406.5600685001	f	8.549	17
32	2023-07-11 04:09:28.556	3	Diagonal 23 # 5-3	Andes	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Notas	26.4	t	\N	17
33	2023-07-11 18:37:05.382	3	Avenida 30c # 42-13	Andes	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Nada	489143.8640000001	t	\N	17
34	2023-07-11 18:56:49.994	3	Diagonal 14 # 33-21	Medellín	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Plaza de la aduana, cuarto piso	28160	t	\N	17
35	2023-07-11 19:42:47.053	6	Diagonal 34 # 17-55	Barbosa	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Unidad 104	4202218.02	t	\N	17
36	2023-07-17 12:56:32.642	3	Carrera 23 # 12-32	Bello	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Barrio Aures	1467193.728	t	\N	17
37	2023-07-18 12:47:08.406	3	Via 40 # 12-37	Malambo	Atlántico	\N	\N	\N	2023-07-24 19:07:49.41	Piso Noveno	977776.8	t	\N	17
38	2023-07-18 15:45:57.351	3	Circunvalar 12 # 8-35	Montería	Córdoba	\N	\N	\N	2023-07-24 19:07:49.41	En el muelle del malecon	2288	t	\N	17
49	2023-07-24 18:40:50.647	6	Avenida 56 # 66-69	Marulanda	Caldas	\N	\N	\N	2023-07-24 19:07:49.41		525279.1435	t	\N	\N
15	2023-06-27 22:01:56.297	3	Carrera 12 # 3-14	Arboletes	Antioquia	\N	\N	\N	2023-07-24 19:22:26.676	Playa el arenal	880	t	\N	17
16	2023-06-27 22:36:07.22	3	Diagonal 12 # 14-33	Angelópolis	Antioquia	\N	\N	\N	2023-07-24 19:22:38.614	Alcaldia	880	t	\N	17
17	2023-06-27 22:41:14.507	3	Carrera 3 # 17-12	Cantagallo	Bolívar	\N	\N	\N	2023-07-24 19:22:38.614	Calle arriba	880	t	\N	17
18	2023-06-29 22:47:58.759	3	Diagonal 5 # 33-72	Cantagallo	Bolívar	\N	\N	\N	2023-07-24 19:23:32.768	Jdjdjd	8360	t	\N	17
19	2023-06-30 19:17:10.724	3	Manzana Envigado # 52-15	Medellín	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768	barrio manzanarez	36520	t	\N	17
20	2023-07-01 00:45:56.67	3	Manzana 56 # 67-67	Cantagallo	Bolívar	\N	\N	\N	2023-07-24 19:23:32.768	Hdjdjdj	5280	t	\N	17
21	2023-07-03 15:41:22.595	3	Carrera 23 # 323-23	Leticia	Amazonas	\N	\N	\N	2023-07-24 19:23:32.768	ete	35.2	t	\N	17
22	2023-07-03 17:47:48.312	3	Manzana 45 # -	Anorí	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768	Hdjejrj	13.2	t	\N	17
23	2023-07-04 14:20:05	3	Diagonal 43 # 55-17	Itagui	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768	unidad maranduaa	21120	t	\N	17
24	2023-07-04 14:34:50.986	3	Circunvalar 55 # 13-	Busbanzá	Boyacá	\N	\N	\N	2023-07-24 19:23:32.768		18480	t	\N	17
25	2023-07-04 15:17:06.557	3	Diagonal 88 # 12-33	San Andrés	Archipiélago de San Andrés, Providencia y Santa Catalina	\N	\N	\N	2023-07-24 19:23:32.768		908.16	t	\N	17
26	2023-07-04 16:18:08.665	3	Calle 52D # 57a-40	Bello	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768	Barrio Rosalpi	34.32	t	\N	17
27	2023-07-06 12:32:55.009	3	Diagonal 24 # 13-23	Amalfi	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768	Barrio el costal	17.6	t	\N	17
28	2023-07-07 18:52:12.972	7	Calle 12 # 12-1	Itagui	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768		38.52	t	\N	17
29	2023-07-07 18:54:56.971	7	Diagonal 12 # 12-12	Andes	Antioquia	\N	\N	\N	2023-07-24 19:23:32.768		9630	t	\N	17
30	2023-07-10 14:04:56.652	6	Transversal 345 # 34-65	Providencia	Archipiélago de San Andrés, Providencia y Santa Catalina	\N	\N	\N	2023-07-24 19:23:32.768	nd	2569.869	t	\N	17
31	2023-07-10 23:13:06.146	6	Manzana 12 # 21-2	Montería	Córdoba	\N	\N	\N	2023-07-24 19:23:32.768	123123	1555347.5	t	\N	17
39	2023-07-19 16:22:51.603	3	Circunvalar 13 # 123-ewr	Barbosa	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Morro Alto, Vereda	286	t	\N	17
40	2023-07-19 17:09:59.232	3	Manzana 23 # 32-43	Argelia	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Este es una prueba	488888.4	t	\N	17
41	2023-07-20 20:07:32.84	3	Carrera 12 # 32-32	Bello	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Edificio Mirador de Altavista, Piso cuarto apto 402	1467972.792	t	\N	17
42	2023-07-20 20:16:18.852	3	Carrera 52d # 57a-40	Bello	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Edificio mirador de Altavista 	1467453.592	t	\N	17
43	2023-07-20 20:46:13.393	4	Carrera 36 # 44-66	Bello	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Bodega 102 - dejar en portería	510.1899999999999	t	\N	17
44	2023-07-21 00:55:25.051	3	Carrera 23 # 46-	Amagá	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Cvjn	32270239.144	t	\N	17
45	2023-07-22 00:47:29.861	3	Manzana 55 # 67-77	Génova	Quindío	\N	\N	\N	2023-07-24 19:07:49.41	Para Sandra	1955729.6	t	\N	17
46	2023-07-22 05:30:02.395	3	Carrera 12 # 12-12	Bello	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41	Tengo sueño	488888.4	t	\N	17
47	2023-07-23 16:29:19.719	3	Circunvalar 12 # 33-20	Barranquilla	Atlántico	\N	\N	\N	2023-07-24 19:07:49.41	Barrio la alhambra	978067.2	t	8.001	17
48	2023-07-24 18:05:29.862	6	Avenida 33 # 55-13	Anorí	Antioquia	\N	\N	\N	2023-07-24 19:07:49.41		276.36965	t	\N	17
50	2023-07-24 19:03:32.726	3	Carrera 80 # 30-22	Medellín	Antioquia	\N	\N	\N	2023-07-25 15:06:17.331	Sector Belen Rosales	524.128	t	5.001	17
62	2023-08-14 21:40:59.726	6	Diagonal 43 # 28-41	Itagui	Antioquia	\N	\N	\N	2023-08-15 13:06:20.301	bodega 104	2144.394	t	5.36	17
63	2023-08-14 22:02:32.254	6	Avenida d # d-d	Bello	Antioquia	\N	\N	\N	2023-08-16 14:32:32.958	d	274.47865	t	5.088	17
65	2023-08-23 21:32:30.173	6	Diagonal 55 # 44-13	Belmira	Antioquia	\N	\N	\N	2023-08-23 21:32:30.173		1050554.505	f	5.086	17
51	2023-07-24 20:23:45.393	3	Manzana 2 # 32-3	Cartagena	Bolívar	\N	\N	\N	2023-07-27 18:48:25.268	sdfasdf	2856.48	t	13.001	17
67	2023-08-25 16:34:30.782	3	Diagonal 12 # 12-12	Angostura	Antioquia	\N	\N	\N	2023-08-25 16:34:30.782	qw	482.7592	f	5.038	17
69	2023-08-25 20:06:01.327	6	Diagonal 55 # 14-22	Sabanagrande	Atlántico	\N	\N	\N	2023-08-25 20:06:01.327		625406.5600685001	f	8.634	17
52	2023-07-24 20:35:25.274	3	Circunvalar 4 # w-ew	Bogotá D.C.	Bogotá D.C.	\N	\N	\N	2023-08-15 13:05:33.901	ADASD	-10758354.904	t	11.001	17
53	2023-07-24 20:39:58.996	3	Via 40 # 32-32	Barranquilla	Atlántico	\N	\N	\N	2023-08-15 13:05:33.917	Via Principal	860443.584	t	8.001	17
54	2023-07-24 20:43:37.216	3	Avenida 33 # 80-14	Medellín	Antioquia	\N	\N	\N	2023-08-15 13:05:33.92	Al lado de la Rosa	977776.8	t	5.001	17
55	2023-07-25 16:49:00.218	6	Diagonal 44 # 55-13	Cravo Norte	Arauca	\N	\N	\N	2023-08-15 13:05:33.923		1051926.89825	t	81.22	17
56	2023-07-26 22:01:27.47	6	Circunvalar 56 # 22-12	Providencia	Archipiélago de San Andrés, Providencia y Santa Catalina	\N	\N	\N	2023-08-15 13:05:33.926		525277.2525000001	t	88.564	17
57	2023-07-27 18:19:05.779	3	Circunvalar 23 # 23-342	Betania	Antioquia	\N	\N	\N	2023-08-15 13:05:33.93	Apartamento 402, Edificio Altavista	1786.4	t	5.091	17
58	2023-08-09 15:19:24.829	6	Avenida 44 # 23-12	Caldas	Boyacá	\N	\N	\N	2023-08-15 13:05:33.933		1057173.005	t	15.131	17
59	2023-08-11 13:35:43.453	6	Diagonal 43 # 28-41	Itagui	Antioquia	\N	\N	\N	2023-08-15 13:05:33.936	bodega 104	27419.5	t	5.36	17
60	2023-08-14 21:20:55.728	6	Avenida 544 # 44-22	Polonuevo	Atlántico	\N	\N	\N	2023-08-15 13:05:33.944		473.03365	t	8.558	17
61	2023-08-14 21:30:00.389	6	Avenida 33 # 22-12	Hatillo de Loba	Bolívar	\N	\N	\N	2023-08-15 13:05:33.952		525551.73115	t	13.3	17
\.


--
-- Data for Name: OrdenDePedidoProducto; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."OrdenDePedidoProducto" ("ordenDePedidoId", "productoId", cantidad, precio, ccosto, category, "rootCategory") FROM stdin;
15	69827d7b-ef80-43b2-9001-b1836a6f6df1	1	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
16	69827d7b-ef80-43b2-9001-b1836a6f6df1	1	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
17	69827d7b-ef80-43b2-9001-b1836a6f6df1	1	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
18	0fd72815-6fb5-4388-a8d5-4dd41f01e539	1	1500	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
18	1e299b68-cfa3-4442-8229-6217ea32be96	1	8000	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
19	859ecb2a-5710-4431-98aa-b546f9cbb7c8	1	6000	60408	78d1c025-de60-4a70-85a6-f18fc1f70b7e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
19	c3688b74-ed68-4a70-8baa-603f31331f3e	1	0	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
19	784cdb4a-5450-47ed-86a6-112036e3771a	2	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
19	811927e4-df83-41e6-8408-6af91e5add25	3	10000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
19	272daa61-8d98-49c2-ae32-8b4d7b9fc643	1	3500	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
20	859ecb2a-5710-4431-98aa-b546f9cbb7c8	1	6000	60408	78d1c025-de60-4a70-85a6-f18fc1f70b7e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
21	3f9608cc-c7e7-434d-84ac-a1444bd84674	2	15	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
21	43f093fa-7f33-4913-a018-da1719ecdfc9	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
21	36cd21bf-a39d-4c8b-a496-112bb73f86f1	1	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
22	34fc2e7d-513b-4117-b33d-3934093dd93a	1	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
22	36cd21bf-a39d-4c8b-a496-112bb73f86f1	1	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
23	69827d7b-ef80-43b2-9001-b1836a6f6df1	2	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
23	784cdb4a-5450-47ed-86a6-112036e3771a	2	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
23	811927e4-df83-41e6-8408-6af91e5add25	2	10000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
23	c3688b74-ed68-4a70-8baa-603f31331f3e	4	0	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
24	0c2cf883-1e9c-436a-b074-0c42228845d6	1	12000	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
24	0a69319f-e801-45c6-8ae8-b43efa8452fe	1	5000	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
24	14a1b555-9a63-46c7-b437-b28f92cb58b0	1	4000	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
25	69827d7b-ef80-43b2-9001-b1836a6f6df1	1	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
25	08aa63f9-0001-4304-9707-f2312f46b8ea	3	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
25	080c38e2-393f-4569-8336-fd9bac065573	1	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
26	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	4	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
26	34fc2e7d-513b-4117-b33d-3934093dd93a	1	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
26	3f9608cc-c7e7-434d-84ac-a1444bd84674	2	15	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
27	7b96a010-c5a4-45df-b9b6-e218a3202b88	2	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
28	08aa63f9-0001-4304-9707-f2312f46b8ea	4	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
29	811927e4-df83-41e6-8408-6af91e5add25	1	10000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
30	080c38e2-393f-4569-8336-fd9bac065573	2	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
30	13d004fb-a626-43d0-8ddc-81bff70a5567	1	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
30	09ff2a2a-b59c-489b-88e8-f9be47f48b31	1	200	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
30	072f17b7-b36c-489e-988d-8adfac32ebfb	1	2500	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
30	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	4	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
31	71ca3df3-6467-4960-8be8-28fc0db5e748	7	235000	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
32	92ad74e4-3aea-4ce1-994c-20cfcc0b3016	1	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
32	a18c67b9-302c-4f7a-8167-25bc88763cf7	2	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
33	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
33	08aa63f9-0001-4304-9707-f2312f46b8ea	1	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
34	811927e4-df83-41e6-8408-6af91e5add25	2	10000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
34	5622da38-3729-4d21-b589-19f6f6e930a4	2	6000	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
35	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	8	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
36	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	3	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
36	08aa63f9-0001-4304-9707-f2312f46b8ea	2	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
36	36cd21bf-a39d-4c8b-a496-112bb73f86f1	2	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
36	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
37	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
38	09ff2a2a-b59c-489b-88e8-f9be47f48b31	1	200	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
38	19e10d98-4dc5-463a-9010-8825070609fa	1	2000	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
38	227bb4ed-2ebd-4085-81ee-c60fe445553b	1	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
38	da82268e-96ce-4230-a558-d14fc9ebbf13	3	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	a18c67b9-302c-4f7a-8167-25bc88763cf7	1	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	a708a0cd-4236-465c-91ab-394afb375bc5	2	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	b5abaf7f-adc4-4d50-a760-05f7b0622bd7	1	100	60408	e5872bae-4418-423c-bdf8-b58fb0cf6b77	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	a101363f-98c6-469b-b7ca-a56366e99cc5	3	12	60408	e5872bae-4418-423c-bdf8-b58fb0cf6b77	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	b4761d8f-2ffa-472e-b597-5e666d66e0a6	4	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	f33e77e7-a9d6-463b-8919-178df2e4e3ba	1	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	83b1208d-0c83-448d-b87c-2d27da9b331d	19	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	93ff20f1-e008-4efc-ab71-e98da94cdfd2	1	6	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	9406d229-8e04-4f26-82c9-4756b4e39294	7	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	9bd2368c-f6a4-432e-a90e-65ee33900e07	2	3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	97da7731-f76e-42c0-b0fb-7e5d9cbcfc4c	2	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	839025a4-88cc-4468-8141-c1e78cd3fdcf	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	8e0a31ea-fe50-4173-bde5-d4011ec07687	1	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	8d60ded1-1c06-42d5-a609-40ffcd4d4bfa	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	1	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	7b96a010-c5a4-45df-b9b6-e218a3202b88	1	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	7bcdc197-2923-400c-9e95-e2a0f6e3e147	1	0	60408	e5872bae-4418-423c-bdf8-b58fb0cf6b77	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	70e15217-ab8e-400a-a63b-70c0f4d30249	1	50	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	6ba4cc00-0405-4904-a4a7-cdbb57eeaa08	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	4f4dd321-83cc-458a-81e0-81feedc2c5d8	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	4b98c3fc-4a7c-4fb6-a3f1-2d4520b4218d	1	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	3f9608cc-c7e7-434d-84ac-a1444bd84674	1	15	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	43f093fa-7f33-4913-a018-da1719ecdfc9	1	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
39	44b97127-9687-4310-b936-b48e36b8388f	1	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
40	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
41	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	3	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
41	bd9286d8-7a25-47a3-bec1-729a1792b063	5	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
41	08aa63f9-0001-4304-9707-f2312f46b8ea	3	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
41	b4761d8f-2ffa-472e-b597-5e666d66e0a6	3	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
41	b5abaf7f-adc4-4d50-a760-05f7b0622bd7	1	100	60408	e5872bae-4418-423c-bdf8-b58fb0cf6b77	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
42	3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	2	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
42	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	3	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
42	08aa63f9-0001-4304-9707-f2312f46b8ea	3	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
42	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	2	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
42	debb43ae-3e59-4587-8169-99150434fede	1	5	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
43	674fc149-afa4-4462-ba4d-7683b0c765e1	3	200	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
43	08aa63f9-0001-4304-9707-f2312f46b8ea	2	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
43	080c38e2-393f-4569-8336-fd9bac065573	1	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
43	3995e461-7fcc-4292-9e54-5f5b7dc12acc	2	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	66	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	08aa63f9-0001-4304-9707-f2312f46b8ea	1	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	09ff2a2a-b59c-489b-88e8-f9be47f48b31	1	200	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	674fc149-afa4-4462-ba4d-7683b0c765e1	3	200	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	69827d7b-ef80-43b2-9001-b1836a6f6df1	3	1000	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	6a258fcc-dad5-4214-92e3-24cfbbe473b5	1	0	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	6a42c3cd-5421-45c2-8261-789255786ac6	1	0	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
44	080c38e2-393f-4569-8336-fd9bac065573	3	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
45	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	4	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
45	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	4	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
45	da82268e-96ce-4230-a558-d14fc9ebbf13	2	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
46	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	aeefe8a9-07ef-4add-9ae0-fc92b9c177ea	1	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	b4761d8f-2ffa-472e-b597-5e666d66e0a6	2	5	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	bd9286d8-7a25-47a3-bec1-729a1792b063	2	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	8d60ded1-1c06-42d5-a609-40ffcd4d4bfa	2	0	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
47	92c139a2-d244-486f-8320-c534f73399eb	2	10	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
48	08aa63f9-0001-4304-9707-f2312f46b8ea	1	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
48	080c38e2-393f-4569-8336-fd9bac065573	1	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
49	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	555555	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
49	080c38e2-393f-4569-8336-fd9bac065573	1	2	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
50	08aa63f9-0001-4304-9707-f2312f46b8ea	2	290.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
50	3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	1	10	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
50	291b5eac-5b1d-496b-8260-d0a085cc6167	1	5	60408	5d81e12c-846f-435c-9d10-147f67862852	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
51	187f2a25-b579-43e4-b3df-71b6e8da67d3	1	134	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
51	227bb4ed-2ebd-4085-81ee-c60fe445553b	1	100	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
51	817bfb09-8fe1-45a3-9810-efeebe574f49	1	12	60408	f8d5654d-b981-498b-adf8-d05e718bdec4	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
51	8a875eef-f92b-4a38-939f-1df3d5949386	1	3000	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
52	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	-6111105	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
52	08aa63f9-0001-4304-9707-f2312f46b8ea	1	-3193.3	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
53	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	488888.4	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
54	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	488888.4	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
55	08aa63f9-0001-4304-9707-f2312f46b8ea	5	274.47865	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
55	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
56	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
57	18c84c5e-8e87-412d-a57e-3cc4ecc2c72a	1	26.4	60408	ebf8bc4a-6c95-4cc4-951a-650c31ff76ea	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
57	9d8c66a7-c358-46d7-b95d-84256445e0a6	1	0	60408	ebf8bc4a-6c95-4cc4-951a-650c31ff76ea	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
57	f2f86739-bb89-493e-9707-8510f5ba4bc2	1	1760	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
58	55050e9c-5b58-4ce5-873d-ca77388bf4ea	1	6618.5	60408	c0d01dab-9929-4e05-a474-b31c29a5f239	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
58	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
59	811927e4-df83-41e6-8408-6af91e5add25	2	9455	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
59	69827d7b-ef80-43b2-9001-b1836a6f6df1	1	945.5	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
59	ea20bd56-a792-4287-9f97-f09538450dcf	1	7564	60408	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
60	09ff2a2a-b59c-489b-88e8-f9be47f48b31	1	189.1	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
60	13d004fb-a626-43d0-8ddc-81bff70a5567	1	9.455	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
60	08aa63f9-0001-4304-9707-f2312f46b8ea	1	274.47865	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
61	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
61	08aa63f9-0001-4304-9707-f2312f46b8ea	1	274.47865	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
62	187f2a25-b579-43e4-b3df-71b6e8da67d3	2	126.697	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
62	19e10d98-4dc5-463a-9010-8825070609fa	1	1891	60408	3a049adb-2967-4247-a7d3-79c98b83a70e	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
63	08aa63f9-0001-4304-9707-f2312f46b8ea	1	274.47865	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
64	08aa63f9-0001-4304-9707-f2312f46b8ea	1	274.47865	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
64	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
65	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2	525277.2525000001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
66	4e97b052-21f5-45c7-b1d6-87200c060c91	1	482.7592	60113	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	b179eb91-0cd4-43ef-a16e-b73e67ddcb86
66	08aa63f9-0001-4304-9707-f2312f46b8ea	9	304.00216	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
67	4e97b052-21f5-45c7-b1d6-87200c060c91	1	482.7592	60113	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	b179eb91-0cd4-43ef-a16e-b73e67ddcb86
68	08aa63f9-0001-4304-9707-f2312f46b8ea	1	304.00216	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
69	08aa63f9-0001-4304-9707-f2312f46b8ea	1	326.6295935	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
69	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	625079.9304750001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
70	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	1	625079.9304750001	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
70	08aa63f9-0001-4304-9707-f2312f46b8ea	1	326.6295935	60408	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	d1eefb93-05f4-45f0-b72b-47ad6a256c0b
\.


--
-- Data for Name: Price; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Price" (id, price1, price2, price3, price4, price5, price6, "productId", "createdAt", "updatedAt") FROM stdin;
4465c3a0-b0a4-4625-a5b1-a3687a7ed554	10000	0	0	\N	\N	\N	8bcde4cd-7c31-424e-b961-0307a4764c51	2023-06-28 23:29:26.977	2023-06-28 23:29:26.977
893bf5ea-c3cd-442c-8715-cd2360687edf	6500	0	0	\N	\N	\N	d298936c-301c-4be4-94c4-b7b926d23399	2023-06-28 23:32:54.412	2023-06-28 23:32:54.412
32c5b6d8-fb05-443f-afeb-fa16be022cc4	5500	0	0	\N	\N	\N	3ce1743a-a1d6-4ea5-a433-8bded16fcef9	2023-06-29 00:17:22.599	2023-06-29 00:17:22.599
4c21ca38-166c-46ca-9c2a-f35201f1b2d4	0	0	0	\N	\N	\N	5ed353b4-7e13-4685-b44a-59610b208800	2023-07-01 15:25:44.516	2023-07-01 15:25:44.516
aa21591c-739f-46d0-aa21-8103cc20c92f	0	0	0	\N	\N	\N	6ccf3a1b-376e-479d-aa4d-fafed00ae8c3	2023-07-01 15:35:01.932	2023-07-01 15:35:01.932
d50580e6-e2fc-4705-b15a-71af9f6e7cf0	2000	0	0	\N	\N	\N	19e10d98-4dc5-463a-9010-8825070609fa	2023-07-01 17:17:32.02	2023-07-01 17:17:32.02
cc0631e9-93f7-45d2-9e41-a87bb9d54570	12000	0	0	\N	\N	\N	0c2cf883-1e9c-436a-b074-0c42228845d6	2023-07-01 17:25:30.658	2023-07-01 17:25:30.658
79bbe512-0f4c-4d02-a53d-995da930ca2e	500	0	0	\N	\N	\N	904f23f4-f717-4c4f-9b8d-4cdc7232002a	2023-07-01 17:48:46.529	2023-07-01 17:48:46.529
581feac6-a9a1-4738-b4bb-576bb9b0e34d	15	0	0	\N	\N	\N	377650de-d351-4048-aa6d-151e0fc69970	2023-07-01 18:34:45.342	2023-07-01 18:34:45.342
50b368b8-e7f8-4cb5-93f7-e3a5042c233a	144	0	0	\N	\N	\N	f032c2e9-cb61-410a-8087-851e27f1be69	2023-07-01 15:42:05.149	2023-08-28 20:53:26.348
ecf293ea-026f-4f3a-8c8c-524ce875f078	183.93	0	0	\N	\N	\N	5c4c1796-ab62-409d-8d15-21c5818306d0	2023-07-01 15:38:39.004	2023-08-28 20:53:26.37
141129e5-8ec0-497d-8d9a-cd9182b77013	1860.55	0	0	\N	\N	\N	272daa61-8d98-49c2-ae32-8b4d7b9fc643	2023-06-28 23:45:48.6	2023-08-28 20:53:26.375
eaf45bcc-56ea-489a-a465-7f8e609a6346	87.64	0	0	\N	\N	\N	d8ec9521-2f54-4658-818b-50e68f0d52a1	2023-07-01 18:36:15.215	2023-08-28 20:53:26.395
31875e6a-7b4a-4aba-bdfe-3249f6066555	270.55	0	0	\N	\N	\N	9e0e36b2-e0ad-4ae0-8bd9-477225c4be1e	2023-06-28 23:22:06.152	2023-08-28 20:53:26.5
2f838c90-e319-4970-9d1c-e7a49f68d9bc	3.71	0	0	\N	\N	\N	187f2a25-b579-43e4-b3df-71b6e8da67d3	2023-07-01 17:45:17.629	2023-08-28 20:53:26.539
be82560d-f1e4-407b-9c4a-15f900bc3360	3.71	0	0	\N	\N	\N	09ff2a2a-b59c-489b-88e8-f9be47f48b31	2023-07-01 17:40:22.224	2023-08-28 20:53:26.582
92cf04be-e254-4a01-bba5-748c08cfe40c	31.42	0	0	\N	\N	\N	c3688b74-ed68-4a70-8baa-603f31331f3e	2023-06-28 13:25:59.869	2023-08-28 20:53:26.603
1d9e5c00-6132-4c9a-94bf-a9d01431e59a	84.44	0	0	\N	\N	\N	da82268e-96ce-4230-a558-d14fc9ebbf13	2023-07-01 18:39:55.438	2023-08-28 20:53:26.609
afb3312d-2692-46de-8c2c-63fffc9fc53c	499.55	0	0	\N	\N	\N	ea20bd56-a792-4287-9f97-f09538450dcf	2023-06-28 22:59:48.146	2023-08-28 20:53:26.618
2dbe0d77-cc4c-4cb2-8b42-6b3bc77643c7	1071.49	0	0	\N	\N	\N	c53c79a0-be7e-42f1-8996-bb2df1a08219	2023-07-01 17:56:54.242	2023-08-28 20:53:26.623
fab53e4c-6fce-4eaa-821b-78575140a7d4	450.98	0	0	\N	\N	\N	f597fe05-f745-4137-a870-d9f0ddf9f0ca	2023-07-01 15:21:01.257	2023-08-28 20:53:26.645
e288c1c6-621b-4f71-b2ac-ebe052ad0970	48.44	0	0	\N	\N	\N	f0bf85fc-5f84-4108-bed3-8a70046f6187	2023-07-01 18:46:52.773	2023-08-28 20:53:26.651
2b0eaa2d-c865-4680-958b-7525b392c4ed	3027.93	0	0	\N	\N	\N	1e299b68-cfa3-4442-8229-6217ea32be96	2023-06-28 13:43:12.91	2023-08-28 20:53:26.657
752102f5-b8ca-4581-84b2-aecaad52d5c3	560.07	0	0	\N	\N	\N	8a875eef-f92b-4a38-939f-1df3d5949386	2023-06-28 23:19:40.233	2023-08-28 20:53:26.699
be4e901a-6f64-41da-bfdf-50028a47c806	259.42	0	0	\N	\N	\N	cf201e2d-4361-49f3-8d71-83a39e4a684f	2023-07-01 15:32:12.328	2023-08-28 20:53:26.705
f4c51036-3ec3-432f-8f8d-e48e9848020c	1158.55	0	0	\N	\N	\N	d0c0689d-1bfd-488b-b8ac-79c6ba186d28	2023-06-28 23:39:29.452	2023-08-28 20:53:26.717
868dab56-4972-4911-89cc-9857b1e09b16	2862.76	0	0	\N	\N	\N	0fd72815-6fb5-4388-a8d5-4dd41f01e539	2023-06-29 00:12:52.74	2023-08-28 20:53:26.736
88711389-9ab1-484c-8eed-3913ccc96253	307.77	0	0	\N	\N	\N	811927e4-df83-41e6-8408-6af91e5add25	2023-06-28 13:15:27.744	2023-08-28 20:53:26.768
341c9ab2-ac3b-4a18-bb30-dd6c0af2381c	1158.55	0	0	\N	\N	\N	f2f86739-bb89-493e-9707-8510f5ba4bc2	2023-06-28 23:36:51.859	2023-08-28 20:53:26.773
fa4a3dc1-5021-4f0d-aa06-753f80042f09	1860.55	0	0	\N	\N	\N	55050e9c-5b58-4ce5-873d-ca77388bf4ea	2023-06-28 23:42:54.464	2023-08-28 20:53:25.791
031d01c5-3606-4855-a4b3-8efc061c38db	80.21	0	0	\N	\N	\N	926eae18-e7ae-497e-b22a-f23054492084	2023-07-01 18:19:00.285	2023-08-28 20:53:25.909
d8dbdeb8-376b-47a1-801f-f51de2028f4d	442.11	0	0	\N	\N	\N	652b6edc-33b1-4105-b315-adf852c31973	2023-07-01 17:37:47.775	2023-08-28 20:53:25.922
9ff13334-f41a-4d2e-b85f-c9df04543980	547.64	0	0	\N	\N	\N	5622da38-3729-4d21-b589-19f6f6e930a4	2023-06-28 23:05:41.025	2023-08-28 20:53:25.928
647afeff-8f54-4d6a-8e9f-bef6a2ab6aa9	1529.89	0	0	\N	\N	\N	859ecb2a-5710-4431-98aa-b546f9cbb7c8	2023-06-28 22:55:52.235	2023-08-28 20:53:25.978
744d446c-d11e-4e36-90e2-7bb86e29f1e9	6244.36	0	0	\N	\N	\N	0a69319f-e801-45c6-8ae8-b43efa8452fe	2023-07-01 15:15:08.38	2023-08-28 20:53:26.011
8258f519-24f2-4996-922e-e8a53cc44d38	34.91	0	0	\N	\N	\N	69827d7b-ef80-43b2-9001-b1836a6f6df1	2023-06-27 14:30:32.648	2023-08-28 20:53:26.036
d4a00c4f-e10f-48c7-8d1d-fef22dad9ff0	43.42	0	0	\N	\N	\N	784cdb4a-5450-47ed-86a6-112036e3771a	2023-06-28 13:23:46.805	2023-08-28 20:53:26.041
1990d2f2-ccce-4369-93ce-00f17483006f	141.71	0	0	\N	\N	\N	eecf1032-3b32-4a12-b03f-2d0c160fa6ca	2023-07-01 18:19:50.506	2023-08-28 20:53:26.045
85c4486c-6feb-4582-a72a-71ad2f195ff4	85.09	0	0	\N	\N	\N	9791f231-65a5-48b3-921f-bec9cddd046c	2023-07-01 18:27:58.602	2023-08-28 20:53:26.106
31fe6e33-4617-4efc-9631-01b73675d43d	345.82	0	0	\N	\N	\N	14a1b555-9a63-46c7-b437-b28f92cb58b0	2023-07-01 17:42:33.055	2023-08-28 20:53:26.15
66b9f83e-6f32-4e45-b899-775b0ad6e894	123.38	0	0	\N	\N	\N	9350dff9-0874-4ccb-b8f6-4c5f76cf76d8	2023-07-01 18:37:56.664	2023-08-28 20:53:26.191
ebdac6d9-7f81-43db-a9dd-820c666d7de3	60.87	0	0	\N	\N	\N	817bfb09-8fe1-45a3-9810-efeebe574f49	2023-07-01 18:11:56.744	2023-08-28 20:53:26.22
bc1c0dda-25be-4049-b36d-719d449a1939	248.8	0	0	\N	\N	\N	227bb4ed-2ebd-4085-81ee-c60fe445553b	2023-07-01 18:23:14.83	2023-08-28 20:53:26.225
54c1357f-d77b-4178-b449-e3b7fd3638a5	53.67	0	0	\N	\N	\N	47e21bdb-442b-4964-885e-54a34ac998b8	2023-07-01 18:04:06.354	2023-08-28 20:53:26.23
9ae9e6c9-b137-40bc-adfa-46059af7183c	182.18	0	0	\N	\N	\N	99932e44-58a8-4033-a473-03e0b2658654	2023-07-01 18:30:23.876	2023-08-28 20:53:26.285
431d0b78-7b37-4d4e-ac5b-7096ce53d5a5	125.83	0	0	\N	\N	\N	33e19cea-619a-490e-ab8a-71ef1be53abc	2023-07-01 17:14:20.865	2023-08-28 20:53:26.305
4a02b741-a9b6-4a45-a792-196f001e6a5d	3865.31	0	0	\N	\N	\N	48c2bc88-3aa9-4c57-b99f-c8f5beeeeabc	2023-07-01 17:53:11.587	2023-08-28 20:53:26.309
9a79d98d-d29f-4b3f-8a06-c11156d3c2b9	51.98	0	0	\N	\N	\N	50086adc-f8ba-40cf-a792-73c61960265e	2023-07-01 18:14:44.332	2023-08-28 20:53:26.315
1f7d76b1-6f0c-45f9-9414-563bc59507ed	255.93	0	0	\N	\N	\N	ef24cfa3-e34d-4979-b1fb-324224d176b5	2023-07-01 18:31:49.268	2023-08-28 20:53:26.32
835dbd35-558b-4aab-8508-fee7fcc6688f	2691.05	0	0	\N	\N	\N	8519678a-cf0c-4c8f-8ca5-cc91b2d78127	2023-06-28 23:49:38.425	2023-08-28 20:53:26.324
7f18210b-387c-494f-a69a-16c91fe33f5f	0	0	0	\N	\N	\N	6a42c3cd-5421-45c2-8261-789255786ac6	2023-07-01 19:02:39.043	2023-07-01 19:02:39.043
e267561c-14a5-4dec-9059-8281c51dff64	0	0	0	\N	\N	\N	822dba01-ad64-421a-8724-79b2f4203999	2023-07-01 19:07:22.344	2023-07-01 19:07:22.344
c7e43656-a7ae-468d-83f5-0546f418a972	0	0	0	\N	\N	\N	5a24bcad-92e0-441c-997c-8c63aa127988	2023-07-01 19:38:49.622	2023-07-01 19:38:49.622
73e485f8-67cc-410c-b390-32398c7c370a	100	0	0	\N	\N	\N	850240e0-c07e-4cc6-8f63-886c29c6059e	2023-07-01 19:41:56.718	2023-07-01 19:41:56.718
8ae2e342-05a5-40b6-b209-5e50cb0b7265	55	0	0	\N	\N	\N	3cccb670-2e9b-4918-ab73-042af0e4518d	2023-07-01 19:45:05.772	2023-07-01 19:45:05.772
45796382-bc9c-4da4-b99f-ca88064656b9	0	0	0	\N	\N	\N	6a258fcc-dad5-4214-92e3-24cfbbe473b5	2023-07-01 19:57:30.273	2023-07-01 19:57:30.273
0d6b8c9f-6d1f-4c2f-ae44-1bf70bc3c32e	0	0	0	\N	\N	\N	24ed9e25-8434-4d07-b441-5116b2597826	2023-07-01 20:01:52.511	2023-07-01 20:01:52.511
0911dd89-e210-4865-9b09-f05c18ba2104	0	0	0	\N	\N	\N	83b1208d-0c83-448d-b87c-2d27da9b331d	2023-07-03 15:21:30.618	2023-07-03 15:21:30.618
4f0bfb03-8d57-4e7d-8bd7-4efab591ced9	33	0	0	\N	\N	\N	59762fdb-46bb-4706-83ef-9c630c6c75d4	2023-07-03 15:31:12.526	2023-07-03 15:31:12.526
58683dde-55ae-4077-b20c-3aabbe00ab4c	5	0	0	\N	\N	\N	b4761d8f-2ffa-472e-b597-5e666d66e0a6	2023-07-03 15:35:28.802	2023-07-03 15:35:28.802
82b3c461-61ef-480b-b3a4-0045ecb0f071	50	0	0	\N	\N	\N	70e15217-ab8e-400a-a63b-70c0f4d30249	2023-07-03 15:36:20.634	2023-07-03 15:36:20.634
a9d4eaf5-a752-45ac-a198-dfe3d97c4336	5	0	0	\N	\N	\N	34fc2e7d-513b-4117-b33d-3934093dd93a	2023-07-03 15:45:48.605	2023-07-03 15:45:48.605
cd42fc87-2528-4b6a-a066-06a117cd8a79	0	0	0	\N	\N	\N	839025a4-88cc-4468-8141-c1e78cd3fdcf	2023-07-03 15:59:33.521	2023-07-03 15:59:33.521
f84f39d1-b0ce-4ad8-be94-3d1e24436e41	10	0	0	\N	\N	\N	a708a0cd-4236-465c-91ab-394afb375bc5	2023-07-03 16:23:47.003	2023-07-03 16:23:47.003
02836308-71d2-4a58-a774-86315e5586d6	438.55	0	0	\N	\N	\N	4c372554-449d-4666-b15f-a26a839332a9	2023-07-01 18:59:32.665	2023-08-28 20:53:26.244
b335dbad-e8db-4815-a41e-0523250ef1cb	12.82	0	0	\N	\N	\N	e4937bdc-c9d3-4424-a95a-481a5fb65464	2023-07-03 14:19:37.24	2023-08-28 20:53:26.525
f5a51628-7525-478b-8ad3-08b0d2865fe1	229.75	0	0	\N	\N	\N	4b98c3fc-4a7c-4fb6-a3f1-2d4520b4218d	2023-07-03 15:02:17.996	2023-08-28 20:53:26.663
3dcc359c-563a-49d0-9e26-15895424fd8c	247.85	0	0	\N	\N	\N	3f9608cc-c7e7-434d-84ac-a1444bd84674	2023-07-03 14:58:08.038	2023-08-28 20:53:26.381
dff1f69a-bea8-4ebe-b58a-6e8651d47f0c	318.55	0	0	\N	\N	\N	37016c30-4403-4a7e-93e7-7937aec8e878	2023-07-01 19:54:47.076	2023-08-28 20:53:25.813
03637048-26e6-49d9-afd8-487e1f9cc861	63.49	0	0	\N	\N	\N	475ff4dd-1665-4668-822a-cb64edc12515	2023-07-01 18:52:39.118	2023-08-28 20:53:26.07
d4f97799-ab03-4a53-b2ff-8f1074ceabfb	152.29	0	0	\N	\N	\N	b559315a-b66d-4781-b74f-c9cdd098848e	2023-07-03 16:11:03.256	2023-08-28 20:53:26.558
44a93311-b6ce-41ce-b6c9-962888c00785	318.55	0	0	\N	\N	\N	674fc149-afa4-4462-ba4d-7683b0c765e1	2023-07-01 19:34:51.193	2023-08-28 20:53:26.267
fb90d122-3bc3-480d-99a4-79066451dded	931.64	0	0	\N	\N	\N	4c580310-fa0e-4e2a-a56e-948e18c72fc8	2023-07-03 14:06:18.076	2023-08-28 20:53:26.177
539849e7-3a63-43a8-9ef6-8d6b76304ef1	113.67	0	0	\N	\N	\N	9406d229-8e04-4f26-82c9-4756b4e39294	2023-07-03 15:10:38.665	2023-08-28 20:53:26.723
aa69cefd-6bac-4fc4-81ab-1645325ef7e6	122.4	0	0	\N	\N	\N	bd9286d8-7a25-47a3-bec1-729a1792b063	2023-07-01 18:50:43.781	2023-08-28 20:53:26.42
c5504c45-271a-4ab1-aa34-d267c4f92b57	49.09	0	0	\N	\N	\N	debb43ae-3e59-4587-8169-99150434fede	2023-07-01 18:51:49.628	2023-08-28 20:53:26.492
14bfe3eb-efdd-43e7-8782-9528a01fb498	167.78	0	0	\N	\N	\N	92c139a2-d244-486f-8320-c534f73399eb	2023-07-03 16:09:05.396	2023-08-28 20:53:26.52
23b1f602-44b7-4369-8a5b-89a18ddd6281	227.56	0	0	\N	\N	\N	4f4dd321-83cc-458a-81e0-81feedc2c5d8	2023-07-03 14:59:08.181	2023-08-28 20:53:26.566
972e4b6e-3488-4547-ab86-2807cbc5ff24	373.09	0	0	\N	\N	\N	aeefe8a9-07ef-4add-9ae0-fc92b9c177ea	2023-07-01 18:56:45.228	2023-08-28 20:53:26.589
877d03f5-fe89-42bc-9643-dbf74e6f9d38	1087.2	0	0	\N	\N	\N	ef1da8d2-e0d5-483d-981b-94e7e4a69465	2023-07-03 14:16:56.805	2023-08-28 20:53:26.669
a0f3d4b6-3645-4525-8528-b12c0281c0c7	94.25	0	0	\N	\N	\N	13d004fb-a626-43d0-8ddc-81bff70a5567	2023-07-03 16:01:12.947	2023-08-28 20:53:26.694
746ed1ae-95e2-43d9-b953-2534cd1e9a81	122.4	0	0	\N	\N	\N	36cd21bf-a39d-4c8b-a496-112bb73f86f1	2023-07-03 15:08:39.068	2023-08-28 20:53:26.712
7ad354b3-d252-413f-9a10-4b6240ff0199	39.27	0	0	\N	\N	\N	168d0fd5-814f-4f1d-806f-04dc918c2b22	2023-07-03 16:22:22.047	2023-08-28 20:53:26.743
551c159d-3f9e-4959-8b78-be053f42c2c4	128.51	0	0	\N	\N	\N	93ff20f1-e008-4efc-ab71-e98da94cdfd2	2023-07-03 15:45:03.426	2023-08-28 20:53:26.782
3a543671-6b7c-423c-b962-34d6f6bc1560	64.8	0	0	\N	\N	\N	9bd2368c-f6a4-432e-a90e-65ee33900e07	2023-07-03 15:47:41.972	2023-08-28 20:53:25.857
d4117e77-9c19-4465-a9e6-06a05dd7779f	933.16	0	0	\N	\N	\N	b5fb324c-e5f7-49f5-8c89-3ee6352a8aba	2023-07-03 14:12:33.297	2023-08-28 20:53:25.864
ef5cece7-0bfb-422e-b43c-e055c7a0f3ab	62.4	0	0	\N	\N	\N	d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	2023-07-03 15:26:49.527	2023-08-28 20:53:25.889
c04be553-c9d9-4e9b-93fd-8c2cc61ea042	318.55	0	0	\N	\N	\N	4b7fe176-67f7-4bdd-b84d-96972d9ff69d	2023-07-01 19:36:14.807	2023-08-28 20:53:26.005
d147787a-7208-4deb-a424-9ec9a64bcd13	290.3	0	0	\N	\N	\N	08aa63f9-0001-4304-9707-f2312f46b8ea	2023-07-03 16:02:58.472	2023-08-28 20:53:26.016
9e3c4187-e50a-4798-8928-829857844882	99.93	0	0	\N	\N	\N	fdb4ad67-b203-4453-b6da-87df913f1c68	2023-07-03 16:12:47.573	2023-08-28 20:53:26.083
a55b1b66-6980-4657-88ac-2f8999bd5675	197.45	0	0	\N	\N	\N	ae73395a-0804-4f96-bdb2-a30fe09af344	2023-07-03 15:29:19.86	2023-08-28 20:53:26.099
0efccc22-fd95-42a5-a459-5ee40acb9e6b	52.8	0	0	\N	\N	\N	f33e77e7-a9d6-463b-8919-178df2e4e3ba	2023-07-03 15:58:00.377	2023-08-28 20:53:26.114
bf98dbf9-dac6-4afd-8b91-4ed828f477b2	68.07	0	0	\N	\N	\N	44b97127-9687-4310-b936-b48e36b8388f	2023-07-03 16:23:06.92	2023-08-28 20:53:26.127
b340345d-02f7-4971-9482-5917e7d8012f	135.49	0	0	\N	\N	\N	6ba4cc00-0405-4904-a4a7-cdbb57eeaa08	2023-07-03 15:09:54.119	2023-08-28 20:53:26.145
e7592962-0b0d-4461-b070-b37d61852f25	50.4	0	0	\N	\N	\N	b4b410a4-586d-4cc3-ae20-55ac97578089	2023-07-03 16:24:24.4	2023-08-28 20:53:26.185
583ab1ee-875f-49b0-a0b0-44ee552db99e	152.06	0	0	\N	\N	\N	3995e461-7fcc-4292-9e54-5f5b7dc12acc	2023-07-03 15:58:44.823	2023-08-28 20:53:26.214
e1ba3be0-1df6-4744-8021-bb4d13ac1931	274.04	0	0	\N	\N	\N	43f093fa-7f33-4913-a018-da1719ecdfc9	2023-07-03 14:37:25.737	2023-08-28 20:53:26.235
e5650918-ae70-404b-afe5-3989491bd67f	92.51	0	0	\N	\N	\N	080c38e2-393f-4569-8336-fd9bac065573	2023-07-03 15:46:35.971	2023-08-28 20:53:26.239
c255cb48-dade-4f45-b1f5-f7f7a4e00eee	931.64	0	0	\N	\N	\N	6b6525c2-d59b-43ea-a219-cb8dd7b96596	2023-07-03 14:08:28.362	2023-08-28 20:53:26.272
98659c48-4ab2-4731-bcf6-974628082007	82.69	0	0	\N	\N	\N	8e0a31ea-fe50-4173-bde5-d4011ec07687	2023-07-03 16:21:37.896	2023-08-28 20:53:26.289
15210690-cb5b-4d70-9d1c-b4379400d789	5	0	0	\N	\N	\N	291b5eac-5b1d-496b-8260-d0a085cc6167	2023-07-03 16:58:06.992	2023-07-03 16:58:06.992
37e77997-714f-4a48-a67e-f2db8160eadb	10	0	0	\N	\N	\N	3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	2023-07-03 17:00:21.207	2023-07-03 17:00:21.207
b6ae108e-8801-4a4c-93a4-bd952737e10d	0	0	0	\N	\N	\N	7bcdc197-2923-400c-9e95-e2a0f6e3e147	2023-07-03 17:11:01.714	2023-07-03 17:11:01.714
d1a7112d-ee3e-438f-bb70-0b9e78c3e915	5	0	0	\N	\N	\N	9da35227-65b0-4d1f-958d-e69e0d3853d5	2023-07-03 17:27:05.692	2023-07-03 17:27:05.692
c41493f6-d9c1-42fd-b3b7-7c1da96ff403	28.29	0	0	\N	\N	\N	19b88797-be2b-4f30-87ac-4e8ef103f721	2023-08-28 19:44:13.704	2023-08-28 20:53:26.761
1c7fac44-864d-450f-ac4a-ee366826efc4	30.76	0	0	\N	\N	\N	a18c67b9-302c-4f7a-8167-25bc88763cf7	2023-07-03 16:54:16.873	2023-08-28 20:53:26.777
275495d9-645c-4924-9636-84190e0fb300	119.78	0	0	\N	\N	\N	7b96a010-c5a4-45df-b9b6-e218a3202b88	2023-07-03 16:55:23.791	2023-08-28 20:53:26.203
5df6368f-221f-40a5-b2db-30cdb77feb2a	32.07	0	0	\N	\N	\N	97da7731-f76e-42c0-b0fb-7e5d9cbcfc4c	2023-07-03 16:26:17.728	2023-08-28 20:53:26.208
f678dc5f-c5e7-4229-a42e-7c1b12ecc59e	22.73	0	0	\N	\N	\N	34471605-c34f-4616-a7e8-2d3f7fb0b956	2023-07-03 16:26:50.972	2023-08-28 20:53:26.279
07cd7f24-e498-4c7d-a034-8b4051f41d5c	2108	0	0	\N	\N	\N	494fd335-9777-4055-a990-130bb6a6ca18	2023-08-28 20:01:23.117	2023-08-28 20:53:25.827
7e186242-43ed-47dd-81a6-2f003809993a	131.06	0	0	\N	\N	\N	6a23d22a-41c5-40d6-8521-e70988699b05	2023-08-28 19:34:12.88	2023-08-28 20:53:25.833
fb3435e0-e924-4efd-abd5-648eae8aaca6	104.95	0	0	\N	\N	\N	8bc0815f-9353-474b-ad06-4c49af691c37	2023-07-03 17:24:32.353	2023-08-28 20:53:26.331
22112bf5-f845-4984-abb9-13cb5d626dbb	128.29	0	0	\N	\N	\N	a101363f-98c6-469b-b7ca-a56366e99cc5	2023-07-03 17:10:16.574	2023-08-28 20:53:26.342
92a5107b-ca4d-41f8-a987-46757f34e517	1414.96	0	0	\N	\N	\N	f8884836-97ad-4e95-b5af-dfd8f4ce7aa7	2023-08-22 21:41:34.866	2023-08-28 20:53:26.356
8107416a-ada7-461f-90f9-f9ad634e9e2c	1782	0	0	\N	\N	\N	e2f3bc96-79cd-48a8-ac70-3ce13bbbf952	2023-08-28 20:05:37.752	2023-08-28 20:53:26.36
484bf08b-ffb5-4333-be04-1d93586d6122	237.29	0	0	\N	\N	\N	f63e8734-6a61-45f4-8ae4-b33d7b25ba3f	2023-08-28 19:35:49.124	2023-08-28 20:53:26.404
b48bedaa-d5a2-4b62-b7af-af72775b6c20	17.45	0	0	\N	\N	\N	04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	2023-07-03 15:38:08.129	2023-08-28 20:53:26.41
0cc3b574-7124-40a1-963a-2dd694088032	319.42	0	0	\N	\N	\N	9d8c66a7-c358-46d7-b95d-84256445e0a6	2023-07-03 17:22:10.902	2023-08-28 20:53:25.852
ce1f16f8-43ce-482d-a181-e63ac5325f8a	506.62	0	0	\N	\N	\N	b5abaf7f-adc4-4d50-a760-05f7b0622bd7	2023-07-03 17:07:23.565	2023-08-28 20:53:26.457
5f4a8657-e917-49c5-85d8-f6e2ce358770	1782	0	0	\N	\N	\N	d3578bed-d526-4687-868d-d77970fb8c12	2023-08-28 20:07:36.604	2023-08-28 20:07:36.604
e14e30fd-5ed2-4c94-9a1a-e94fa0b0c4b9	213	0	0	\N	\N	\N	6552c8b6-e3fa-4e2d-aa33-f6625ad55739	2023-08-28 19:37:13.405	2023-08-28 19:37:13.405
a858a0a3-76d6-45ba-80be-8c702eeb6982	57	0	0	\N	\N	\N	d24ec077-7625-4df6-af0c-16e6c16d3300	2023-08-28 19:47:36.976	2023-08-28 19:47:36.976
fe29c38e-e8bc-41ef-8e9f-f62ad94f0d91	117.82	0	0	\N	\N	\N	8d60ded1-1c06-42d5-a609-40ffcd4d4bfa	2023-07-03 15:37:23.37	2023-08-28 20:53:25.905
2920c20d-735b-41e2-b713-efbe93ced7ec	24.44	0	0	\N	\N	\N	18c84c5e-8e87-412d-a57e-3cc4ecc2c72a	2023-07-03 17:21:31.954	2023-08-28 20:53:25.943
03c72098-7b77-4aa0-a48a-3a76c24c23bc	220.23	0	0	\N	\N	\N	71ca3df3-6467-4960-8be8-28fc0db5e748	2023-07-01 18:09:25.336	2023-08-28 20:53:25.987
8cd3b699-6144-4286-848a-0080c013f3cb	426.01	0	0	\N	\N	\N	37a007b5-7039-4e78-8979-904e9bb856f0	2023-08-22 21:47:54.241	2023-08-28 20:53:26.062
e7a87532-7300-4ab3-81f0-79f8e620487c	98.53	0	0	\N	\N	\N	92ad74e4-3aea-4ce1-994c-20cfcc0b3016	2023-07-03 16:56:56.28	2023-08-28 20:53:26.078
f5821362-2c91-4fa6-96fd-9ba48f7499b5	1763.6	0	0	\N	\N	\N	26a8762e-13b7-44aa-8a2b-1db34b8d7e79	2023-08-28 20:03:06.987	2023-08-28 20:53:26.155
c5a23ad0-a53f-4a79-966f-c194ec2f9b51	842.86	0	0	\N	\N	\N	9005a2ad-4547-4acd-b475-f421cd01d24f	2023-08-22 21:56:23.069	2023-08-28 20:53:26.535
660cc430-f549-43d6-a336-aa1734e73af1	857.37	0	0	\N	\N	\N	ca357e92-4816-4dd6-82ad-8b0c1b018ccf	2023-08-28 19:40:36.077	2023-08-28 20:53:26.551
82e84281-1678-44c3-b4cd-d408d94ecdb1	460.99	0	0	\N	\N	\N	4e97b052-21f5-45c7-b1d6-87200c060c91	2023-08-22 21:53:52.589	2023-08-28 20:53:26.63
9f9dcb1b-b022-4723-ac8b-3afe68286265	186.98	0	0	\N	\N	\N	072f17b7-b36c-489e-988d-8adfac32ebfb	2023-07-01 17:32:42.604	2023-08-28 20:53:26.159
6195ae37-e1a0-4513-b8d1-68a981c5ee54	1914	0	0	\N	\N	\N	0bdf37b6-3433-4080-9101-a196d48eeecb	2023-08-28 20:13:19.011	2023-08-28 20:53:26.687
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Product" (id, name, description, brand, code, eancode, quantity, promo, active, "categoryId", "createdAt", "updatedAt", tax, "rootCategory") FROM stdin;
55050e9c-5b58-4ce5-873d-ca77388bf4ea	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	T6DM B31 2R 00 C1  	PARKER	BOPE038	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:42:54.452	2023-08-28 20:53:25.788	19	\N
37016c30-4403-4a7e-93e7-7937aec8e878	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW001CNYW	PARKER	VADR211	\N	4	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:54:47.068	2023-08-28 20:53:25.811	19	\N
494fd335-9777-4055-a990-130bb6a6ca18	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SGTDO61210	PIETRO	MERO062	\N	1	f	t	4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	2023-08-28 20:01:23.11	2023-08-28 20:53:25.825	19	\N
9d8c66a7-c358-46d7-b95d-84256445e0a6	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	P3NKA00ESA	PARKER	FIEF121	\N	10	f	t	ebf8bc4a-6c95-4cc4-951a-650c31ff76ea	2023-07-03 17:22:10.894	2023-08-28 20:53:25.849	19	\N
e2f3bc96-79cd-48a8-ac70-3ce13bbbf952	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SGTDO61103	PIETRO	MERO064	\N	16	f	t	4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	2023-08-28 20:05:37.745	2023-08-28 20:53:26.359	19	\N
272daa61-8d98-49c2-ae32-8b4d7b9fc643	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	T6DM B38 2R 00 C1	PARKER	BOPE040	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:45:48.592	2023-08-28 20:53:26.373	19	\N
13d004fb-a626-43d0-8ddc-81bff70a5567	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	930118Q	PARKER	FIEF126	\N	2	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:01:12.938	2023-08-28 20:53:26.692	19	\N
6ccf3a1b-376e-479d-aa4d-fafed00ae8c3	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	786293	PARKER	BOPY054	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:35:01.917	2023-07-01 15:35:01.917	19	\N
59762fdb-46bb-4706-83ef-9c630c6c75d4	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	517-00214-4	PARKER	VARP135	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 15:31:12.516	2023-07-03 15:31:12.516	19	\N
291b5eac-5b1d-496b-8260-d0a085cc6167	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932533M	PARKER	FIPH014	\N	4	f	t	5d81e12c-846f-435c-9d10-147f67862852	2023-07-03 16:58:06.984	2023-07-24 19:03:33.653	19	\N
c53c79a0-be7e-42f1-8996-bb2df1a08219	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	033-71752-0	PARKER	RUOT291	\N	2	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:56:54.234	2023-08-28 20:53:26.621	19	\N
9da35227-65b0-4d1f-958d-e69e0d3853d5	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	B35-02WHC	PARKER	RPFX011	\N	2	f	t	7798e3e4-5f1b-46f4-b8ee-78472e62dff0	2023-07-03 17:27:05.678	2023-07-03 17:27:05.678	19	\N
904f23f4-f717-4c4f-9b8d-4cdc7232002a	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SKPAVC6513	PARKER	RPBO169	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:48:46.521	2023-07-01 17:48:46.521	19	\N
3ce1743a-a1d6-4ea5-a433-8bded16fcef9	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S23-17116-OK	PARKER	BOPB208	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-06-29 00:17:22.591	2023-07-03 14:16:49.571	19	\N
8bcde4cd-7c31-424e-b961-0307a4764c51	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PAVC1002R422	PARKER	BOPY015	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:29:26.97	2023-07-03 14:24:13.345	19	\N
5ed353b4-7e13-4685-b44a-59610b208800	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S23-15696-0K	PARKER	BOPB264	\N	0	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:25:44.507	2023-07-03 14:30:12.513	19	\N
d298936c-301c-4be4-94c4-b7b926d23399	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PAVC65R413	PARKER	BOPY017	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:32:54.403	2023-07-03 14:43:41.881	19	\N
0c2cf883-1e9c-436a-b074-0c42228845d6	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S23-12481-0 	PARKER	RPBO110	\N	0	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:25:30.651	2023-07-04 14:34:50.996	19	\N
19e10d98-4dc5-463a-9010-8825070609fa	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	033-59805-0	PARKER	RPBO006	\N	0	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:17:32.012	2023-08-14 21:40:59.733	19	\N
859ecb2a-5710-4431-98aa-b546f9cbb7c8	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	TG0785EV450AAAB	PARKER	MOBF023	\N	1	f	t	78d1c025-de60-4a70-85a6-f18fc1f70b7e	2023-06-28 22:55:52.225	2023-08-28 20:53:25.976	19	\N
71ca3df3-6467-4960-8be8-28fc0db5e748	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	CPRM2PP21SVHT 	PARKER	VAAL062	\N	10	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:09:25.328	2023-08-28 20:53:25.985	19	\N
0a69319f-e801-45c6-8ae8-b43efa8452fe	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S23-12684-0	PARKER	BOPB219	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:15:08.369	2023-08-28 20:53:26.009	19	\N
69827d7b-ef80-43b2-9001-b1836a6f6df1	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FL69121	PARKER	AEVV003	\N	4	f	t	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	2023-06-27 14:30:32.639	2023-08-28 20:53:26.034	19	\N
14a1b555-9a63-46c7-b437-b28f92cb58b0	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	033-71757-0	PARKER	RPBO161	\N	2	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:42:33.046	2023-08-28 20:53:26.148	19	\N
072f17b7-b36c-489e-988d-8adfac32ebfb	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SKPAVC6511	PARKER	RPBO150	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:32:42.595	2023-08-28 20:53:26.157	19	\N
47e21bdb-442b-4964-885e-54a34ac998b8	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	RDH101K30	PARKER	VAAL030	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:04:06.346	2023-08-28 20:53:26.228	19	\N
33e19cea-619a-490e-ab8a-71ef1be53abc	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	HLS2HVSDLH	PARKER	FIPH046	\N	4	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:14:20.853	2023-08-28 20:53:26.303	19	\N
48c2bc88-3aa9-4c57-b99f-c8f5beeeeabc	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S13-44470-0	PARKER	RUOT288	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:53:11.579	2023-08-28 20:53:26.307	19	\N
50086adc-f8ba-40cf-a792-73c61960265e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S10LD012	PARKER	VABB039	\N	28	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:14:44.323	2023-08-28 20:53:26.313	19	\N
8519678a-cf0c-4c8f-8ca5-cc91b2d78127	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	P1028PS01SRM5BL00E12	PARKER	BOPY014	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:49:38.417	2023-08-28 20:53:26.322	19	\N
f032c2e9-cb61-410a-8087-851e27f1be69	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	RG2AHL0061	PARKER	CISV257	\N	7	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:42:05.142	2023-08-28 20:53:26.346	19	\N
5c4c1796-ab62-409d-8d15-21c5818306d0	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SKPAVC10022	PARKER	BOSU011	\N	2	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:38:38.995	2023-08-28 20:53:26.369	19	\N
9e0e36b2-e0ad-4ae0-8bd9-477225c4be1e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D14AA2A	PARKER	BOPX018	\N	2	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:22:06.143	2023-08-28 20:53:26.498	19	\N
187f2a25-b579-43e4-b3df-71b6e8da67d3	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	306-40035-0	PARKER	RPBO162	\N	4	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:45:17.621	2023-08-28 20:53:26.537	19	\N
09ff2a2a-b59c-489b-88e8-f9be47f48b31	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	306-40174-0	PARKER	RPBO160	\N	4	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:40:22.216	2023-08-28 20:53:26.58	19	\N
c3688b74-ed68-4a70-8baa-603f31331f3e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	AB138010	PARKER	FIDH002	\N	1	f	t	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	2023-06-28 13:25:59.862	2023-08-28 20:53:26.601	19	\N
ea20bd56-a792-4287-9f97-f09538450dcf	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	LDRA-004	PARKER	INAK008	\N	2	f	t	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	2023-06-28 22:59:48.138	2023-08-28 20:53:26.616	19	\N
f597fe05-f745-4137-a870-d9f0ddf9f0ca	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	033-71598-0	PARKER	BOPB262	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:21:01.249	2023-08-28 20:53:26.644	19	\N
8a875eef-f92b-4a38-939f-1df3d5949386	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3349111048	PARKER	BOPX006	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:19:40.223	2023-08-28 20:53:26.697	19	\N
cf201e2d-4361-49f3-8d71-83a39e4a684f	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	036-32902-0	PARKER	BOPB270	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 15:32:12.317	2023-08-28 20:53:26.703	19	\N
d0c0689d-1bfd-488b-b8ac-79c6ba186d28	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	T6C B17 2R 00 B1 	PARKER	BOPE035	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:39:29.444	2023-08-28 20:53:26.715	19	\N
0fd72815-6fb5-4388-a8d5-4dd41f01e539	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	RRKPAVC100R22	PARKER	BOPB182	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-06-29 00:12:52.732	2023-08-28 20:53:26.735	19	\N
811927e4-df83-41e6-8408-6af91e5add25	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	02970 - AI253KT	PARKER	AUVE002	\N	3	f	t	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	2023-06-28 13:15:27.729	2023-08-28 20:53:26.766	19	\N
f2f86739-bb89-493e-9707-8510f5ba4bc2	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	T6C B12 2R00B1	PARKER	BOPE033	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:36:51.845	2023-08-28 20:53:26.771	19	\N
652b6edc-33b1-4105-b315-adf852c31973	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	033-71595-0	PARKER	RPBO159	\N	1	f	t	3a049adb-2967-4247-a7d3-79c98b83a70e	2023-07-01 17:37:47.759	2023-08-28 20:53:25.921	19	\N
5622da38-3729-4d21-b589-19f6f6e930a4	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3349111069	PARKER	BOPX004	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 23:05:41.017	2023-08-28 20:53:25.926	19	\N
377650de-d351-4048-aa6d-151e0fc69970	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	RAH161S30	PARKER	VACT025	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:34:45.331	2023-07-01 18:34:45.331	19	\N
822dba01-ad64-421a-8724-79b2f4203999	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW004CNTW	PARKER	VADR087	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:07:22.335	2023-07-01 19:07:22.335	19	\N
5a24bcad-92e0-441c-997c-8c63aa127988	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW020BNJW	PARKER	VADR093	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:38:49.614	2023-07-01 19:38:49.614	19	\N
850240e0-c07e-4cc6-8f63-886c29c6059e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW020BNTW	PARKER	VADR094	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:41:56.711	2023-07-01 19:41:56.711	19	\N
3cccb670-2e9b-4918-ab73-042af0e4518d	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW020BNYW 	PARKER	VADR138	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:45:05.765	2023-07-01 19:45:05.765	19	\N
24ed9e25-8434-4d07-b441-5116b2597826	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW008CNJW	PARKER	VADR248	\N	0	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 20:01:52.503	2023-07-01 20:01:52.503	19	\N
6a42c3cd-5421-45c2-8261-789255786ac6	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW001CNJW	PARKER	VADR084	\N	0	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:02:39.033	2023-07-21 00:55:25.061	19	\N
9791f231-65a5-48b3-921f-bec9cddd046c	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PRH102K30	PARKER	VACT012	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:27:58.594	2023-08-28 20:53:26.104	19	\N
6ba4cc00-0405-4904-a4a7-cdbb57eeaa08	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937393Q	PARKER	FIEF051	\N	32	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:09:54.111	2023-08-28 20:53:26.143	19	\N
9350dff9-0874-4ccb-b8f6-4c5f76cf76d8	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	DSH101NR	PARKER	VACT060	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:37:56.65	2023-08-28 20:53:26.189	19	\N
227bb4ed-2ebd-4085-81ee-c60fe445553b	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	CSPH161A20-16T	PARKER	VACT010	\N	5	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:23:14.822	2023-08-28 20:53:26.223	19	\N
4c372554-449d-4666-b15f-a26a839332a9	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FM3DDKN55	PARKER	VACX048	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:59:32.652	2023-08-28 20:53:26.242	19	\N
99932e44-58a8-4033-a473-03e0b2658654	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PRH161S50	PARKER	VACT019	\N	5	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:30:23.864	2023-08-28 20:53:26.283	19	\N
d8ec9521-2f54-4658-818b-50e68f0d52a1	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	DSH101CR	PARKER	VACT052	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:36:15.207	2023-08-28 20:53:26.394	19	\N
bd9286d8-7a25-47a3-bec1-729a1792b063	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	F1200S	PARKER	VACX014	\N	11	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:50:43.773	2023-08-28 20:53:26.413	19	\N
debb43ae-3e59-4587-8169-99150434fede	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	N400S	PARKER	VACX015	\N	27	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:51:49.62	2023-08-28 20:53:26.476	19	\N
e4937bdc-c9d3-4424-a95a-481a5fb65464	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PS2817P	PARKER	VAPQ077	\N	4	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 14:19:37.227	2023-08-28 20:53:26.523	19	\N
4f4dd321-83cc-458a-81e0-81feedc2c5d8	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937399Q	PARKER	FIEF028	\N	38	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 14:59:08.059	2023-08-28 20:53:26.564	19	\N
aeefe8a9-07ef-4add-9ae0-fc92b9c177ea	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FM2DDKN	PARKER	VACX047	\N	7	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:56:45.221	2023-08-28 20:53:26.587	19	\N
da82268e-96ce-4230-a558-d14fc9ebbf13	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	F800S	PARKER	VACX012	\N	4	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:39:55.43	2023-08-28 20:53:26.608	19	\N
f0bf85fc-5f84-4108-bed3-8a70046f6187	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	F400S	PARKER	VACX013	\N	14	f	t	d1eefb93-05f4-45f0-b72b-47ad6a256c0b	2023-07-01 18:46:52.765	2023-08-28 20:53:26.649	19	\N
1e299b68-cfa3-4442-8229-6217ea32be96	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PVP3336R221	PARKER	BOPY012	\N	1	f	t	c0d01dab-9929-4e05-a474-b31c29a5f239	2023-06-28 13:43:12.902	2023-08-28 20:53:26.655	19	\N
4b98c3fc-4a7c-4fb6-a3f1-2d4520b4218d	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937400Q	PARKER	FIEF180	\N	17	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:02:17.983	2023-08-28 20:53:26.662	19	\N
ef1da8d2-e0d5-483d-981b-94e7e4a69465	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PRDM3PP21SVG15	PARKER	VADR252	\N	4	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 14:16:56.796	2023-08-28 20:53:26.667	19	\N
36cd21bf-a39d-4c8b-a496-112bb73f86f1	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937394Q	PARKER	FIEF064	\N	53	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:08:39.05	2023-08-28 20:53:26.71	19	\N
9406d229-8e04-4f26-82c9-4756b4e39294	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937395	PARKER	FIEF024	\N	23	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:10:38.657	2023-08-28 20:53:26.721	19	\N
b5fb324c-e5f7-49f5-8c89-3ee6352a8aba	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D3W004CNJW	PARKER	VADR251	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 14:12:33.288	2023-08-28 20:53:25.862	19	\N
926eae18-e7ae-497e-b22a-f23054492084	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	693987	PARKER	VABB055	\N	4	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:19:00.277	2023-08-28 20:53:25.907	19	\N
3e0ab425-e77b-40d7-b6c6-a70d77b3eb6e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	931598M	PARKER	RPFX023	\N	2	f	t	5d81e12c-846f-435c-9d10-147f67862852	2023-07-03 17:00:21.199	2023-07-24 19:03:33.653	19	\N
83b1208d-0c83-448d-b87c-2d27da9b331d	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	940802	PARKER	FIEF062	\N	1	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:21:30.609	2023-07-19 16:22:52.476	19	\N
839025a4-88cc-4468-8141-c1e78cd3fdcf	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	924453Q	PARKER	FIEF127	\N	10	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:59:33.513	2023-07-19 16:22:52.476	19	\N
7bcdc197-2923-400c-9e95-e2a0f6e3e147	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	ILP210QBD35Y9Y91	PARKER	FIFI114	\N	1	f	t	e5872bae-4418-423c-bdf8-b58fb0cf6b77	2023-07-03 17:11:01.706	2023-07-19 16:22:52.476	19	\N
70e15217-ab8e-400a-a63b-70c0f4d30249	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932623Q	PARKER	FIEF015	\N	4	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:36:20.626	2023-07-19 16:22:52.476	19	\N
18c84c5e-8e87-412d-a57e-3cc4ecc2c72a	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	PS701P	PARKER	FIEF109	\N	7	f	t	ebf8bc4a-6c95-4cc4-951a-650c31ff76ea	2023-07-03 17:21:31.946	2023-08-28 20:53:25.941	19	\N
4b7fe176-67f7-4bdd-b84d-96972d9ff69d	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW002CNJW 	PARKER	VADR090	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:36:14.799	2023-08-28 20:53:26.003	19	\N
eecf1032-3b32-4a12-b03f-2d0c160fa6ca	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	691750	PARKER	VABB066	\N	5	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:19:50.498	2023-08-28 20:53:26.043	19	\N
475ff4dd-1665-4668-822a-cb64edc12515	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	F600S	PARKER	VACX021	\N	11	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:52:39.111	2023-08-28 20:53:26.067	19	\N
92ad74e4-3aea-4ce1-994c-20cfcc0b3016	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	924927	PARKER	RPFX022	\N	4	f	t	5d81e12c-846f-435c-9d10-147f67862852	2023-07-03 16:56:56.272	2023-08-28 20:53:26.075	19	\N
fdb4ad67-b203-4453-b6da-87df913f1c68	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	940733	PARKER	FIEF314	\N	8	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:12:47.563	2023-08-28 20:53:26.081	19	\N
f33e77e7-a9d6-463b-8919-178df2e4e3ba	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	924450	PARKER	FIEF124	\N	5	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:58:00.369	2023-08-28 20:53:26.112	19	\N
4c580310-fa0e-4e2a-a56e-948e18c72fc8	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D3W002CNTW	PARKER	VADR103	\N	11	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 14:06:18.056	2023-08-28 20:53:26.176	19	\N
b4b410a4-586d-4cc3-ae20-55ac97578089	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937490	PARKER	FIFI016	\N	5	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:24:24.391	2023-08-28 20:53:26.182	19	\N
97da7731-f76e-42c0-b0fb-7e5d9cbcfc4c	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937484	PARKER	FIFI017	\N	4	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:26:17.715	2023-08-28 20:53:26.206	19	\N
080c38e2-393f-4569-8336-fd9bac065573	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932668Q	PARKER	FIEF056	\N	5	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:46:35.962	2023-08-28 20:53:26.238	19	\N
674fc149-afa4-4462-ba4d-7683b0c765e1	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW002CNTW 	PARKER	VADR089	\N	7	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:34:51.185	2023-08-28 20:53:26.265	19	\N
6b6525c2-d59b-43ea-a219-cb8dd7b96596	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D3W004CNTW	PARKER	VADR222	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-03 14:08:28.355	2023-08-28 20:53:26.271	19	\N
8e0a31ea-fe50-4173-bde5-d4011ec07687	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932617Q	PARKER	FIEF321	\N	3	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:21:37.888	2023-08-28 20:53:26.288	19	\N
ef24cfa3-e34d-4979-b1fb-324224d176b5	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	RAH201S50	PARKER	VACT023	\N	2	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:31:49.259	2023-08-28 20:53:26.318	19	\N
a101363f-98c6-469b-b7ca-a56366e99cc5	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	934331T	PARKER	FIFI026	\N	66	f	t	e5872bae-4418-423c-bdf8-b58fb0cf6b77	2023-07-03 17:10:16.566	2023-08-28 20:53:26.334	19	\N
3f9608cc-c7e7-434d-84ac-a1444bd84674	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937398Q	PARKER	FIEF016	\N	3	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 14:58:08.03	2023-08-28 20:53:26.379	19	\N
92c139a2-d244-486f-8320-c534f73399eb	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	933486	PARKER	FIEF165	\N	1	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:09:05.387	2023-08-28 20:53:26.518	19	\N
b559315a-b66d-4781-b74f-c9cdd098848e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	926890Q	PARKER	FIEF302	\N	3	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:11:03.248	2023-08-28 20:53:26.556	19	\N
168d0fd5-814f-4f1d-806f-04dc918c2b22	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	926541	PARKER	FIEF331	\N	1	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:22:22.039	2023-08-28 20:53:26.741	19	\N
04451efa-1dbc-433f-8b6e-50bc6a4bfa3a	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	921999	PARKER	FIEF022	\N	12492	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:38:08.12	2023-08-28 22:01:21.928	19	\N
d47b548e-4cc0-4eb1-a01f-6912b7c26d8e	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	924448	PARKER	FIEF130	\N	26	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:26:49.519	2023-08-28 20:53:25.886	19	\N
8d60ded1-1c06-42d5-a609-40ffcd4d4bfa	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932467	PARKER	FIEF021	\N	6	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:37:23.362	2023-08-28 20:53:25.903	19	\N
b4761d8f-2ffa-472e-b597-5e666d66e0a6	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932073	PARKER	FIEF011	\N	4	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:35:28.795	2023-07-23 16:29:20.517	19	\N
34fc2e7d-513b-4117-b33d-3934093dd93a	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932688Q	PARKER	FIEF033	\N	8	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:45:48.597	2023-07-04 16:18:08.676	19	\N
6552c8b6-e3fa-4e2d-aa33-f6625ad55739	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FMF1060630BA	PIETRO	FIIU005	\N	4	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:37:13.398	2023-08-28 19:37:13.398	19	\N
6a258fcc-dad5-4214-92e3-24cfbbe473b5	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	D1VW002CNYWX	PARKER	VADR215	\N	0	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 19:57:30.266	2023-07-21 00:55:25.061	19	\N
d24ec077-7625-4df6-af0c-16e6c16d3300	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	2840230	PIETRO	FICT002	\N	3	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:47:36.968	2023-08-28 19:47:36.968	19	\N
d3578bed-d526-4687-868d-d77970fb8c12	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SGTO61074	PIETRO	MERO065	\N	2	f	t	4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	2023-08-28 20:07:36.597	2023-08-28 20:07:36.597	19	\N
a708a0cd-4236-465c-91ab-394afb375bc5	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932670	PARKER	FIEF400	\N	3	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:23:46.995	2023-07-19 16:22:52.475	19	\N
784cdb4a-5450-47ed-86a6-112036e3771a	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	AB116310	PARKER	FIDH001	\N	1	f	t	a89d03f9-2a0b-4a81-bdc7-ac13d016da1e	2023-06-28 13:23:46.798	2023-08-28 20:53:26.039	19	\N
37a007b5-7039-4e78-8979-904e9bb856f0	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3746260	RIELLO	QEAM001	\N	14	f	t	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	2023-08-22 21:47:54.234	2023-08-28 20:53:26.055	19	\N
ae73395a-0804-4f96-bdb2-a30fe09af344	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	940734	PARKER	FIEF156	\N	1	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:29:19.848	2023-08-28 20:53:26.097	19	\N
44b97127-9687-4310-b936-b48e36b8388f	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	928763	PARKER	FIEF332	\N	5	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:23:06.912	2023-08-28 20:53:26.125	19	\N
26a8762e-13b7-44aa-8a2b-1db34b8d7e79	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	SGTDO61076	PIETRO	MERO063	\N	3	f	t	4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	2023-08-28 20:03:06.979	2023-08-28 20:53:26.153	19	\N
7b96a010-c5a4-45df-b9b6-e218a3202b88	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	926748	PARKER	FIEF106	\N	6	f	t	5d81e12c-846f-435c-9d10-147f67862852	2023-07-03 16:55:23.783	2023-08-28 20:53:26.201	19	\N
3995e461-7fcc-4292-9e54-5f5b7dc12acc	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	924452Q	PARKER	FIEF125	\N	4	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:58:44.815	2023-08-28 20:53:26.212	19	\N
43f093fa-7f33-4913-a018-da1719ecdfc9	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937397Q	PARKER	FIEF009	\N	12	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 14:37:25.728	2023-08-28 20:53:26.233	19	\N
34471605-c34f-4616-a7e8-2d3f7fb0b956	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	937480	PARKER	FIFI018	\N	6	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:26:50.957	2023-08-28 20:53:26.276	19	\N
8bc0815f-9353-474b-ad06-4c49af691c37	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	06L22BE	PARKER	FILB016	\N	2	f	t	7798e3e4-5f1b-46f4-b8ee-78472e62dff0	2023-07-03 17:24:32.345	2023-08-28 20:53:26.329	19	\N
f8884836-97ad-4e95-b5af-dfd8f4ce7aa7	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3470110	RIELLO	QEAM006	\N	3	f	t	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	2023-08-22 21:41:34.858	2023-08-28 20:53:26.354	19	\N
f63e8734-6a61-45f4-8ae4-b33d7b25ba3f	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FMF1060500BA	PIETRO	FIIU004	\N	7	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:35:49.118	2023-08-28 20:53:26.402	19	\N
b5abaf7f-adc4-4d50-a760-05f7b0622bd7	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	ILP110QBMP35Y9Y91	PARKER	FIFI011	\N	3	f	t	e5872bae-4418-423c-bdf8-b58fb0cf6b77	2023-07-03 17:07:23.525	2023-08-28 20:53:26.442	19	\N
9005a2ad-4547-4acd-b475-f421cd01d24f	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3747260	RIELLO	QEAM002	\N	2	f	t	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	2023-08-22 21:56:23.061	2023-08-28 20:53:26.533	19	\N
ca357e92-4816-4dd6-82ad-8b0c1b018ccf	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FMF10608F3BA	PIETRO	FIIU006	\N	4	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:40:36.07	2023-08-28 20:53:26.549	19	\N
0bdf37b6-3433-4080-9101-a196d48eeecb	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	------	PIETRO	METN044	\N	2	f	t	4289aeb6-437e-4c1c-9fa5-d33d8dd4ebdd	2023-08-28 20:13:19.005	2023-08-28 20:53:26.685	19	\N
a18c67b9-302c-4f7a-8167-25bc88763cf7	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	936912	PARKER	FIEF104	\N	21	f	t	5d81e12c-846f-435c-9d10-147f67862852	2023-07-03 16:54:16.865	2023-08-28 20:53:26.775	19	\N
93ff20f1-e008-4efc-ab71-e98da94cdfd2	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932017Q	PARKER	FIEF030	\N	6	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:45:03.414	2023-08-28 20:53:26.78	19	\N
08aa63f9-0001-4304-9707-f2312f46b8ea	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	926169	PARKER	FIEF131	\N	484	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 16:02:58.464	2023-08-28 22:01:21.929	19	\N
6a23d22a-41c5-40d6-8521-e70988699b05	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FMF1060230IA	PIETRO	FIIU002	\N	16	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:34:12.873	2023-08-28 20:53:25.831	19	\N
9bd2368c-f6a4-432e-a90e-65ee33900e07	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	932611Q	PARKER	FIEF066	\N	5	f	t	03e74896-ee1f-4ae7-ab3a-1216cb2d0d7b	2023-07-03 15:47:41.965	2023-08-28 20:53:25.855	19	\N
817bfb09-8fe1-45a3-9810-efeebe574f49	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	S10LDD024	PARKER	VABB037	\N	1	f	t	f8d5654d-b981-498b-adf8-d05e718bdec4	2023-07-01 18:11:56.736	2023-08-28 20:53:26.218	19	\N
4e97b052-21f5-45c7-b1d6-87200c060c91	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	3746159	RIELLO	QEAM003	\N	24	f	t	947b9cbc-ef5e-4be1-b5f9-20f9f114fdda	2023-08-22 21:53:52.582	2023-08-28 20:53:26.628	19	\N
19b88797-be2b-4f30-87ac-4e8ef103f721	FILTRO INDUSTRIAL PIETRO FIORENTINI - 50 MICRAS DIAMETRO: 1 1/2" MAOP: 10 BAR CONEXIÓN: ROSCADA	FMF1000300BA	PIETRO	FIIU013	\N	3	f	t	0f886436-dcdb-4f10-a851-24235ea9941b	2023-08-28 19:44:13.695	2023-08-28 20:53:26.759	19	\N
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Roles" (id, name) FROM stdin;
1	cliente
2	admin
\.


--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Usuario" (id, "roleId", name, phone, email, "docType", "numDoc", "Departament", city, address, "bussinessUnit", zoneid, asesor, discount, "codVendedor") FROM stdin;
6	1	Wilfer Castano	3006005253	wilfer.castano@equisol.com.co	CC	901588363-0	Antioquia	La Estrella	Calle 30 # 12-12	6	1	jairo.rivera@equisol.com.co	5.45	17
3	1	Jovany Vélez Arango	3002005393	jvelez23@misena.edu.co	CC	15263832-1	Antioquia	Bello	Calle 52D # 57A-40 apto 402	6	1	spvergara@gmail.com	12	17
4	1	Jairo Alonso Rivera Arango	3006865293	ejara461@gmail.com	CC	303030303-1	Antioquia	Bello	Cabañas, bello antioqui	6	1	jairo.rivera@equisol.com.co	18.5	17
5	2	Jairo Alonso Rivera Arango	3006865293	jairo.rivera@equisol.com.co	CC	3030303030-5	Antioquia	Bello	Cabañas, bello antioqui	6	1	jairo.rivera@equisol.com.co	0	17
7	1	Oscar Padilla	3003003001	oscar.padilla@equisol.com.co	CC	666666666-0	Antioquia	Medellin	Morro Arriba	6	1	jairo.rivera@equisol.com.co	3.7	17
1	2	Jovany Vélez Arango	3002005393	jovany.velez@gmail.com	NIT	15263832-4	Antioquia	Bello	Calle 52D # 57A-40 apto 402	6	1	jvelez23@misena.edu.co	0	17
24	1	SKIDS INGENIERIA SAS	3017094199	compras@e-skids.com	NIT	901400556-8	Antioquia	La Estrella	Kr. 54 No. 79AA Sur – 40 Bodegas La Troja #149	6	1	luz.jaramillo@equisol.com.co	25	F3
25	1	COMBUSTION Y CONTROL S.A.S.	3002656864	compras@combustionycontrol.com	NIT	830051066-5	Bogotá D.C.	Bogotá D.C.	Cra. 69 B N° 24 - 26 Sur, Zona Ind. Carvajal	6	2	andrea.calderon@equisol.com.co	20	D8
26	1	EQUISOL SAS	3128518512	oscar.gonzalez@equisol.com.co	NIT	900953704-0	Antioquia	Itagui	Diagonal 43 # 28-41 Bodega 104 Unidad Industrial Marandúa, Itagüi, Antioqui	6	1	luz.jaramillo@equisol.com.co	20	F3
\.


--
-- Data for Name: Zones; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public."Zones" (id, name, zone) FROM stdin;
1	Antioquia	1
4	Cundiboyacense	2
2	Costa	3
5	Valle	4
6	Eje cafetero	5
3	Santanderes	6
\.


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.ciudades (id, ciudad, codigo, "departamentoId") FROM stdin;
644cb1b8-b917-4a46-84f3-d00e8bb7d5ce	Providencia	88.564	36b8a679-8e34-4038-8321-9c89a0b84f75
3d2bfea0-24c3-44d7-b6d2-e6549e08b986	San Andrés	88.001	36b8a679-8e34-4038-8321-9c89a0b84f75
761bcfcc-81d4-45bd-af4d-553e7ce40e41	Albania	18.029	248fa9c9-429f-4097-a43a-d5c026ec3ebe
f47c74a2-f34c-481e-a95a-bf213f8a7887	Belén de Los Andaquies	18.094	248fa9c9-429f-4097-a43a-d5c026ec3ebe
c81f1eba-36a5-44f6-b503-ee69c278b465	Cartagena del Chairá	18.15	248fa9c9-429f-4097-a43a-d5c026ec3ebe
3457dc3b-9df7-414c-a865-433c8566b351	Curillo	18.205	248fa9c9-429f-4097-a43a-d5c026ec3ebe
1fd26ac7-f8aa-4378-8150-d011fc3ee3ab	El Doncello	18.247	248fa9c9-429f-4097-a43a-d5c026ec3ebe
d751da47-f38c-4078-aec8-6719a9c776b3	El Paujil	18.256	248fa9c9-429f-4097-a43a-d5c026ec3ebe
75a0af10-fa18-4f76-b7a2-0d70618ac78a	Florencia	18.001	248fa9c9-429f-4097-a43a-d5c026ec3ebe
f52ea93a-e89c-4028-bf03-31e3019be99d	La Montañita	18.41	248fa9c9-429f-4097-a43a-d5c026ec3ebe
9caaafa7-23cb-4a56-a826-83f061316956	Milán	18.46	248fa9c9-429f-4097-a43a-d5c026ec3ebe
a87c1cbd-9da8-4924-ac17-dc14ff406500	Morelia	18.479	248fa9c9-429f-4097-a43a-d5c026ec3ebe
30b862a9-c8aa-4cb9-b4ab-a2364096241c	Puerto Rico	18.592	248fa9c9-429f-4097-a43a-d5c026ec3ebe
16f82e17-9435-439c-baec-38c712f86902	San José del Fragua	18.61	248fa9c9-429f-4097-a43a-d5c026ec3ebe
a26069bc-fa87-483d-9db4-5cfbce221654	San Vicente del Caguán	18.753	248fa9c9-429f-4097-a43a-d5c026ec3ebe
8531a315-9fc9-413d-abf3-ac258b6bf523	Solano	18.756	248fa9c9-429f-4097-a43a-d5c026ec3ebe
5e38214b-0f00-4abd-bab7-3ea728cb13c5	Solita	18.785	248fa9c9-429f-4097-a43a-d5c026ec3ebe
3b03369f-bebe-4bbb-be0b-47dad7e312c8	Valparaíso	18.86	248fa9c9-429f-4097-a43a-d5c026ec3ebe
9de52db5-8e8d-4b48-901b-6de01d758a73	Bogotá D.C.	11.001	1b5ec75d-637e-4ca7-98ba-1b9eda47c45d
5cc2e107-70b8-4f20-a8df-c3a9b2e949f0	El Encanto	91.263	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
8ca28abc-9bf5-45d9-92f3-745d31925548	La Chorrera	91.405	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
da1e38d6-0e07-46ec-a8ef-2519ccc65e02	La Pedrera	91.407	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
096006b9-e520-4f24-95d0-3a2bf6286317	La Victoria	91.43	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
ef698ac9-fae0-42a2-893a-0bc15cede07a	Leticia	91.001	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
8685b6b5-30a3-4e03-9052-df51fd48bc32	Miriti Paraná	91.46	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
eeaee77c-1c12-4a70-8603-25c85585b31c	Puerto Alegría	91.53	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
496b9b34-9309-411d-a96d-2ae1118058aa	Puerto Arica	91.536	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
ad79ac64-0e71-4b8c-9b02-efc2b0148260	Puerto Nariño	91.54	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
2f4050bd-c841-4216-b109-4d48ea393ec7	Puerto Santander	91.669	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
1123726f-488a-45a3-bc12-caa5b38d9271	Tarapacá	91.798	7b036cf5-fdb4-4ea4-a39b-b4340cf5656d
7764a06f-3317-471d-ae94-a75564479bbf	Arauca	81.001	74fa3549-914b-40e0-8378-c7aa2238d1b5
db090b01-84a0-48ba-8e93-dcccc49aa4c2	Arauquita	81.065	74fa3549-914b-40e0-8378-c7aa2238d1b5
0459c2d4-0470-410f-a8e9-08b55719fd73	Cravo Norte	81.22	74fa3549-914b-40e0-8378-c7aa2238d1b5
189f0825-2122-493d-9742-cb5193c8b246	Fortul	81.3	74fa3549-914b-40e0-8378-c7aa2238d1b5
6db26206-5b15-4442-ac61-f2c2346cbe37	Puerto Rondón	81.591	74fa3549-914b-40e0-8378-c7aa2238d1b5
7f18033a-f3b9-4892-92c3-22f5370bd9e7	Saravena	81.736	74fa3549-914b-40e0-8378-c7aa2238d1b5
d5445821-815b-4a62-adf4-6e4138024939	Tame	81.794	74fa3549-914b-40e0-8378-c7aa2238d1b5
98a71a97-2d86-4e40-952b-d3a3b090b7a2	Achí	13.006	4b66d65b-2c48-4bd3-a188-c6fe86be1982
0a44109d-29ab-4167-8090-677cecc1d49b	Altos del Rosario	13.03	4b66d65b-2c48-4bd3-a188-c6fe86be1982
2a2012bc-fd88-4e99-b1e9-b455f5ca99c4	Arenal	13.042	4b66d65b-2c48-4bd3-a188-c6fe86be1982
fdd7f8ca-02bd-4188-8f2a-fae133bf20da	Arjona	13.052	4b66d65b-2c48-4bd3-a188-c6fe86be1982
a4559785-84e0-4902-b1ef-b8def15643ce	Arroyohondo	13.062	4b66d65b-2c48-4bd3-a188-c6fe86be1982
3b12908d-5ad9-47f2-a83e-b24e6a59c9d5	Barranco de Loba	13.074	4b66d65b-2c48-4bd3-a188-c6fe86be1982
e564281a-1b4e-4840-ab87-f865881588a5	Calamar	13.14	4b66d65b-2c48-4bd3-a188-c6fe86be1982
93782c32-ee21-4ef5-bd51-d8abb7cffb3e	Cantagallo	13.16	4b66d65b-2c48-4bd3-a188-c6fe86be1982
02d7021c-eeb6-47bb-af64-87cb58983495	Cartagena	13.001	4b66d65b-2c48-4bd3-a188-c6fe86be1982
c731f46a-a79e-4375-93f4-76f8cfe8dbc8	Cicuco	13.188	4b66d65b-2c48-4bd3-a188-c6fe86be1982
e7d70bd0-7e14-4149-9db2-2227699e728c	Clemencia	13.222	4b66d65b-2c48-4bd3-a188-c6fe86be1982
3c181a29-8f96-4e91-b30a-5231fe42291c	Córdoba	13.212	4b66d65b-2c48-4bd3-a188-c6fe86be1982
a4bc82ec-ecd9-4e35-adf9-c6cdd251eb58	El Carmen de Bolívar	13.244	4b66d65b-2c48-4bd3-a188-c6fe86be1982
c0acd9f8-bfac-4dbb-a854-ad93b5bf5b14	El Guamo	13.248	4b66d65b-2c48-4bd3-a188-c6fe86be1982
bb1ecc40-8b7b-4402-8275-6e0f71185df9	El Peñón	13.268	4b66d65b-2c48-4bd3-a188-c6fe86be1982
3059b630-7713-4799-9a55-70f7d10ff7ff	Hatillo de Loba	13.3	4b66d65b-2c48-4bd3-a188-c6fe86be1982
4efeeca9-01b2-4fb0-a540-97da98437a00	Magangué	13.43	4b66d65b-2c48-4bd3-a188-c6fe86be1982
9f361a4d-03ad-40d7-8ba9-1c08eb4e8d5c	Mahates	13.433	4b66d65b-2c48-4bd3-a188-c6fe86be1982
31c09dc4-6564-4926-8917-74eecfd254d8	Margarita	13.44	4b66d65b-2c48-4bd3-a188-c6fe86be1982
ed51c362-a11f-437c-82ff-8f863dbb353b	María la Baja	13.442	4b66d65b-2c48-4bd3-a188-c6fe86be1982
c29de5c7-f083-4feb-b4eb-62b9fec383d2	Mompós	13.468	4b66d65b-2c48-4bd3-a188-c6fe86be1982
f4bdaec3-2c77-4d9a-8f38-446440042d55	Montecristo	13.458	4b66d65b-2c48-4bd3-a188-c6fe86be1982
ab63789b-1e9d-4236-b14d-efc5f8350f44	Morales	13.473	4b66d65b-2c48-4bd3-a188-c6fe86be1982
9f740daf-c26a-4de5-89dc-f45e659014af	Norosí	13.49	4b66d65b-2c48-4bd3-a188-c6fe86be1982
afb29b2c-e4b9-4c07-a087-39c63c70b771	Pinillos	13.549	4b66d65b-2c48-4bd3-a188-c6fe86be1982
d4aef18d-8ccb-4696-9110-ac5dce401437	Regidor	13.58	4b66d65b-2c48-4bd3-a188-c6fe86be1982
0d9f197c-6f8f-43dc-9e19-86b08c92b331	Río Viejo	13.6	4b66d65b-2c48-4bd3-a188-c6fe86be1982
fe5632aa-c5b0-45f0-aff1-56c86ff9d040	San Cristóbal	13.62	4b66d65b-2c48-4bd3-a188-c6fe86be1982
02763fae-2e24-4b2f-be06-dede1e8e6b48	San Estanislao	13.647	4b66d65b-2c48-4bd3-a188-c6fe86be1982
2d6ce411-0ff2-4156-854e-79510234c252	San Fernando	13.65	4b66d65b-2c48-4bd3-a188-c6fe86be1982
8fb0c7f5-53c4-4eaa-a33f-e024029254a3	San Jacinto	13.654	4b66d65b-2c48-4bd3-a188-c6fe86be1982
7e7ecc0a-3c01-4846-8205-6745b0bc3702	San Jacinto del Cauca	13.655	4b66d65b-2c48-4bd3-a188-c6fe86be1982
623a5c40-787c-457e-8f24-5ceed59d84a3	San Juan Nepomuceno	13.657	4b66d65b-2c48-4bd3-a188-c6fe86be1982
c9aeb7bf-b6ab-4e36-9b9f-1ba645264d9c	San Martín de Loba	13.667	4b66d65b-2c48-4bd3-a188-c6fe86be1982
e0d1901d-70c0-4f62-bdea-069bc7f5e8c3	San Pablo de Borbur	13.67	4b66d65b-2c48-4bd3-a188-c6fe86be1982
28bd7e29-3a5f-4a06-b434-3e365e3285bb	Santa Catalina	13.673	4b66d65b-2c48-4bd3-a188-c6fe86be1982
3b9f214f-ee13-4336-b527-e449a2439bbc	Santa Rosa	13.683	4b66d65b-2c48-4bd3-a188-c6fe86be1982
94e20636-ed05-4042-810d-4ec53d522a75	Santa Rosa del Sur	13.688	4b66d65b-2c48-4bd3-a188-c6fe86be1982
6b708d9d-0462-473a-8180-8aab0a11ae43	Simití	13.744	4b66d65b-2c48-4bd3-a188-c6fe86be1982
99948d00-79c3-43bc-96b7-3a83bbb810bb	Soplaviento	13.76	4b66d65b-2c48-4bd3-a188-c6fe86be1982
b33a570c-7b89-4311-8d49-f3569b6555fd	Talaigua Nuevo	13.78	4b66d65b-2c48-4bd3-a188-c6fe86be1982
3900414b-9948-447e-a912-abf8016e6050	Tiquisio	13.81	4b66d65b-2c48-4bd3-a188-c6fe86be1982
05dc5c74-db2e-48f9-924a-6ff8734d0e21	Turbaco	13.836	4b66d65b-2c48-4bd3-a188-c6fe86be1982
c9e2e532-db5b-4098-8544-3c550ad53b65	Turbaná	13.838	4b66d65b-2c48-4bd3-a188-c6fe86be1982
043cfe01-f9ee-4792-9576-013dcc1af60e	Villanueva	13.873	4b66d65b-2c48-4bd3-a188-c6fe86be1982
6c20f9e9-a690-4f6f-b476-d99edd2a7272	Zambrano	13.894	4b66d65b-2c48-4bd3-a188-c6fe86be1982
99e10056-e9da-4d3a-a9b5-46dc060022a2	Abejorral	5.002	b630d288-b871-4314-aa5c-02e8f629a6b9
10248237-0786-4750-b7c8-db84fdd99da1	Abriaquí	5.004	b630d288-b871-4314-aa5c-02e8f629a6b9
bbdadd7d-9067-42e9-bb43-696b6cc4fc73	Alejandría	5.021	b630d288-b871-4314-aa5c-02e8f629a6b9
7a446708-85dc-4c87-86ab-d25ebcec727c	Amagá	5.03	b630d288-b871-4314-aa5c-02e8f629a6b9
5fe74aaf-7f62-420a-8dd1-77a5710ba229	Amalfi	5.031	b630d288-b871-4314-aa5c-02e8f629a6b9
ada9981e-a03b-467c-8f80-8ac6873b8cd8	Andes	5.034	b630d288-b871-4314-aa5c-02e8f629a6b9
d8b56d42-db66-49bd-868e-665772d25082	Angelópolis	5.036	b630d288-b871-4314-aa5c-02e8f629a6b9
30bff6e7-ddc1-454e-aa71-1b5538fe3563	Angostura	5.038	b630d288-b871-4314-aa5c-02e8f629a6b9
26791eb8-69e3-482f-817f-cad54c7fa3e0	Anorí	5.04	b630d288-b871-4314-aa5c-02e8f629a6b9
722a5efe-b60e-4925-acdb-273bb70fa910	Anza	5.044	b630d288-b871-4314-aa5c-02e8f629a6b9
ed67d97a-b4c4-44d1-bf07-2cd225ff0836	Apartadó	5.045	b630d288-b871-4314-aa5c-02e8f629a6b9
a7a7670b-d6bd-4fd9-b425-862168e62c6c	Arboletes	5.051	b630d288-b871-4314-aa5c-02e8f629a6b9
e71b7dd3-e530-4f33-8dba-6e6038068af1	Argelia	5.055	b630d288-b871-4314-aa5c-02e8f629a6b9
87351ad1-29cb-45b3-9b20-643e695853c4	Armenia	5.059	b630d288-b871-4314-aa5c-02e8f629a6b9
3406da04-6ff9-48a3-a6c4-565b38a4d992	Barbosa	5.079	b630d288-b871-4314-aa5c-02e8f629a6b9
2671f0f0-6bbe-4071-833e-1abd9f7fea8c	Bello	5.088	b630d288-b871-4314-aa5c-02e8f629a6b9
3a3be07e-b5cb-49c4-a610-cb6302ebac77	Belmira	5.086	b630d288-b871-4314-aa5c-02e8f629a6b9
6996c760-aba2-4921-8bb1-3818ceead775	Betania	5.091	b630d288-b871-4314-aa5c-02e8f629a6b9
28929eab-7ce3-47b6-b78c-d8d227300bee	Betulia	5.093	b630d288-b871-4314-aa5c-02e8f629a6b9
16b6dfbf-ee8c-4e80-9671-81a3fa9ba80f	Briceño	5.107	b630d288-b871-4314-aa5c-02e8f629a6b9
df937b42-64b0-4ce9-8105-41aa589781f9	Buriticá	5.113	b630d288-b871-4314-aa5c-02e8f629a6b9
f9daf3f7-37b8-4cff-aee5-98b3ba0d0646	Cáceres	5.12	b630d288-b871-4314-aa5c-02e8f629a6b9
f492552b-ea84-4d13-8957-a651f524a033	Caicedo	5.125	b630d288-b871-4314-aa5c-02e8f629a6b9
a3f230ed-3011-40aa-9d20-ea79b6f9eeb4	Caldas	5.129	b630d288-b871-4314-aa5c-02e8f629a6b9
4d42f1d7-0165-42e4-abe7-a15362364fea	Campamento	5.134	b630d288-b871-4314-aa5c-02e8f629a6b9
2b280ecd-9028-48fb-b8f8-18326667f841	Cañasgordas	5.138	b630d288-b871-4314-aa5c-02e8f629a6b9
30347b67-69f0-40b3-8ded-816df11908be	Caracolí	5.142	b630d288-b871-4314-aa5c-02e8f629a6b9
55b12dc3-893a-4e97-b0f9-cf55866a3fe3	Caramanta	5.145	b630d288-b871-4314-aa5c-02e8f629a6b9
f0a524da-e6f9-47ea-8db4-e54a809dc4f5	Carepa	5.147	b630d288-b871-4314-aa5c-02e8f629a6b9
bcd9119b-4b0f-46d2-ab0e-0f1725a7ab5a	Carolina	5.15	b630d288-b871-4314-aa5c-02e8f629a6b9
2f2d079d-2219-4c4f-b09e-727647f2b57b	Caucasia	5.154	b630d288-b871-4314-aa5c-02e8f629a6b9
01f5169e-960c-4fa6-89ef-9b45582644fd	Chigorodó	5.172	b630d288-b871-4314-aa5c-02e8f629a6b9
67e9f7e6-b123-4d12-92e0-9cec1ea829df	Cisneros	5.19	b630d288-b871-4314-aa5c-02e8f629a6b9
e0aa3f56-f321-437c-a79c-cc2dcf9c48e8	Ciudad Bolívar	5.101	b630d288-b871-4314-aa5c-02e8f629a6b9
79671ca6-8f0f-4a87-b36a-bec47febf734	Cocorná	5.197	b630d288-b871-4314-aa5c-02e8f629a6b9
3ee62e6a-2958-4525-9475-f81135e3c570	Concepción	5.206	b630d288-b871-4314-aa5c-02e8f629a6b9
c7bf4ffc-9ddf-4321-8c59-46eed61fa7e7	Concordia	5.209	b630d288-b871-4314-aa5c-02e8f629a6b9
0b713e3b-4c4e-421d-9551-5416089c4a57	Copacabana	5.212	b630d288-b871-4314-aa5c-02e8f629a6b9
cd7f513e-0557-41f5-b979-0c0e6782511a	Dabeiba	5.234	b630d288-b871-4314-aa5c-02e8f629a6b9
e2c0566e-ddd8-4f15-8408-90a793f19372	Don Matías	5.237	b630d288-b871-4314-aa5c-02e8f629a6b9
29a9ef40-468c-45ba-9f78-fd9ea45f9691	Ebéjico	5.24	b630d288-b871-4314-aa5c-02e8f629a6b9
571b7af0-5151-4e01-87c6-520c186649ed	El Bagre	5.25	b630d288-b871-4314-aa5c-02e8f629a6b9
5f92086e-725a-449f-bbb3-6a3cd5cbf58b	El Carmen de Viboral	5.148	b630d288-b871-4314-aa5c-02e8f629a6b9
3268dc26-d8db-4559-96bf-75ba6a3717d1	El Santuario	5.697	b630d288-b871-4314-aa5c-02e8f629a6b9
474bc116-c93a-4b62-a7ec-9306c102d778	Entrerrios	5.264	b630d288-b871-4314-aa5c-02e8f629a6b9
8d74a6c3-c9cd-44ff-a290-75a149d66426	Envigado	5.266	b630d288-b871-4314-aa5c-02e8f629a6b9
7fad9709-f9c5-45b2-9e5f-249e0620534e	Fredonia	5.282	b630d288-b871-4314-aa5c-02e8f629a6b9
b918f608-02ed-497b-ad9d-5cf37fc14719	Frontino	5.284	b630d288-b871-4314-aa5c-02e8f629a6b9
75ac9230-00f2-4077-a7e3-e3708464fd7a	Giraldo	5.306	b630d288-b871-4314-aa5c-02e8f629a6b9
0ad21e04-1f1d-41d6-a434-a4a73f1a6245	Girardota	5.308	b630d288-b871-4314-aa5c-02e8f629a6b9
39ee85be-895a-4e8f-8c12-65c765c0fc15	Gómez Plata	5.31	b630d288-b871-4314-aa5c-02e8f629a6b9
1c1d022b-346e-4ed5-b52e-8069c629753a	Granada	5.313	b630d288-b871-4314-aa5c-02e8f629a6b9
198ede1a-94ad-4109-8340-1b489d69ad33	Guadalupe	5.315	b630d288-b871-4314-aa5c-02e8f629a6b9
e5288390-133b-41d7-a86c-d41089ec3475	Guarne	5.318	b630d288-b871-4314-aa5c-02e8f629a6b9
67aafa32-1fb5-4b00-a477-19bc4b7d5075	Guatapé	5.321	b630d288-b871-4314-aa5c-02e8f629a6b9
3eceb6fd-fc8f-47f6-998f-43bf63e8965a	Heliconia	5.347	b630d288-b871-4314-aa5c-02e8f629a6b9
b0ed1cc9-34d4-4885-9192-2619128be970	Hispania	5.353	b630d288-b871-4314-aa5c-02e8f629a6b9
47aa91f6-de20-4067-9171-aab8b7c469c7	Itagui	5.36	b630d288-b871-4314-aa5c-02e8f629a6b9
1baca505-4324-4011-820d-f3737cd944b7	Ituango	5.361	b630d288-b871-4314-aa5c-02e8f629a6b9
15eca300-2a0a-4c77-91c2-44917639ac95	Jardín	5.364	b630d288-b871-4314-aa5c-02e8f629a6b9
674b566c-8c1c-4735-9895-7f2b49d63290	Jericó	5.368	b630d288-b871-4314-aa5c-02e8f629a6b9
92894d19-1807-41fc-a601-1856099c2135	La Ceja	5.376	b630d288-b871-4314-aa5c-02e8f629a6b9
c77e18e6-2574-46cc-929f-b13b2542ca3c	La Estrella	5.38	b630d288-b871-4314-aa5c-02e8f629a6b9
073de570-0317-4b17-98aa-e4ef0aa42796	La Pintada	5.39	b630d288-b871-4314-aa5c-02e8f629a6b9
e9e38f0b-eeb3-4b73-bcbb-574def7f4b92	La Unión	5.4	b630d288-b871-4314-aa5c-02e8f629a6b9
0e0a9553-5ab6-4204-aba0-bc44b13fceea	Liborina	5.411	b630d288-b871-4314-aa5c-02e8f629a6b9
ad80b11b-aa06-4f04-8f39-85c4f11cb7c3	Maceo	5.425	b630d288-b871-4314-aa5c-02e8f629a6b9
653b2d94-9b47-4cc8-bb47-b18324a365dd	Marinilla	5.44	b630d288-b871-4314-aa5c-02e8f629a6b9
fc5c6496-a648-409d-ac10-fa2ec5671b70	Medellín	5.001	b630d288-b871-4314-aa5c-02e8f629a6b9
40f6190a-ae44-49b8-8a7e-2bc06ffab9d6	Montebello	5.467	b630d288-b871-4314-aa5c-02e8f629a6b9
78e8aeda-1407-4bde-88e9-2777793f5c23	Murindó	5.475	b630d288-b871-4314-aa5c-02e8f629a6b9
98041e5b-4357-40ba-8b78-3bbb4a55cced	Mutatá	5.48	b630d288-b871-4314-aa5c-02e8f629a6b9
09493bcc-f097-43a3-90d9-c5427d208cf9	Nariño	5.483	b630d288-b871-4314-aa5c-02e8f629a6b9
836e7279-a0e3-4b69-9a35-28473bec9218	Nechí	5.495	b630d288-b871-4314-aa5c-02e8f629a6b9
662dfe5a-2b7f-446e-987d-e0ede2ed3ea5	Necoclí	5.49	b630d288-b871-4314-aa5c-02e8f629a6b9
39e25f80-7275-44b6-b2dc-57564aca6d65	Olaya	5.501	b630d288-b871-4314-aa5c-02e8f629a6b9
322aa5c0-1dfe-476a-93db-308c03193ee2	Peñol	5.541	b630d288-b871-4314-aa5c-02e8f629a6b9
936e6f80-740e-4bf8-9ac3-2c4a09f2e572	Peque	5.543	b630d288-b871-4314-aa5c-02e8f629a6b9
62f2fda6-dbda-4b1e-bb85-40dadcc7f7db	Pueblorrico	5.576	b630d288-b871-4314-aa5c-02e8f629a6b9
e691aff2-7a20-47d8-9d73-ad7e1ef0f400	Puerto Berrío	5.579	b630d288-b871-4314-aa5c-02e8f629a6b9
cd012d5f-d74e-4af9-b44a-76148e816e9e	Puerto Nare	5.585	b630d288-b871-4314-aa5c-02e8f629a6b9
601e0990-de00-4e4c-8d0b-1ca273d478fb	Puerto Triunfo	5.591	b630d288-b871-4314-aa5c-02e8f629a6b9
4fd79284-a769-4baa-9179-a8986cea0b3a	Remedios	5.604	b630d288-b871-4314-aa5c-02e8f629a6b9
6dd9b7a2-d274-4a6e-9f28-0a341264efe0	Retiro	5.607	b630d288-b871-4314-aa5c-02e8f629a6b9
ba905e26-ac97-4108-9e33-c94d2c14a3a5	Rionegro	5.615	b630d288-b871-4314-aa5c-02e8f629a6b9
97e85877-76bb-40ae-b3cd-670f4d27bf18	Sabanalarga	5.628	b630d288-b871-4314-aa5c-02e8f629a6b9
70b2598f-096c-410a-bbab-401b36271c1b	Sabaneta	5.631	b630d288-b871-4314-aa5c-02e8f629a6b9
56bf061c-acc8-43af-b620-715b98dbb49e	Salgar	5.642	b630d288-b871-4314-aa5c-02e8f629a6b9
8a0c81e0-7b13-44f3-a721-f3dc7b42f253	San Andrés de Cuerquía	5.647	b630d288-b871-4314-aa5c-02e8f629a6b9
c522ddeb-e031-4f09-94cd-faa9c3806bb0	San Carlos	5.649	b630d288-b871-4314-aa5c-02e8f629a6b9
8b77ef0a-deca-4252-86b2-c74cdb755a8a	San Francisco	5.652	b630d288-b871-4314-aa5c-02e8f629a6b9
b6439534-06c7-43e6-9ff6-a91302ba83e3	San Jerónimo	5.656	b630d288-b871-4314-aa5c-02e8f629a6b9
7df37873-65bd-450d-b45e-d2a3301c248e	San José de La Montaña	5.658	b630d288-b871-4314-aa5c-02e8f629a6b9
0d8a9c57-9445-4f7c-80b2-ed7188c3aa68	San Juan de Urabá	5.659	b630d288-b871-4314-aa5c-02e8f629a6b9
6ffe74f1-d727-4c9d-a2f1-c0cac64ed8a1	San Luis	5.66	b630d288-b871-4314-aa5c-02e8f629a6b9
b238929c-b6b0-4e67-a10a-1cb93178336c	San Pedro	5.664	b630d288-b871-4314-aa5c-02e8f629a6b9
15460a96-ab80-4eb5-811c-7151b5677324	San Pedro de Uraba	5.665	b630d288-b871-4314-aa5c-02e8f629a6b9
e8ea0402-95ea-4b1c-bec5-d49aaa3cfb8d	San Rafael	5.667	b630d288-b871-4314-aa5c-02e8f629a6b9
f85b3327-48c6-4eb7-aac8-5f5f17b87f28	San Roque	5.67	b630d288-b871-4314-aa5c-02e8f629a6b9
a377d0d0-894c-4ea9-b01e-3a60ad1ef93a	Santa Bárbara	5.679	b630d288-b871-4314-aa5c-02e8f629a6b9
1f6a2cc4-77b5-4acb-bd1d-597b192cea4c	Santafé de Antioquia	5.042	b630d288-b871-4314-aa5c-02e8f629a6b9
c22f835b-df37-4826-9304-a4a562a13588	Santa Rosa de Osos	5.686	b630d288-b871-4314-aa5c-02e8f629a6b9
429f9c8d-d772-42cf-9571-faec139705e7	Santo Domingo	5.69	b630d288-b871-4314-aa5c-02e8f629a6b9
86a20933-1fe9-49bc-a2df-df376c059a12	San Vicente	5.674	b630d288-b871-4314-aa5c-02e8f629a6b9
0afa98da-a462-4842-911e-0278314ecaf9	Segovia	5.736	b630d288-b871-4314-aa5c-02e8f629a6b9
35efb1bc-9a3a-4960-ab43-c2d87e0991f4	Sonsón	5.756	b630d288-b871-4314-aa5c-02e8f629a6b9
24d492c4-336c-448a-aaf0-d4d49620a52f	Sopetrán	5.761	b630d288-b871-4314-aa5c-02e8f629a6b9
93dac3e6-b25c-472a-a99c-2d0feef41088	Támesis	5.789	b630d288-b871-4314-aa5c-02e8f629a6b9
2cd8c7e8-2b91-46cb-8dd7-d3ce47538e5b	Tarazá	5.79	b630d288-b871-4314-aa5c-02e8f629a6b9
a5161e5a-cce2-49aa-bbe3-31f1a23cdaa3	Tarso	5.792	b630d288-b871-4314-aa5c-02e8f629a6b9
99ba3f8d-a0c0-4bb5-bd7c-bc0727d58c2f	Titiribí	5.809	b630d288-b871-4314-aa5c-02e8f629a6b9
3d7df22e-7b2b-40a3-8c78-e5abd46d039c	Toledo	5.819	b630d288-b871-4314-aa5c-02e8f629a6b9
37283a67-4caf-48b4-92a5-f848370afb43	Turbo	5.837	b630d288-b871-4314-aa5c-02e8f629a6b9
92f2f3bd-4c45-4b56-8dca-610a9c851435	Uramita	5.842	b630d288-b871-4314-aa5c-02e8f629a6b9
35101e11-f3e0-4061-8c56-4a555eae69bf	Urrao	5.847	b630d288-b871-4314-aa5c-02e8f629a6b9
c16fbb61-cd83-4276-b1ea-3f205541837b	Valdivia	5.854	b630d288-b871-4314-aa5c-02e8f629a6b9
00b11d3f-7e52-4be4-8cae-08b19e1bab44	Valparaíso	5.856	b630d288-b871-4314-aa5c-02e8f629a6b9
0d6fa38f-7a72-4895-840e-bbf52361f24f	Vegachí	5.858	b630d288-b871-4314-aa5c-02e8f629a6b9
f2a9f1eb-c4ae-4eaa-9b6a-68c67eef1572	Venecia	5.861	b630d288-b871-4314-aa5c-02e8f629a6b9
29fef6ec-6535-4652-9a42-1664ba41b85d	Vigía del Fuerte	5.873	b630d288-b871-4314-aa5c-02e8f629a6b9
e03d2de8-09ed-4232-874c-7e600c621e4b	Yalí	5.885	b630d288-b871-4314-aa5c-02e8f629a6b9
5af39341-b59a-4b8b-b6ce-0de19d1a93c8	Yarumal	5.887	b630d288-b871-4314-aa5c-02e8f629a6b9
1fb798d3-492f-468c-8835-2c56ec43c834	Yolombó	5.89	b630d288-b871-4314-aa5c-02e8f629a6b9
4d9e65c4-d8a5-446e-8571-6da626f7cca1	Yondó	5.893	b630d288-b871-4314-aa5c-02e8f629a6b9
70ecd3fa-9b38-4893-97e5-8d044efd9440	Zaragoza	5.895	b630d288-b871-4314-aa5c-02e8f629a6b9
cdf73cd0-5d2c-4456-b6f5-1017c36280bb	Almaguer	19.022	7697f54c-477d-4bcb-8038-773618306335
726697ce-b3c8-41ad-b0e3-7bc2d25fd32a	Argelia	19.05	7697f54c-477d-4bcb-8038-773618306335
2cdfc08d-d00d-4156-b3b0-a9cf5095f7fe	Balboa	19.075	7697f54c-477d-4bcb-8038-773618306335
520befb4-057d-401c-b418-6c34064a4de6	Bolívar	19.1	7697f54c-477d-4bcb-8038-773618306335
6e1aaa2f-ec9e-45de-a8c4-a74c0dcef813	Buenos Aires	19.11	7697f54c-477d-4bcb-8038-773618306335
8af39634-278d-4567-9baa-faa22fef9bbf	Cajibío	19.13	7697f54c-477d-4bcb-8038-773618306335
0972f510-d585-4d8a-9f8b-74f9688f09eb	Caldono	19.137	7697f54c-477d-4bcb-8038-773618306335
d8e6ab74-27e1-415a-9199-96b9d3d99735	Caloto	19.142	7697f54c-477d-4bcb-8038-773618306335
78f462c0-fe9b-4225-8c4c-56981852a470	Corinto	19.212	7697f54c-477d-4bcb-8038-773618306335
a53d0a0f-1208-4a36-ab95-8d96ff697aa0	El Tambo	19.256	7697f54c-477d-4bcb-8038-773618306335
13d0440a-e6e4-402b-9bae-ce6beebd8d42	Florencia	19.29	7697f54c-477d-4bcb-8038-773618306335
61286383-2e5f-41e7-93e6-ed4b6030358e	Guachené	19.3	7697f54c-477d-4bcb-8038-773618306335
c018b33f-74e1-4248-a388-9a71207afdd1	Guapi	19.318	7697f54c-477d-4bcb-8038-773618306335
1d5b4cd9-a4f8-4f83-8a16-2099890a089c	Inzá	19.355	7697f54c-477d-4bcb-8038-773618306335
46b5b9fe-9540-449e-b5e8-301f0a5726a8	Jambaló	19.364	7697f54c-477d-4bcb-8038-773618306335
1438888c-88b0-4e21-96f7-3c7bee58f607	La Sierra	19.392	7697f54c-477d-4bcb-8038-773618306335
82317c71-a551-4f76-a2c0-308ab2711538	La Vega	19.397	7697f54c-477d-4bcb-8038-773618306335
c9a928bd-1cb1-4d2f-92a9-4b1fff686127	López	19.418	7697f54c-477d-4bcb-8038-773618306335
9baa6006-1f9b-4466-bd36-ee58d71e9a8b	Mercaderes	19.45	7697f54c-477d-4bcb-8038-773618306335
dc007e04-1013-4774-a7ee-08fe30c60a5e	Miranda	19.455	7697f54c-477d-4bcb-8038-773618306335
f608ea97-8d88-42f1-9d4a-c5b4354df3d4	Morales	19.473	7697f54c-477d-4bcb-8038-773618306335
1cfe3cc0-351f-4416-a3cf-5d37f6eea391	Padilla	19.513	7697f54c-477d-4bcb-8038-773618306335
9b8f7019-8189-49d0-8c1f-4aeab2da4866	Páez	19.517	7697f54c-477d-4bcb-8038-773618306335
608ce351-584f-4a77-84fc-d1d0c32de779	Patía	19.532	7697f54c-477d-4bcb-8038-773618306335
93b5f2f6-8285-415e-b724-7d44c886b9de	Piamonte	19.533	7697f54c-477d-4bcb-8038-773618306335
116f68d2-9504-4f37-9bdb-a3f4d9e15f9e	Piendamó	19.548	7697f54c-477d-4bcb-8038-773618306335
ed4c8c50-40f3-4b97-9a5a-599a721d83b0	Popayán	19.001	7697f54c-477d-4bcb-8038-773618306335
99b2059d-2d80-4253-a616-fcecd0cd4575	Puerto Tejada	19.573	7697f54c-477d-4bcb-8038-773618306335
488c8fd7-45e0-4961-a8ae-e8a7b5dde438	Puracé	19.585	7697f54c-477d-4bcb-8038-773618306335
bc8f51b9-297a-4421-b30f-f05a6d78d74d	Rosas	19.622	7697f54c-477d-4bcb-8038-773618306335
ff2e5872-9f27-4668-b4bb-86ea83e93777	San Sebastián	19.693	7697f54c-477d-4bcb-8038-773618306335
152183a2-e9d8-4c44-aa33-b3b7a1b0fea7	Santander de Quilichao	19.698	7697f54c-477d-4bcb-8038-773618306335
031180da-11b6-4e78-bbc5-6725f7f95a1e	Santa Rosa	19.701	7697f54c-477d-4bcb-8038-773618306335
2cae05ff-b2b8-4cd1-be93-ddfe81a4b007	Silvia	19.743	7697f54c-477d-4bcb-8038-773618306335
6908165e-e2d6-43ce-9274-1f79cc9e1b43	Sotara	19.76	7697f54c-477d-4bcb-8038-773618306335
95c35564-497b-4b47-995e-8b5730df6d5a	Suárez	19.78	7697f54c-477d-4bcb-8038-773618306335
66a90ea4-70d1-46ed-ba3e-2e26f2dc27c3	Sucre	19.785	7697f54c-477d-4bcb-8038-773618306335
d0256fd9-9ce7-46f6-a20b-33ee82320e55	Timbío	19.807	7697f54c-477d-4bcb-8038-773618306335
a5511dc8-9cc7-4d40-99ec-afe89a7c6272	Timbiquí	19.809	7697f54c-477d-4bcb-8038-773618306335
9a050b10-e39a-47b0-8e8f-77e644b3dda2	Toribio	19.821	7697f54c-477d-4bcb-8038-773618306335
8509e831-daf8-4bcc-b928-3cfe9ba49281	Totoró	19.824	7697f54c-477d-4bcb-8038-773618306335
3d60394f-cb95-4bdd-bdd9-d3355200072a	Villa Rica	19.845	7697f54c-477d-4bcb-8038-773618306335
877d9025-e4ac-4480-8632-2f8ed545e98d	Agua de Dios	25.001	0db93e16-343b-4f1d-a86d-c485874d057f
126df975-4085-4148-87c1-7e970df90696	Albán	25.019	0db93e16-343b-4f1d-a86d-c485874d057f
682ffac7-f8f4-46db-a677-826a892cb879	Anapoima	25.035	0db93e16-343b-4f1d-a86d-c485874d057f
e6b91b37-1b8d-4453-a321-4a1ff3596281	Anolaima	25.04	0db93e16-343b-4f1d-a86d-c485874d057f
b4a14c57-97eb-46cd-8d96-3b8301d720b3	Apulo	25.599	0db93e16-343b-4f1d-a86d-c485874d057f
a0038293-77dc-4fb8-99ff-5a4185798682	Arbeláez	25.053	0db93e16-343b-4f1d-a86d-c485874d057f
dc2b8d3c-75d9-44f2-bd2b-dd1a02eddf0e	Beltrán	25.086	0db93e16-343b-4f1d-a86d-c485874d057f
f74f563c-e24c-4d9e-8a46-b44e328dcff5	Bituima	25.095	0db93e16-343b-4f1d-a86d-c485874d057f
c7910797-34e8-4521-9bee-28c07f69a17d	Bojacá	25.099	0db93e16-343b-4f1d-a86d-c485874d057f
baf2c486-7e74-4f81-a7f8-e4ba50868fb4	Cabrera	25.12	0db93e16-343b-4f1d-a86d-c485874d057f
1614c687-ec06-4ce4-9fd4-e559f621c0a8	Cachipay	25.123	0db93e16-343b-4f1d-a86d-c485874d057f
2042001b-1986-4a4c-9cab-bab18259d29b	Cajicá	25.126	0db93e16-343b-4f1d-a86d-c485874d057f
b270342a-66cd-4b7c-a3cf-1da292556428	Caparrapí	25.148	0db93e16-343b-4f1d-a86d-c485874d057f
0b64221e-7478-4b1c-8c26-77a5696670a8	Caqueza	25.151	0db93e16-343b-4f1d-a86d-c485874d057f
5a5faf4f-9be9-4889-865b-066205289927	Carmen de Carupa	25.154	0db93e16-343b-4f1d-a86d-c485874d057f
a4e79f37-b242-4792-907b-7ffd6288f0a5	Chaguaní	25.168	0db93e16-343b-4f1d-a86d-c485874d057f
4b01047a-622c-45b0-88ec-520d0ed3575e	Baranoa	8.078	7903cecc-5a4a-4758-b53f-d37d3d61d00e
64d296ac-8fa5-4377-8373-cdd81b7c8853	Barranquilla	8.001	7903cecc-5a4a-4758-b53f-d37d3d61d00e
26402fa6-bd53-4514-bf12-897b835b2be4	Campo de La Cruz	8.137	7903cecc-5a4a-4758-b53f-d37d3d61d00e
bb46407d-1f4b-4a47-93d6-99325835b773	Candelaria	8.141	7903cecc-5a4a-4758-b53f-d37d3d61d00e
4d7bc72e-3f92-42dc-a7b9-e9a2355ead9b	Galapa	8.296	7903cecc-5a4a-4758-b53f-d37d3d61d00e
f622c840-498b-4ad0-8458-99062af5a158	Juan de Acosta	8.372	7903cecc-5a4a-4758-b53f-d37d3d61d00e
a83f4891-85f2-49e7-a697-38bab492081f	Luruaco	8.421	7903cecc-5a4a-4758-b53f-d37d3d61d00e
d62117f9-777c-4165-bb70-2ba5132f15f1	Malambo	8.433	7903cecc-5a4a-4758-b53f-d37d3d61d00e
5c1999f4-99be-4ed0-9d7a-fe3be2135c4a	Manatí	8.436	7903cecc-5a4a-4758-b53f-d37d3d61d00e
e09618be-e2e7-4d6f-a73b-8e5c0849fa67	Palmar de Varela	8.52	7903cecc-5a4a-4758-b53f-d37d3d61d00e
54c63e9d-e024-4ebe-9f16-5520ddc08550	Piojó	8.549	7903cecc-5a4a-4758-b53f-d37d3d61d00e
5cd7016f-fc28-4d09-b410-af996d02fd67	Polonuevo	8.558	7903cecc-5a4a-4758-b53f-d37d3d61d00e
72e755bf-e64e-4dad-9778-7e245b7e9cce	Ponedera	8.56	7903cecc-5a4a-4758-b53f-d37d3d61d00e
efc16f00-f87e-401c-bcfc-2a315eeda3e5	Puerto Colombia	8.573	7903cecc-5a4a-4758-b53f-d37d3d61d00e
f782b645-18bf-4698-a43c-4664c44a3d18	Repelón	8.606	7903cecc-5a4a-4758-b53f-d37d3d61d00e
2a09a5a3-b4d4-4f14-8436-308354bdf946	Sabanagrande	8.634	7903cecc-5a4a-4758-b53f-d37d3d61d00e
efb7ab6c-83e6-4e68-8497-ec36701d579e	Sabanalarga	8.638	7903cecc-5a4a-4758-b53f-d37d3d61d00e
6e9580d7-9cb2-4ecd-a57f-efe71d67829c	Santa Lucía	8.675	7903cecc-5a4a-4758-b53f-d37d3d61d00e
75083079-5e09-407f-80f8-86f984b92a36	Santo Tomás	8.685	7903cecc-5a4a-4758-b53f-d37d3d61d00e
6d9b7509-54c7-46c2-b382-d2e725fb1e6b	Soledad	8.758	7903cecc-5a4a-4758-b53f-d37d3d61d00e
94e4ee51-0a53-4a17-b0cf-782b9ff23cc5	Suan	8.77	7903cecc-5a4a-4758-b53f-d37d3d61d00e
068aa141-a7b8-4054-b79e-cf341bc47fd7	Tubará	8.832	7903cecc-5a4a-4758-b53f-d37d3d61d00e
37325c07-b51b-455a-95ed-437c485e05b7	Usiacurí	8.849	7903cecc-5a4a-4758-b53f-d37d3d61d00e
b2a76544-6592-4aaf-a4a4-4fe0662d94c2	Acandí	27.006	9b67060a-f514-4139-b09e-e9dd97f9dab6
2102c886-c57c-46f8-ba1b-47997c5d6c7d	Alto Baudo	27.025	9b67060a-f514-4139-b09e-e9dd97f9dab6
bd6d6f2a-47e4-4c9c-8ec9-e44dd814382f	Atrato	27.05	9b67060a-f514-4139-b09e-e9dd97f9dab6
76aa5ffa-caa8-4969-8038-dffb000cac6e	Bagadó	27.073	9b67060a-f514-4139-b09e-e9dd97f9dab6
7da59694-d523-4937-8c4a-fc1e6cbf2a97	Bahía Solano	27.075	9b67060a-f514-4139-b09e-e9dd97f9dab6
835f3823-ade2-4a41-9cd2-9034be4431d0	Bajo Baudó	27.077	9b67060a-f514-4139-b09e-e9dd97f9dab6
e842ba51-4be7-48f7-9552-074f0b934754	Belén de Bajira	27.086	9b67060a-f514-4139-b09e-e9dd97f9dab6
59d9f94f-5593-44fb-a803-11e8544c7eb9	Bojaya	27.099	9b67060a-f514-4139-b09e-e9dd97f9dab6
59ab7622-1524-4521-aad2-d4db82083c24	Carmen del Darien	27.15	9b67060a-f514-4139-b09e-e9dd97f9dab6
6936a36c-82a5-41cd-a0d3-9eb748d29910	Cértegui	27.16	9b67060a-f514-4139-b09e-e9dd97f9dab6
bb4077fc-ed2e-47ca-9918-dec44ea5943a	Condoto	27.205	9b67060a-f514-4139-b09e-e9dd97f9dab6
36dc7055-a4df-423a-a706-96366f94d790	El Cantón del San Pablo	27.135	9b67060a-f514-4139-b09e-e9dd97f9dab6
843fb0fd-e3ca-40ec-9901-b8e5800c8c81	El Carmen de Atrato	27.245	9b67060a-f514-4139-b09e-e9dd97f9dab6
ac5ecc94-72cc-4103-9094-55c4a961e6c9	El Litoral del San Juan	27.25	9b67060a-f514-4139-b09e-e9dd97f9dab6
244afe1b-0035-4422-884c-88b3c8fb5e29	Istmina	27.361	9b67060a-f514-4139-b09e-e9dd97f9dab6
c0032f6a-530b-487f-87a2-73a849137828	Juradó	27.372	9b67060a-f514-4139-b09e-e9dd97f9dab6
fdd2c511-c529-451f-ad89-0b6e80418b28	Lloró	27.413	9b67060a-f514-4139-b09e-e9dd97f9dab6
b1a96d52-f434-4f56-9a49-3c7b11ed1771	Medio Atrato	27.425	9b67060a-f514-4139-b09e-e9dd97f9dab6
a2ec3310-ee9e-4183-ba2f-58f4016fffd9	Medio Baudó	27.43	9b67060a-f514-4139-b09e-e9dd97f9dab6
5b2cd554-556b-4bd7-9845-99f510e74bda	Medio San Juan	27.45	9b67060a-f514-4139-b09e-e9dd97f9dab6
aa28ebc6-1d25-47dd-9d51-85f7236e20d0	Nóvita	27.491	9b67060a-f514-4139-b09e-e9dd97f9dab6
ea8e0358-13de-4ec4-a73f-0cc01b23f8fa	Nuquí	27.495	9b67060a-f514-4139-b09e-e9dd97f9dab6
f52bc1bf-79e0-4e1d-8e08-3a3d64941507	Quibdó	27.001	9b67060a-f514-4139-b09e-e9dd97f9dab6
6a232df9-1278-45ee-9549-ac2759e749aa	Río Iro	27.58	9b67060a-f514-4139-b09e-e9dd97f9dab6
df029b07-edef-455e-9b23-c9da43ec2cf9	Río Quito	27.6	9b67060a-f514-4139-b09e-e9dd97f9dab6
deeb490f-d547-41b9-8755-23ba0db04994	Riosucio	27.615	9b67060a-f514-4139-b09e-e9dd97f9dab6
74b11499-190d-4122-8fe6-0b9b88bc78d8	San José del Palmar	27.66	9b67060a-f514-4139-b09e-e9dd97f9dab6
94b8d2c9-c554-4bae-81ff-1252c7c4bbb3	Sipí	27.745	9b67060a-f514-4139-b09e-e9dd97f9dab6
dde21924-8c33-4bf7-b7ac-afae7e35d2a2	Tadó	27.787	9b67060a-f514-4139-b09e-e9dd97f9dab6
0615a15c-7f90-4907-966d-314f35a22f86	Unguía	27.8	9b67060a-f514-4139-b09e-e9dd97f9dab6
423202b0-9923-4282-9d8e-22f81a28d762	Unión Panamericana	27.81	9b67060a-f514-4139-b09e-e9dd97f9dab6
c29f896a-04a6-4c0f-9137-469de64eb1f7	Algarrobo	47.03	3d71474c-67e5-4760-92a4-e9b599911267
ff4a054d-8172-48b7-9b5e-7ec1e0dd2eba	Aracataca	47.053	3d71474c-67e5-4760-92a4-e9b599911267
34141dea-68a8-40f4-a0a8-b7906264fe6e	Ariguaní	47.058	3d71474c-67e5-4760-92a4-e9b599911267
92c2d4eb-0d61-4a0f-86e2-334afe94e83e	Cerro San Antonio	47.161	3d71474c-67e5-4760-92a4-e9b599911267
dff97887-1a5c-4759-a764-fc7fb0eaa52f	Chivolo	47.17	3d71474c-67e5-4760-92a4-e9b599911267
7c38ef76-d6af-4487-93a2-db41e871eca9	Ciénaga	47.189	3d71474c-67e5-4760-92a4-e9b599911267
519ba096-e45f-4347-bba8-00c36f656686	Concordia	47.205	3d71474c-67e5-4760-92a4-e9b599911267
fae94a4c-8938-43db-84bc-4b0bd5e53b95	El Banco	47.245	3d71474c-67e5-4760-92a4-e9b599911267
44e750da-d942-49fa-96fd-90d8de9f8b37	El Piñon	47.258	3d71474c-67e5-4760-92a4-e9b599911267
5d2daae9-9944-4c5d-832d-003e67b25bb7	El Retén	47.268	3d71474c-67e5-4760-92a4-e9b599911267
bd116ae8-1a52-4faf-8993-3595e437ef94	Fundación	47.288	3d71474c-67e5-4760-92a4-e9b599911267
a9b45e76-f990-4e18-bc71-24ba095266d7	Guamal	47.318	3d71474c-67e5-4760-92a4-e9b599911267
2dd5d6e0-fef5-46b9-a504-b9720ed296c1	Almeida	15.022	2ee650ab-8239-4202-a073-d51a8eb7eb23
a95f1072-9198-4f25-9e6a-25797b554df2	Aquitania	15.047	2ee650ab-8239-4202-a073-d51a8eb7eb23
c17cc64c-ed6a-4de4-ab3f-cf5d704f8d66	Arcabuco	15.051	2ee650ab-8239-4202-a073-d51a8eb7eb23
92d93eb3-ffca-43f9-bf54-66374edab910	Belén	15.087	2ee650ab-8239-4202-a073-d51a8eb7eb23
42de81d2-fd3a-4d09-9595-3c4e823e9f48	Berbeo	15.09	2ee650ab-8239-4202-a073-d51a8eb7eb23
19541ebf-611b-42cc-bf7e-23dfc411a2bf	Betéitiva	15.092	2ee650ab-8239-4202-a073-d51a8eb7eb23
b21fbcc3-199a-44b5-8569-651419b61548	Boavita	15.097	2ee650ab-8239-4202-a073-d51a8eb7eb23
820e481f-6669-497e-a860-597111771a29	Boyacá	15.104	2ee650ab-8239-4202-a073-d51a8eb7eb23
4513a312-efef-4fec-bb29-83a4ecff8cc3	Briceño	15.106	2ee650ab-8239-4202-a073-d51a8eb7eb23
2683a65e-6aad-4ff4-af06-6967b324e9c9	Buena Vista	15.109	2ee650ab-8239-4202-a073-d51a8eb7eb23
9f69be1f-2346-4c85-a2f8-2b8758d902b7	Busbanzá	15.114	2ee650ab-8239-4202-a073-d51a8eb7eb23
e5d1c8b3-aedf-4282-9f48-3a896792b4ae	Caldas	15.131	2ee650ab-8239-4202-a073-d51a8eb7eb23
40c539ec-47cd-4e99-93cd-b9b7acca7631	Campohermoso	15.135	2ee650ab-8239-4202-a073-d51a8eb7eb23
38048bf7-b9c8-486c-be84-eba5f9debb62	Cerinza	15.162	2ee650ab-8239-4202-a073-d51a8eb7eb23
4b50fb1e-f26d-47aa-8742-b931c36946bc	Chinavita	15.172	2ee650ab-8239-4202-a073-d51a8eb7eb23
6c508b5c-94d1-406e-8db6-b1a6e2ccf8d8	Chiquinquirá	15.176	2ee650ab-8239-4202-a073-d51a8eb7eb23
c7338d86-5f2d-4191-a481-3e789649c843	Chíquiza	15.232	2ee650ab-8239-4202-a073-d51a8eb7eb23
e79e238b-ff9b-4b41-b3dc-718782ae61c9	Chiscas	15.18	2ee650ab-8239-4202-a073-d51a8eb7eb23
7c998af9-0f1a-49e2-a422-cf297eff2a98	Chita	15.183	2ee650ab-8239-4202-a073-d51a8eb7eb23
6d794f01-2199-4dfd-9237-b5d5122154c3	Chitaraque	15.185	2ee650ab-8239-4202-a073-d51a8eb7eb23
1721f4d2-9161-4892-bfaf-191df56618b8	Chivatá	15.187	2ee650ab-8239-4202-a073-d51a8eb7eb23
47f74222-6f9e-47fd-bf69-094f5cc6171b	Chivor	15.236	2ee650ab-8239-4202-a073-d51a8eb7eb23
78c85fa5-672c-4df9-ac6b-ecbd8e5bbc3c	Ciénega	15.189	2ee650ab-8239-4202-a073-d51a8eb7eb23
9427a914-3998-473e-8a44-af67349b9d24	Cómbita	15.204	2ee650ab-8239-4202-a073-d51a8eb7eb23
6ff4daee-df83-4822-984d-51cf31afb88e	Coper	15.212	2ee650ab-8239-4202-a073-d51a8eb7eb23
b6ceacda-487c-47c5-9437-d2cd8d851610	Corrales	15.215	2ee650ab-8239-4202-a073-d51a8eb7eb23
8dbf563a-251a-455e-8eb3-11b60c8a0f94	Covarachía	15.218	2ee650ab-8239-4202-a073-d51a8eb7eb23
d63ef10d-f44e-41ed-955a-5656ad093135	Cubará	15.223	2ee650ab-8239-4202-a073-d51a8eb7eb23
a05cbfc3-8a43-40a4-943e-0dc30a8c6b7a	Cucaita	15.224	2ee650ab-8239-4202-a073-d51a8eb7eb23
e5c259c9-eecc-4884-9125-aa434caf5c24	Cuítiva	15.226	2ee650ab-8239-4202-a073-d51a8eb7eb23
58ae9fd0-3a4c-46f6-a9ba-cca94cd665c3	Duitama	15.238	2ee650ab-8239-4202-a073-d51a8eb7eb23
bcfe79d1-9b5e-4cbf-a0c8-802ad257038b	El Cocuy	15.244	2ee650ab-8239-4202-a073-d51a8eb7eb23
af13d0ca-25bc-41f5-9f18-407bed629eee	El Espino	15.248	2ee650ab-8239-4202-a073-d51a8eb7eb23
d39cfc11-b2ed-47db-8c3a-27ff77f6f21b	Firavitoba	15.272	2ee650ab-8239-4202-a073-d51a8eb7eb23
76e700c8-f2d2-4873-a26c-56fd2e49287e	Floresta	15.276	2ee650ab-8239-4202-a073-d51a8eb7eb23
da4b6079-4140-49c1-a66f-afb429d2074d	Gachantivá	15.293	2ee650ab-8239-4202-a073-d51a8eb7eb23
4716a88d-50f0-4b07-9a1e-1f9502166208	Gameza	15.296	2ee650ab-8239-4202-a073-d51a8eb7eb23
42563485-59b5-445e-a056-d1afbd7109b7	Garagoa	15.299	2ee650ab-8239-4202-a073-d51a8eb7eb23
91b4593e-e70d-4974-a6e4-41401d0ba001	Guacamayas	15.317	2ee650ab-8239-4202-a073-d51a8eb7eb23
d73db443-18cc-4f7f-88e0-8ddd97281f41	Guateque	15.322	2ee650ab-8239-4202-a073-d51a8eb7eb23
29d31126-7003-45fc-9751-3d191080e7b0	Guayatá	15.325	2ee650ab-8239-4202-a073-d51a8eb7eb23
8c66cfd2-715d-4220-aa26-1758b851277b	Güicán	15.332	2ee650ab-8239-4202-a073-d51a8eb7eb23
b4119a75-7512-44e7-a3c8-f11569751126	Iza	15.362	2ee650ab-8239-4202-a073-d51a8eb7eb23
d79a6680-131b-47e7-8891-bcb41f9e084e	Jenesano	15.367	2ee650ab-8239-4202-a073-d51a8eb7eb23
1eff4c66-68ac-4559-946a-97b0d1749bc6	Jericó	15.368	2ee650ab-8239-4202-a073-d51a8eb7eb23
349856aa-b25c-4e8e-92a6-e9c4e927ccf5	Labranzagrande	15.377	2ee650ab-8239-4202-a073-d51a8eb7eb23
6d1b55c4-7c85-488b-9ee0-daddd3f35ebe	La Capilla	15.38	2ee650ab-8239-4202-a073-d51a8eb7eb23
e0489a70-e019-43cf-b43a-9c630fc84a59	La Uvita	15.403	2ee650ab-8239-4202-a073-d51a8eb7eb23
d9407594-b2a3-44c6-b9cb-57d7bfe66501	La Victoria	15.401	2ee650ab-8239-4202-a073-d51a8eb7eb23
0dfa66a5-3e79-4132-9273-ebf6cea9e745	Macanal	15.425	2ee650ab-8239-4202-a073-d51a8eb7eb23
da4f0c8d-e3fe-4757-bec7-af32654e5ad5	Maripí	15.442	2ee650ab-8239-4202-a073-d51a8eb7eb23
4ee4007d-91b6-4a34-a52b-558943726ccb	Miraflores	15.455	2ee650ab-8239-4202-a073-d51a8eb7eb23
f93bce32-db3a-4a55-a15b-caa312d2a105	Mongua	15.464	2ee650ab-8239-4202-a073-d51a8eb7eb23
6eda456e-ee61-48c8-a840-c7c62457a0d5	Monguí	15.466	2ee650ab-8239-4202-a073-d51a8eb7eb23
511a9214-e217-4dc6-9570-ced01e22007d	Moniquirá	15.469	2ee650ab-8239-4202-a073-d51a8eb7eb23
d2a316de-6d1d-46bc-8c74-36d1d1a584b7	Motavita	15.476	2ee650ab-8239-4202-a073-d51a8eb7eb23
ced0e29a-c5c4-4337-9b21-f9c296cd50b0	Muzo	15.48	2ee650ab-8239-4202-a073-d51a8eb7eb23
eb554c14-5760-473d-9599-0bfd709d536a	Nobsa	15.491	2ee650ab-8239-4202-a073-d51a8eb7eb23
c83f23ba-42ab-4da2-89de-9854ea26a6fb	Nuevo Colón	15.494	2ee650ab-8239-4202-a073-d51a8eb7eb23
172e2108-aa59-4a57-ad54-c26d7770a26a	Oicatá	15.5	2ee650ab-8239-4202-a073-d51a8eb7eb23
4d122df7-e164-49c3-a33b-c3471ae42b3d	Otanche	15.507	2ee650ab-8239-4202-a073-d51a8eb7eb23
96861594-e89a-4a73-a80f-ad849e524d61	Pachavita	15.511	2ee650ab-8239-4202-a073-d51a8eb7eb23
1b6d86b9-9ee3-4bb7-bbf9-92dd8391d73f	Páez	15.514	2ee650ab-8239-4202-a073-d51a8eb7eb23
c1e665b3-11a6-49c4-8aea-d37cef901f52	Paipa	15.516	2ee650ab-8239-4202-a073-d51a8eb7eb23
d07e781c-7751-405e-8597-db1737301d86	Pajarito	15.518	2ee650ab-8239-4202-a073-d51a8eb7eb23
3c192847-bcbc-4084-ace3-23441fa50318	Panqueba	15.522	2ee650ab-8239-4202-a073-d51a8eb7eb23
8a07643a-2c10-466a-9b12-1fa99b64240e	Pauna	15.531	2ee650ab-8239-4202-a073-d51a8eb7eb23
88e2d6f6-dc3a-4d60-adec-1a039c8dcd91	Paya	15.533	2ee650ab-8239-4202-a073-d51a8eb7eb23
2565e8da-ab14-4eee-a524-1d447724f7e7	Paz de Río	15.537	2ee650ab-8239-4202-a073-d51a8eb7eb23
737b8102-b3ab-4dfe-9ed2-567965c756b2	Pesca	15.542	2ee650ab-8239-4202-a073-d51a8eb7eb23
22b1cd75-023a-48dc-bfb2-f7a0ece4e767	Pisba	15.55	2ee650ab-8239-4202-a073-d51a8eb7eb23
adcc4521-9199-4f68-9d61-856b59dce36c	Puerto Boyacá	15.572	2ee650ab-8239-4202-a073-d51a8eb7eb23
876f6cc2-ec15-461d-a99e-17da93641e35	Quípama	15.58	2ee650ab-8239-4202-a073-d51a8eb7eb23
b33e1a36-7e1d-4f2f-9def-fd64c6299e25	Ramiriquí	15.599	2ee650ab-8239-4202-a073-d51a8eb7eb23
c26a92f4-1910-4722-831c-6e8f0bd6bbc3	Ráquira	15.6	2ee650ab-8239-4202-a073-d51a8eb7eb23
e81915c2-808d-4697-a108-9c1a0bf00c9b	Rondón	15.621	2ee650ab-8239-4202-a073-d51a8eb7eb23
92e4fdd1-114c-4d3f-8125-ac9ae14bf5d2	Saboyá	15.632	2ee650ab-8239-4202-a073-d51a8eb7eb23
a583fe3a-92d1-4076-b939-d3d5b16a157c	Sáchica	15.638	2ee650ab-8239-4202-a073-d51a8eb7eb23
18d96828-ab61-486b-ae42-af796759acd2	Samacá	15.646	2ee650ab-8239-4202-a073-d51a8eb7eb23
848d3c63-ce69-4fcd-a70a-04b50fddb938	San Eduardo	15.66	2ee650ab-8239-4202-a073-d51a8eb7eb23
69e4c016-c2dc-4dee-ba78-da0c3e12a7d8	San José de Pare	15.664	2ee650ab-8239-4202-a073-d51a8eb7eb23
1e74d159-34df-466a-8996-b9615a2c6c88	San Luis de Gaceno	15.667	2ee650ab-8239-4202-a073-d51a8eb7eb23
76b3fca2-e8c1-4a4a-bea5-47a758aa93fe	San Mateo	15.673	2ee650ab-8239-4202-a073-d51a8eb7eb23
1633196c-de61-4353-ab21-9e2b1c558040	San Miguel de Sema	15.676	2ee650ab-8239-4202-a073-d51a8eb7eb23
7721ba67-8e6e-49eb-97fc-a6a87c1ec082	San Pablo de Borbur	15.681	2ee650ab-8239-4202-a073-d51a8eb7eb23
a6287703-951f-4482-909b-63e1d4164b6e	Santa María	15.69	2ee650ab-8239-4202-a073-d51a8eb7eb23
f0a9332a-a626-4c98-82e8-b06219472d6a	Santana	15.686	2ee650ab-8239-4202-a073-d51a8eb7eb23
f1b295a5-a135-4e57-836a-d43725ac3409	Santa Rosa de Viterbo	15.693	2ee650ab-8239-4202-a073-d51a8eb7eb23
d8559abb-0c66-4906-9c4f-b8eea6ce8558	Santa Sofía	15.696	2ee650ab-8239-4202-a073-d51a8eb7eb23
d842285d-ee4b-4d93-9d6b-f67089f1afea	Sativanorte	15.72	2ee650ab-8239-4202-a073-d51a8eb7eb23
e2ce029a-b2f7-4402-8fdc-6b6cb20a59bb	Sativasur	15.723	2ee650ab-8239-4202-a073-d51a8eb7eb23
c6ed0965-0d91-44dc-8aca-f6b61c97363a	Siachoque	15.74	2ee650ab-8239-4202-a073-d51a8eb7eb23
575ee803-571e-4649-b632-43c77a5212d2	Soatá	15.753	2ee650ab-8239-4202-a073-d51a8eb7eb23
8618070f-d6c5-4ff2-a75c-9da1032660fa	Socha	15.757	2ee650ab-8239-4202-a073-d51a8eb7eb23
7230976b-a723-40f6-a161-bb46a8d86b8f	Socotá	15.755	2ee650ab-8239-4202-a073-d51a8eb7eb23
52dccc0f-da08-44c2-9c08-cf27391c008d	Sogamoso	15.759	2ee650ab-8239-4202-a073-d51a8eb7eb23
5c4be77d-6616-40b6-9cd7-8fbb1c2b0804	Somondoco	15.761	2ee650ab-8239-4202-a073-d51a8eb7eb23
3b06ecf2-9ce7-4686-a57d-64d5eee6119e	Sora	15.762	2ee650ab-8239-4202-a073-d51a8eb7eb23
d7496986-ab37-4e25-af6a-2e438027ed15	Soracá	15.764	2ee650ab-8239-4202-a073-d51a8eb7eb23
be80942c-c1f8-418f-ae2f-5e72e528234f	Sotaquirá	15.763	2ee650ab-8239-4202-a073-d51a8eb7eb23
28c62aef-7381-4d45-a0a8-d19aa1959675	Susacón	15.774	2ee650ab-8239-4202-a073-d51a8eb7eb23
e466b795-5ca1-4b41-9f4f-c1e88ac69f42	Sutamarchán	15.776	2ee650ab-8239-4202-a073-d51a8eb7eb23
0014c48c-8e71-4029-bde0-86866d430196	Sutatenza	15.778	2ee650ab-8239-4202-a073-d51a8eb7eb23
7f354e6e-6f55-483b-b425-e988be12fbc4	Tasco	15.79	2ee650ab-8239-4202-a073-d51a8eb7eb23
54e6e244-5ac0-4096-9bb6-eca38d56cf1f	Tenza	15.798	2ee650ab-8239-4202-a073-d51a8eb7eb23
b174467c-b269-4bcb-bcf0-3dca7f031127	Tibaná	15.804	2ee650ab-8239-4202-a073-d51a8eb7eb23
3d442253-f8a3-48b3-bbe2-2b83ea3f6bb6	Tibasosa	15.806	2ee650ab-8239-4202-a073-d51a8eb7eb23
7b2348dd-40b4-476a-82b4-d39db00a1a37	Tinjacá	15.808	2ee650ab-8239-4202-a073-d51a8eb7eb23
e5353cf5-6bd9-4c58-9018-345ab8f25cf1	Tipacoque	15.81	2ee650ab-8239-4202-a073-d51a8eb7eb23
9a89ac34-adf2-423b-9583-4441e2b53f58	Toca	15.814	2ee650ab-8239-4202-a073-d51a8eb7eb23
65442440-0617-4afd-859b-2cea62f63bb6	Togüí	15.816	2ee650ab-8239-4202-a073-d51a8eb7eb23
c13faf6b-6d2f-4501-96c3-3cae6d1bfd54	Tópaga	15.82	2ee650ab-8239-4202-a073-d51a8eb7eb23
e0e156a7-4db5-4c2c-90e6-c3be53daeeab	Tota	15.822	2ee650ab-8239-4202-a073-d51a8eb7eb23
74f4567a-f6a9-4233-a511-4c87beb40cee	Tunja	15.001	2ee650ab-8239-4202-a073-d51a8eb7eb23
8707587a-c615-4c4a-aa09-3d5b075cf375	Tununguá	15.832	2ee650ab-8239-4202-a073-d51a8eb7eb23
dd69c9cc-9186-4c34-9eb4-209004d84cf5	Turmequé	15.835	2ee650ab-8239-4202-a073-d51a8eb7eb23
c2e3229e-09a0-4455-916d-85fcae1a58cc	Tuta	15.837	2ee650ab-8239-4202-a073-d51a8eb7eb23
f5267587-2952-43b2-8d94-ee142f078c7a	Tutazá	15.839	2ee650ab-8239-4202-a073-d51a8eb7eb23
1526a0e0-cda0-424e-9d0a-c3dbbf9bb382	Umbita	15.842	2ee650ab-8239-4202-a073-d51a8eb7eb23
4d1f54de-0e88-42f3-855d-991d4caba7f8	Ventaquemada	15.861	2ee650ab-8239-4202-a073-d51a8eb7eb23
746658cb-9b66-4163-910a-fa7f92bfe754	Villa de Leyva	15.407	2ee650ab-8239-4202-a073-d51a8eb7eb23
3a7b275e-1202-4787-87f9-34f61f96fde7	Viracachá	15.879	2ee650ab-8239-4202-a073-d51a8eb7eb23
da16f679-8e62-4308-84fe-c46136273726	Zetaquira	15.897	2ee650ab-8239-4202-a073-d51a8eb7eb23
27ba2e4c-c409-42c3-b324-81f1909834c2	Aguazul	85.01	1d15c002-bb94-421d-a51e-7daccf244b24
1a7b8faf-7b89-4366-800c-a267486a9b91	Chámeza	85.015	1d15c002-bb94-421d-a51e-7daccf244b24
7ffd4d9a-5166-4db3-8261-de7d839fe8ea	Hato Corozal	85.125	1d15c002-bb94-421d-a51e-7daccf244b24
9166d9e7-b3cb-4e5c-aec4-8d3180e101ea	La Salina	85.136	1d15c002-bb94-421d-a51e-7daccf244b24
5a3d8288-8044-47ec-a44a-a850aee83c94	Maní	85.139	1d15c002-bb94-421d-a51e-7daccf244b24
a6cf7cf8-dabd-4051-b54e-d5b46b40d8d2	Monterrey	85.162	1d15c002-bb94-421d-a51e-7daccf244b24
d60d0434-36ad-4f25-b786-8306cec69120	Nunchía	85.225	1d15c002-bb94-421d-a51e-7daccf244b24
5a1c0468-ff80-43f4-8c81-0670024e7fe5	Orocué	85.23	1d15c002-bb94-421d-a51e-7daccf244b24
28d24ed7-a39b-4a1d-8eac-670399fc4ffe	Paz de Ariporo	85.25	1d15c002-bb94-421d-a51e-7daccf244b24
ad65f58c-10af-4fd3-a9be-c231fe0e9082	Aguadas	17.013	5be53e60-f4c5-495c-a56e-37d2c2898542
b19cfa5d-fb34-4c82-8441-761bbeb30677	Anserma	17.042	5be53e60-f4c5-495c-a56e-37d2c2898542
1b5384a7-bde7-4df3-9556-f771237b9890	Aranzazu	17.05	5be53e60-f4c5-495c-a56e-37d2c2898542
fd414765-1392-4d31-b379-da9d28b9f250	Belalcázar	17.088	5be53e60-f4c5-495c-a56e-37d2c2898542
ed3bada7-9f59-4731-958d-8810eb0cd70d	Chinchiná	17.174	5be53e60-f4c5-495c-a56e-37d2c2898542
44314f06-c776-405a-a05d-f3dd73ebf808	Filadelfia	17.272	5be53e60-f4c5-495c-a56e-37d2c2898542
eb188d89-4a62-4d7c-8a17-bd36fb2e8960	La Dorada	17.38	5be53e60-f4c5-495c-a56e-37d2c2898542
bdb459b8-b839-4d09-87f7-62e6f1ac36d3	La Merced	17.388	5be53e60-f4c5-495c-a56e-37d2c2898542
c1b7b7de-c7d4-463d-9a9b-4391bde59a6a	Manizales	17.001	5be53e60-f4c5-495c-a56e-37d2c2898542
84ec49c4-e214-43b8-bc2d-e87cd753685c	Manzanares	17.433	5be53e60-f4c5-495c-a56e-37d2c2898542
756a2030-7d20-4f6c-be54-fa3146c06c6a	Marmato	17.442	5be53e60-f4c5-495c-a56e-37d2c2898542
12cefae3-d50c-4c95-a882-99fa3fcd0b7e	Marquetalia	17.444	5be53e60-f4c5-495c-a56e-37d2c2898542
fafd1810-fb0a-410d-b3a7-53d735a36677	Marulanda	17.446	5be53e60-f4c5-495c-a56e-37d2c2898542
e6d1c40e-9b2e-4a58-a373-199a9fe53eb5	Neira	17.486	5be53e60-f4c5-495c-a56e-37d2c2898542
07099d48-711d-496f-89cc-3e7868a6a0e9	Norcasia	17.495	5be53e60-f4c5-495c-a56e-37d2c2898542
1a22dd09-21f9-4651-b80b-2bc7f46e1ff3	Pácora	17.513	5be53e60-f4c5-495c-a56e-37d2c2898542
86f3a0c2-38eb-43aa-a837-a421ca328800	Palestina	17.524	5be53e60-f4c5-495c-a56e-37d2c2898542
cacd9aa6-c716-4f0b-a3a9-947c7c357a88	Pensilvania	17.541	5be53e60-f4c5-495c-a56e-37d2c2898542
5dca2910-6b05-4001-8489-5eb9ba4e7e6c	Riosucio	17.614	5be53e60-f4c5-495c-a56e-37d2c2898542
cb8518fd-5130-4b15-90c8-0181469fc10c	Risaralda	17.616	5be53e60-f4c5-495c-a56e-37d2c2898542
ab3d759a-66ad-401d-8eae-8c2f8bdba03c	Salamina	17.653	5be53e60-f4c5-495c-a56e-37d2c2898542
4b4b9dbf-c967-4bfa-bf91-7ab533e41958	Samaná	17.662	5be53e60-f4c5-495c-a56e-37d2c2898542
4a8dad54-999c-439c-942c-151a95a4749f	San José	17.665	5be53e60-f4c5-495c-a56e-37d2c2898542
0cb776ab-ace9-46fe-8f99-27fd5a5f2bc6	Supía	17.777	5be53e60-f4c5-495c-a56e-37d2c2898542
46775dee-27e3-465a-986d-c232023472f4	Victoria	17.867	5be53e60-f4c5-495c-a56e-37d2c2898542
730948f5-d028-4db6-9ac9-1b038a8f29ce	Villamaría	17.873	5be53e60-f4c5-495c-a56e-37d2c2898542
6737d73f-9a3c-4631-b857-03d7e8d48dec	Viterbo	17.877	5be53e60-f4c5-495c-a56e-37d2c2898542
38c1f84f-9fc9-4733-8acb-de3b8b20ab14	Ayapel	23.068	9fc9a068-261a-4514-9acb-70c2c3b90578
ca0de575-6cd4-46e6-bd61-02746cc55e30	Buenavista	23.079	9fc9a068-261a-4514-9acb-70c2c3b90578
c36bbe37-63df-4adf-ba19-38d600fd858d	Canalete	23.09	9fc9a068-261a-4514-9acb-70c2c3b90578
1a6105e7-1564-4699-acb8-c618a757b159	Cereté	23.162	9fc9a068-261a-4514-9acb-70c2c3b90578
11f5077c-677a-4bc0-a649-c4720beb9e64	Chimá	23.168	9fc9a068-261a-4514-9acb-70c2c3b90578
2ae85f57-bb3c-42bb-9e16-1fc3dfbd2157	Chinú	23.182	9fc9a068-261a-4514-9acb-70c2c3b90578
4da34c82-8063-4089-ab43-d1a5283bd459	Ciénaga de Oro	23.189	9fc9a068-261a-4514-9acb-70c2c3b90578
2dff24a9-6d7d-47ef-9743-e4db211c355b	Cotorra	23.3	9fc9a068-261a-4514-9acb-70c2c3b90578
ea165fc8-2a2a-45f6-8278-f710f908e9f9	La Apartada	23.35	9fc9a068-261a-4514-9acb-70c2c3b90578
72c452cd-e1ae-4e71-8c16-5b483025e68d	Lorica	23.417	9fc9a068-261a-4514-9acb-70c2c3b90578
e0f28cca-e62c-4bf1-be73-5e2bb37bd091	Los Córdobas	23.419	9fc9a068-261a-4514-9acb-70c2c3b90578
579ca6d4-6636-40d5-a29f-9184fa3d3b5a	Momil	23.464	9fc9a068-261a-4514-9acb-70c2c3b90578
e10d8a9b-7b39-4d1f-bb38-21d561c123d1	Moñitos	23.5	9fc9a068-261a-4514-9acb-70c2c3b90578
6222a85b-6bcd-47d0-ab6c-9b7ce5d9470f	Montelíbano	23.466	9fc9a068-261a-4514-9acb-70c2c3b90578
b4d935cd-39f6-4771-951b-044898e04c4e	Montería	23.001	9fc9a068-261a-4514-9acb-70c2c3b90578
7d9f282c-1e99-4f03-a34f-dd1e36dd0afd	Planeta Rica	23.555	9fc9a068-261a-4514-9acb-70c2c3b90578
12f5b742-faee-405b-bbd4-12641d03211d	Pueblo Nuevo	23.57	9fc9a068-261a-4514-9acb-70c2c3b90578
7a92f54e-c26b-4202-a571-ed27a9a59fe7	Puerto Escondido	23.574	9fc9a068-261a-4514-9acb-70c2c3b90578
7099452e-290c-4ef7-8e83-dc05c9792f5c	Puerto Libertador	23.58	9fc9a068-261a-4514-9acb-70c2c3b90578
0c1eef32-6ea9-45ed-9e35-cbc837152c7f	Purísima	23.586	9fc9a068-261a-4514-9acb-70c2c3b90578
cb2a5ee2-8260-411e-8af3-2f83a489ddc6	Sahagún	23.66	9fc9a068-261a-4514-9acb-70c2c3b90578
a1fda870-4407-4621-9c6f-26d0fd5781a3	San Andrés Sotavento	23.67	9fc9a068-261a-4514-9acb-70c2c3b90578
174c8122-613a-4151-a117-d64b5c0ea276	San Antero	23.672	9fc9a068-261a-4514-9acb-70c2c3b90578
af0199ba-92f8-48ce-b276-4345d6cd976b	San Bernardo del Viento	23.675	9fc9a068-261a-4514-9acb-70c2c3b90578
1928f3a2-654f-40de-b0ad-241742242506	San Carlos	23.678	9fc9a068-261a-4514-9acb-70c2c3b90578
96991444-763a-414f-b1b8-5c0e378463f7	San José de Uré	23.682	9fc9a068-261a-4514-9acb-70c2c3b90578
6a8c0897-26c0-43b7-9c59-46fbd2533596	San Pelayo	23.686	9fc9a068-261a-4514-9acb-70c2c3b90578
23da71ad-6b2d-4661-ab37-90cd38787337	Tierralta	23.807	9fc9a068-261a-4514-9acb-70c2c3b90578
06c6e549-f0af-4b00-9795-5bd0a01c1092	Tuchín	23.815	9fc9a068-261a-4514-9acb-70c2c3b90578
07d689c9-cf69-4133-be37-cddaddd72498	Valencia	23.855	9fc9a068-261a-4514-9acb-70c2c3b90578
d4bab1af-08ea-4004-b95a-06b34d60fae8	Acevedo	41.006	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
9004e94c-d753-405b-82ba-7c7bb50bfca7	Agrado	41.013	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
1be8b456-cd2f-42d8-b283-d33b10438c3c	Aipe	41.016	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
9b3c32db-cbe8-4cde-9c56-ff8f91b1a965	Algeciras	41.02	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
12e414ff-2477-4bef-94dd-b2212f792ddc	Altamira	41.026	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
bbabdc61-e926-4d2f-b197-c486e4e93cf8	Baraya	41.078	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
869dfe91-d74b-4a32-964b-7018c8fd760f	Campoalegre	41.132	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
aed5beeb-1398-469a-bbfe-a38c75c1bded	Colombia	41.206	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
62e7e8d9-0706-435f-93ff-c3e369dc964e	Elías	41.244	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
45466856-213c-441f-8787-304fb0144f41	Aguachica	20.011	38cd9c60-e9bc-415c-97de-ed976d14c0c1
e314e045-ecce-423d-b651-c7479257a46a	Agustín Codazzi	20.013	38cd9c60-e9bc-415c-97de-ed976d14c0c1
bd15cb80-c65a-42ff-8265-b8cca5d45a9e	Astrea	20.032	38cd9c60-e9bc-415c-97de-ed976d14c0c1
d7544597-947d-4f1f-bf4d-4e244b77dea5	Becerril	20.045	38cd9c60-e9bc-415c-97de-ed976d14c0c1
cf034fea-8c5a-4ff2-b402-e0f5c65a3742	Bosconia	20.06	38cd9c60-e9bc-415c-97de-ed976d14c0c1
edb5d066-4120-4100-a4a0-902bbbe25221	Chimichagua	20.175	38cd9c60-e9bc-415c-97de-ed976d14c0c1
1d355828-a4cd-401b-bbc1-39bdfde420c5	Chiriguaná	20.178	38cd9c60-e9bc-415c-97de-ed976d14c0c1
1f7d8077-8373-44ac-9d4c-fc33893365ff	Curumaní	20.228	38cd9c60-e9bc-415c-97de-ed976d14c0c1
ec4de587-8c6a-4a1f-b5d3-6ae85c47ba12	El Copey	20.238	38cd9c60-e9bc-415c-97de-ed976d14c0c1
656715c7-8e5e-4418-a483-cde41f18a12b	El Paso	20.25	38cd9c60-e9bc-415c-97de-ed976d14c0c1
a41fbf9f-54f2-4fd7-8721-f786757f0ca7	Gamarra	20.295	38cd9c60-e9bc-415c-97de-ed976d14c0c1
314302bd-c9b0-4023-bfc9-7bf6476cab7a	González	20.31	38cd9c60-e9bc-415c-97de-ed976d14c0c1
f08c6445-0eb1-417a-b29b-ba6674c8a975	La Gloria	20.383	38cd9c60-e9bc-415c-97de-ed976d14c0c1
682bdf62-1890-409a-b338-da0e6e556f5f	La Jagua de Ibirico	20.4	38cd9c60-e9bc-415c-97de-ed976d14c0c1
defcc1eb-7db0-4858-b755-2b51a667144a	La Paz	20.621	38cd9c60-e9bc-415c-97de-ed976d14c0c1
df475736-792a-40b9-8ecc-6723374650cc	Manaure	20.443	38cd9c60-e9bc-415c-97de-ed976d14c0c1
5d2c55a4-5fa4-4d53-b68d-133b320a869c	Pailitas	20.517	38cd9c60-e9bc-415c-97de-ed976d14c0c1
4abbc02d-ad03-456d-99d4-d8dd5107a531	Pelaya	20.55	38cd9c60-e9bc-415c-97de-ed976d14c0c1
21a1c8fb-133f-407c-90c8-2b042ee5a0b8	Pueblo Bello	20.57	38cd9c60-e9bc-415c-97de-ed976d14c0c1
65795b4f-34dc-40dd-8603-a64b5fc6bfdb	Río de Oro	20.614	38cd9c60-e9bc-415c-97de-ed976d14c0c1
f7654ce6-0ae7-49bf-9b43-d4f6a927a6a3	San Alberto	20.71	38cd9c60-e9bc-415c-97de-ed976d14c0c1
ab38ae58-9896-4d93-be4b-c1d6235c81b5	San Diego	20.75	38cd9c60-e9bc-415c-97de-ed976d14c0c1
d45ef44c-c66d-4fea-9c5c-80f4f4d56ce6	San Martín	20.77	38cd9c60-e9bc-415c-97de-ed976d14c0c1
83633e2d-e721-43a2-b247-8a89d26a42ae	Tamalameque	20.787	38cd9c60-e9bc-415c-97de-ed976d14c0c1
3e2545e8-77c8-411d-b3b4-ad48335f7012	Valledupar	20.001	38cd9c60-e9bc-415c-97de-ed976d14c0c1
d7ebe9a4-5775-4fdb-a7b0-28fe738973f8	Barranco Minas	94.343	41e76ec3-f260-462b-8269-97a43c3ce1cf
46b81d47-21ea-4ad5-b242-dc4930077c1e	Cacahual	94.886	41e76ec3-f260-462b-8269-97a43c3ce1cf
e3516da2-2d32-4bc8-9932-5ec654d81690	Inírida	94.001	41e76ec3-f260-462b-8269-97a43c3ce1cf
540d1ac2-90c4-4b6f-ba3d-d5c1f050aa23	La Guadalupe	94.885	41e76ec3-f260-462b-8269-97a43c3ce1cf
a2226781-bc4d-4aa6-aec3-a7bdb4cca74c	Mapiripana	94.663	41e76ec3-f260-462b-8269-97a43c3ce1cf
83eb3c98-5dfe-48bb-b477-52d5833253f3	Morichal	94.888	41e76ec3-f260-462b-8269-97a43c3ce1cf
eecebd05-1732-4476-9c24-57b7770ae0c1	Pana Pana	94.887	41e76ec3-f260-462b-8269-97a43c3ce1cf
717af617-d3ff-4f03-8674-b7b459f1dbe1	Puerto Colombia	94.884	41e76ec3-f260-462b-8269-97a43c3ce1cf
1aa0c8a8-5c8e-4fba-b3bc-f928b0c32e49	San Felipe	94.883	41e76ec3-f260-462b-8269-97a43c3ce1cf
8bc89102-14da-4213-9a3a-2add3ed4ca13	Albania	44.035	ee7eb36e-c558-4de8-a5fa-8793498415ac
b344201a-241f-42d5-83ce-321e127da4f3	Barrancas	44.078	ee7eb36e-c558-4de8-a5fa-8793498415ac
f7a2e7e0-8acf-4458-a3c4-b722f08eccd4	Dibula	44.09	ee7eb36e-c558-4de8-a5fa-8793498415ac
5b3bce4a-da87-4320-b927-6695b725e66d	Distracción	44.098	ee7eb36e-c558-4de8-a5fa-8793498415ac
b72167bd-b996-4629-b600-35bb78ba25a8	El Molino	44.11	ee7eb36e-c558-4de8-a5fa-8793498415ac
e070643c-213c-41c1-b624-3d22e4a11a37	Fonseca	44.279	ee7eb36e-c558-4de8-a5fa-8793498415ac
eaa1d675-0a7c-4476-830f-2a0c38cf44b3	Hatonuevo	44.378	ee7eb36e-c558-4de8-a5fa-8793498415ac
28544259-a3fe-45eb-a262-14e4fad79bd3	La Jagua del Pilar	44.42	ee7eb36e-c558-4de8-a5fa-8793498415ac
a62205ca-cfc7-4506-b1af-a03eb223225d	Maicao	44.43	ee7eb36e-c558-4de8-a5fa-8793498415ac
ba35b1f4-b69c-4f03-8893-2f4ab1af72ce	Manaure	44.56	ee7eb36e-c558-4de8-a5fa-8793498415ac
f63afdaf-ff72-4413-b16a-095c993f435a	Riohacha	44.001	ee7eb36e-c558-4de8-a5fa-8793498415ac
35e10c37-b02c-4e3a-9a76-4fa165012533	San Juan del Cesar	44.65	ee7eb36e-c558-4de8-a5fa-8793498415ac
2bf59836-9334-4066-aec2-7e53114c03eb	Uribia	44.847	ee7eb36e-c558-4de8-a5fa-8793498415ac
11bdaa35-39e6-4bcc-bfa2-370517637a06	Urumita	44.855	ee7eb36e-c558-4de8-a5fa-8793498415ac
55555fff-d42c-4fc6-b7a0-dcffa29712ed	Villanueva	44.874	ee7eb36e-c558-4de8-a5fa-8793498415ac
dcca40b9-2462-4027-bf90-fe01bb0b5aa2	Abrego	54.003	c75417a3-bc85-4b1a-a9d7-a54ae205daef
b1d33ae4-9dce-4130-a62c-d13dcb5fb3a6	Arboledas	54.051	c75417a3-bc85-4b1a-a9d7-a54ae205daef
6da65108-c43a-473d-8c79-c8fc1c8476cb	Bochalema	54.099	c75417a3-bc85-4b1a-a9d7-a54ae205daef
186c37ad-97f7-4cc5-91db-e7a4bfecef9e	Bucarasica	54.109	c75417a3-bc85-4b1a-a9d7-a54ae205daef
473f8579-8816-4868-9831-d2ab20b92736	Cachirá	54.128	c75417a3-bc85-4b1a-a9d7-a54ae205daef
6e12b8d3-95c5-4a25-b871-2789f512d39e	Cácota	54.125	c75417a3-bc85-4b1a-a9d7-a54ae205daef
7e46bb70-968b-4e3d-a4e0-1d5f64d65fed	Chinácota	54.172	c75417a3-bc85-4b1a-a9d7-a54ae205daef
92fb48d8-466a-40f7-9a60-03ef88132908	Chitagá	54.174	c75417a3-bc85-4b1a-a9d7-a54ae205daef
47022c9c-7771-4141-9950-60ee652387a2	Convención	54.206	c75417a3-bc85-4b1a-a9d7-a54ae205daef
608422c2-1a06-45b4-90eb-7af7e6b3c8b8	Cúcuta	54.001	c75417a3-bc85-4b1a-a9d7-a54ae205daef
0924555e-2640-4476-a1b0-64af8db60918	Cucutilla	54.223	c75417a3-bc85-4b1a-a9d7-a54ae205daef
1d4294df-4407-4ff6-9846-d000fc022f20	Durania	54.239	c75417a3-bc85-4b1a-a9d7-a54ae205daef
bcf09081-24d1-466c-9048-b296100316ba	El Carmen	54.245	c75417a3-bc85-4b1a-a9d7-a54ae205daef
c0eb835d-246a-401b-a59f-699d9b877324	El Tarra	54.25	c75417a3-bc85-4b1a-a9d7-a54ae205daef
4416f664-69e3-45c1-9aa6-efbb53ce0f31	El Zulia	54.261	c75417a3-bc85-4b1a-a9d7-a54ae205daef
6b95fd2e-0eb1-4c56-96f1-30d1d429395c	Gramalote	54.313	c75417a3-bc85-4b1a-a9d7-a54ae205daef
db6886ca-89d1-4f98-a23a-9aa987dbce7a	Hacarí	54.344	c75417a3-bc85-4b1a-a9d7-a54ae205daef
145ec793-415c-48e2-8ea4-46d536735080	Pore	85.263	1d15c002-bb94-421d-a51e-7daccf244b24
f3aa864a-9b6d-4fdf-a4a0-c55535bfc9de	Recetor	85.279	1d15c002-bb94-421d-a51e-7daccf244b24
51c38144-db68-4a2d-9a36-f588591e5fa3	Sabanalarga	85.3	1d15c002-bb94-421d-a51e-7daccf244b24
5e217de7-8815-4a54-b70a-08a8d562b898	Sácama	85.315	1d15c002-bb94-421d-a51e-7daccf244b24
16800145-8e84-48df-a736-091df896d192	San Luis de Gaceno	85.325	1d15c002-bb94-421d-a51e-7daccf244b24
67209edb-b7ea-4c5c-9ae3-9ba148061d8d	Támara	85.4	1d15c002-bb94-421d-a51e-7daccf244b24
52f33443-8fb5-44f2-98e8-a57045ba96a8	Tauramena	85.41	1d15c002-bb94-421d-a51e-7daccf244b24
3454e66f-2a77-4a44-a984-2c44175a413a	Trinidad	85.43	1d15c002-bb94-421d-a51e-7daccf244b24
645e6624-371e-41c3-af33-9563333bd76e	Villanueva	85.44	1d15c002-bb94-421d-a51e-7daccf244b24
997874ab-7812-441b-813f-5c2ecbe07790	Yopal	85.001	1d15c002-bb94-421d-a51e-7daccf244b24
8b535ec7-e736-49a3-bbdb-fa8f460a0f2c	Calamar	95.015	7d4496ea-e50b-4028-967c-ac3166384502
aa8af95b-5654-419b-b23c-2398ab2cf357	El Retorno	95.025	7d4496ea-e50b-4028-967c-ac3166384502
00b84e4c-9b80-450f-86fc-3bed561d32f0	Miraflores	95.2	7d4496ea-e50b-4028-967c-ac3166384502
095f5e10-1fef-4608-9586-deb996134126	San José del Guaviare	95.001	7d4496ea-e50b-4028-967c-ac3166384502
5bc36428-3ab8-4058-b1a2-49c57f920c3d	Armenia	63.001	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
2400e767-7ca9-4de3-bfca-470ce02cbfdc	Buenavista	63.111	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
01a0c040-94bc-496f-91ca-0654f5d3aa84	Calarcá	63.13	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
d0e02a50-8036-45ca-a683-b6d9a748b7a0	Circasia	63.19	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
2ec10019-44d6-468f-bffa-0a65fa31e61e	Córdoba	63.212	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
06834c26-454d-401f-adde-6e88be83e37b	Filandia	63.272	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
c2b24d71-c673-45e5-875c-b0276e54979a	Génova	63.302	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
6ccbd205-2aee-4988-857f-1e861d2feb48	La Tebaida	63.401	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
a7c91c3b-b893-42f6-829e-977c13d3158c	Montenegro	63.47	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
86d55761-84c6-47c4-80f4-d08bf158afdf	Pijao	63.548	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
0a1f4ddc-4883-42c5-b331-cc41f3b631fb	Quimbaya	63.594	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
08942767-2175-458d-9e65-5934d30f7838	Salento	63.69	48cdd7da-885f-4ac2-b8bf-a8a8cb35891d
f13b33bc-c3b1-4a6a-9784-01a34882b0bf	Alpujarra	73.024	50f482a3-3fbc-44d6-9881-be270ac7597b
37d420ae-0a17-4015-9621-9bc314d7e507	Alvarado	73.026	50f482a3-3fbc-44d6-9881-be270ac7597b
04f13f00-7a3e-4e25-a087-51b036087698	Ambalema	73.03	50f482a3-3fbc-44d6-9881-be270ac7597b
7f1579d6-1ce9-4f43-8726-0445cc51d603	Anzoátegui	73.043	50f482a3-3fbc-44d6-9881-be270ac7597b
07b9eb36-b0d5-47b5-9750-4a2febe43b7b	Armero	73.055	50f482a3-3fbc-44d6-9881-be270ac7597b
9d04d670-b924-4018-a5bf-610219c99412	Ataco	73.067	50f482a3-3fbc-44d6-9881-be270ac7597b
51cecf2e-1e57-4ef4-aaab-6bd2c0b58cc9	Cajamarca	73.124	50f482a3-3fbc-44d6-9881-be270ac7597b
4dbc60f7-0cce-49f4-ac63-ea093cf7a0c3	Carmen de Apicala	73.148	50f482a3-3fbc-44d6-9881-be270ac7597b
83bb74fa-9e15-4d5d-9d2d-cfeefc86bf25	Casabianca	73.152	50f482a3-3fbc-44d6-9881-be270ac7597b
6fa51abc-82e5-4055-9ef8-036e323fc5d3	Chaparral	73.168	50f482a3-3fbc-44d6-9881-be270ac7597b
3d3bd8b6-43e9-4b59-8bec-36e55a20e0d6	Coello	73.2	50f482a3-3fbc-44d6-9881-be270ac7597b
70f6acb2-d317-41e1-83c5-adfb3ccf61e5	Coyaima	73.217	50f482a3-3fbc-44d6-9881-be270ac7597b
1ca09b2e-9afa-4ac4-bede-afeff69b5130	Cunday	73.226	50f482a3-3fbc-44d6-9881-be270ac7597b
0ce1ce7e-b183-4ad7-8940-e7ae974c3e34	Dolores	73.236	50f482a3-3fbc-44d6-9881-be270ac7597b
1b536e0a-7542-4d04-b622-d16b794f743c	Espinal	73.268	50f482a3-3fbc-44d6-9881-be270ac7597b
fdefd5f4-a710-48df-919f-969b05e7fa57	Falan	73.27	50f482a3-3fbc-44d6-9881-be270ac7597b
f3ddd6b1-cbae-4ae0-b1ba-62689305c0cb	Flandes	73.275	50f482a3-3fbc-44d6-9881-be270ac7597b
3d140ef1-c5eb-4e75-bc25-3bc56792f364	Fresno	73.283	50f482a3-3fbc-44d6-9881-be270ac7597b
eaf2df64-c4e1-4264-a584-0c2336215ef9	Guamo	73.319	50f482a3-3fbc-44d6-9881-be270ac7597b
04500677-8398-42c3-be98-31983dd06bb5	Herveo	73.347	50f482a3-3fbc-44d6-9881-be270ac7597b
83bf8134-e2d1-43bb-a569-7fc8a74c86ff	Honda	73.349	50f482a3-3fbc-44d6-9881-be270ac7597b
9a9f9359-290b-41ac-a139-d7190b392965	Ibagué	73.001	50f482a3-3fbc-44d6-9881-be270ac7597b
1b43c850-fc87-490f-97f6-25481b71d46e	Icononzo	73.352	50f482a3-3fbc-44d6-9881-be270ac7597b
03be72be-03c2-46e1-8261-f0249d8bd6b9	Lérida	73.408	50f482a3-3fbc-44d6-9881-be270ac7597b
da5a6fc5-cc45-48e2-9693-ee4534edffb2	Líbano	73.411	50f482a3-3fbc-44d6-9881-be270ac7597b
5aa78fce-8f73-446f-a43f-39a45dcd004e	Mariquita	73.443	50f482a3-3fbc-44d6-9881-be270ac7597b
64390d40-299c-4b1e-b7ce-ee192fcd0b29	Melgar	73.449	50f482a3-3fbc-44d6-9881-be270ac7597b
b0e5c314-7e31-4589-9e5f-8777f227ce5d	Murillo	73.461	50f482a3-3fbc-44d6-9881-be270ac7597b
f5479543-5888-47a4-95bc-7432ef2d5326	Natagaima	73.483	50f482a3-3fbc-44d6-9881-be270ac7597b
39c5887d-03fc-4b26-9f19-0595d13b1ca9	Ortega	73.504	50f482a3-3fbc-44d6-9881-be270ac7597b
5b9c489d-67f9-4a43-9e9c-5701d9fe701b	Palocabildo	73.52	50f482a3-3fbc-44d6-9881-be270ac7597b
c0cbdf69-1f15-40e6-be56-1c740f2fb094	Piedras	73.547	50f482a3-3fbc-44d6-9881-be270ac7597b
7c299cc5-0801-448f-83b1-a75709857b70	Planadas	73.555	50f482a3-3fbc-44d6-9881-be270ac7597b
566d1dbe-a803-448e-a9c3-c5f1cda39ca1	Prado	73.563	50f482a3-3fbc-44d6-9881-be270ac7597b
a9d502c1-9990-4b9e-ac70-b67a62066d2a	Purificación	73.585	50f482a3-3fbc-44d6-9881-be270ac7597b
7f7cf656-f3b9-44a6-8ba4-6c54d16dfa7b	Rio Blanco	73.616	50f482a3-3fbc-44d6-9881-be270ac7597b
2abaa479-6b9a-4732-af65-051e9e0e101e	Roncesvalles	73.622	50f482a3-3fbc-44d6-9881-be270ac7597b
1cfebb5e-d635-411b-b8f3-85b58ac772d6	Rovira	73.624	50f482a3-3fbc-44d6-9881-be270ac7597b
1db23465-46c0-423b-b2e5-9a3528105d68	Saldaña	73.671	50f482a3-3fbc-44d6-9881-be270ac7597b
b7901490-e0ac-4a82-89ed-31e990115577	San Antonio	73.675	50f482a3-3fbc-44d6-9881-be270ac7597b
fd55db17-c39e-41c3-a805-c4f914151dc0	Chía	25.175	0db93e16-343b-4f1d-a86d-c485874d057f
20d4b79c-0f13-4154-bb53-68f424fba161	Chipaque	25.178	0db93e16-343b-4f1d-a86d-c485874d057f
c00d05bc-7fb8-4f59-b219-875c20b91c01	Choachí	25.181	0db93e16-343b-4f1d-a86d-c485874d057f
7ef09e79-212e-4523-acc0-a2ea58ccd1d1	Chocontá	25.183	0db93e16-343b-4f1d-a86d-c485874d057f
28639e6a-a999-4a0d-be61-65c4caa44465	Cogua	25.2	0db93e16-343b-4f1d-a86d-c485874d057f
0a95b557-537b-437a-9f19-d99242516d93	Cota	25.214	0db93e16-343b-4f1d-a86d-c485874d057f
3d82ca1d-876f-409f-b24e-af265a73eb96	Cucunubá	25.224	0db93e16-343b-4f1d-a86d-c485874d057f
33c2cbec-50c4-4021-9fc1-758ec4ac6f8c	El Colegio	25.245	0db93e16-343b-4f1d-a86d-c485874d057f
eec4684c-4127-4035-ae02-b401efd58319	El Peñón	25.258	0db93e16-343b-4f1d-a86d-c485874d057f
afa5a561-3c2c-4dc0-ad93-b73a986efa68	El Rosal	25.26	0db93e16-343b-4f1d-a86d-c485874d057f
77b3f47d-b4e0-4734-8e66-50e2bf249f00	Facatativá	25.269	0db93e16-343b-4f1d-a86d-c485874d057f
25748a73-5251-4c5c-9a89-4d3ab9b1a3f5	Fomeque	25.279	0db93e16-343b-4f1d-a86d-c485874d057f
91b97c8b-f2f2-4878-8709-d2f47e2f13ae	Fosca	25.281	0db93e16-343b-4f1d-a86d-c485874d057f
82c93e4a-b722-409e-af37-2ab45b3d5861	Funza	25.286	0db93e16-343b-4f1d-a86d-c485874d057f
b04e2c72-5bc9-4162-867c-498ea3e2dc59	Fúquene	25.288	0db93e16-343b-4f1d-a86d-c485874d057f
d8c4926a-f15f-45be-8646-a44432c60350	Fusagasugá	25.29	0db93e16-343b-4f1d-a86d-c485874d057f
499e674d-77a9-4925-90c7-885d1ef080cc	Gachala	25.293	0db93e16-343b-4f1d-a86d-c485874d057f
a1254f43-4f57-442b-935f-b12257a78dd8	Gachancipá	25.295	0db93e16-343b-4f1d-a86d-c485874d057f
364188f1-5a66-4f40-a8bc-c0a85d096fd0	Gachetá	25.297	0db93e16-343b-4f1d-a86d-c485874d057f
ac693d9c-59ba-440e-8f40-96c5a1293e7d	Gama	25.299	0db93e16-343b-4f1d-a86d-c485874d057f
2de5973e-7e7c-4edd-9061-1001e434c6f7	Girardot	25.307	0db93e16-343b-4f1d-a86d-c485874d057f
f8dee724-49cc-43f4-ae82-556a9f22ff7f	Granada	25.312	0db93e16-343b-4f1d-a86d-c485874d057f
42212579-87f1-4e2b-b848-101927859b99	Guachetá	25.317	0db93e16-343b-4f1d-a86d-c485874d057f
80a761bb-7442-4ec6-97b1-df74fe86ff34	Guaduas	25.32	0db93e16-343b-4f1d-a86d-c485874d057f
e05ef07e-cbad-41ec-835d-9c2c51835d54	Guasca	25.322	0db93e16-343b-4f1d-a86d-c485874d057f
ff8e54a7-a1fc-4d61-97ad-48a8b7ed4e9d	Guataquí	25.324	0db93e16-343b-4f1d-a86d-c485874d057f
8007a768-d4ab-4772-af26-7dd2fc87adae	Guatavita	25.326	0db93e16-343b-4f1d-a86d-c485874d057f
f6751f51-9672-4373-88a6-7c439aa4723f	Guayabal de Siquima	25.328	0db93e16-343b-4f1d-a86d-c485874d057f
ab2c0338-55d7-44cb-ba3f-a0a5af39e917	Guayabetal	25.335	0db93e16-343b-4f1d-a86d-c485874d057f
6d5e2517-a555-4cb1-a3dc-083f268447ed	Gutiérrez	25.339	0db93e16-343b-4f1d-a86d-c485874d057f
2cc2608c-fb29-4552-969d-815c7b5f8171	Jerusalén	25.368	0db93e16-343b-4f1d-a86d-c485874d057f
09bc0cec-e35c-45e5-9e71-8faa6b80e598	Junín	25.372	0db93e16-343b-4f1d-a86d-c485874d057f
a1fbd16a-7fa9-4a6f-9545-76deb54660f4	La Calera	25.377	0db93e16-343b-4f1d-a86d-c485874d057f
de4e7c2d-e4c5-42a5-b902-63a4c15bc14e	La Mesa	25.386	0db93e16-343b-4f1d-a86d-c485874d057f
9bafdfae-be8c-45b4-a0fb-2efe6cc845e0	La Palma	25.394	0db93e16-343b-4f1d-a86d-c485874d057f
af7125fe-4a49-40da-a303-19ef61ddd344	La Peña	25.398	0db93e16-343b-4f1d-a86d-c485874d057f
b5ce8139-3d8b-4787-89f9-cc9d14ead508	La Vega	25.402	0db93e16-343b-4f1d-a86d-c485874d057f
680e8cd5-9219-4c63-a9d7-d54626760b65	Lenguazaque	25.407	0db93e16-343b-4f1d-a86d-c485874d057f
3f501d93-9b70-44d4-b50e-7fc6f85b8b2d	Macheta	25.426	0db93e16-343b-4f1d-a86d-c485874d057f
eb388310-e35d-4f4c-ac57-700f451c519b	Madrid	25.43	0db93e16-343b-4f1d-a86d-c485874d057f
dc9e5b85-44a1-48a4-be5f-76f00dc1d0ff	Manta	25.436	0db93e16-343b-4f1d-a86d-c485874d057f
28dbca88-f36f-4b4f-a2fb-4ae313cd399d	Medina	25.438	0db93e16-343b-4f1d-a86d-c485874d057f
a3e05f05-3a0f-43ab-b4a7-29ee995e5013	Mosquera	25.473	0db93e16-343b-4f1d-a86d-c485874d057f
546369ed-18d5-468f-b0ec-b4814771791d	Nariño	25.483	0db93e16-343b-4f1d-a86d-c485874d057f
589e2ea0-9dd1-4623-8299-713cb4c02a38	Nemocón	25.486	0db93e16-343b-4f1d-a86d-c485874d057f
cbd1267e-ae31-4f5d-a91c-701377faa9f8	Nilo	25.488	0db93e16-343b-4f1d-a86d-c485874d057f
5333a807-f05e-4150-a45c-bf5286e82188	Nimaima	25.489	0db93e16-343b-4f1d-a86d-c485874d057f
ccbc057d-4452-46bf-a310-082d4ddfa470	Nocaima	25.491	0db93e16-343b-4f1d-a86d-c485874d057f
3f0f3a55-b33d-4b91-ab20-535403b547c9	Pacho	25.513	0db93e16-343b-4f1d-a86d-c485874d057f
1c4141c3-73f8-4dad-9ed3-5103fb47e0ba	Paime	25.518	0db93e16-343b-4f1d-a86d-c485874d057f
f6065218-25e3-43a0-916e-fde0f14a2959	Pandi	25.524	0db93e16-343b-4f1d-a86d-c485874d057f
330c0dbf-286c-47c0-b524-dbfa22f0f26b	Paratebueno	25.53	0db93e16-343b-4f1d-a86d-c485874d057f
1eedbe57-b677-4f71-baf0-9635b332407d	Pasca	25.535	0db93e16-343b-4f1d-a86d-c485874d057f
c6d0e48c-f72e-46d9-9635-a52dc29272e8	Puerto Salgar	25.572	0db93e16-343b-4f1d-a86d-c485874d057f
cfc568ed-ae85-465d-bfc0-603b8fb920d5	Pulí	25.58	0db93e16-343b-4f1d-a86d-c485874d057f
2e9184b9-0f7d-461a-9157-753cf8da08dd	Quebradanegra	25.592	0db93e16-343b-4f1d-a86d-c485874d057f
4c0d66ec-3446-4779-935f-d93ae0e6d632	Quetame	25.594	0db93e16-343b-4f1d-a86d-c485874d057f
d6424aa6-96e1-42c5-b3f0-259500c8f224	Quipile	25.596	0db93e16-343b-4f1d-a86d-c485874d057f
2bd2dbd2-75fd-4abd-ac27-ccff91bf8d5c	Ricaurte	25.612	0db93e16-343b-4f1d-a86d-c485874d057f
3fe8c5f5-6557-4960-b922-2073b9c49c8e	San Antonio del Tequendama	25.645	0db93e16-343b-4f1d-a86d-c485874d057f
98317474-66ea-41a9-800c-0a4fc8c26ab5	San Bernardo	25.649	0db93e16-343b-4f1d-a86d-c485874d057f
9f1ae0e7-5bcb-44fc-9726-d51c1187acc7	San Cayetano	25.653	0db93e16-343b-4f1d-a86d-c485874d057f
3eddc479-5621-48b6-a851-2271cf5f6782	San Francisco	25.658	0db93e16-343b-4f1d-a86d-c485874d057f
49be6bd4-1882-4d00-ac7f-cfc3ce9dd4b0	San Juan de Río Seco	25.662	0db93e16-343b-4f1d-a86d-c485874d057f
fc7cebbc-ad9d-40a9-9971-c7de6673a2eb	Sasaima	25.718	0db93e16-343b-4f1d-a86d-c485874d057f
b10dadc2-60f6-40af-a045-e8ec45520673	Sesquilé	25.736	0db93e16-343b-4f1d-a86d-c485874d057f
04de8e97-0aba-430d-914f-64eca8f650ea	Sibaté	25.74	0db93e16-343b-4f1d-a86d-c485874d057f
50002db7-a909-46dc-94d4-8e6ad4a68a4d	Silvania	25.743	0db93e16-343b-4f1d-a86d-c485874d057f
39d8d527-b3a9-4d84-ac3b-dcc555d791c6	Simijaca	25.745	0db93e16-343b-4f1d-a86d-c485874d057f
5a52682f-1846-4167-a141-43e503912e98	Soacha	25.754	0db93e16-343b-4f1d-a86d-c485874d057f
c6aaa7c7-e735-4718-828a-f05bef588b10	Sopó	25.758	0db93e16-343b-4f1d-a86d-c485874d057f
4e829e39-fbcd-406f-b231-c9657d5c60c6	Subachoque	25.769	0db93e16-343b-4f1d-a86d-c485874d057f
c93c2cf0-bfee-4067-bd98-8d319449fbed	Suesca	25.772	0db93e16-343b-4f1d-a86d-c485874d057f
aea30728-254c-4402-89ff-26c7cc9c0a3d	Supatá	25.777	0db93e16-343b-4f1d-a86d-c485874d057f
45bbf528-da16-4320-aa68-4db4f7c8e55b	Susa	25.779	0db93e16-343b-4f1d-a86d-c485874d057f
74ac1ce9-632a-45c2-8335-43e6e0eec0d2	Sutatausa	25.781	0db93e16-343b-4f1d-a86d-c485874d057f
1ae06c61-d71b-49df-9edd-95a6e0cc5855	Tabio	25.785	0db93e16-343b-4f1d-a86d-c485874d057f
16c2d5e4-1ec7-4c13-8498-c95ce9bfb10d	Tausa	25.793	0db93e16-343b-4f1d-a86d-c485874d057f
321688a9-a76b-42e2-8de4-9175072374b3	Tena	25.797	0db93e16-343b-4f1d-a86d-c485874d057f
073c0c63-43c8-4ca6-a8ea-3ba206085709	Tenjo	25.799	0db93e16-343b-4f1d-a86d-c485874d057f
23bf1fd5-797e-4e9b-9662-2ffb7e147ff5	Tibacuy	25.805	0db93e16-343b-4f1d-a86d-c485874d057f
2add1114-d30e-4086-a43d-a45a731c1a87	Tibirita	25.807	0db93e16-343b-4f1d-a86d-c485874d057f
a7cdad4d-8c47-4a45-9fc2-087565819198	Tocaima	25.815	0db93e16-343b-4f1d-a86d-c485874d057f
5bc60c77-82bc-410c-9d24-dd771c8fe565	Tocancipá	25.817	0db93e16-343b-4f1d-a86d-c485874d057f
7eb0f266-6194-4119-9438-e46eeff1d0e5	Topaipí	25.823	0db93e16-343b-4f1d-a86d-c485874d057f
1e60deba-1f47-42db-9f0b-86f97fc4cd04	Ubalá	25.839	0db93e16-343b-4f1d-a86d-c485874d057f
d8f29f6d-fc47-484f-be3b-d356d6159955	Ubaque	25.841	0db93e16-343b-4f1d-a86d-c485874d057f
a9691c4d-dd7f-4bef-a960-f44b4be0e756	Une	25.845	0db93e16-343b-4f1d-a86d-c485874d057f
637e0194-6dcd-4baf-938d-5bed2fddd0d9	Útica	25.851	0db93e16-343b-4f1d-a86d-c485874d057f
4c3f0f78-cb34-4942-b560-2ce47f1e05c5	Venecia	25.506	0db93e16-343b-4f1d-a86d-c485874d057f
c8d972e1-f949-43ff-9dc7-be8fba3832dd	Vergara	25.862	0db93e16-343b-4f1d-a86d-c485874d057f
1fe35bf5-d79d-449b-9a67-3e5917cff6d8	Vianí	25.867	0db93e16-343b-4f1d-a86d-c485874d057f
9ea2d835-ddcd-4453-b1f8-62aa7536131e	Villa de San Diego de Ubate	25.843	0db93e16-343b-4f1d-a86d-c485874d057f
d5916563-2f15-4adf-b38d-dc12865d6018	Villagómez	25.871	0db93e16-343b-4f1d-a86d-c485874d057f
400130a8-27a8-4ef8-a17a-cf03730f58c6	Villapinzón	25.873	0db93e16-343b-4f1d-a86d-c485874d057f
edaee903-bf97-4171-b3de-07e4f74541c0	Villeta	25.875	0db93e16-343b-4f1d-a86d-c485874d057f
40a79ec7-f15d-423a-825b-8e35e23c38be	Viotá	25.878	0db93e16-343b-4f1d-a86d-c485874d057f
2640f364-d3cd-42c3-af30-7886f5e1a6b3	Yacopí	25.885	0db93e16-343b-4f1d-a86d-c485874d057f
0b7d028e-d2ab-4ac7-96e5-58ab7d385909	Zipacón	25.898	0db93e16-343b-4f1d-a86d-c485874d057f
b72330b7-7ff7-4aea-888c-8ca89b59a9c1	Zipaquirá	25.899	0db93e16-343b-4f1d-a86d-c485874d057f
6552f1cb-49cb-4ecd-b88d-86326b3877c2	Albán	52.019	780747c7-74e9-4e62-a06c-22958851e66a
85ce1687-9ab3-4435-aa81-d1798b61052b	Aldana	52.022	780747c7-74e9-4e62-a06c-22958851e66a
08e92520-17f7-466d-86eb-0c79a0d2f954	Ancuyá	52.036	780747c7-74e9-4e62-a06c-22958851e66a
75159144-8e2c-46b7-9163-620a9dbf9017	Arboleda	52.051	780747c7-74e9-4e62-a06c-22958851e66a
dc831444-3fd1-4230-9a6e-a612bea095b4	Barbacoas	52.079	780747c7-74e9-4e62-a06c-22958851e66a
4b06a350-9ae4-494a-ad76-f096b1e0d967	Belén	52.083	780747c7-74e9-4e62-a06c-22958851e66a
44cd5877-ac35-411c-ab36-ca9bf839856e	Buesaco	52.11	780747c7-74e9-4e62-a06c-22958851e66a
db1d13e7-ec18-44e8-9fdb-0b924ee2b377	Chachagüí	52.24	780747c7-74e9-4e62-a06c-22958851e66a
e204ecbf-5124-4c5e-92eb-49c0aa080382	Colón	52.203	780747c7-74e9-4e62-a06c-22958851e66a
e90ed387-9d35-4ae1-b622-2e733d3e705a	Consaca	52.207	780747c7-74e9-4e62-a06c-22958851e66a
fb55b117-0d05-49cc-accf-baef5d289615	Contadero	52.21	780747c7-74e9-4e62-a06c-22958851e66a
a1ed67d4-eb92-4e36-84bf-7867bcbe50fb	Córdoba	52.215	780747c7-74e9-4e62-a06c-22958851e66a
266bbac3-6e75-4c78-a053-948488855db3	Cuaspud	52.224	780747c7-74e9-4e62-a06c-22958851e66a
6d0f8fef-2059-4fac-abaf-ebb0c7f3a928	Cumbal	52.227	780747c7-74e9-4e62-a06c-22958851e66a
35674f1a-8d8c-47b9-ac49-514686897909	Cumbitara	52.233	780747c7-74e9-4e62-a06c-22958851e66a
8874f9fc-73b4-45c1-a9b1-4202de1b3e17	El Charco	52.25	780747c7-74e9-4e62-a06c-22958851e66a
c14869c3-b6ee-4a31-bcbb-551d2c824f6a	El Peñol	52.254	780747c7-74e9-4e62-a06c-22958851e66a
f549331c-0bb0-4d6a-acd6-ee2755ae4d6f	El Rosario	52.256	780747c7-74e9-4e62-a06c-22958851e66a
fd1d3b14-b83b-4501-98ed-7bdc1228733f	El Tablón de Gómez	52.258	780747c7-74e9-4e62-a06c-22958851e66a
d006457b-1fb1-465a-922e-0e742a876861	El Tambo	52.26	780747c7-74e9-4e62-a06c-22958851e66a
af0d5a7a-e58a-451b-b42e-d213a0ad2945	Francisco Pizarro	52.52	780747c7-74e9-4e62-a06c-22958851e66a
430de255-b5d2-4d1d-a3c5-ed6176712e14	Funes	52.287	780747c7-74e9-4e62-a06c-22958851e66a
93499daa-2b07-404f-a1df-622b495dbced	Guachucal	52.317	780747c7-74e9-4e62-a06c-22958851e66a
ee405384-c1ca-40ee-b6e9-e2a0a97337d3	Guaitarilla	52.32	780747c7-74e9-4e62-a06c-22958851e66a
96b7bf8f-de9d-47b5-a94c-8e07a51ebdac	Gualmatán	52.323	780747c7-74e9-4e62-a06c-22958851e66a
5cd01867-7f54-44be-9a2f-76121eb9b3bf	Iles	52.352	780747c7-74e9-4e62-a06c-22958851e66a
ac25cbcc-1731-4645-81b5-ff8f92eb3f02	Imués	52.354	780747c7-74e9-4e62-a06c-22958851e66a
7c8a9206-0773-496f-8094-a720af6c7074	Ipiales	52.356	780747c7-74e9-4e62-a06c-22958851e66a
4c6b6dd9-2ad8-4f77-9e3d-a87eaae6bd11	La Cruz	52.378	780747c7-74e9-4e62-a06c-22958851e66a
8d205c5e-58e9-4339-99e8-b0e441818b51	La Florida	52.381	780747c7-74e9-4e62-a06c-22958851e66a
ba14f371-a221-4c3e-a851-9ac4e0180e6b	La Llanada	52.385	780747c7-74e9-4e62-a06c-22958851e66a
cbf51b95-5a19-496a-8b45-4b3349e5176b	La Tola	52.39	780747c7-74e9-4e62-a06c-22958851e66a
51298dcc-fc6f-4369-885c-b26d72af0853	La Unión	52.399	780747c7-74e9-4e62-a06c-22958851e66a
d1eb34d4-3757-4ecd-943e-7f0c21461458	Nueva Granada	47.46	3d71474c-67e5-4760-92a4-e9b599911267
89497f99-65a9-48f6-a4ba-62aea3cbfd91	Pedraza	47.541	3d71474c-67e5-4760-92a4-e9b599911267
9c44341d-0fcf-424b-9722-55ee8317f053	Pijiño del Carmen	47.545	3d71474c-67e5-4760-92a4-e9b599911267
7ab503a9-d2ba-4817-94fe-1fef97db9e50	Pivijay	47.551	3d71474c-67e5-4760-92a4-e9b599911267
1cf85e00-61f5-48d4-90bd-2389455e98c5	Plato	47.555	3d71474c-67e5-4760-92a4-e9b599911267
b3782d8b-37cd-431a-ac7c-efed4b17dd12	Pueblo Viejo	47.57	3d71474c-67e5-4760-92a4-e9b599911267
91778ab5-ae4d-4149-a07a-b04b3be7dfff	Remolino	47.605	3d71474c-67e5-4760-92a4-e9b599911267
c74cd5d3-a401-45fe-959a-6a379d16e1a5	Sabanas de San Angel	47.66	3d71474c-67e5-4760-92a4-e9b599911267
1267e099-baca-42ce-8247-ed4e48f58ddd	Salamina	47.675	3d71474c-67e5-4760-92a4-e9b599911267
d00ec977-df18-4389-b088-4ba2ab36253a	San Sebastián de Buenavista	47.692	3d71474c-67e5-4760-92a4-e9b599911267
dc5a3e3f-7788-44df-a366-ce870109c2e7	Santa Ana	47.707	3d71474c-67e5-4760-92a4-e9b599911267
3ec10f7e-e906-40ce-8af9-6aab2dce5f4f	Santa Bárbara de Pinto	47.72	3d71474c-67e5-4760-92a4-e9b599911267
140a38c8-ba20-4ccc-a420-2957de3a1480	Santa Marta	47.001	3d71474c-67e5-4760-92a4-e9b599911267
73d6c8c9-e19e-4314-a3ae-0e2c57a8fa00	San Zenón	47.703	3d71474c-67e5-4760-92a4-e9b599911267
2dc86e0f-730e-4383-a479-bb75031fffb4	Sitionuevo	47.745	3d71474c-67e5-4760-92a4-e9b599911267
2c9649a2-819d-41b9-982d-01f9d7d064e8	Tenerife	47.798	3d71474c-67e5-4760-92a4-e9b599911267
7e5a117c-b3fa-409f-b6d4-2b7c4ba49d3b	Zapayán	47.96	3d71474c-67e5-4760-92a4-e9b599911267
6256fc70-8b05-4cb3-b842-985735fbb96c	Zona Bananera	47.98	3d71474c-67e5-4760-92a4-e9b599911267
f4b77a90-a295-4840-965f-713b0b4f7f40	Acacias	50.006	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
47a2f248-a532-4cee-aaa0-c4df9a3610fd	Barranca de Upía	50.11	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
e10668b6-d16b-4677-8b1e-84c91338a821	Cabuyaro	50.124	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
cc8bf4f4-290c-48a8-b509-1dc7a504a371	Castilla la Nueva	50.15	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
8298c1e6-2b25-426d-a62b-06364876af19	Cubarral	50.223	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
9188002d-52ed-4f09-9cc4-1d0eab1d5d48	Cumaral	50.226	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
c50cdabc-0d7a-4959-a114-adda239aa482	El Calvario	50.245	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
59d19750-b0ce-421d-9ffa-c4ab2216df01	El Castillo	50.251	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
d09db598-af0b-4bcb-867c-30b526972c92	El Dorado	50.27	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
54a66f81-0b8a-4e7a-a487-e227463ba7b3	Fuente de Oro	50.287	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
ffc5d241-4f46-4bc6-83fe-f5124c014fbb	Granada	50.313	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
cf191940-5863-4aa2-a8af-3e8b99131ebd	Guamal	50.318	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
facadf54-117a-4230-98a1-e634d4d85032	La Macarena	50.35	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
a79c2b54-8c4d-493c-bd6a-d6b2fb200ac1	Lejanías	50.4	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
b46b06f5-0b54-4be9-a22d-282a9c81f2d7	Mapiripán	50.325	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
5fe84e8f-2514-4dc4-956c-e53d40aa5108	Mesetas	50.33	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
4a84c5cc-962a-40f0-8b6e-0fa837e4e628	Puerto Concordia	50.45	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
29810f8e-64c2-4f2a-bd10-1673ef17ddce	Puerto Gaitán	50.568	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
43bdb8d7-0f2c-4087-a7dc-327f6dc1e10b	Puerto Lleras	50.577	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
bff84e76-ee39-4b63-9512-c6b5e62fd51a	Puerto López	50.573	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
a3e0d34e-79f3-4622-866e-19bbb6b7f036	Puerto Rico	50.59	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
f2a084be-d99f-4555-b94f-14948214f18a	Restrepo	50.606	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
4132886e-30af-413a-b4fd-b13e20e05987	San Carlos de Guaroa	50.68	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
ceef5e9d-fb2c-4615-a271-89486e2f9649	San Juan de Arama	50.683	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
2e1c6ba5-d85a-42e3-aba7-497c01834d76	San Juanito	50.686	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
d3e48f45-af1c-47f4-83cf-79f2097d1e98	San Martín	50.689	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
360d3984-e0a2-4343-8bda-fdc395c05c1e	Uribe	50.37	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
9cf6b096-03ed-45b5-b77a-feee032366bb	Villavicencio	50.001	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
40cb9bb0-63f7-460a-b364-4b6a3a846df6	Vista Hermosa	50.711	52ab49ad-737e-40fb-8e02-3b7c542bdbd5
3a475100-142f-4077-a401-16b7d83fe584	Aguada	68.013	a2d305b3-0d04-4275-bfe6-659790a540b1
317759f7-c552-41fc-9547-d55936b74ffa	Albania	68.02	a2d305b3-0d04-4275-bfe6-659790a540b1
c059c241-cd08-48fc-aae5-bee9a8cd743a	Aratoca	68.051	a2d305b3-0d04-4275-bfe6-659790a540b1
285e0199-8e90-40bd-a30c-b49078dfc722	Barbosa	68.077	a2d305b3-0d04-4275-bfe6-659790a540b1
e141bf85-1d9d-49fe-9a2c-588e5d45e76a	Barichara	68.079	a2d305b3-0d04-4275-bfe6-659790a540b1
5d10f686-6889-4a61-9d8d-7b2f3033ccd8	Barrancabermeja	68.081	a2d305b3-0d04-4275-bfe6-659790a540b1
847d7eb0-0439-4157-a378-8dab658790c8	Betulia	68.092	a2d305b3-0d04-4275-bfe6-659790a540b1
2112fd1b-d243-4435-baaf-9b622ebcb361	Bolívar	68.101	a2d305b3-0d04-4275-bfe6-659790a540b1
089d6885-1f21-4cde-9e93-92f4bf478273	Bucaramanga	68.001	a2d305b3-0d04-4275-bfe6-659790a540b1
90d01fdb-ca73-4be5-9dbb-5a944dcdf276	Cabrera	68.121	a2d305b3-0d04-4275-bfe6-659790a540b1
a9121ebd-4487-4204-9dc0-8eee09c5cd43	California	68.132	a2d305b3-0d04-4275-bfe6-659790a540b1
93860b64-9bad-4990-a723-9add30002746	Capitanejo	68.147	a2d305b3-0d04-4275-bfe6-659790a540b1
e910f1c0-daa8-48ec-a7a5-8213006ff170	Carcasí	68.152	a2d305b3-0d04-4275-bfe6-659790a540b1
4e6dd941-3aa9-425b-bb56-dec875259f82	Cepitá	68.16	a2d305b3-0d04-4275-bfe6-659790a540b1
97fc74df-f949-4c7b-90a9-786a633c2ed1	Cerrito	68.162	a2d305b3-0d04-4275-bfe6-659790a540b1
cc06484e-de7c-4453-ad18-1e7760e8b18c	Charalá	68.167	a2d305b3-0d04-4275-bfe6-659790a540b1
e4220030-0d5b-4be7-8ea7-d677504243da	Charta	68.169	a2d305b3-0d04-4275-bfe6-659790a540b1
607c90ac-c5fd-4624-b030-0432672bfebb	Chimá	68.176	a2d305b3-0d04-4275-bfe6-659790a540b1
4fbf066d-251c-4c4e-9f2c-6d7f8f6946cf	Garzón	41.298	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
aa6db4f3-f1bf-41e1-a34b-10470bf3a2f0	Gigante	41.306	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
0960e5cb-7cde-4ac3-a020-de7bdbddc65a	Guadalupe	41.319	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
ca019ea3-73d5-449a-b407-b7d5a760d1c2	Hobo	41.349	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
10224bf8-e316-4218-b389-87b46cc79974	Iquira	41.357	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
48a4371a-bec0-4fad-b081-44e2d1e8e1f2	Isnos	41.359	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
6079aae1-b6a9-484d-9be6-8a25076f52e7	La Argentina	41.378	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
7af2a63a-f5c1-4147-94a5-4df29d586772	La Plata	41.396	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
08fbd21f-fc21-4a04-8919-727699fe40c1	Nátaga	41.483	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
44023e40-bd8b-48dd-b80b-284f31e095b8	Neiva	41.001	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
6c4dc02f-1232-4dcb-bbf3-c7a5fc06b952	Oporapa	41.503	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
46bd2574-ec6e-43a1-8d3c-2f4144402e09	Paicol	41.518	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
8676a517-bf84-4992-87d6-a4c366798e4c	Palermo	41.524	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
5d54a002-65dd-4e88-9844-846d939724ee	Palestina	41.53	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
af011dd2-0f42-4d22-b1a1-4e9b1dc813f9	Pital	41.548	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
639a4a96-47bd-43c0-a78f-702de6611430	Pitalito	41.551	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
a100e9ed-8d7c-4928-b5e6-6988c18a743a	Rivera	41.615	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
2693a6c6-b6ea-47c8-8506-fa81834375c4	Saladoblanco	41.66	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
5536b32e-d045-4efe-9f7f-7fa99ac2c389	San Agustín	41.668	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
f436a5eb-98d2-4675-a877-f035642c4581	Santa María	41.676	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
34370f6b-99ea-4a4b-bc70-95ef6ca7d938	Suaza	41.77	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
7c363d35-38c9-46a9-943f-36510278a8b4	Tarqui	41.791	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
dfdeb6fa-e363-41d2-be31-d060e4f0b45a	Tello	41.799	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
7d640186-a5d6-403a-a71c-18bc48ffe3c7	Teruel	41.801	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
e572cd4c-9038-4404-b88a-8ff167cbfa4b	Tesalia	41.797	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
59733dce-b1cd-4c64-8cb9-5ce23c1332b3	Timaná	41.807	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
9f82d1bd-a4b9-4a3a-b1b2-3dad2a3e4813	Villavieja	41.872	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
c2c69c58-9458-49fd-b3cf-31be5cafacd2	Yaguará	41.885	396f4422-ce0d-48ba-bf2d-bd04b7b05abe
8ac1199f-8adb-4dd4-a3b3-59885c4c1040	Colón	86.219	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
eb040585-9c2b-46fd-a5a7-d939ed3b609c	Leguízamo	86.573	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
5f5fc129-0c63-4d11-92fd-2c7724cae8b3	Mocoa	86.001	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
a584e66e-d981-406d-b26e-cc6218b0234f	Orito	86.32	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
bd1f3e47-1eee-4f6d-891e-b360872deeb3	Puerto Asís	86.568	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
36d33251-0f46-40fa-a30e-49d847c885be	Puerto Caicedo	86.569	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
60dd7b1d-01f7-48d3-814d-b2119c5f3d7f	Puerto Guzmán	86.571	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
0b57e3d9-c0f3-4a28-9829-76ddccf2a363	San Francisco	86.755	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
fc817e25-58ce-4b57-86e4-e9d8e0145192	San Miguel	86.757	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
e74bc28d-11ca-4782-b26a-aec753447dbf	Santiago	86.76	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
c0ad22d9-a6b0-4d02-a540-d9c3abefbe97	Sibundoy	86.749	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
0a7ae1d0-ed7b-4c83-ac2e-5bf0a03e1ee0	Valle de Guamez	86.865	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
f19e0f65-0ccf-4554-a3db-4bb2546a0fe9	Villagarzón	86.885	9ce171e1-83e2-4b5c-b8c0-79b96684cd3c
6de3fb1b-dc0a-40ac-9b1d-034a0f18536d	Buenavista	70.11	71b70393-3345-448b-8d4d-e2f3fc3facc6
b66906fd-11d9-4b09-bcc2-0d7db55b59cb	Caimito	70.124	71b70393-3345-448b-8d4d-e2f3fc3facc6
1d164f98-b0d1-41f7-88e7-6bec16535a0d	Chalán	70.23	71b70393-3345-448b-8d4d-e2f3fc3facc6
daafc37f-614e-438f-ad60-241d8dc7364b	Coloso	70.204	71b70393-3345-448b-8d4d-e2f3fc3facc6
18728b45-a887-4954-9403-3989976f3a05	Corozal	70.215	71b70393-3345-448b-8d4d-e2f3fc3facc6
766ae0ae-7aa9-412f-8b43-94327da6c20e	Coveñas	70.221	71b70393-3345-448b-8d4d-e2f3fc3facc6
05320bb8-3d9b-4c66-a560-f44bd84240c6	El Roble	70.233	71b70393-3345-448b-8d4d-e2f3fc3facc6
34520292-0898-46df-a718-39f456c3f702	Galeras	70.235	71b70393-3345-448b-8d4d-e2f3fc3facc6
caf0af21-c424-4f13-9d97-ff30f8b82a04	Guaranda	70.265	71b70393-3345-448b-8d4d-e2f3fc3facc6
c7ab7b42-6645-480e-8001-19de95a64aea	La Unión	70.4	71b70393-3345-448b-8d4d-e2f3fc3facc6
053a6b37-3ede-4e4d-9b79-8f30361dc5a3	Los Palmitos	70.418	71b70393-3345-448b-8d4d-e2f3fc3facc6
4971b1ad-4995-4fcc-89ec-16385956330c	Majagual	70.429	71b70393-3345-448b-8d4d-e2f3fc3facc6
f32e0c10-7419-4670-9303-2c694b0b3e18	Morroa	70.473	71b70393-3345-448b-8d4d-e2f3fc3facc6
eed5cc2e-4bf1-4b41-ace0-a14f88aaadb4	Ovejas	70.508	71b70393-3345-448b-8d4d-e2f3fc3facc6
5eb36af4-b4ce-4ed7-88d7-be43b532a5af	Palmito	70.523	71b70393-3345-448b-8d4d-e2f3fc3facc6
e097dc9e-4b24-4a27-b7f6-1500e85553c9	Sampués	70.67	71b70393-3345-448b-8d4d-e2f3fc3facc6
a59e885c-bb7e-4489-9af8-062cbd72e292	San Benito Abad	70.678	71b70393-3345-448b-8d4d-e2f3fc3facc6
4dc9b581-827a-4252-aff9-604396659bff	San Juan de Betulia	70.702	71b70393-3345-448b-8d4d-e2f3fc3facc6
b278f5d2-39f4-4007-a8fc-cbec16b8d570	San Luis de Sincé	70.742	71b70393-3345-448b-8d4d-e2f3fc3facc6
2c5065cd-1f11-402e-880b-5806c3a07869	San Marcos	70.708	71b70393-3345-448b-8d4d-e2f3fc3facc6
4ba6e116-4602-4c7e-9a03-b5c8350a3727	San Onofre	70.713	71b70393-3345-448b-8d4d-e2f3fc3facc6
198f46b7-8c3d-4424-be6d-1793e6d40f5e	San Pedro	70.717	71b70393-3345-448b-8d4d-e2f3fc3facc6
8bb8f91a-a5b3-4450-b103-39943b7bcf2c	Santiago de Tolú	70.82	71b70393-3345-448b-8d4d-e2f3fc3facc6
3bce0835-8479-4b56-9546-645323baad6e	Sincelejo	70.001	71b70393-3345-448b-8d4d-e2f3fc3facc6
8c53f74b-49c0-4979-bee6-dbb370044628	Sucre	70.771	71b70393-3345-448b-8d4d-e2f3fc3facc6
3f9bc82a-eb1d-43fe-a463-9621f6cdb7b7	Leiva	52.405	780747c7-74e9-4e62-a06c-22958851e66a
95171cc7-cf07-409f-ad58-740e61824322	Linares	52.411	780747c7-74e9-4e62-a06c-22958851e66a
f05afd18-6f47-48fc-abd9-e73455b23a78	Los Andes	52.418	780747c7-74e9-4e62-a06c-22958851e66a
027faf03-8dba-4282-999a-e50a08b994c8	Magüí	52.427	780747c7-74e9-4e62-a06c-22958851e66a
3318d88f-dec0-4844-b909-c9a31323adc8	Mallama	52.435	780747c7-74e9-4e62-a06c-22958851e66a
7d0d54b4-6e39-482d-96cd-6bd476a63ee1	Mosquera	52.473	780747c7-74e9-4e62-a06c-22958851e66a
4b4d69c1-8702-41ac-b94a-722998dec5b1	Nariño	52.48	780747c7-74e9-4e62-a06c-22958851e66a
e30ccda9-7f92-491e-8a07-35e6b8470f84	Olaya Herrera	52.49	780747c7-74e9-4e62-a06c-22958851e66a
20e33c47-45b5-4cd5-93b8-c4598db18038	Ospina	52.506	780747c7-74e9-4e62-a06c-22958851e66a
bc6614f1-8c90-4675-97e7-34a5d1d7c83c	Pasto	52.001	780747c7-74e9-4e62-a06c-22958851e66a
74c79722-cd3f-4952-ba66-72099908f447	Policarpa	52.54	780747c7-74e9-4e62-a06c-22958851e66a
6c84ffd4-4f5d-477e-bc37-170b1f2731f3	Potosí	52.56	780747c7-74e9-4e62-a06c-22958851e66a
fe261184-e964-4206-a9b7-e032b9f6b744	Providencia	52.565	780747c7-74e9-4e62-a06c-22958851e66a
2cbef633-6f3a-483b-83f7-77dffcded2f8	Puerres	52.573	780747c7-74e9-4e62-a06c-22958851e66a
18516b47-aa80-4b02-9fb5-9d40149243ae	Pupiales	52.585	780747c7-74e9-4e62-a06c-22958851e66a
829cb3fa-441e-4237-ac24-55118d1783f9	Ricaurte	52.612	780747c7-74e9-4e62-a06c-22958851e66a
e8545113-c7ae-44b0-8799-adba69af43de	Roberto Payán	52.621	780747c7-74e9-4e62-a06c-22958851e66a
4ef85015-9a40-4321-b037-40c2b468573c	Samaniego	52.678	780747c7-74e9-4e62-a06c-22958851e66a
27e067e9-10e9-4cd3-bcaf-cc44033bf13c	San Andrés de Tumaco	52.835	780747c7-74e9-4e62-a06c-22958851e66a
06e8b726-6c26-4d11-84b8-18d2cf21cf5e	San Bernardo	52.685	780747c7-74e9-4e62-a06c-22958851e66a
63728108-221e-4bd3-b2db-3039306f0a8a	Sandoná	52.683	780747c7-74e9-4e62-a06c-22958851e66a
ed0315e4-3ae9-4eb5-a8be-6eabe6ecf110	San Lorenzo	52.687	780747c7-74e9-4e62-a06c-22958851e66a
6f1d2c72-733b-4b2e-9954-c7104f5b7450	San Pablo	52.693	780747c7-74e9-4e62-a06c-22958851e66a
5949d37e-4923-4498-aa03-296dab879766	San Pedro de Cartago	52.694	780747c7-74e9-4e62-a06c-22958851e66a
c971b831-a904-48ef-93d5-8846502c86cf	Santa Bárbara	52.696	780747c7-74e9-4e62-a06c-22958851e66a
b05d0657-7dc4-43bb-9c96-56975c7b436b	Santacruz	52.699	780747c7-74e9-4e62-a06c-22958851e66a
e007f40c-cf95-42e9-a77f-a83bd686ce8b	Sapuyes	52.72	780747c7-74e9-4e62-a06c-22958851e66a
c351a57f-3d18-4fcd-bb36-52802e49eb2a	Taminango	52.786	780747c7-74e9-4e62-a06c-22958851e66a
7aabe3fc-466a-43d2-a2c2-b5862a0012f9	Tangua	52.788	780747c7-74e9-4e62-a06c-22958851e66a
4ef60031-27ce-4a60-9db2-27f5e1d21d86	Túquerres	52.838	780747c7-74e9-4e62-a06c-22958851e66a
c90e03c0-d46b-471d-a9a6-8de2bb8b3631	Yacuanquer	52.885	780747c7-74e9-4e62-a06c-22958851e66a
58c945f7-9e18-4a42-af0a-dd50c9744e1b	Apía	66.045	b2de4874-4820-468e-99c9-81719ec20034
4d7b56ad-7325-4778-9492-ad152826a745	Balboa	66.075	b2de4874-4820-468e-99c9-81719ec20034
cd66095c-d699-432c-bb06-30c117472835	Belén de Umbría	66.088	b2de4874-4820-468e-99c9-81719ec20034
dc541587-85f7-4967-9906-c06b57c18345	Dosquebradas	66.17	b2de4874-4820-468e-99c9-81719ec20034
bfe90075-a9de-4e7f-90ee-5af7058bc82a	Guática	66.318	b2de4874-4820-468e-99c9-81719ec20034
86d4826e-5e66-444c-8dda-d47bd6593a37	La Celia	66.383	b2de4874-4820-468e-99c9-81719ec20034
c590bb74-2c3b-4e19-874a-a0caff9213fa	La Virginia	66.4	b2de4874-4820-468e-99c9-81719ec20034
550e2c5e-7631-4ee1-9c8c-09f8ef268c6c	Marsella	66.44	b2de4874-4820-468e-99c9-81719ec20034
43d5cafc-286e-4f32-b614-acc7496e0d3a	Mistrató	66.456	b2de4874-4820-468e-99c9-81719ec20034
e70920f4-9f86-4ec7-aedc-d3f4f56d0407	Pereira	66.001	b2de4874-4820-468e-99c9-81719ec20034
0b4bcad6-ce7b-4a98-bf25-0a4d88d2461a	Pueblo Rico	66.572	b2de4874-4820-468e-99c9-81719ec20034
c479e8e0-0a86-45aa-8beb-06e42053c481	Quinchía	66.594	b2de4874-4820-468e-99c9-81719ec20034
64fcee26-8fe3-4e84-9eac-0b33116a943e	Santa Rosa de Cabal	66.682	b2de4874-4820-468e-99c9-81719ec20034
37fde6ea-3d72-4986-8a31-620783ed3933	Santuario	66.687	b2de4874-4820-468e-99c9-81719ec20034
5cb4de86-c2b0-4cb3-bb3d-88c0356ce2e0	Carurú	97.161	2d1edfce-7b9c-4d8e-ac56-995b5522c431
4c8870a3-01b8-4744-b96c-5821795158be	Mitú	97.001	2d1edfce-7b9c-4d8e-ac56-995b5522c431
9f8e588d-13ca-4fdd-965d-032bdc5aac2b	Pacoa	97.511	2d1edfce-7b9c-4d8e-ac56-995b5522c431
d2f8f53e-48d0-4e25-9249-e74b39fc4f3c	Papunahua	97.777	2d1edfce-7b9c-4d8e-ac56-995b5522c431
0f057e9e-8cf2-4d3c-89c5-e1c05fa7b310	Taraira	97.666	2d1edfce-7b9c-4d8e-ac56-995b5522c431
6df040be-0714-4029-9d30-e5e59bcfc884	Yavaraté	97.889	2d1edfce-7b9c-4d8e-ac56-995b5522c431
f3d23bc8-8fbf-401d-b11e-912b6b016538	Herrán	54.347	c75417a3-bc85-4b1a-a9d7-a54ae205daef
7b5047e7-c52d-4b05-9cfb-3ace119d1b25	Labateca	54.377	c75417a3-bc85-4b1a-a9d7-a54ae205daef
4a1bdc2b-69d8-4edc-8ae2-af8da8e10aa8	La Esperanza	54.385	c75417a3-bc85-4b1a-a9d7-a54ae205daef
ab86b593-8238-41da-b7f8-22994b2ae3d9	La Playa	54.398	c75417a3-bc85-4b1a-a9d7-a54ae205daef
d8f84421-aa34-4e4c-b524-6f6880376803	Los Patios	54.405	c75417a3-bc85-4b1a-a9d7-a54ae205daef
4f188f2a-6814-46f3-91da-e82a2df711cb	Lourdes	54.418	c75417a3-bc85-4b1a-a9d7-a54ae205daef
7c95113e-1d5c-484d-b094-0c6431203af9	Mutiscua	54.48	c75417a3-bc85-4b1a-a9d7-a54ae205daef
c90d1132-c976-4773-bf8d-08e9d460f686	Ocaña	54.498	c75417a3-bc85-4b1a-a9d7-a54ae205daef
eaca4d81-5493-473d-adca-6e19d07a469e	Pamplona	54.518	c75417a3-bc85-4b1a-a9d7-a54ae205daef
bfa3eb53-8b81-4006-936f-33f2b24cbbb0	Pamplonita	54.52	c75417a3-bc85-4b1a-a9d7-a54ae205daef
ddb149e2-70e6-4a00-a6d2-4532e9a5ca5f	Puerto Santander	54.553	c75417a3-bc85-4b1a-a9d7-a54ae205daef
e9f0109f-7fef-49d5-b294-378791bdd732	Ragonvalia	54.599	c75417a3-bc85-4b1a-a9d7-a54ae205daef
ba505024-634c-42f1-bb5f-8044a3218566	Salazar	54.66	c75417a3-bc85-4b1a-a9d7-a54ae205daef
2c5576d5-7be3-4664-bef7-d7a187ab5e3f	San Calixto	54.67	c75417a3-bc85-4b1a-a9d7-a54ae205daef
60324429-07e3-49fc-bf12-332d70edcd6f	San Cayetano	54.673	c75417a3-bc85-4b1a-a9d7-a54ae205daef
94b8af34-cbaf-41e7-a900-ccafd37dca2a	Santiago	54.68	c75417a3-bc85-4b1a-a9d7-a54ae205daef
2ada8e4e-b1db-4c71-8c33-0038579ce529	Sardinata	54.72	c75417a3-bc85-4b1a-a9d7-a54ae205daef
37aa57aa-9f42-4f1c-bd6d-d8f706ff13f2	Silos	54.743	c75417a3-bc85-4b1a-a9d7-a54ae205daef
d45bfe7b-0db1-4fbf-8174-497dae9a115d	Teorama	54.8	c75417a3-bc85-4b1a-a9d7-a54ae205daef
877180c2-4466-43fc-aab6-7117375590dc	Tibú	54.81	c75417a3-bc85-4b1a-a9d7-a54ae205daef
d23e0b94-a7f2-4b17-a5d3-421880e0179c	Toledo	54.82	c75417a3-bc85-4b1a-a9d7-a54ae205daef
4cc569ad-0333-44e1-838e-74d25fa467d3	Villa Caro	54.871	c75417a3-bc85-4b1a-a9d7-a54ae205daef
0e31c233-7162-402a-86de-d1a5a18bc318	Villa del Rosario	54.874	c75417a3-bc85-4b1a-a9d7-a54ae205daef
553d154f-7f63-43a4-815c-50da08c83d59	Alcalá	76.02	38879c50-3885-4988-876b-1bc66017e7eb
23ea6228-15bc-42d2-808f-66753cded313	Andalucía	76.036	38879c50-3885-4988-876b-1bc66017e7eb
85fbc8d8-3456-44dd-abb8-7ef0f4787928	Ansermanuevo	76.041	38879c50-3885-4988-876b-1bc66017e7eb
418e6f30-afb5-417e-9012-51034aa0c263	Argelia	76.054	38879c50-3885-4988-876b-1bc66017e7eb
8c67e8a0-c7a6-4daf-946e-14e23d1f2f7f	Bolívar	76.1	38879c50-3885-4988-876b-1bc66017e7eb
c47a0839-750c-49fa-ae90-9600a3886f65	Buenaventura	76.109	38879c50-3885-4988-876b-1bc66017e7eb
e130481f-a1a5-444d-a011-b0a22b05e052	Bugalagrande	76.113	38879c50-3885-4988-876b-1bc66017e7eb
4aaacbad-2663-4691-b73a-23a9e0f133f8	Caicedonia	76.122	38879c50-3885-4988-876b-1bc66017e7eb
bd8a657b-6bd3-4d65-835e-4f049fd1d2cf	Cali	76.001	38879c50-3885-4988-876b-1bc66017e7eb
d986047e-5dfd-4c68-b1ad-7ac68c0dd23c	Calima	76.126	38879c50-3885-4988-876b-1bc66017e7eb
7ca838d8-ac85-4e12-b1d8-bd76546370cc	Candelaria	76.13	38879c50-3885-4988-876b-1bc66017e7eb
d0bd46c7-4c6b-4120-bba1-6b5c62dc777c	Cartago	76.147	38879c50-3885-4988-876b-1bc66017e7eb
fafcf88f-f980-4379-b4a3-2566b0a1b106	Dagua	76.233	38879c50-3885-4988-876b-1bc66017e7eb
543943c0-621d-41ab-8228-42c00263169b	El Águila	76.243	38879c50-3885-4988-876b-1bc66017e7eb
ca347998-783f-4104-9a30-0496420d63f3	El Cairo	76.246	38879c50-3885-4988-876b-1bc66017e7eb
e6d49efe-cfd1-4725-90ea-269722989498	El Cerrito	76.248	38879c50-3885-4988-876b-1bc66017e7eb
a0b9cf64-3b09-4ac1-8df2-ffbb531563b1	El Dovio	76.25	38879c50-3885-4988-876b-1bc66017e7eb
597c2085-e2aa-4cf3-8451-c300911cf9cf	Florida	76.275	38879c50-3885-4988-876b-1bc66017e7eb
29613f33-27f3-4ec7-85f5-648065a8d785	Ginebra	76.306	38879c50-3885-4988-876b-1bc66017e7eb
b8c7afbe-c858-427f-9442-e14a51192476	Guacarí	76.318	38879c50-3885-4988-876b-1bc66017e7eb
c9360734-9c3c-4e4a-a6aa-cd3deca63f66	Guadalajara de Buga	76.111	38879c50-3885-4988-876b-1bc66017e7eb
736bcfd3-abb0-4fb5-b109-80712347e8ea	Jamundí	76.364	38879c50-3885-4988-876b-1bc66017e7eb
65af51eb-6309-4941-9d75-e5bd9083d42e	La Cumbre	76.377	38879c50-3885-4988-876b-1bc66017e7eb
c72c5a8a-2f87-4821-83cf-1202d284f5c4	La Unión	76.4	38879c50-3885-4988-876b-1bc66017e7eb
ab8b47c1-75ca-4f05-a4de-6af4178969b9	La Victoria	76.403	38879c50-3885-4988-876b-1bc66017e7eb
4420dfb6-e55c-412b-9a00-bb06774850ac	Obando	76.497	38879c50-3885-4988-876b-1bc66017e7eb
22c79359-824b-4e2d-a305-aef0c4d9da55	Palmira	76.52	38879c50-3885-4988-876b-1bc66017e7eb
d658d3b4-6391-4b2b-b759-777ab85918f1	Pradera	76.563	38879c50-3885-4988-876b-1bc66017e7eb
a3c1f3af-2efc-46ab-a97b-2a5bd077c0f6	Restrepo	76.606	38879c50-3885-4988-876b-1bc66017e7eb
21c79e09-38cf-484d-bd05-15f23e40b359	Riofrío	76.616	38879c50-3885-4988-876b-1bc66017e7eb
87ed1d11-fd54-4dac-b54b-d4f0462cb93c	Roldanillo	76.622	38879c50-3885-4988-876b-1bc66017e7eb
1fe092c2-af1d-4903-b472-d2ff3b667000	San Pedro	76.67	38879c50-3885-4988-876b-1bc66017e7eb
4b23318b-f064-4ee2-86ff-22fca23351b9	Sevilla	76.736	38879c50-3885-4988-876b-1bc66017e7eb
415f159f-dd9c-41a2-bdac-09257c22cff7	Toro	76.823	38879c50-3885-4988-876b-1bc66017e7eb
2d107743-f57f-44b5-bd5d-77ea436a582d	Trujillo	76.828	38879c50-3885-4988-876b-1bc66017e7eb
1a214caa-15b7-4d9d-b00c-5f2fe30eda39	Tuluá	76.834	38879c50-3885-4988-876b-1bc66017e7eb
a4a3cb29-e5b8-4bfd-bc90-fb790cf9d93c	Ulloa	76.845	38879c50-3885-4988-876b-1bc66017e7eb
0816234a-a9e3-45ce-9192-624d488f0365	Versalles	76.863	38879c50-3885-4988-876b-1bc66017e7eb
45cf93b3-aa22-4e35-88ec-b8cde6d710ac	Vijes	76.869	38879c50-3885-4988-876b-1bc66017e7eb
74ca9e6f-2bfd-488a-871c-545441c284ad	Yotoco	76.89	38879c50-3885-4988-876b-1bc66017e7eb
6550d46e-2266-4df9-8668-57986bfedf10	Yumbo	76.892	38879c50-3885-4988-876b-1bc66017e7eb
63ed4f34-454f-444e-b522-a39d56c2cb37	Zarzal	76.895	38879c50-3885-4988-876b-1bc66017e7eb
3f92a104-e40e-499d-a34e-3d7a92d20254	Chipatá	68.179	a2d305b3-0d04-4275-bfe6-659790a540b1
2af40dd9-372d-4e8e-a1f2-a9da5e7a9dd9	Cimitarra	68.19	a2d305b3-0d04-4275-bfe6-659790a540b1
e36ce1c5-8e70-43f0-9580-37062d497a89	Concepción	68.207	a2d305b3-0d04-4275-bfe6-659790a540b1
165f3ae2-07b5-42e4-9b8f-1f7c9e9dfb34	Confines	68.209	a2d305b3-0d04-4275-bfe6-659790a540b1
867c11b7-d1b0-4397-8119-598ff34ebf24	Contratación	68.211	a2d305b3-0d04-4275-bfe6-659790a540b1
a88ff0cd-a47a-44ff-9353-ad27c539c01d	Coromoro	68.217	a2d305b3-0d04-4275-bfe6-659790a540b1
cb2ab82d-2875-4b86-8c43-ecc1eb07b6bd	Curití	68.229	a2d305b3-0d04-4275-bfe6-659790a540b1
1b2ed2f6-4ff7-4ad7-a23d-154921d916f9	El Carmen de Chucurí	68.235	a2d305b3-0d04-4275-bfe6-659790a540b1
853adcc1-301d-47f8-bc45-80ee0b110aa2	El Guacamayo	68.245	a2d305b3-0d04-4275-bfe6-659790a540b1
bda31f87-68ca-4489-bbaf-0025ddfea751	El Peñón	68.25	a2d305b3-0d04-4275-bfe6-659790a540b1
a9028474-6997-4c68-b48b-05360409fdc5	El Playón	68.255	a2d305b3-0d04-4275-bfe6-659790a540b1
af4177d3-117c-4008-9d35-da982441a0ef	Encino	68.264	a2d305b3-0d04-4275-bfe6-659790a540b1
7c7eb8af-4a2a-4f1e-b93d-30ad208ef9ca	Enciso	68.266	a2d305b3-0d04-4275-bfe6-659790a540b1
2b3fbf19-6654-44b7-8c5b-9a5520bc7393	Florián	68.271	a2d305b3-0d04-4275-bfe6-659790a540b1
f6695e73-30fc-4f9c-9bd9-153d7b029553	Floridablanca	68.276	a2d305b3-0d04-4275-bfe6-659790a540b1
8f729d6c-0b88-46ec-93ed-1858c6a0f9f3	Galán	68.296	a2d305b3-0d04-4275-bfe6-659790a540b1
fe9d903d-aba5-4402-85b5-0b61f6ccf315	Gambita	68.298	a2d305b3-0d04-4275-bfe6-659790a540b1
565a7d45-31ce-4572-bfbc-6caf36712fe0	Girón	68.307	a2d305b3-0d04-4275-bfe6-659790a540b1
b9f60756-9cb3-4934-8982-db9c60ef56d5	Guaca	68.318	a2d305b3-0d04-4275-bfe6-659790a540b1
cb9e4148-c0f0-4376-bf15-7ab80f8a098a	Guadalupe	68.32	a2d305b3-0d04-4275-bfe6-659790a540b1
af09e4dd-fefc-4884-8e10-7af065afb041	Guapotá	68.322	a2d305b3-0d04-4275-bfe6-659790a540b1
221ce886-16a8-4835-badb-767bd1bfb3d6	Guavatá	68.324	a2d305b3-0d04-4275-bfe6-659790a540b1
9544b60b-86d5-41ba-a655-a651a8b5d532	Güepsa	68.327	a2d305b3-0d04-4275-bfe6-659790a540b1
17a86b40-79ed-4b44-8684-1db03750582c	Hato	68.344	a2d305b3-0d04-4275-bfe6-659790a540b1
453ecdb8-fd21-449c-9422-ea0da365333b	Jesús María	68.368	a2d305b3-0d04-4275-bfe6-659790a540b1
80e88246-776c-4f20-9688-dcc26d9b69df	Jordán	68.37	a2d305b3-0d04-4275-bfe6-659790a540b1
2b323925-506f-4dd2-8ad8-8544c1008015	La Belleza	68.377	a2d305b3-0d04-4275-bfe6-659790a540b1
5e1a90c2-ea89-4db2-a337-83814e7725b0	Landázuri	68.385	a2d305b3-0d04-4275-bfe6-659790a540b1
c26ea8bf-87f0-4cae-8a34-04604a2e6d43	La Paz	68.397	a2d305b3-0d04-4275-bfe6-659790a540b1
c6ab3a52-8e8c-480e-81cd-d593eaa6bed8	Lebríja	68.406	a2d305b3-0d04-4275-bfe6-659790a540b1
52645ad3-547e-440b-a4d2-98f6b052387b	Los Santos	68.418	a2d305b3-0d04-4275-bfe6-659790a540b1
1db8b9b1-2475-4adf-84f2-46589c80246d	Macaravita	68.425	a2d305b3-0d04-4275-bfe6-659790a540b1
49873a2e-fea5-4e55-9e5c-6d4e9c1f8993	Málaga	68.432	a2d305b3-0d04-4275-bfe6-659790a540b1
517b7502-6642-4a57-8a8b-1d290f2a4ece	Matanza	68.444	a2d305b3-0d04-4275-bfe6-659790a540b1
c84caba7-1ec8-45d6-b9c8-2a691b18c8f9	Mogotes	68.464	a2d305b3-0d04-4275-bfe6-659790a540b1
4a9a902b-c0a2-4af3-9168-577d425f0304	Molagavita	68.468	a2d305b3-0d04-4275-bfe6-659790a540b1
3153bbd5-93f9-4af2-a4ca-b186f1248024	Ocamonte	68.498	a2d305b3-0d04-4275-bfe6-659790a540b1
bd999f95-bb7b-4a10-b014-a6e4b35f4cb4	Oiba	68.5	a2d305b3-0d04-4275-bfe6-659790a540b1
d805461c-fd82-48a7-b07d-f1a05c94dc81	Onzaga	68.502	a2d305b3-0d04-4275-bfe6-659790a540b1
9360014d-be13-4efb-9ab2-bc3652499ec1	Palmar	68.522	a2d305b3-0d04-4275-bfe6-659790a540b1
fe6a9e00-447b-405f-95b7-47aacc79f719	Palmas del Socorro	68.524	a2d305b3-0d04-4275-bfe6-659790a540b1
9bf77e37-fab7-4268-b2be-ae4b05994ef4	Páramo	68.533	a2d305b3-0d04-4275-bfe6-659790a540b1
40fce4b2-485e-44b1-8a20-3392cb1a082a	Piedecuesta	68.547	a2d305b3-0d04-4275-bfe6-659790a540b1
cad6f1f3-dfd1-45f0-8577-a70f6281ea22	Pinchote	68.549	a2d305b3-0d04-4275-bfe6-659790a540b1
d7deddd8-cc29-4b69-9235-b9e51cc2ec66	Puente Nacional	68.572	a2d305b3-0d04-4275-bfe6-659790a540b1
eca62e64-b1b6-4d29-a8c3-c2813b9ff7d7	Puerto Parra	68.573	a2d305b3-0d04-4275-bfe6-659790a540b1
9bf1e8cd-d9fc-462d-9a32-b605940a9c97	Puerto Wilches	68.575	a2d305b3-0d04-4275-bfe6-659790a540b1
68a3f18c-44eb-476d-8035-59037c3c8061	Rionegro	68.615	a2d305b3-0d04-4275-bfe6-659790a540b1
d7bbe35c-a289-43d4-8ea7-9e10dec42390	Sabana de Torres	68.655	a2d305b3-0d04-4275-bfe6-659790a540b1
97db4fb9-af2d-4a59-afd5-d1f9ce54e338	San Andrés	68.669	a2d305b3-0d04-4275-bfe6-659790a540b1
a2cd2be8-849c-40be-94ff-b027c2bf0b49	San Benito	68.673	a2d305b3-0d04-4275-bfe6-659790a540b1
2b428ca9-a682-40eb-97de-b84d29e90c82	San Gil	68.679	a2d305b3-0d04-4275-bfe6-659790a540b1
85e3d209-6bab-4194-b1bc-deaf28573dbc	San Joaquín	68.682	a2d305b3-0d04-4275-bfe6-659790a540b1
73798001-c998-4469-b40d-bb8fb50b26d9	San José de Miranda	68.684	a2d305b3-0d04-4275-bfe6-659790a540b1
9f2d0b4d-b5e6-4906-8c14-b238f81c11cd	San Miguel	68.686	a2d305b3-0d04-4275-bfe6-659790a540b1
c2ea5c9b-fe6f-467e-9741-e9584b42a23c	Santa Bárbara	68.705	a2d305b3-0d04-4275-bfe6-659790a540b1
6a8c83db-dae6-4c6a-9edc-008ca76077ab	Santa Helena del Opón	68.72	a2d305b3-0d04-4275-bfe6-659790a540b1
c76c62ca-d723-4dfb-975f-ee4f219759eb	San Vicente de Chucurí	68.689	a2d305b3-0d04-4275-bfe6-659790a540b1
2528ad35-fa6a-4c66-b235-a5615a8bda5c	Simacota	68.745	a2d305b3-0d04-4275-bfe6-659790a540b1
b7d4f2a2-e221-4aa8-b202-c1f374bc1d84	Socorro	68.755	a2d305b3-0d04-4275-bfe6-659790a540b1
0f6a20d9-f90a-4cdb-a6e5-09f37b007ffc	Suaita	68.77	a2d305b3-0d04-4275-bfe6-659790a540b1
71cd3baa-d1d2-4acb-873c-a3463753b4ca	Sucre	68.773	a2d305b3-0d04-4275-bfe6-659790a540b1
1a76209c-9787-4817-af42-5b1c3df44b86	Suratá	68.78	a2d305b3-0d04-4275-bfe6-659790a540b1
45fe7043-3851-4f46-bafb-86515ed922cc	Tona	68.82	a2d305b3-0d04-4275-bfe6-659790a540b1
2c8a5d10-baa8-43e7-990f-58558baa1eff	Valle de San José	68.855	a2d305b3-0d04-4275-bfe6-659790a540b1
a77c7519-77cb-4a7a-8755-49f533bb5b55	Vélez	68.861	a2d305b3-0d04-4275-bfe6-659790a540b1
7d523195-e734-47ab-9d89-71dda4763272	Vetas	68.867	a2d305b3-0d04-4275-bfe6-659790a540b1
17aa4642-5445-48f4-906e-578d689ba53d	Villanueva	68.872	a2d305b3-0d04-4275-bfe6-659790a540b1
1fe8ab53-9dc0-4f79-b88c-efd438cbdb17	Zapatoca	68.895	a2d305b3-0d04-4275-bfe6-659790a540b1
cbb00575-ea6d-4e13-8b03-4ef57c9f7626	Cumaribo	99.773	6bdcf349-1f6b-4d47-8913-4b73f64a85b3
f86735fa-61c8-4217-a753-8a3c1c9bb97e	La Primavera	99.524	6bdcf349-1f6b-4d47-8913-4b73f64a85b3
33df8ccb-bf4f-4872-a00a-3a54d1aff3b2	Puerto Carreño	99.001	6bdcf349-1f6b-4d47-8913-4b73f64a85b3
7a791ccb-3dd2-4339-a514-6ee657e9e25a	Santa Rosalía	99.624	6bdcf349-1f6b-4d47-8913-4b73f64a85b3
e33e4719-9c09-482a-b8c8-2c5a332d05e3	San Luis	73.678	50f482a3-3fbc-44d6-9881-be270ac7597b
f4bf2a53-213d-4004-ba73-ffd5fdab8228	Santa Isabel	73.686	50f482a3-3fbc-44d6-9881-be270ac7597b
e15ea63d-f7f0-4030-a0c8-051590ba6efb	Suárez	73.77	50f482a3-3fbc-44d6-9881-be270ac7597b
88855398-d9d0-4741-b31a-1817aa38f4bf	Valle de San Juan	73.854	50f482a3-3fbc-44d6-9881-be270ac7597b
43209356-60f5-4a6e-b8f8-e18d3ec0794c	Venadillo	73.861	50f482a3-3fbc-44d6-9881-be270ac7597b
c34e90e4-6903-4504-92d9-7fcbd526950b	Villahermosa	73.87	50f482a3-3fbc-44d6-9881-be270ac7597b
e912a1ef-8647-474d-8558-298fa4167620	Villarrica	73.873	50f482a3-3fbc-44d6-9881-be270ac7597b
251eadc8-c4bb-4193-a8a5-cf2cc542c8dc	Tolú Viejo	70.823	71b70393-3345-448b-8d4d-e2f3fc3facc6
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.departamentos (id, departamento, codigo) FROM stdin;
7b036cf5-fdb4-4ea4-a39b-b4340cf5656d	Amazonas	91
b630d288-b871-4314-aa5c-02e8f629a6b9	Antioquia	5
74fa3549-914b-40e0-8378-c7aa2238d1b5	Arauca	81
36b8a679-8e34-4038-8321-9c89a0b84f75	Archipiélago de San Andrés, Providencia y Santa Catalina	88
7903cecc-5a4a-4758-b53f-d37d3d61d00e	Atlántico	8
1b5ec75d-637e-4ca7-98ba-1b9eda47c45d	Bogotá D.C.	11
4b66d65b-2c48-4bd3-a188-c6fe86be1982	Bolívar	13
2ee650ab-8239-4202-a073-d51a8eb7eb23	Boyacá	15
5be53e60-f4c5-495c-a56e-37d2c2898542	Caldas	17
248fa9c9-429f-4097-a43a-d5c026ec3ebe	Caquetá	18
1d15c002-bb94-421d-a51e-7daccf244b24	Casanare	85
7697f54c-477d-4bcb-8038-773618306335	Cauca	19
38cd9c60-e9bc-415c-97de-ed976d14c0c1	Cesar	20
9b67060a-f514-4139-b09e-e9dd97f9dab6	Chocó	27
9fc9a068-261a-4514-9acb-70c2c3b90578	Córdoba	23
0db93e16-343b-4f1d-a86d-c485874d057f	Cundinamarca	25
41e76ec3-f260-462b-8269-97a43c3ce1cf	Guainía	94
7d4496ea-e50b-4028-967c-ac3166384502	Guaviare	95
396f4422-ce0d-48ba-bf2d-bd04b7b05abe	Huila	41
ee7eb36e-c558-4de8-a5fa-8793498415ac	La Guajira	44
3d71474c-67e5-4760-92a4-e9b599911267	Magdalena	47
52ab49ad-737e-40fb-8e02-3b7c542bdbd5	Meta	50
780747c7-74e9-4e62-a06c-22958851e66a	Nariño	52
c75417a3-bc85-4b1a-a9d7-a54ae205daef	Norte de Santander	54
9ce171e1-83e2-4b5c-b8c0-79b96684cd3c	Putumayo	86
48cdd7da-885f-4ac2-b8bf-a8a8cb35891d	Quindío	63
b2de4874-4820-468e-99c9-81719ec20034	Risaralda	66
a2d305b3-0d04-4275-bfe6-659790a540b1	Santander	68
71b70393-3345-448b-8d4d-e2f3fc3facc6	Sucre	70
50f482a3-3fbc-44d6-9881-be270ac7597b	Tolima	73
38879c50-3885-4988-876b-1bc66017e7eb	Valle del Cauca	76
2d1edfce-7b9c-4d8e-ac56-995b5522c431	Vaupés	97
6bdcf349-1f6b-4d47-8913-4b73f64a85b3	Vichada	99
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.sellers (id, code, email) FROM stdin;
1	09	jvelez23@misena.edu.co
2	17	jairo.rivera@equisol.com.co
7	78	wilfer.castano@equisol.com.co
8	F3	luz.jaramillo@equisol.com.co
9	D8	andrea.calderon@equisol.com.co
\.


--
-- Name: CcostoZoneCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."CcostoZoneCategories_id_seq"', 43, true);


--
-- Name: OrdenDePedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."OrdenDePedido_id_seq"', 70, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 2, true);


--
-- Name: Usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Usuario_id_seq"', 26, true);


--
-- Name: Zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public."Zones_id_seq"', 6, true);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.sellers_id_seq', 9, true);


--
-- Name: AuthUser AuthUser_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."AuthUser"
    ADD CONSTRAINT "AuthUser_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: CcostoZoneCategories CcostoZoneCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_pkey" PRIMARY KEY ("ordenDePedidoId", "productoId");


--
-- Name: OrdenDePedido OrdenDePedido_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_pkey" PRIMARY KEY (id);


--
-- Name: Price Price_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY (id);


--
-- Name: Zones Zones_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Zones"
    ADD CONSTRAINT "Zones_pkey" PRIMARY KEY (id);


--
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: AuthUser_email_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "AuthUser_email_key" ON public."AuthUser" USING btree (email);


--
-- Name: AuthUser_userAuthToken_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "AuthUser_userAuthToken_key" ON public."AuthUser" USING btree ("userAuthToken");


--
-- Name: CcostoZoneCategories_ccosto_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "CcostoZoneCategories_ccosto_key" ON public."CcostoZoneCategories" USING btree (ccosto);


--
-- Name: Product_code_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Product_code_key" ON public."Product" USING btree (code);


--
-- Name: Product_eancode_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Product_eancode_key" ON public."Product" USING btree (eancode);


--
-- Name: Roles_name_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Roles_name_key" ON public."Roles" USING btree (name);


--
-- Name: Usuario_email_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Usuario_email_key" ON public."Usuario" USING btree (email);


--
-- Name: Usuario_numDoc_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Usuario_numDoc_key" ON public."Usuario" USING btree ("numDoc");


--
-- Name: Zones_zone_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX "Zones_zone_key" ON public."Zones" USING btree (zone);


--
-- Name: fki_Usuario_asesor_fkey; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX "fki_Usuario_asesor_fkey" ON public."Usuario" USING btree (asesor);


--
-- Name: sellers_code_key; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE UNIQUE INDEX sellers_code_key ON public.sellers USING btree (code);


--
-- Name: Category Category_padreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_padreId_fkey" FOREIGN KEY ("padreId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CcostoZoneCategories CcostoZoneCategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: CcostoZoneCategories CcostoZoneCategories_zone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."CcostoZoneCategories"
    ADD CONSTRAINT "CcostoZoneCategories_zone_fkey" FOREIGN KEY (zone) REFERENCES public."Zones"(zone) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Image Image_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_ordenDePedidoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_ordenDePedidoId_fkey" FOREIGN KEY ("ordenDePedidoId") REFERENCES public."OrdenDePedido"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedidoProducto OrdenDePedidoProducto_productoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedidoProducto"
    ADD CONSTRAINT "OrdenDePedidoProducto_productoId_fkey" FOREIGN KEY ("productoId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrdenDePedido OrdenDePedido_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."OrdenDePedido"
    ADD CONSTRAINT "OrdenDePedido_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Usuario"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Price Price_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Price"
    ADD CONSTRAINT "Price_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Usuario Usuario_codVendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_codVendedor_fkey" FOREIGN KEY ("codVendedor") REFERENCES public.sellers(code) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Usuario Usuario_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Usuario Usuario_zoneid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_zoneid_fkey" FOREIGN KEY (zoneid) REFERENCES public."Zones"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ciudades ciudades_departamentoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT "ciudades_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES public.departamentos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: ecommerce
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

