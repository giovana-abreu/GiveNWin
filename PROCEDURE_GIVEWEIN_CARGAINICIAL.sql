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