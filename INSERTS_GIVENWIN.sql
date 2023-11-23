BEGIN
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('João da Silva', '123.456.789-00', '123456', 'Masculino', 'São Paulo', 'joao.silva@gmail.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES('Maria da Silva', '987.654.321-00', '543219', 'Feminino', 'Bahia', 'maria.silva@email.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES('Jo Pereira', '098.765.432-10', '213456', 'Nao Binario', 'Ceará', 'jo.pereira@fiap.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Ana Lopes', '876.543.210-98', '654321', 'Outros', 'Distrito Federal', 'ana.lopes@email.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Pedro Santos', '765.432.109-87', '765432', 'Feminino', 'Espírito Santo', 'pedro.santos@uol.com.br', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Flávia Souza', '654.321.098-76', '876543', 'Masculino', 'Goiás', 'flavia.souza@yahoo.com.br', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Ariel Martins', '543.210.987-65', '987654', 'Nao Binario', 'Maranhão', 'ariel.martins@gmail.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Bruna Oliveira', '432.109.876-54', '098765', 'Feminino', 'Mato Grosso', 'bruna.oliveira@outlook.com', 0);
    INSERT INTO TB_GIVEWIN_DOADOR (nome, cpf, senha, genero, estado, email, pontuacao) VALUES ('Rafaela Andrade', '321.098.765-43', '123456', 'Feminino', 'Mato Grosso do Sul', 'rafaela.andrade@hotmail.com', 0);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (1, 'Sangue', 1000);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (2, 'Medicamentos', 100);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (3, 'Equipamentos Medicos', 800);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (4, 'Plaquetas', 3000);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (5, 'Cabelo', 500);
    INSERT INTO TB_GIVEWIN_TIPO_DOACAO (id_tipo_doacao, nome, pontuacao_doacao) VALUES (6, 'EPI', 50);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
        INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
        INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (1, 100, 10, TRUE, 'CUPOM10', 1);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (2, 50, 20, TRUE, 'CUPOM20', 2);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (3, 25, 30, TRUE, 'CUPOM30', 3);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (4, 15, 40, FALSE, 'CUPOM40', 4);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (5, 10, 50, TRUE, 'CUPOM50', 5);
    INSERT INTO TB_GIVEWIN_CUPOM (id_cupom, quantidade, valor_desconto, disponivel, codigo_gerado, id_parceiro) VALUES (6, 5, 60, FALSE, 'CUPOM60', 6);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (1,'HOSPITAL DAS CLINICAS DA FACULDADE DE MEDICINA DA USP','Hospital das Clinicas SP',60.448.040/0001-22, 'hcsenha123' );
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (2,'SANTA CASA DE MISERICORDIA DE VOTUPORANGA','Santa Casa', 72.957.814/0001-20, 'santacasavotuporanga');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (3,'L & R Servicos de Cabeleireiros e Comercio de Produtos LTDA','Glitz Mania', 13348142000196, 'glitzmania101112');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (4,'ONG Fio de Luz','ONG Fio de Luz', 29.634.833/0001-96, 'doecabelofiodeluz');
    INSERT INTO TB_GIVEWIN_RECEPTOR (id_receptor, razaoSocial, nomeFantasia, cnpj, senha) VALUES (5,'Uniao Brasileira De Educacao E Assistencia','HOSPITAL SAO LUCAS DA PUCRS',  88630413000796, 'HSLPUCRS');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj, senha) VALUES (1,'ARCOS DOURADOS COMERCIO DE ALIMENTOS LTDA','McDonalds',42.591.651/0001-43, 'amomuitotudoisso' );
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj, senha) VALUES (2,'LIVRARIA LEITURA LTDA','Leitura', 18.741.504/0001-28, 'livrarialeiturabh');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj, senha) VALUES (3,'RAIA DROGASIL S/A','DrogaRaia', 61.585.865/0001-51, 'drogaraia1234');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj, senha) VALUES (4,'CENTAURO LTDA','Centauro', 74.501.131/0001-99, 'centaurosports');
    INSERT INTO TB_GIVEWIN_PARCEIRO (id_parceiro, razaoSocial, nomeFantasia, cnpj, senha) VALUES (5,'IFOOD.COM AGENCIA DE RESTAURANTES ONLINE S.A.','iFood', 14.380.200/0001-21, 'pedeumifood');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (1,1,5,5);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (2,5,4,4);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (3,5,8,3);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (4,2,7,2);
    INSERT INTO TB_GIVEWIN_DOACAO (id_doacao, id_tipo_doacao,id_doador,id_receptor) VALUES (5,1,2,2);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;

BEGIN
    INSERT INTO TB_GIVEWIN_CUPONS_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao) VALUES (1,1,5,5);
    INSERT INTO TB_GIVEWIN_CUPONS_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao) VALUES (2,5,4,4);
    INSERT INTO TB_GIVEWIN_CUPONS_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao) VALUES (3,5,8,3);
    INSERT INTO TB_GIVEWIN_CUPONS_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao) VALUES (4,2,7,2);
    INSERT INTO TB_GIVEWIN_CUPONS_DOADOR (id_cupom_doador, id_cupom, id_doador, codigo_gerado, dt_utilizacao) VALUES (5,1,2,2);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (1, SYSDATE, SQLCODE, SQLERRM);
        WHEN DUP_VAL_ON_INDEX THEN
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (2, SYSDATE, SQLCODE, SQLERRM);
        WHEN OTHERS THEN 
            INSERT INTO TB_GIVEWIN_ERROS (id, data_erro, cod_erro, desc_erro) VALUES (3, SYSDATE, SQLCODE, SQLERRM);
END;