CREATE OR REPLACE TRIGGER TRG_AUDITA_TRANSFERENCIA
    BEFORE INSERT OR UPDATE OF DEPARTMENT_ID OR DELETE
    ON EMPLOYEES
    FOR EACH ROW
DECLARE
    vEMPLOYEE_ID    EMPLOYEES.EMPLOYEE_ID%TYPE;
    vEVENTO         VARCHAR2(1);
BEGIN
    CASE
        WHEN 
            INSERTING 
        THEN 
            vEMPLOYEE_ID := :NEW.EMPLOYEE_ID;
            vEVENTO := 'I';
        WHEN
            UPDATING
        THEN
            vEMPLOYEE_ID := :NEW.EMPLOYEE_ID;
            vEVENTO := 'U';
        ELSE
            vEMPLOYEE_ID := :OLD.EMPLOYEE_ID;
            vEVENTO := 'D';
    END CASE;  
    
    INSERT INTO JOB_HISTORY(
        EMPLOYEE_ID,
        START_DATE,
        END_DATE,
        JOB_ID,
        DEPARTMENT_ID
    )VALUES(
        vEMPLOYEE_ID,
        :OLD.HIRE_DATE,
        SYSDATE,
        :OLD.JOB_ID,
        :OLD.DEPARTMENT_ID
    );
   
    INSERT INTO LOG_JOB_HISTORY(
        LOG_ID,
        TIPO_ACAO,
        DATA_ALTERACAO,
        EMPLOYEE_ID,
        JOB_ID_ANTES,
        JOB_ID_DEPOIS,
        DEPARTMENT_ID_ANTES,
        DEPARTMENT_ID_DEPOIS,
        USUARIO_ALTERACAO
    )VALUES(
        SEQ_LOG_JOB_HISTORY.NEXTVAL,
        vEVENTO,
        SYSDATE,
        vEMPLOYEE_ID,
        :OLD.JOB_ID,
        :NEW.JOB_ID,
        :OLD.DEPARTMENT_ID,
        :NEW.DEPARTMENT_ID,
        USER
    );
    
END;