CREATE TABLE TB_GIVEWIN_DOADOR (
    id_doador NUMBER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    pontuacao NUMBER
);

CREATE TABLE TB_GIVEWIN_RECEPTOR (
    id_receptor NUMBER PRIMARY KEY,
    razaoSocial VARCHAR(255) NOT NULL,
    nomeFantasia VARCHAR(255),
    cnpj VARCHAR(20) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE TB_GIVEWIN_TIPO_DOACAO (
    id_tipo_doacao NUMBER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    pontuacao_doacao NUMBER NOT NULL
);

CREATE TABLE TB_GIVEWIN_DOACAO (
    id_doacao NUMBER PRIMARY KEY,
    id_tipo_doacao NUMBER NOT NULL,
    id_doador NUMBER NOT NULL,
    id_receptor NUMBER NOT NULL,
    FOREIGN KEY (id_tipo_doacao) REFERENCES TB_GIVEWIN_TIPO_DOACAO(id_tipo_doacao),
    FOREIGN KEY (id_doador) REFERENCES TB_GIVEWIN_DOADOR(id_doador),
    FOREIGN KEY (id_receptor) REFERENCES TB_GIVEWIN_RECEPTOR(id_receptor)
);

CREATE TABLE TB_GIVEWIN_PARCEIRO (
    id_parceiro NUMBER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    cnpj VARCHAR(20) NOT NULL
);

CREATE TABLE TB_GIVEWIN_CUPOM (
    id_cupom NUMBER PRIMARY KEY,
    quantidade NUMBER NOT NULL,
    valor_desconto NUMBER NOT NULL,
    disponivel BOOLEAN NOT NULL,
    codigo_gerado VARCHAR(255) NOT NULL,
    id_parceiro NUMBER,
    FOREIGN KEY (id_parceiro) REFERENCES TB_GIVEWIN_PARCEIRO(id_parceiro)
);

CREATE TABLE TB_GIVEWIN_CUPONS_DOADOR (
    id_cupom NUMBER,
    id_doador NUMBER,
    codigo_gerado VARCHAR(255),
    dt_utilizacao DATE,
    PRIMARY KEY (id_cupom, id_doador),
    FOREIGN KEY (id_cupom) REFERENCES TB_GIVEWIN_CUPOM(id_cupom),
    FOREIGN KEY (id_doador) REFERENCES TB_GIVEWIN_DOADOR(id_doador)
);
