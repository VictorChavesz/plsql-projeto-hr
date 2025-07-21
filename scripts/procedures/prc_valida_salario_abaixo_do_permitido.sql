CREATE OR REPLACE PROCEDURE PRC_VALIDA_SALARIO_ABAIXO_DO_PERMITIDO 
IS
    CURSOR cEMPLOYEES IS
        SELECT
            E.EMPLOYEE_ID,
            E.JOB_ID,
            E.DEPARTMENT_ID,
            E.SALARY,
            J.MIN_SALARY
        FROM
            EMPLOYEES E
        JOIN
            JOBS J
        ON
            E.JOB_ID = J.JOB_ID;
BEGIN

    FOR vRECORD IN cEMPLOYEES LOOP
        IF vRECORD.SALARY < vRECORD.MIN_SALARY
        THEN
            MERGE INTO SALARIOS_ABAIXO_DO_PERMITIDO T
            USING
                (SELECT
                        vRECORD.EMPLOYEE_ID                             AS EMPLOYEE_ID,
                        FUN_OBTEM_NOME_COMPLETO(vRECORD.EMPLOYEE_ID)    AS NOME_COMPLETO,
                        vRECORD.JOB_ID                                  AS JOB_ID,
                        vRECORD.DEPARTMENT_ID                           AS DEPARTMENT_ID,
                        vRECORD.MIN_SALARY                              AS MIN_SALARY,
                        vRECORD.SALARY                                  AS SALARY
                    FROM
                        DUAL
                )S
                ON (T.EMPLOYEE_ID = S.EMPLOYEE_ID)
                WHEN MATCHED THEN
                    UPDATE
                        SET T.SALARY = S.SALARY
                WHEN NOT MATCHED THEN
                    INSERT(
                        EMPLOYEE_ID,
                        NOME_COMPLETO,
                        JOB_ID,
                        DEPARTMENT_ID,
                        MIN_SALARY,
                        SALARY
                    )VALUES(
                        S.EMPLOYEE_ID,
                        FUN_OBTEM_NOME_COMPLETO(S.EMPLOYEE_ID),
                        S.JOB_ID,
                        S.DEPARTMENT_ID,
                        S.MIN_SALARY,
                        S.SALARY
                    );
        END IF;
    END LOOP;

EXCEPTION
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERRO ORACLE: ' || SQLCODE || SQLERRM);
END;