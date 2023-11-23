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
