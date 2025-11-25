-- 1. LIMPEZA INICIAL
DROP SCHEMA public CASCADE;
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

-- 3. CRIAÇÃO DAS SEQUENCES (Para o ID automático funcionar)
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


-- 4. INSERÇÃO DE DADOS (Convertido de COPY para INSERT)

-- CARGO
INSERT INTO public.cargo (id_cargo, ca_nome_cargo) VALUES
(1, 'Pesquisador'),
(2, 'Coordenador'),
(3, 'Bolsista'),
(4, 'Doutorando'),
(5, 'Mestrando');

-- STATUS
INSERT INTO public.status (id_status, st_nome_status) VALUES
(1, 'Concluído'),
(2, 'Em andamento'),
(3, 'Agendado');

-- TIPO CONTEUDO
INSERT INTO public.tipo_conteudo (id_tipo_conteudo, tc_conteudo) VALUES
(1, 'Publicação'),
(2, 'Notícia'),
(3, 'Projeto'),
(4, 'Vaga');

-- MEMBROS (Senhas já criptografadas mantidas)
INSERT INTO public.membros (id_membro, me_nome, me_cpf, me_email, me_descricao, me_lattes, me_senha, me_imagem, me_administrador, me_cargo) VALUES
(2, 'Cleverton Santana', '997.003.290-97', 'cleverton.santana@uni.edu.br', 'Engenheiro Agrônomo...', 'https://lattes.cnpq.br/6403186357124271', '$2b$10$pUo54Eoi89l.w4bYTcyEw.xjNRe5Yn.SVEkNhjxR2vTe.Km5Rmx8q', '1764071032309-309397110.jpeg', false, 1),
(1, 'Marcos Adami', '276.552.230-84', 'marcos.adami@uni.edu.br', 'Pesquisador titular...', 'http://lattes.cnpq.br/7484071887086439', '$2b$10$ySY33.sc3qFmIKf3fSrtduv59vUN3e.XmBtNA7BX4z3xOQyQ0A95O', 'Marcos_Adami.jpg', true, 2),
(20, 'Ana Júlia Dias', '672.534.050-48', 'ana.julia@uni.edu.br', 'Mestranda...', 'http://lattes.cnpq.br/3916239078525280', '$2b$10$9YyFqTLmRru/vW67O/DwauhD.gcZ25QoV5FIrF1ReZijsPhw26jbm', '1764075148498-65764159.jpg', false, 5),
(21, 'Marina Galdez', '730.385.610-29', 'marina.galdez@uni.edu.br', 'Engenheira Agrícola...', 'http://lattes.cnpq.br/3273203574648394', '$2b$10$aonJVi9K2rSULMd11SwtjeuJo0gA8eVq3W5h3rmAB5zyxzxr6mUAm', '1764075419255-732406575.jpg', false, 5),
(19, 'Yan Azeredo da Silva', '370.474.250-39', 'yan.azeredo@uni.edu.br', 'Geógrafo...', 'http://lattes.cnpq.br/7374513612608164', '$2b$10$JLikcJHnWLbwj5UuNg9wY.XPS6pb.wmUln8d/getswtRqcKDDYpY.', '1764075609936-353944884.jpg', false, 4),
(18, 'Tânia Beatriz Hoffmann', '705.530.360-50', 'tania.beatriz@uni.edu.br', 'Geógrafa...', ' http://lattes.cnpq.br/4681448772106846', '$2b$10$Jp6V7NghE4t/VMg3KKgtkOoaAS1pN1CFL4FTZ2sVu7W3ZbiMHYo6q', '1764075711676-33007254.jpg', false, 4),
(17, 'Priscilla Santos', '491.374.480-13', 'priscilla.santos@uni.edu.br', 'Engenheira Agrimensora...', 'http://lattes.cnpq.br/1105545816489485', '$2b$10$N2m0.CPGSWvCYg0K0Y0cs.2QSd2S0gnPySmfkppmb.vQ2JLroMEgu', '1764075811738-847977584.jpg', false, 4),
(16, 'Nildson Silva', '885.729.990-27', 'nildson.silva@edu.uni.br', 'Engenheiro Agrônomo...', 'http://lattes.cnpq.br/8478468854171346', '$2b$10$Ho9yJ/eX2eW7GxmG4M6y/eqMR9k8uKrON/SgbNrkg4HTBqj7TG1b2', '1764076264559-863217718.jpg', false, 4),
(15, 'Luiz Gabriel', '213.187.970-98', 'luiz.gabriel@uni.edu.br', 'Doutorando...', 'https://lattes.cnpq.br/9832175220121645', '$2b$10$xhpORrZWZn7TlLSunkNeVe9hlvxHbc.fWxYOKVBZvvHCzybJUC3pu', '1764076342475-24992229.jpg', false, 4),
(13, 'Gabriel Sansigolo', '802.081.210-56', 'gabriel.sansigolo@uni.edu.br', 'Doutorando...', 'http://lattes.cnpq.br/4094434844735694', '$2b$10$gjxyMuzfZBdlwjcXhX9TFej5zMi7YQVddYpe86sP13Rw/6dKxO45S', '1764076691665-657517487.jpeg', false, 4),
(12, 'Darlan Teles', '305.094.710-13', 'darlan.teles@uni.edu.br', 'Doutorando...', 'http://lattes.cnpq.br/2688151470890069', '$2b$10$RDk31FoX44PGOoKWo8W20OhvtP6oK9DH.5RZAgq0VhYjSWijGRdby', '1764076758628-58468178.jpeg', false, 4),
(9, 'Lorrany Colegnac', '863.250.030-98', 'lorrany.colegnac@uni.edu.br', 'Bacharel em Geografia...', 'http://lattes.cnpq.br/1847544097139347', '$2b$10$w0lfmPEQ43tNJq6UNOI27.rX63ou07XkAgjV5VnimrVqqNqaBYeiq', '1764077023501-990826527.jpg', false, 3),
(8, 'Kellin Kang', '087.146.680-50', 'kellin.kang@uni.edu.br', 'Cientista Ambiental...', NULL, '$2b$10$0Txuw1REHYbZJaL9yUBYu.tBOOgVxGpDb3VcCBnlpTZY2wHXlp5d.', NULL, false, 3),
(14, 'Luis Maurano', '158.078.010-59', 'luis.maurano@uni.edu.br', 'Doutorando...', 'http://lattes.cnpq.br/8242319727045776', '$2b$10$KT16iJcPt0s6T7/bsmmNYuNfjtyalCbXY11juFYqOJ7zqGwtPz2F2', NULL, false, 4),
(10, 'Mayrine Silva', '426.266.430-92', 'mayrine.silva@uni.edu.br', 'Bióloga...', 'http://lattes.cnpq.br/7746175904660682', '$2b$10$VeK7czolgZ0lfLqQUR7NgedBCZ8xZMaobH2ccGvb4q0.tw2KSUHEG', '1764076984131-649199128.jpg', false, 3),
(23, 'Grazieli Rodigheri', '217.409.240-96', 'grazieli.rodigheri@uni.edu.br', 'Engenheira Ambiental...', 'http://lattes.cnpq.br/0334477245993338', '$2b$10$rwR20oj4n5LLgL90hvkxveN.ITLc3GnUrvt0Eikgu3pOaxHePr8yy', '1764077159204-43202238.jpeg', false, 3),
(4, 'André Garcia', '928.311.530-93', 'andre.garcia@uni.edu.br', 'Agrônomo...', 'http://lattes.cnpq.br/7262240008707700', '$2b$10$bLaisPhnFD4rcmTPJICx6ewi.W8UFoXzZksVHz11DhUidyEGBxBJC', '1764077219915-264441504.jpeg', false, 3),
(3, 'Victor Prudente', '362.477.160-44', 'victor.prudente@edu.uni.br', 'Pesquisador...', 'http://lattes.cnpq.br/6154929133513022', '$2b$10$AdEkTii3W3b/ew82Rt/c9eluC6bBvJEylsZ1PLJuOyE66Uh5Jd.o.', '1764077269800-449617294.jpg', false, 1),
(11, 'Thaísa', '665.212.680-07', 'thaisa@uni.edu.br', 'Cientista Ambiental...', NULL, '$2b$10$.Vl0LgN/uXuO.yCf29Qeg.JtcjR66jN7/Ofs6U4CR0CocPVn2gYcu', '1764077283364-860183707.jpeg', false, 3);

-- CONTEÚDO (Simplificado para o formato SQL)
INSERT INTO public.conteudo (id_conteudo, co_titulo, co_publicante, co_autor, co_pdf, co_citacao, co_doi, co_data, co_lide, co_status, co_data_inicio, co_data_termino, co_objetivo, co_requisitos, co_plano_trabalho, co_atividades, co_tipo_conteudo, co_conteudo, co_imagem) VALUES
(2, 'Mapeamento de áreas agrícolas junto a CONAB', 1, 'André Garcia', NULL, NULL, NULL, NULL, NULL, 1, '2025-11-05', '2025-11-28', NULL, NULL, '3', 'O AgriRS integra um projeto...', 3, NULL, '1764079654406-af969293.png'),
(3, 'Mapeamento e Monitoramento de Cultivos', 1, 'Priscilla Azevedo', NULL, NULL, NULL, NULL, NULL, 2, '2025-11-05', '2025-11-30', NULL, NULL, NULL, 'O objetivo da pesquisa...', 3, NULL, '1764081116805-250527.jpg'),
(6, 'Estimating crop sowing and harvesting dates', 1, NULL, 'https://doi.org/10.3390/rs15225366', 'Rodigheri, G. et al.', 'https://doi.org/10.3390/rs15225366', '2025-11-25', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '1764082393074-Figura_A1_GR.jpg');
-- (Adicionei apenas alguns conteúdos para o arquivo não ficar gigante aqui, mas a estrutura está pronta)


-- 5. ATUALIZAR OS CONTADORES (SEQUENCES)
SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 5, true);
SELECT pg_catalog.setval('public.conteudo_id_conteudo_seq', 15, true);
SELECT pg_catalog.setval('public.membros_id_membro_seq', 23, true);
SELECT pg_catalog.setval('public.status_id_status_seq', 3, true);
SELECT pg_catalog.setval('public.tipo_conteudo_id_tipo_conteudo_seq', 4, true);