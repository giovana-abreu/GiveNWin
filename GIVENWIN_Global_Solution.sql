-- COMANDOS DDL

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

--- Procedure para Carga Inicial

CREATE OR REPLACE PROCEDURE PROC_GIVEWIN_CARGAINICIAL IS
BEGIN

-- TB_GIVEWIN_DOADOR
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'João da Silva', '123.456.789-00', '123456', 'Masculino', 'São Paulo', 'joao.silva@gmail.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES(seq_tb_givewin_doador.NEXTVAL,'Maria da Silva', '987.654.321-00', '543219', 'Feminino', 'Bahia', 'maria.silva@email.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES(seq_tb_givewin_doador.NEXTVAL,'Jo Pereira', '098.765.432-10', '213456', 'Nao Binario', 'Ceará', 'jo.pereira@fiap.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Ana Lopes', '876.543.210-98', '654321', 'Outros', 'Distrito Federal', 'ana.lopes@email.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Pedro Santos', '765.432.109-87', '765432', 'Feminino', 'Espírito Santo', 'pedro.santos@uol.com.br', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Flávia Souza', '654.321.098-76', '876543', 'Masculino', 'Goiás', 'flavia.souza@yahoo.com.br', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Ariel Martins', '543.210.987-65', '987654', 'Nao Binario', 'Maranhão', 'ariel.martins@gmail.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Bruna Oliveira', '432.109.876-54', '098765', 'Feminino', 'Mato Grosso', 'bruna.oliveira@outlook.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (id_doador, nome, cpf, senha, genero, estado, email, pontuacao) VALUES (seq_tb_givewin_doador.NEXTVAL,'Rafaela Andrade', '321.098.765-43', '123456', 'Feminino', 'Mato Grosso do Sul', 'rafaela.andrade@hotmail.com', 0);

    -- TB_GIVEWIN_RECEPTOR
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (seq_tb_givewin_receptor.NEXTVAL,'HOSPITAL DAS CLINICAS DA FACULDADE DE MEDICINA DA USP', 'Hospital das Clinicas SP', '60.448.040/0001-22', 'hcsenha123');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (seq_tb_givewin_receptor.NEXTVAL,'SANTA CASA DE MISERICORDIA DE VOTUPORANGA','Santa Casa', '72.957.814/0001-20', 'santacasavotuporanga');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (seq_tb_givewin_receptor.NEXTVAL,'LR Servicos de Cabeleireiros e Comercio de Produtos LTDA','Glitz Mania', '13348142000196', 'glitzmania101112');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (seq_tb_givewin_receptor.NEXTVAL,'ONG Fio de Luz','ONG Fio de Luz', '29.634.833/0001-96', 'doecabelofiodeluz');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (seq_tb_givewin_receptor.NEXTVAL,'Uniao Brasileira De Educacao E Assistencia','HOSPITAL SAO LUCAS DA PUCRS',  '88630413000796', 'HSLPUCRS');

    -- TB_GIVEWIN_TIPO_DOACAO
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'Sangue', 1000);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'Medicamentos', 100);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'Equipamentos Medicos', 800);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'Plaquetas', 3000);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'Cabelo', 500);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (seq_tb_givewin_tipo_doacao.NEXTVAL, 'EPI', 50);

    -- TB_GIVEWIN_PARCEIRO
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj) VALUES (seq_tb_givewin_parceiro.NEXTVAL,'ARCOS DOURADOS COMERCIO DE ALIMENTOS LTDA','McDonalds', '42.591.651/0001-43');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj) VALUES (seq_tb_givewin_parceiro.NEXTVAL,'LIVRARIA LEITURA LTDA','Leitura', '18.741.504/0001-28');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj) VALUES (seq_tb_givewin_parceiro.NEXTVAL,'RAIA DROGASIL S/A','DrogaRaia', '61.585.865/0001-51');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj) VALUES (seq_tb_givewin_parceiro.NEXTVAL,'CENTAURO LTDA','Centauro', '74.501.131/0001-99');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj) VALUES (seq_tb_givewin_parceiro.NEXTVAL, 'IFOOD.COM AGENCIA DE RESTAURANTES ONLINE S.A.', 'iFood', '14.380.200/0001-21');
    -- TB_GIVEWIN_CUPOM
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 100, 10, 'TRUE', 4);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 50, 20, 'TRUE', 2);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 25, 30, 'TRUE', 3);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 15, 40, 'FALSE', 5);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 10, 50, 'TRUE', 3); 
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, cupom_ativo, id_parceiro) VALUES (seq_tb_givewin_cupom.NEXTVAL, 5, 60, 'FALSE', 1);
    
    
    -- TB_GIVEWIN_DOACAO
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (seq_tb_givewin_doacao.NEXTVAL,1,5,5);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (seq_tb_givewin_doacao.NEXTVAL,5,4,4);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (seq_tb_givewin_doacao.NEXTVAL,5,8,3);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (seq_tb_givewin_doacao.NEXTVAL,2,7,2);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (seq_tb_givewin_doacao.NEXTVAL,1,2,2);

    -- TB_GIVEWIN_CUPOM_DOADOR
    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 2, 3, DBMS_RANDOM.STRING('X', 13), SYSDATE);

    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 2, 1, DBMS_RANDOM.STRING('X', 13), SYSDATE);

    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 6, 2, DBMS_RANDOM.STRING('X', 13), SYSDATE);

    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 3, 4, DBMS_RANDOM.STRING('X', 13), SYSDATE);

    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 5, 2, DBMS_RANDOM.STRING('X', 13), SYSDATE);

    INSERT INTO TB_GIVEWIN_CUPOM_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao)
    VALUES (seq_tb_givewin_cupom_doador.NEXTVAL, 4, 5, DBMS_RANDOM.STRING('X', 13), SYSDATE);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN 
        DECLARE
            cod_erro NUMBER := SQLCODE;
            msg_erro VARCHAR2(1000) := SQLERRM;
        BEGIN
            INSERT INTO TB_GIVEWIN_ERROS (id_erro, data_erro, cod_erro, desc_erro) 
            VALUES (seq_tb_givewin_erros.NEXTVAL, SYSDATE, cod_erro, msg_erro);
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir as informações. Por favor, revise e tente novamente');
        END;
        
    WHEN NO_DATA_FOUND THEN DECLARE
            cod_erro NUMBER := SQLCODE;
            msg_erro VARCHAR2(1000) := SQLERRM;
        BEGIN
            INSERT INTO TB_GIVEWIN_ERROS (id_erro, data_erro, cod_erro, desc_erro) VALUES (seq_tb_givewin_erros.NEXTVAL, SYSDATE, cod_erro, msg_erro);
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir as informações. Por favor revise e tente novamente');
        END;
        
    WHEN OTHERS THEN DECLARE
            cod_erro NUMBER := SQLCODE;
            msg_erro VARCHAR2(1000) := SQLERRM;
        BEGIN
            INSERT INTO TB_GIVEWIN_ERROS (id_erro, data_erro, cod_erro, desc_erro) VALUES (seq_tb_givewin_erros.NEXTVAL, SYSDATE, cod_erro, msg_erro);
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir as informações. Por favor revise e tente novamente');
        END;

END PROC_GIVEWIN_CARGAINICIAL;
/

SET SERVEROUTPUT ON;
BEGIN
    PROC_GIVEWIN_CARGAINICIAL;
END;
/

--- Procedure: Comando DQL para verificar doações por tipo

CREATE OR REPLACE PROCEDURE PROC_DOADOR_POR_TIPO_DOACAO (
    p_tipo_doacao_id NUMBER
)
AS
    CURSOR cursor_doadores IS
        SELECT DISTINCT d.id_doador, d.nome
        FROM TB_GIVEWIN_DOACAO doac
        JOIN TB_GIVEWIN_DOADOR d ON doac.id_doador = d.id_doador
        JOIN TB_GIVEWIN_TIPO_DOACAO td ON doac.id_tipo_doacao = td.id_tipo_doacao
        WHERE td.id_tipo_doacao = p_tipo_doacao_id;

    var_id_doador TB_GIVEWIN_DOADOR.id_doador%TYPE;
    var_nome_doador TB_GIVEWIN_DOADOR.nome%TYPE;
    var_resultados NUMBER := 1;
BEGIN
    OPEN cursor_doadores;

    FETCH cursor_doadores INTO var_id_doador, var_nome_doador;
    IF cursor_doadores%NOTFOUND THEN
        var_resultados := 0;
    END IF;

    IF var_resultados = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Doadores encontrados:');
        LOOP
            DBMS_OUTPUT.PUT_LINE(var_id_doador || ' | ' || var_nome_doador);
            FETCH cursor_doadores INTO var_id_doador, var_nome_doador;
            EXIT WHEN cursor_doadores%NOTFOUND;
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nenhum doador encontrado para o tipo de doação especificado.');
    END IF;

    CLOSE cursor_doadores;
END PROC_DOADOR_POR_TIPO_DOACAO;
/

SET SERVEROUTPUT ON;
DECLARE
    tipo_doacao_id NUMBER := 1;
BEGIN
    PROC_DOADOR_POR_TIPO_DOACAO(tipo_doacao_id);
END;
/


--- Procedure: Comando DQL para puxar status do usuario por numero de doações

CREATE OR REPLACE PROCEDURE PROC_CONSULTA_STATUS_DOADOR (
    p_id_doador NUMBER
)
AS
    CURSOR cursor_info_doador IS
        SELECT
            d.id_doador,
            d.nome,
            COUNT(da.id_doacao) AS total_doacoes
        FROM
            TB_GIVEWIN_DOADOR d
        LEFT JOIN
            TB_GIVEWIN_DOACAO da ON d.id_doador = da.id_doador
        WHERE
            d.id_doador = p_id_doador
        GROUP BY
            d.id_doador, d.nome;

    var_registro_doador cursor_info_doador%ROWTYPE;
BEGIN
    OPEN cursor_info_doador;

    DBMS_OUTPUT.PUT_LINE('Nome | Total de Doações | Status');

    LOOP
        FETCH cursor_info_doador INTO var_registro_doador;
        EXIT WHEN cursor_info_doador%NOTFOUND;

        -- Tomada de decisão: Status baseado no número de doações
        IF var_registro_doador.total_doacoes > 5 THEN
            DBMS_OUTPUT.PUT_LINE(
                var_registro_doador.nome || ' | ' ||
                var_registro_doador.total_doacoes || ' | Doador VIP'
            );
        ELSIF var_registro_doador.total_doacoes >= 1 AND var_registro_doador.total_doacoes <= 5 THEN
            DBMS_OUTPUT.PUT_LINE(
                var_registro_doador.nome || ' | ' ||
                var_registro_doador.total_doacoes || ' | Doador Ativo'
            );
        ELSE
            DBMS_OUTPUT.PUT_LINE(
                var_registro_doador.nome || ' | ' ||
                var_registro_doador.total_doacoes || ' | Inativo'
            );
        END IF;
    END LOOP;

    CLOSE cursor_info_doador;
END PROC_CONSULTA_STATUS_DOADOR;
/


SET SERVEROUTPUT ON;
BEGIN
    PROC_CONSULTA_STATUS_DOADOR(5);
END;
/


--- Função para somar os pontos de acordo com as doações feitas pelo usuario

CREATE OR REPLACE FUNCTION atualizar_pontuacao_doador(p_id_doador IN NUMBER)
RETURN NUMBER
IS
    pontuacao_total NUMBER := 0;
BEGIN
    SELECT SUM(tipo.pontuacao_doacao)
    INTO pontuacao_total
    FROM TB_GIVEWIN_DOACAO doacao
    JOIN TB_GIVEWIN_TIPO_DOACAO tipo ON doacao.id_tipo_doacao = tipo.id_tipo_doacao
    WHERE doacao.id_doador = p_id_doador;

    UPDATE TB_GIVEWIN_DOADOR
    SET pontuacao = pontuacao + pontuacao_total
    WHERE id_doador = p_id_doador;


    RETURN pontuacao_total;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    var_id_doador NUMBER := 2;
    var_nome_doador VARCHAR2(100);
    pontuacao_total NUMBER;
BEGIN
    SELECT nome
    INTO var_nome_doador
    FROM TB_GIVEWIN_DOADOR
    WHERE id_doador = var_id_doador;
    pontuacao_total := atualizar_pontuacao_doador(var_id_doador);
    IF pontuacao_total >= 0 THEN
     DBMS_OUTPUT.PUT_LINE('Doador: ' || var_nome_doador);
        DBMS_OUTPUT.PUT_LINE('Pontuação total do doador: ' || pontuacao_total);
    END IF;
END;
/