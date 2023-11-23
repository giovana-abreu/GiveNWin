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
