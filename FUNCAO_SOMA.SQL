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