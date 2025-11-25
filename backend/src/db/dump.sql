--
-- PostgreSQL database dump
--

\restrict 9llqXluMXMRYeJi2M2g9gYwKc2Nnm99aKjqw3mouPSUAcxQyq1omhncFpRSKFUc

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo (
    id_cargo integer NOT NULL,
    ca_nome_cargo character varying(100) NOT NULL
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- Name: cargo_id_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cargo_id_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cargo_id_cargo_seq OWNER TO postgres;

--
-- Name: cargo_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cargo_id_cargo_seq OWNED BY public.cargo.id_cargo;


--
-- Name: conteudo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conteudo (
    id_conteudo integer NOT NULL,
    co_titulo text,
    co_publicante integer,
    co_autor character varying(255),
    co_pdf text,
    co_citacao text,
    co_doi character varying(100),
    co_data date,
    co_lide text,
    co_status integer,
    co_data_inicio date,
    co_data_termino date,
    co_objetivo text,
    co_requisitos text,
    co_plano_trabalho text,
    co_atividades text,
    co_tipo_conteudo integer,
    co_conteudo text,
    co_imagem character varying(255)
);


ALTER TABLE public.conteudo OWNER TO postgres;

--
-- Name: conteudo_id_conteudo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conteudo_id_conteudo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conteudo_id_conteudo_seq OWNER TO postgres;

--
-- Name: conteudo_id_conteudo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conteudo_id_conteudo_seq OWNED BY public.conteudo.id_conteudo;


--
-- Name: membros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membros (
    id_membro integer NOT NULL,
    me_nome character varying(100) NOT NULL,
    me_cpf character varying(14) NOT NULL,
    me_email character varying(100) NOT NULL,
    me_descricao text,
    me_lattes character varying(255),
    me_senha text NOT NULL,
    me_imagem text,
    me_administrador boolean DEFAULT false,
    me_cargo integer
);


ALTER TABLE public.membros OWNER TO postgres;

--
-- Name: membros_id_membro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membros_id_membro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membros_id_membro_seq OWNER TO postgres;

--
-- Name: membros_id_membro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membros_id_membro_seq OWNED BY public.membros.id_membro;


--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id_status integer NOT NULL,
    st_nome_status character varying(100) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_status_seq OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_status_seq OWNED BY public.status.id_status;


--
-- Name: tipo_conteudo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_conteudo (
    id_tipo_conteudo integer NOT NULL,
    tc_conteudo character varying(50) NOT NULL
);


ALTER TABLE public.tipo_conteudo OWNER TO postgres;

--
-- Name: tipo_conteudo_id_tipo_conteudo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_conteudo_id_tipo_conteudo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_conteudo_id_tipo_conteudo_seq OWNER TO postgres;

--
-- Name: tipo_conteudo_id_tipo_conteudo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_conteudo_id_tipo_conteudo_seq OWNED BY public.tipo_conteudo.id_tipo_conteudo;


--
-- Name: cargo id_cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo ALTER COLUMN id_cargo SET DEFAULT nextval('public.cargo_id_cargo_seq'::regclass);


--
-- Name: conteudo id_conteudo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo ALTER COLUMN id_conteudo SET DEFAULT nextval('public.conteudo_id_conteudo_seq'::regclass);


--
-- Name: membros id_membro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membros ALTER COLUMN id_membro SET DEFAULT nextval('public.membros_id_membro_seq'::regclass);


--
-- Name: status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.status_id_status_seq'::regclass);


--
-- Name: tipo_conteudo id_tipo_conteudo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_conteudo ALTER COLUMN id_tipo_conteudo SET DEFAULT nextval('public.tipo_conteudo_id_tipo_conteudo_seq'::regclass);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargo (id_cargo, ca_nome_cargo) FROM stdin;
1	Pesquisador
2	Coordenador
3	Bolsista
4	Doutorando
5	Mestrando
\.


--
-- Data for Name: conteudo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conteudo (id_conteudo, co_titulo, co_publicante, co_autor, co_pdf, co_citacao, co_doi, co_data, co_lide, co_status, co_data_inicio, co_data_termino, co_objetivo, co_requisitos, co_plano_trabalho, co_atividades, co_tipo_conteudo, co_conteudo, co_imagem) FROM stdin;
2	Mapeamento de áreas agrícolas junto a CONAB	1	André Garcia	\N	\N	\N	\N	\N	1	2025-11-05	2025-11-28	\N	\N	3	O AgriRS integra um projeto firmado entre a Companhia Nacional de Abastecimento (Conab) e o Instituto Nacional de Pesquisas Espaciais (INPE) com o objetivo de mapear, por meio de imagens de satélite, as áreas cultivadas com milho primeira safra, arroz irrigado e trigo no estado do Rio Grande do Sul, além de milho (primeira e segunda safra) e trigo nos estados do Paraná e de São Paulo. A metodologia adotada inclui a construção de um painel utilizando amostragem aleatória estratificada em dois estágios que serviu para estimar a área cultivada e para validar o mapeamento. Após a seleção das amostras são realizados trabalhos de campo para visitar os pontos sorteados in loco (pontos para validação) e para coletar dados de treinamento. Com os dados coletados, a classificação da áreas agrícolas é feita com o uso de modelos de machine leraning. A iniciativa busca fortalecer o monitoramento agrícola nacional, melhorar as estimativas de safra, apoiar ações de segurança alimentar e contribuir para a mitigação dos impactos das mudanças climáticas e para o desenvolvimento sustentável da agricultura.	3	\N	1764079654406-af969293-9905-4cf9-ab5f-2026a379f68a.png
3	Mapeamento e Monitoramento de Cultivos Agrícolas no Brasil	1	Priscilla Azevedo dos Santos - Doutoranda INPE e Marcos Adami - Orientador INPE	\N	\N	\N	\N	\N	2	2025-11-05	2025-11-30	\N	\N	\N	O objetivo da pesquisa é tornar mais assertivos os produtos cartográficos oriundos de mapeamentos de cultivos agrícolas por Sensoriamento Remoto existentes no Brasil, contribuindo para a diminuição das dissimilaridades entre as áreas e classes agrícolas no espaço-tempo, auxiliando a tomada de decisão no monitoramento agrícola e suas aplicações (estimativa de área, produtividade, sustentabilidade, mudanças de uso, outros). Em seu desenvolvimento, a pesquisa conta com abordagens espaço-temporais que envolvem a integração de dados/produtos multifonte (EO1), análise de mudanças e dissimilaridades nas áreas/classes agrícolas (EO2) e a modelagem probabilística de incertezas (EO3) no mapeamento de áreas agrícolas no Brasil por Sensoriamento Remoto, tendo como foco os cultivos agrícolas anuais.\r\n	3	\N	1764081116805-250527_MapaAptidÃ£oAgrÃ­cola_DiculgaÃ§Ã£o_mapa.jpg
4	Estimativa do Percentual de Cobertura do Solo por Resíduos Culturais através de Sensoriamento Remoto Orbital	1	Marina Galdez de Castro Silva - Mestranda INPE, Marcos Adami - Orientador INPE e Julio Franchini - Embrapa Soja	\N	\N	\N	\N	\N	2	2025-11-01	2025-11-03	\N	\N	\N	Os resíduos culturais mantidos na superfície das áreas agrícolas auxiliam na conservação do solo e da água. Por sua estimativa em campo ser onerosa, uma opção é utilizar dados e técnicas de sensoriamento remoto para detectá-los. Nesse contexto, esta pesquisa tem como objetivo estimar o percentual de cobertura do solo por resíduos culturais a partir de imagens multiespectrais de sensoriamento remoto orbital, utilizando dados do sensor MSI/Sentinel-2, regressões linear e quadrática, e o algoritmo Random Forest (RF). Espera-se encontrar no sensoriamento remoto orbital um método eficaz para estimar a cobertura do solo por resíduos culturais em larga escala, tornando a variável de fácil aplicabilidade em programas nacionais que incentivem o manejo sustentável do solo. 	3	\N	1764081673432-51028.png
5	Detecção de Desmatamento e Cicatriz de Fogo no Cerrado via Redes Neurais Artificiais.	1	Ana Júlia Dias, Marcos Adami, Lênio Soares Galvão e Valdivino Santiago	\N	\N	\N	\N	\N	3	2025-11-29	2025-11-30	\N	\N	\N	O Cerrado passou a ser degradado intensivamente com o avanço da ocupação humana. Para auxiliar na conservação da biodiversidade do Cerrado, programas brasileiros, como o Projeto de Monitoramento do Desmatamento (PRODES) e o Sistema de Detecção e Desmatamento em Tempo Real (DETER), têm sido propostos para quantificar desmatamentos. Buscando a compreensão da resposta espectro-temporal da vegetação e a semi-automatização da detecção de distúrbios (desmatamento e fogo) nas formações campestre, florestal e savânica do Cerrado, a presente pesquisa busca avaliar a detecção de desmatamento e de áreas queimadas neste bioma utilizando redes Convolutional Long Short-Term Memory (ConvLSTM), treinadas e testadas com imagens do sensor MultiSpectral Instrument (MSI)/Sentinel-2, e comparadas com a classificação gerada pelo Random Forest.\r\n	3	\N	1764081812797-validacao-pt.png
6	Estimating crop sowing and harvesting dates using satellite vegetation index: A comparative analysis.	1	undefined	https://doi.org/10.3390/rs15225366	Rodigheri, G., Sanches, I. D. A., Richetti, J., Tsukahara, R. Y., Lawes, R., Bendini, H. D. N., & Adami, M.	https://doi.org/10.3390/rs15225366	2025-11-25	\N	\N	\N	\N	\N	\N	1	\N	1	\N	1764082393074-Figura_A1_GR.jpg
7	Sugarcane Yield Estimation Using Satellite Remote Sensing Data in Empirical or Mechanistic Modeling: A Systematic Review.	1		https://doi.org/10.3390/rs16050863	de França e Silva, N. R., Chaves, M. E. D., Luciano, A. C. d. S., Sanches, I. D., de Almeida, C. M., & Adami, M. 	https://doi.org/10.3390/rs16050863	2024-06-25	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764082794706-Figura_A2_NS.png
8	Limitations of cloud cover for optical remote sensing of agricultural areas across South America.	1		https://doi.org/10.1016/j.rsase.2020.100414	Prudente, V.H.R., Martins, V.S., Vieira, D.C., et al.	https://doi.org/10.1016/j.rsase.2020.100414	2025-11-30	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764083586352-Figura_A3_VP.png
9	Land Use and Land Cover Products for Agricultural Mapping Applications in Brazil: Challenges and Limitations	1		https://doi.org/10.3390/rs17132324	Santos, P.A.d.; Adami, M.; Picoli, M.C.A.; Prudente, V.H.R.; Esquerdo, J.C.D.M.; Queiroz, G.R.d.; Carneiro de Santana, C.T.; Chaves, M.E.D.	https://doi.org/10.3390/rs17132324	2025-11-30	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764083704167-Figura_A4_PS.png
11	A Method for Estimating Soybean Sowing, Beginning Seed, and Harvesting Dates in Brazil Using NDVI-MODIS Data	1		https://doi.org/10.3390/rs16142520	Santana, C.T.C.; Sanches, I.D.; Caldas, M.M.; Adami, M.	https://doi.org/10.3390/rs16142520	2025-11-01	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764083814133-Figura_A5_CS.jpeg
13	Comprehensive workflow for image segmentation of rice fields utilizing the PLANET model. The datasets for training, validation, and testing have been distributed equally, and subsequent evaluations yielded enhanced prediction results	1		https://doi.org/10.1016/j.acags.2025.100223	Garcia, A. D. B., Islam, M. S., Prudente, V. H. R., Sanches, I. D. A., & Cheng, I.	https://doi.org/10.1016/j.acags.2025.100223	2025-11-16	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764083899885-Figura_A6_AG.png
15	Growth behavior of irrigated rice according to different indices, sensors, and stages of the growth cycle. (A) Time series pattern for NDVI and NDWI for single-harvest rice fields. (B) Time series pattern for VH and VV polarizations for single-harvest rice fields. (C) Time series pattern for NDVI and NDWI for double-harvest rice fields. (D) Time series pattern for VH and VV polarizations for double-harvest rice fields. At the bottom, the photos illustrate the condition of the irrigated rice fields at various stages of crop development. Source of photos: Douglas George de Oliveira and EPAGRI.	1		https://doi.org/10.3390/agriengineering7030065	Garcia, A. D. B., Sanches, I. D. A., Prudente, V. H. R., & Trabaquini, K. 	https://doi.org/10.3390/agriengineering7030065	2026-10-13	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1764085075997-Figura_A7_AG.png
\.


--
-- Data for Name: membros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membros (id_membro, me_nome, me_cpf, me_email, me_descricao, me_lattes, me_senha, me_imagem, me_administrador, me_cargo) FROM stdin;
2	Cleverton Santana	997.003.290-97	cleverton.santana@uni.edu.br	Engenheiro Agrônomo (UNEMAT), com mestrado em Agronomia - Agricultura (FAC-UNESP) e doutorado em Sensoriamento Remoto (INPE). Atualmente é analista na Companhia Nacional de Abastecimento (Conab), onde desenvolve pesquisas na área de monitoramento agrícola, com foco em estádios fenológicos, estimativa de área e produtividade, além da classificação de culturas agrícolas, utilizando dados de sensoriamento remoto.	https://lattes.cnpq.br/6403186357124271	$2b$10$pUo54Eoi89l.w4bYTcyEw.xjNRe5Yn.SVEkNhjxR2vTe.Km5Rmx8q	1764071032309-309397110.jpeg	f	1
1	Marcos Adami	276.552.230-84	marcos.adami@uni.edu.br	Pesquisador titular do Instituto Nacional de Pesquisas Espaciais, graduado em Ciências Econômicas pela Faculdade de Filosofia Ciências e Letras de Cornélio Procópio (1997), mestrado e doutorado em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (2003 e 2010). Possui experiência em sistemas de informação geográfica e sensoriamento remoto com ênfase nos seguintes temas: análise de séries temporais, mudança de uso da terra, amostragem e estatísticas agrícolas.	http://lattes.cnpq.br/7484071887086439	$2b$10$ySY33.sc3qFmIKf3fSrtduv59vUN3e.XmBtNA7BX4z3xOQyQ0A95O	Marcos_Adami.jpg	t	2
20	Ana Júlia Dias	672.534.050-48	ana.julia@uni.edu.br	Mestranda do Programa de Pós Graduação em Sensoriamento Remoto, no Instituto Nacional de Pesquisas espaciais (INPE). Formada em Bacharel em Geografia, com ênfase em análise ambiental e geoprocessamento, pela Universidade Estadual Paulista Júlio de Mesquita Filho - UNESP. Atualmente faz pesquisa com foco na identificação semi-automatizada de degradação na vegetação do Cerrado e atua no projeto Lethal Psi (Leeds- UK) na área de coleta e processamento de dados radiométricos da vegetação Amazônica. Tem experiência na área de Geografia, com ênfase em geoprocessamento e Sensoriamento Remoto, atuando principalmente nos seguintes temas: Vegetação, Cerrado, Radiometria,Temperatura e Saúde	http://lattes.cnpq.br/3916239078525280	$2b$10$9YyFqTLmRru/vW67O/DwauhD.gcZ25QoV5FIrF1ReZijsPhw26jbm	1764075148498-65764159.jpg	f	5
21	Marina Galdez	730.385.610-29	marina.galdez@uni.edu.br	Engenheira Agrícola e Ambiental formada pela Universidade Federal Fluminense (UFF). Atualmente, mestranda do Programa de Pós Graduação em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Desenvolve pesquisas voltadas ao monitoramento agrícola, com foco na estimativa da cobertura do solo por resíduos culturais.\r\n	http://lattes.cnpq.br/3273203574648394	$2b$10$aonJVi9K2rSULMd11SwtjeuJo0gA8eVq3W5h3rmAB5zyxzxr6mUAm	1764075419255-732406575.jpg	f	5
19	Yan Azeredo da Silva	370.474.250-39	yan.azeredo@uni.edu.br	Geógrafo pela Universidade Federal Fluminense (UFF) e mestre em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Atualmente, é doutorando pelo mesmo instituto, com foco em monitoramento da vegetação nativa no bioma Cerrado. Possui experiência em geoprocessamento, modelagem ambiental e processamento digital de imagens de satélite, com ênfase em estudos de cobertura e uso da terra, desastres naturais e conservação ambiental.\r\n	http://lattes.cnpq.br/7374513612608164	$2b$10$JLikcJHnWLbwj5UuNg9wY.XPS6pb.wmUln8d/getswtRqcKDDYpY.	1764075609936-353944884.jpg	f	4
18	Tânia Beatriz Hoffmann	705.530.360-50	tania.beatriz@uni.edu.br	Geógrafa pela Universidade Federal de Santa Catarina (UFSC), mestre e atualmente doutoranda em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE), com período sanduíche na Universidade de Maryland (UMD).\r\n	 http://lattes.cnpq.br/4681448772106846	$2b$10$Jp6V7NghE4t/VMg3KKgtkOoaAS1pN1CFL4FTZ2sVu7W3ZbiMHYo6q	1764075711676-33007254.jpg	f	4
17	Priscilla Santos	491.374.480-13	priscilla.santos@uni.edu.br	Engenheira Agrimensora e Cartógrafa, Mestra em Geociências e Especialista em Estatística Aplicada pela Universidade Federal Rural do Rio de Janeiro (UFRRJ). Atualmente, Doutoranda em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Possui experiência na área de Geociências, com ênfase em Geomática.\r\n	http://lattes.cnpq.br/1105545816489485	$2b$10$N2m0.CPGSWvCYg0K0Y0cs.2QSd2S0gnPySmfkppmb.vQ2JLroMEgu	1764075811738-847977584.jpg	f	4
16	Nildson Silva	885.729.990-27	nildson.silva@edu.uni.br	Engenheiro Agrônomo (UFRPE) com graduação-sanduíche no curso de Engenharia Agrícola e do Meio Rural (USC/Espanha) e mestre em Sensoriamento Remoto (INPE). Atualmente doutorando em Sensoriamento Remoto (INPE) e Analista de Geoprocessamento na Serasa Experian.\r\n	http://lattes.cnpq.br/8478468854171346	$2b$10$Ho9yJ/eX2eW7GxmG4M6y/eqMR9k8uKrON/SgbNrkg4HTBqj7TG1b2	1764076264559-863217718.jpg	f	4
15	Luiz Gabriel	213.187.970-98	luiz.gabriel@uni.edu.br	Doutorando em Sensoriamento Remoto no Programa de Pós Graduação em Sensoriamento Remoto do Instituto Nacional de Pesquisas Espaciais. Possui graduação e mestrado em Engenharia Agronômica (UFSCar) e graduação em Ciências Moleculares (USP). Possui experiência em ciência de dados e tem interesse em processos de mudança de uso da terra e ordenamento territorial, meteorologia e ecologia.\r\n	https://lattes.cnpq.br/9832175220121645	$2b$10$xhpORrZWZn7TlLSunkNeVe9hlvxHbc.fWxYOKVBZvvHCzybJUC3pu	1764076342475-24992229.jpg	f	4
13	Gabriel Sansigolo	802.081.210-56	gabriel.sansigolo@uni.edu.br	Doutorando em Computação Aplicada pelo Instituto Nacional de Pesquisas Espaciais. Mestre em Computação Aplicada e Tecnólogo em Análise e Desenvolvimento de Sistemas. Tem experiência na área de Ciência da Computação, com ênfase em Geoinformática. Atualmente é pesquisador da Fundação para o Desenvolvimento Científico e Tecnológico em Saúde e desenvolvedor Full-stack nos Projetos Brazil Data Cube e HARMONIZE. \r\n	http://lattes.cnpq.br/4094434844735694	$2b$10$gjxyMuzfZBdlwjcXhX9TFej5zMi7YQVddYpe86sP13Rw/6dKxO45S	1764076691665-657517487.jpeg	f	4
12	Darlan Teles	305.094.710-13	darlan.teles@uni.edu.br	Doutorando em Sensoriamento Remoto no Instituto Nacional de Pesquisas Espaciais (INPE) com ênfase em indicadores remoto para qualidade de pastagens no Cerrado. Mestre em Meteorologia Aplicada na Universidade Federal de Viçosa (UFV). Engenheiro Agrícola formado pela Universidade Federal de Sergipe (UFS).\r\n	http://lattes.cnpq.br/2688151470890069	$2b$10$RDk31FoX44PGOoKWo8W20OhvtP6oK9DH.5RZAgq0VhYjSWijGRdby	1764076758628-58468178.jpeg	f	4
9	Lorrany Colegnac	863.250.030-98	lorrany.colegnac@uni.edu.br	Bacharel em Geografia (UNICENTRO). Atualmente é bolsista de projeto (CNPq) do AgriRS (INPE) em parceria com a CONAB.\r\n	http://lattes.cnpq.br/1847544097139347	$2b$10$w0lfmPEQ43tNJq6UNOI27.rX63ou07XkAgjV5VnimrVqqNqaBYeiq	1764077023501-990826527.jpg	f	3
8	Kellin Kang	087.146.680-50	kellin.kang@uni.edu.br	Cientista Ambiental (UNIFESP). Atualmente é bolsista de projeto (CNPq) do AgriRS (INPE) em parceria com a CONAB.\r\n	\N	$2b$10$0Txuw1REHYbZJaL9yUBYu.tBOOgVxGpDb3VcCBnlpTZY2wHXlp5d.	\N	f	3
14	Luis Maurano	158.078.010-59	luis.maurano@uni.edu.br	Doutorando em Sensoriamento Remoto no Instituto Nacional de Pesquisas Espaciais (INPE 2024/2027). Mestre em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE 2016/2018). Possui graduação de Tecnólogo em Processamento de Dados pela Faculdade de Tecnologia da Universidade Presbiteriana Mackenzie (1988). Atualmente é Tecnologista Sênior III da Divisão de Processamento de Imagens (DPI) do Instituto Nacional de Pesquisas Espaciais (INPE) com atuação no Programa Biomas BR - PRODES, DETER e TERRACLASS. Concepção, modelagem e implantação do banco de dados geográficos para suporte ao programa de monitoramento de queimadas e desmatamento por satélite do INPE.\r\n	http://lattes.cnpq.br/8242319727045776	$2b$10$KT16iJcPt0s6T7/bsmmNYuNfjtyalCbXY11juFYqOJ7zqGwtPz2F2	\N	f	4
10	Mayrine Silva	426.266.430-92	mayrine.silva@uni.edu.br	Bióloga (UTP) e Engenheira Florestal (UFSC), mestre em Ciências pelo PPG em Ecossistemas Agrícolas e Naturais (UFSC). Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB.\r\n	http://lattes.cnpq.br/7746175904660682	$2b$10$VeK7czolgZ0lfLqQUR7NgedBCZ8xZMaobH2ccGvb4q0.tw2KSUHEG	1764076984131-649199128.jpg	f	3
23	Grazieli Rodigheri	217.409.240-96	grazieli.rodigheri@uni.edu.br	Engenheira Ambiental (UPF), mestre em Sensoriamento Remoto e Geoprocessamento (UFRGS) e doutora em Sensoriamento Remoto (INPE). Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB.	http://lattes.cnpq.br/0334477245993338	$2b$10$rwR20oj4n5LLgL90hvkxveN.ITLc3GnUrvt0Eikgu3pOaxHePr8yy	1764077159204-43202238.jpeg	f	3
4	André Garcia	928.311.530-93	andre.garcia@uni.edu.br	Agrônomo (IFES) e Doutor em Sensoriamento Remoto (INPE), com ênfase na linha de pesquisa em sensoriamento remoto aplicado à agricultura. Membro do AgriRSLab com foco no desenvolvimento de metodologias e abordagens para mapeamento e caracterização de cultivos agrícolas. Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB onde desenvolve trabalhos de mapeamento do uso e cobertura do solo por meio de imagens orbitais de satélites ópticos e de micro-ondas (SAR).\r\n	http://lattes.cnpq.br/7262240008707700	$2b$10$bLaisPhnFD4rcmTPJICx6ewi.W8UFoXzZksVHz11DhUidyEGBxBJC	1764077219915-264441504.jpeg	f	3
3	Victor Prudente	362.477.160-44	victor.prudente@edu.uni.br	Pesquisador de pós-doutorado na School for Environment and Sustainability (SEAS) na Universidade de Michigan. Tem experiência em Sensoriamento Remoto, atuando nas seguintes subáreas: sensoriamento remoto agrícola, sensoriamento remoto por micro-ondas (SAR), multisensor, mudanças de uso e cobertura da terra, e monitoramento de agricultura familiar. Doutor em Sensoriamento Remoto pelo INPE. Bacharel e Mestre em Engenharia Agrícola (Unioeste).\r\n	http://lattes.cnpq.br/6154929133513022	$2b$10$AdEkTii3W3b/ew82Rt/c9eluC6bBvJEylsZ1PLJuOyE66Uh5Jd.o.	1764077269800-449617294.jpg	f	1
11	Thaísa	665.212.680-07	thaisa@uni.edu.br	Cientista Ambiental (UFG), mestre em Ciências Ambientais (UnB) e doutoranda em Ciências Ambientais (UFG). Atualmente é bolsista de projeto (CNPq) do AgriRS (INPE) em parceria com a CONAB.\r\n	\N	$2b$10$.Vl0LgN/uXuO.yCf29Qeg.JtcjR66jN7/Ofs6U4CR0CocPVn2gYcu	1764077283364-860183707.jpeg	f	3
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id_status, st_nome_status) FROM stdin;
1	Concluído
2	Em andamento
3	Agendado
\.


--
-- Data for Name: tipo_conteudo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_conteudo (id_tipo_conteudo, tc_conteudo) FROM stdin;
1	Publicação
2	Notícia
3	Projeto
4	Vaga
\.


--
-- Name: cargo_id_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 5, true);


--
-- Name: conteudo_id_conteudo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conteudo_id_conteudo_seq', 15, true);


--
-- Name: membros_id_membro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membros_id_membro_seq', 23, true);


--
-- Name: status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_status_seq', 3, true);


--
-- Name: tipo_conteudo_id_tipo_conteudo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_conteudo_id_tipo_conteudo_seq', 4, true);


--
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- Name: conteudo conteudo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo
    ADD CONSTRAINT conteudo_pkey PRIMARY KEY (id_conteudo);


--
-- Name: membros membros_me_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membros
    ADD CONSTRAINT membros_me_cpf_key UNIQUE (me_cpf);


--
-- Name: membros membros_me_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membros
    ADD CONSTRAINT membros_me_email_key UNIQUE (me_email);


--
-- Name: membros membros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membros
    ADD CONSTRAINT membros_pkey PRIMARY KEY (id_membro);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);


--
-- Name: tipo_conteudo tipo_conteudo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_conteudo
    ADD CONSTRAINT tipo_conteudo_pkey PRIMARY KEY (id_tipo_conteudo);


--
-- Name: conteudo conteudo_co_publicante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo
    ADD CONSTRAINT conteudo_co_publicante_fkey FOREIGN KEY (co_publicante) REFERENCES public.membros(id_membro) ON DELETE SET NULL;


--
-- Name: conteudo conteudo_co_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo
    ADD CONSTRAINT conteudo_co_status_fkey FOREIGN KEY (co_status) REFERENCES public.status(id_status) ON DELETE SET NULL;


--
-- Name: conteudo conteudo_co_tipo_conteudo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudo
    ADD CONSTRAINT conteudo_co_tipo_conteudo_fkey FOREIGN KEY (co_tipo_conteudo) REFERENCES public.tipo_conteudo(id_tipo_conteudo) ON DELETE SET NULL;


--
-- Name: membros membros_me_cargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membros
    ADD CONSTRAINT membros_me_cargo_fkey FOREIGN KEY (me_cargo) REFERENCES public.cargo(id_cargo) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 9llqXluMXMRYeJi2M2g9gYwKc2Nnm99aKjqw3mouPSUAcxQyq1omhncFpRSKFUc

