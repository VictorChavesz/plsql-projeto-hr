CREATE OR REPLACE PROCEDURE PRC_VALIDA_SALARIO_ACIMA_DA_MEDIA_DEP(pDEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE)
IS
    CURSOR cEMPLOYEES IS
        SELECT
            EMPLOYEE_ID,
            JOB_ID,
            DEPARTMENT_ID,
            SALARY
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID = pDEPARTMENT_ID;
        
    vMEDIA_SALARIAL NUMBER;
BEGIN
    
    vMEDIA_SALARIAL := FNC_CALCULA_MEDIA_SALARIAL(pDEPARTMENT_ID);
    
    FOR vRECORD IN cEMPLOYEES LOOP
    
        IF vRECORD.SALARY > vMEDIA_SALARIAL
        THEN
        
            /*IF vRECORD.EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM SALARIOS_ACIMA_DA_MEDIA)
            THEN
                UPDATE
                    SALARIOS_ACIMA_DA_MEDIA
                SET 
                    SALARY = vRECORD.SALARY
                WHERE
                    SALARIOS_ACIMA_DA_MEDIA.EMPLOYEE_ID = vRECORD.EMPLOYEE_ID;
            
            ELSE
                    
                INSERT INTO SALARIOS_ACIMA_DA_MEDIA(
                    EMPLOYEE_ID,
                    NOME_COMPLETO,
                    JOB_ID,
                    DEPARTMENT_ID,
                    SALARY
                )VALUES(
                    vRECORD.EMPLOYEE_ID,
                    FUN_OBTEM_NOME_COMPLETO(vRECORD.EMPLOYEE_ID),
                    vRECORD.JOB_ID,
                    vRECORD.DEPARTMENT_ID,
                    vRECORD.SALARY
                );
            
            END IF;*/
            
            MERGE INTO SALARIOS_ACIMA_DA_MEDIA T
            USING
                (
                    SELECT
                        vRECORD.EMPLOYEE_ID                             AS EMPLOYEE_ID,
                        FUN_OBTEM_NOME_COMPLETO(vRECORD.EMPLOYEE_ID)    AS NOME_COMPLETO,
                        vRECORD.JOB_ID                                  AS JOB_ID,
                        vRECORD.DEPARTMENT_ID                           AS DEPARTMENT_ID,
                        vRECORD.SALARY                                  AS SALARY
                    FROM
                        DUAL
                )S
            ON(T.EMPLOYEE_ID = S.EMPLOYEE_ID)
            WHEN MATCHED THEN
                UPDATE
                    SET T.SALARY = S.SALARY
            WHEN NOT MATCHED THEN
                    INSERT(
                        EMPLOYEE_ID,
                        NOME_COMPLETO,
                        JOB_ID,
                        DEPARTMENT_ID,
                        SALARY
                    )VALUES(
                        S.EMPLOYEE_ID,
                        FUN_OBTEM_NOME_COMPLETO(S.EMPLOYEE_ID),
                        S.JOB_ID,
                        S.DEPARTMENT_ID,
                        S.SALARY
                    );
        END IF;
    END LOOP;
END;