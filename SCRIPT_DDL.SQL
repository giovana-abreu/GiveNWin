CREATE TABLE TB_GIVEWIN_DOADOR (
    id_doador NUMBER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    genero VARCHAR(20) CHECK (genero IN ('Feminino', 'Masculino', 'Nao Binario', 'Outros')) NOT NULL,
    estado VARCHAR(30) CHECK (estado IN ('Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará', 'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima', 'Santa Catarina', 'São Paulo', 'Sergipe', 'Tocantins')) NOT NULL,	
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
    razaoSocial VARCHAR(255) NOT NULL,
    nomeFantasia VARCHAR(255),
    cnpj VARCHAR(20) NOT NULL
);

CREATE TABLE TB_GIVEWIN_CUPOM (
    id_cupom NUMBER PRIMARY KEY,
    quantidade NUMBER NOT NULL,
    valor_desconto NUMBER NOT NULL,
    cupom_ativo VARCHAR(5)CHECK(cupom_ativo IN('FALSE', 'TRUE')) NOT NULL,
    id_parceiro NUMBER,
    FOREIGN KEY (id_parceiro) REFERENCES TB_GIVEWIN_PARCEIRO(id_parceiro)
);

CREATE TABLE TB_GIVEWIN_CUPOM_DOADOR (
    id_cupom_doador NUMBER,
    id_cupom NUMBER,
    id_doador NUMBER,
    codigo_gerado VARCHAR(255),
    dt_utilizacao DATE,
    PRIMARY KEY (id_cupom, id_doador),
    FOREIGN KEY (id_cupom) REFERENCES TB_GIVEWIN_CUPOM(id_cupom),
    FOREIGN KEY (id_doador) REFERENCES TB_GIVEWIN_DOADOR(id_doador)
);

CREATE TABLE TB_GIVEWIN_ERROS (
    id_erro NUMBER, 
    data_erro DATE, 
    cod_erro NUMBER, 
    desc_erro VARCHAR(2000)
);


--SEQUENCES PARA GERAR ID

CREATE SEQUENCE seq_tb_givewin_doador START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_tipo_doacao START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_cupom START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_receptor START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_parceiro START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_doacao START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_cupom_doador START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tb_givewin_erros START WITH 1 INCREMENT BY 1;

---DROPS

DROP TABLE TB_GIVEWIN_CUPOM_DOADOR CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_CUPOM CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_DOACAO CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_PARCEIRO CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_TIPO_DOACAO CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_RECEPTOR CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_DOADOR CASCADE CONSTRAINTS;
DROP TABLE TB_GIVEWIN_ERROS CASCADE CONSTRAINTS;


DROP SEQUENCE seq_tb_givewin_cupom_doador;
DROP SEQUENCE seq_tb_givewin_cupom;
DROP SEQUENCE seq_tb_givewin_doacao;
DROP SEQUENCE seq_tb_givewin_parceiro;
DROP SEQUENCE seq_tb_givewin_tipo_doacao;
DROP SEQUENCE seq_tb_givewin_receptor;
DROP SEQUENCE seq_tb_givewin_doador;
DROP SEQUENCE seq_tb_givewin_erros;