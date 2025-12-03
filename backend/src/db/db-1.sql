
    -- 1. LIMPEZA TOTAL
    DROP SCHEMA IF EXISTS public CASCADE;
    CREATE SCHEMA public;
    GRANT ALL ON SCHEMA public TO postgres;
    GRANT ALL ON SCHEMA public TO public;

    -- 2. CRIAÇÃO DAS TABELAS
    CREATE TABLE public.cargo (
        id_cargo integer NOT NULL PRIMARY KEY,
        ca_nome_cargo character varying(100) NOT NULL
    );

    CREATE TABLE public.status (
        id_status integer NOT NULL PRIMARY KEY,
        st_nome_status character varying(100) NOT NULL
    );

    CREATE TABLE public.tipo_conteudo (
        id_tipo_conteudo integer NOT NULL PRIMARY KEY,
        tc_conteudo character varying(50) NOT NULL
    );

    CREATE TABLE public.membros (
        id_membro integer NOT NULL PRIMARY KEY,
        me_nome character varying(100) NOT NULL,
        me_cpf character varying(14) NOT NULL UNIQUE,
        me_email character varying(100) NOT NULL UNIQUE,
        me_descricao text,
        me_lattes character varying(255),
        me_senha text NOT NULL,
        me_imagem text,
        me_administrador boolean DEFAULT false,
        me_cargo integer REFERENCES public.cargo(id_cargo)
    );

    CREATE TABLE public.conteudo (
        id_conteudo integer NOT NULL PRIMARY KEY,
        co_titulo text,
        co_publicante integer REFERENCES public.membros(id_membro),
        co_autor character varying(255),
        co_pdf text,
        co_citacao text,
        co_doi character varying(100),
        co_data date,
        co_lide text,
        co_status integer REFERENCES public.status(id_status),
        co_data_inicio date,
        co_data_termino date,
        co_objetivo text,
        co_requisitos text,
        co_plano_trabalho text,
        co_atividades text,
        co_tipo_conteudo integer REFERENCES public.tipo_conteudo(id_tipo_conteudo),
        co_conteudo text,
        co_imagem character varying(255)
    );

    -- 3. SEQUENCES
    CREATE SEQUENCE public.cargo_id_cargo_seq AS integer START WITH 1 OWNED BY public.cargo.id_cargo;
    ALTER TABLE ONLY public.cargo ALTER COLUMN id_cargo SET DEFAULT nextval('public.cargo_id_cargo_seq');

    CREATE SEQUENCE public.conteudo_id_conteudo_seq AS integer START WITH 1 OWNED BY public.conteudo.id_conteudo;
    ALTER TABLE ONLY public.conteudo ALTER COLUMN id_conteudo SET DEFAULT nextval('public.conteudo_id_conteudo_seq');

    CREATE SEQUENCE public.membros_id_membro_seq AS integer START WITH 1 OWNED BY public.membros.id_membro;
    ALTER TABLE ONLY public.membros ALTER COLUMN id_membro SET DEFAULT nextval('public.membros_id_membro_seq');

    CREATE SEQUENCE public.status_id_status_seq AS integer START WITH 1 OWNED BY public.status.id_status;
    ALTER TABLE ONLY public.status ALTER COLUMN id_status SET DEFAULT nextval('public.status_id_status_seq');

    CREATE SEQUENCE public.tipo_conteudo_id_tipo_conteudo_seq AS integer START WITH 1 OWNED BY public.tipo_conteudo.id_tipo_conteudo;
    ALTER TABLE ONLY public.tipo_conteudo ALTER COLUMN id_tipo_conteudo SET DEFAULT nextval('public.tipo_conteudo_id_tipo_conteudo_seq');

    -- 4. DADOS AUXILIARES
    INSERT INTO public.cargo (id_cargo, ca_nome_cargo) VALUES (1, 'Pesquisador'), (2, 'Coordenador'), (3, 'Bolsista'), (4, 'Doutorando'), (5, 'Mestrando');
    INSERT INTO public.status (id_status, st_nome_status) VALUES (1, 'Concluído'), (2, 'Em andamento'), (3, 'Agendado');
    INSERT INTO public.tipo_conteudo (id_tipo_conteudo, tc_conteudo) VALUES (1, 'Publicação'), (2, 'Notícia'), (3, 'Projeto'), (4, 'Vaga');

    -- 5. MEMBROS
    INSERT INTO public.membros (id_membro, me_nome, me_cpf, me_email, me_descricao, me_lattes, me_senha, me_imagem, me_administrador, me_cargo) VALUES
(2, 'Cleverton Santana', '997.003.290-97', 'cleverton.santana@uni.edu.br', 'Engenheiro Agrônomo (UNEMAT), com mestrado em Agronomia - Agricultura (FAC-UNESP) e doutorado em Sensoriamento Remoto (INPE). Atualmente é analista na Companhia Nacional de Abastecimento (Conab), onde desenvolve pesquisas na área de monitoramento agrícola, com foco em estádios fenológicos, estimativa de área e produtividade, além da classificação de culturas agrícolas, utilizando dados de sensoriamento remoto.', 'https://lattes.cnpq.br/6403186357124271', '$2b$10$pUo54Eoi89l.w4bYTcyEw.xjNRe5Yn.SVEkNhjxR2vTe.Km5Rmx8q', '1764071032309-309397110.jpeg', FALSE, 1),
(1, 'Marcos Adami', '276.552.230-84', 'marcos.adami@uni.edu.br', 'Pesquisador titular do Instituto Nacional de Pesquisas Espaciais, graduado em Ciências Econômicas pela Faculdade de Filosofia Ciências e Letras de Cornélio Procópio (1997), mestrado e doutorado em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (2003 e 2010). Possui experiência em sistemas de informação geográfica e sensoriamento remoto com ênfase nos seguintes temas: análise de séries temporais, mudança de uso da terra, amostragem e estatísticas agrícolas.', 'http://lattes.cnpq.br/7484071887086439', '$2b$10$ySY33.sc3qFmIKf3fSrtduv59vUN3e.XmBtNA7BX4z3xOQyQ0A95O', 'Marcos_Adami.jpg', TRUE, 2),
(20, 'Ana Júlia Dias', '672.534.050-48', 'ana.julia@uni.edu.br', 'Mestranda do Programa de Pós Graduação em Sensoriamento Remoto, no Instituto Nacional de Pesquisas espaciais (INPE). Formada em Bacharel em Geografia, com ênfase em análise ambiental e geoprocessamento, pela Universidade Estadual Paulista Júlio de Mesquita Filho - UNESP. Atualmente faz pesquisa com foco na identificação semi-automatizada de degradação na vegetação do Cerrado e atua no projeto Lethal Psi (Leeds- UK) na área de coleta e processamento de dados radiométricos da vegetação Amazônica. Tem experiência na área de Geografia, com ênfase em geoprocessamento e Sensoriamento Remoto, atuando principalmente nos seguintes temas: Vegetação, Cerrado, Radiometria,Temperatura e Saúde', 'http://lattes.cnpq.br/3916239078525280', '$2b$10$9YyFqTLmRru/vW67O/DwauhD.gcZ25QoV5FIrF1ReZijsPhw26jbm', '1764075148498-65764159.jpg', FALSE, 5),
(21, 'Marina Galdez', '730.385.610-29', 'marina.galdez@uni.edu.br', 'Engenheira Agrícola e Ambiental formada pela Universidade Federal Fluminense (UFF). Atualmente, mestranda do Programa de Pós Graduação em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Desenvolve pesquisas voltadas ao monitoramento agrícola, com foco na estimativa da cobertura do solo por resíduos culturais.', 'http://lattes.cnpq.br/3273203574648394', '$2b$10$aonJVi9K2rSULMd11SwtjeuJo0gA8eVq3W5h3rmAB5zyxzxr6mUAm', '1764075419255-732406575.jpg', FALSE, 5),
(19, 'Yan Azeredo da Silva', '370.474.250-39', 'yan.azeredo@uni.edu.br', 'Geógrafo pela Universidade Federal Fluminense (UFF) e mestre em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Atualmente, é doutorando pelo mesmo instituto, com foco em monitoramento da vegetação nativa no bioma Cerrado. Possui experiência em geoprocessamento, modelagem ambiental e processamento digital de imagens de satélite, com ênfase em estudos de cobertura e uso da terra, desastres naturais e conservação ambiental.', 'http://lattes.cnpq.br/7374513612608164', '$2b$10$JLikcJHnWLbwj5UuNg9wY.XPS6pb.wmUln8d/getswtRqcKDDYpY.', '1764075609936-353944884.jpg', FALSE, 4),
(18, 'Tânia Beatriz Hoffmann', '705.530.360-50', 'tania.beatriz@uni.edu.br', 'Geógrafa pela Universidade FedeEngenheira Agrimensora e Cartógrafa, Mestra em Geociências e Especialista em Estatística Aplicada pela Universidade Federal Rural do Rio de Janeiro (UFRRJ). Atualmente, Doutoranda em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Possui experiência na área de Geociências, com ênfase em Geomática.ral de Santa Catarina (UFSC), mestre e atualmente doutoranda em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE), com período sanduíche na Universidade de Maryland (UMD).', 'http://lattes.cnpq.br/4681448772106846', '$2b$10$Jp6V7NghE4t/VMg3KKgtkOoaAS1pN1CFL4FTZ2sVu7W3ZbiMHYo6q', '1764075711676-33007254.jpg', FALSE, 4),
(17, 'Priscilla Santos', '491.374.480-13', 'priscilla.santos@uni.edu.br', 'Engenheira Agrimensora e Cartógrafa, Mestra em Geociências e Especialista em Estatística Aplicada pela Universidade Federal Rural do Rio de Janeiro (UFRRJ). Atualmente, Doutoranda em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE). Possui experiência na área de Geociências, com ênfase em Geomática.', 'http://lattes.cnpq.br/1105545816489485', '$2b$10$N2m0.CPGSWvCYg0K0Y0cs.2QSd2S0gnPySmfkppmb.vQ2JLroMEgu', '1764075811738-847977584.jpg', FALSE, 4),
(16, 'Nildson Silva', '885.729.990-27', 'nildson.silva@edu.uni.br', 'Engenheiro Agrônomo (UFRPE) com graduação-sanduíche no curso de Engenharia Agrícola e do Meio Rural (USC/Espanha) e mestre em Sensoriamento Remoto (INPE). Atualmente doutorando em Sensoriamento Remoto (INPE) e Analista de Geoprocessamento na Serasa Experian.', 'http://lattes.cnpq.br/8478468854171346', '$2b$10$Ho9yJ/eX2eW7GxmG4M6y/eqMR9k8uKrON/SgbNrkg4HTBqj7TG1b2', '1764076264559-863217718.jpg', FALSE, 4),
(15, 'Luiz Gabriel', '213.187.970-98', 'luiz.gabriel@uni.edu.br', 'Doutorando em Sensoriamento Remoto no Programa de Pós Graduação em Sensoriamento Remoto do Instituto Nacional de Pesquisas Espaciais. Possui graduação e mestrado em Engenharia Agronômica (UFSCar) e graduação em Ciências Moleculares (USP). Possui experiência em ciência de dados e tem interesse em processos de mudança de uso da terra e ordenamento territorial, meteorologia e ecologia.', 'https://lattes.cnpq.br/9832175220121645', '$2b$10$xhpORrZWZn7TlLSunkNeVe9hlvxHbc.fWxYOKVBZvvHCzybJUC3pu', '1764076342475-24992229.jpg', FALSE, 4),
(13, 'Gabriel Sansigolo', '802.081.210-56', 'gabriel.sansigolo@uni.edu.br', 'Doutorando em Computação Aplicada pelo Instituto Nacional de Pesquisas Espaciais. Mestre em Computação Aplicada e Tecnólogo em Análise e Desenvolvimento de Sistemas. Tem experiência na área de Ciência da Computação, com ênfase em Geoinformática. Atualmente é pesquisador da Fundação para o Desenvolvimento Científico e Tecnológico em Saúde e desenvolvedor Full-stack nos Projetos Brazil', 'http://lattes.cnpq.br/4094434844735694', '$2b$10$gjxyMuzfZBdlwjcXhX9TFej5zMi7YQVddYpe86sP13Rw/6dKxO45S', '1764076691665-657517487.jpeg', FALSE, 4),
(12, 'Darlan Teles', '305.094.710-13', 'darlan.teles@uni.edu.br', 'Doutorando em Sensoriamento Remoto no Instituto Nacional de Pesquisas Espaciais (INPE) com ênfase em indicadores remoto para qualidade de pastagens no Cerrado. Mestre em Meteorologia Aplicada na Universidade Federal de Viçosa (UFV). Engenheiro Agrícola formado pela Universidade Federal de Sergipe (UFS).', 'http://lattes.cnpq.br/2688151470890069', '$2b$10$RDk31FoX44PGOoKWo8W20OhvtP6oK9DH.5RZAgq0VhYjSWijGRdby', '1764076758628-58468178.jpeg', FALSE, 4),
(9, 'Lorrany Colegnac', '863.250.030-98', 'lorrany.colegnac@uni.edu.br', 'Bacharel em Geografia...', 'http://lattes.cnpq.br/1847544097139347', '$2b$10$w0lfmPEQ43tNJq6UNOI27.rX63ou07XkAgjV5VnimrVqqNqaBYeiq', '1764077023501-990826527.jpg', FALSE, 3),
(8, 'Kellin Kang', '087.146.680-50', 'kellin.kang@uni.edu.br', 'Cientista Ambiental (UNIFESP). Atualmente é bolsista de projeto (CNPq) do AgriRS (INPE) em parceria com a CONAB.', NULL, '$2b$10$0Txuw1REHYbZJaL9yUBYu.tBOOgVxGpDb3VcCBnlpTZY2wHXlp5d.', NULL, FALSE, 3),
(14, 'Luis Maurano', '158.078.010-59', 'luis.maurano@uni.edu.br', 'Doutorando em Sensoriamento Remoto no Instituto Nacional de Pesquisas Espaciais (INPE 2024/2027). Mestre em Sensoriamento Remoto pelo Instituto Nacional de Pesquisas Espaciais (INPE 2016/2018). Possui graduação de Tecnólogo em Processamento de Dados pela Faculdade de Tecnologia da Universidade Presbiteriana Mackenzie (1988). Atualmente é Tecnologista Sênior III da Divisão de Processamento de Imagens (DPI) do Instituto Nacional de Pesquisas Espaciais (INPE) com atuação no Programa Biomas BR - PRODES, DETER e TERRACLASS. Concepção, modelagem e implantação do banco de dados geográficos para suporte ao programa de monitoramento de queimadas e desmatamento por satélite do INPE.', 'http://lattes.cnpq.br/8242319727045776', '$2b$10$KT16iJcPt0s6T7/bsmmNYuNfjtyalCbXY11juFYqOJ7zqGwtPz2F2', NULL, FALSE, 4),
(10, 'Mayrine Silva', '426.266.430-92', 'mayrine.silva@uni.edu.br', 'Bióloga (UTP) e Engenheira Florestal (UFSC), mestre em Ciências pelo PPG em Ecossistemas Agrícolas e Naturais (UFSC). Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB.', 'http://lattes.cnpq.br/7746175904660682', '$2b$10$VeK7czolgZ0lfLqQUR7NgedBCZ8xZMaobH2ccGvb4q0.tw2KSUHEG', '1764076984131-649199128.jpg', FALSE, 3),
(23, 'Grazieli Rodigheri', '217.409.240-96', 'grazieli.rodigheri@uni.edu.br', 'Engenheira Ambiental (UPF), mestre em Sensoriamento Remoto e Geoprocessamento (UFRGS) e doutora em Sensoriamento Remoto (INPE). Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB.', 'http://lattes.cnpq.br/0334477245993338', '$2b$10$rwR20oj4n5LLgL90hvkxveN.ITLc3GnUrvt0Eikgu3pOaxHePr8yy', '1764077159204-43202238.jpeg', FALSE, 3),
(4, 'André Garcia', '928.311.530-93', 'andre.garcia@uni.edu.br', 'Agrônomo (IFES) e Doutor em Sensoriamento Remoto (INPE), com ênfase na linha de pesquisa em sensoriamento remoto aplicado à agricultura. Membro do AgriRSLab com foco no desenvolvimento de metodologias e abordagens para mapeamento e caracterização de cultivos agrícolas. Atualmente é bolsista de projeto (CNPq) do AgriRS em parceria com a CONAB onde desenvolve trabalhos de mapeamento do uso e cobertura do solo por meio de imagens orbitais de satélites ópticos e de micro-ondas (SAR).', 'http://lattes.cnpq.br/7262240008707700', '$2b$10$bLaisPhnFD4rcmTPJICx6ewi.W8UFoXzZksVHz11DhUidyEGBxBJC', '1764077219915-264441504.jpeg', FALSE, 3),
(3, 'Victor Prudente', '362.477.160-44', 'victor.prudente@edu.uni.br', 'Pesquisador de pós-doutorado na School for Environment and Sustainability (SEAS) na Universidade de Michigan. Tem experiência em Sensoriamento Remoto, atuando nas seguintes subáreas: sensoriamento remoto agrícola, sensoriamento remoto por micro-ondas (SAR), multisensor, mudanças de uso e cobertura da terra, e monitoramento de agricultura familiar. Doutor em Sensoriamento Remoto pelo INPE. Bacharel e Mestre em Engenharia Agrícola (Unioeste).', 'http://lattes.cnpq.br/6154929133513022', '$2b$10$AdEkTii3W3b/ew82Rt/c9eluC6bBvJEylsZ1PLJuOyE66Uh5Jd.o.', '1764077269800-449617294.jpg', FALSE, 1),
(11, 'Thaísa', '665.212.680-07', 'thaisa@uni.edu.br', 'Cientista Ambiental (UFG), mestre em Ciências Ambientais (UnB) e doutoranda em Ciências Ambientais (UFG). Atualmente é bolsista de projeto (CNPq) do AgriRS (INPE) em parceria com a CONAB.', NULL, '$2b$10$.Vl0LgN/uXuO.yCf29Qeg.JtcjR66jN7/Ofs6U4CR0CocPVn2gYcu', '1764077283364-860183707.jpeg', FALSE, 3)
ON CONFLICT (id_membro) DO NOTHING;

    -- 6. INSERÇÃO DE CONTEÚDO
    -- 6.1 PROJETOS
    INSERT INTO public.conteudo (id_conteudo, co_titulo, co_publicante, co_autor, co_status, co_data_inicio, co_data_termino, co_plano_trabalho, co_lide, co_tipo_conteudo, co_imagem) VALUES
    (2, 'Mapeamento de áreas agrícolas junto a CONAB', 1, 'André Garcia', 1, '2025-11-05', '2025-11-28', '3', 'O AgriRS integra um projeto...', 3, '1764079654406-af969293-9905-4cf9-ab5f-2026a379f68a.png'),
    (3, 'Mapeamento e Monitoramento de Cultivos Agrícolas', 1, 'Priscilla Azevedo dos Santos', 2, '2025-11-05', '2025-11-30', NULL, 'O objetivo da pesquisa...', 3, '1764081116805-250527_MapaAptidÃ£oAgrÃ­cola_DiculgaÃ§Ã£o_mapa.jpg'),
    (4, 'Estimativa do Percentual de Cobertura do Solo', 1, 'Marina Galdez de Castro Silva', 2, '2025-11-01', '2025-11-03', NULL, 'Os resíduos culturais...', 3, '1764081673432-51028.png'),
    (5, 'Detecção de Desmatamento e Cicatriz de Fogo', 1, 'Ana Júlia Dias', 3, '2025-11-29', '2025-11-30', NULL, 'O Cerrado passou a ser...', 3, '1764081812797-validacao-pt.png');

    -- 6.2 PUBLICAÇÕES
    INSERT INTO public.conteudo (id_conteudo, co_titulo, co_publicante, co_doi, co_citacao, co_data, co_plano_trabalho, co_tipo_conteudo, co_imagem) VALUES
    (6, 'Estimating crop sowing and harvesting dates', 1, 'https://doi.org/10.3390/rs15225366', 'Rodigheri, G. et al.', '2025-11-25', 1, 1, '1764082393074-Figura_A1_GR.jpg'),
    (7, 'Sugarcane Yield Estimation Using Satellite Remote Sensing', 1, 'https://doi.org/10.3390/rs16050863', 'de França e Silva, N. R. et al.', '2024-06-25', 1, 1, '1764082794706-Figura_A2_NS.png'),
    (8, 'Limitations of cloud cover for optical remote sensing', 1, 'https://doi.org/10.1016/j.rsase.2020.100414', 'Prudente, V.H.R. et al.', '2025-11-30', 1, 1, '1764083586352-Figura_A3_VP.png'),
    (9, 'Land Use and Land Cover Products for Agricultural Mapping', 1, 'https://doi.org/10.3390/rs17132324', 'Santos, P.A.d. et al.', '2025-11-30', 1, 1, '1764083704167-Figura_A4_PS.png'),
    (11, 'A Method for Estimating Soybean Sowing', 1, 'https://doi.org/10.3390/rs16142520', 'Santana, C.T.C. et al.', '2025-11-01', 1, 1, '1764083814133-Figura_A5_CS.jpeg'),
    (13, 'Comprehensive workflow for image segmentation', 1, 'https://doi.org/10.1016/j.acags.2025.100223', 'Garcia, A. D. B. et al.', '2025-11-16', 1, 1, '1764083899885-Figura_A6_AG.png'),
    (15, 'Growth behavior of irrigated rice', 1, 'https://doi.org/10.3390/agriengineering7030065', 'Garcia, A. D. B. et al.', '2026-10-13', 1, 1, '1764085075997-Figura_A7_AG.png');

    -- 6.3 VAGAS
    INSERT INTO public.conteudo (id_conteudo, co_titulo, co_publicante, co_data_inicio, co_data_termino, co_requisitos, co_atividades, co_lide, co_status, co_tipo_conteudo) VALUES 
    (20, 'Bolsa PCI - Desenvolvimento Full Stack para WebGIS', 1, '2025-11-26', '2025-12-20', 'Graduação em Ciência da Computação...', 'Desenvolver e manter o portal...', 'Oportunidade para atuar no desenvolvimento...', 2, 4),
    (21, 'Estágio em Sensoriamento Remoto e Geoprocessamento', 2, '2025-12-01', '2025-12-15', 'Estar cursando Geografia...', 'Apoio na validação de campo...', 'Vaga de estágio presencial...', 2, 4),
    (22, 'Bolsa DTI-A: Análise de Séries Temporais (Python/R)', 1, '2025-11-10', '2025-11-25', 'Doutorado em Sensoriamento Remoto...', 'Desenvolver algoritmos...', 'Bolsa de pesquisa para atuar no projeto...', 1, 4);

    -- 6.4 NOTÍCIAS
    INSERT INTO public.conteudo (id_conteudo, co_titulo, co_publicante, co_data, co_lide, co_conteudo, co_imagem, co_status, co_tipo_conteudo) VALUES 
    (23, 'Equipe do AgriRS conclui validação de campo no Oeste Baiano', 4, '2025-11-20', 'Pesquisadores percorreram mais de 2.000 km...', 'Durante duas semanas, a equipe...', '1764224073719-pc_home_carrosel1.webp', 1, 2),
    (24, 'Novo satélite CBERS-6 trará avanços para monitoramento de nuvens', 1, '2025-10-15', 'O futuro satélite da parceria Brasil-China...', 'O Instituto Nacional de Pesquisas Espaciais...', '1764224059073-pc_home_carrosel9.webp', 1, 2),
    (25, 'AgriRS Lab apresenta resultados no Simpósio Brasileiro de SR', 19, '2025-04-10', 'Três artigos desenvolvidos pela equipe...', 'O laboratório teve participação massiva...', '1764224124253-pc_home_carrosel8.webp', 1, 2);

    -- 7. ATUALIZAÇÃO DOS CONTADORES (SEQUENCES)
    SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 5, true);
    SELECT pg_catalog.setval('public.conteudo_id_conteudo_seq', 26, true);
    SELECT pg_catalog.setval('public.membros_id_membro_seq', 24, true);
    SELECT pg_catalog.setval('public.status_id_status_seq', 3, true);
    SELECT pg_catalog.setval('public.tipo_conteudo_id_tipo_conteudo_seq', 4, true);
