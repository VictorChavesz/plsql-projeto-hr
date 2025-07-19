--Consulta dos dados da tabela

DESC EMPLOYEES;

--Criando procedure

CREATE OR REPLACE PROCEDURE PRC_INSERE_FUNCIONARIO( 
    pFIRST_NAME     	EMPLOYEES.FIRST_NAME%TYPE,     
    pLAST_NAME      	EMPLOYEES.LAST_NAME%TYPE,      
    pEMAIL          	EMPLOYEES.EMAIL%TYPE,          
    pPHONE_NUMBER   	EMPLOYEES.PHONE_NUMBER%TYPE,   
    pHIRE_DATE      	EMPLOYEES.HIRE_DATE%TYPE,      
    pJOB_ID         	EMPLOYEES.JOB_ID%TYPE,         
    pSALARY         	EMPLOYEES.SALARY%TYPE,         
    pCOMMISSION_PCT 	EMPLOYEES.COMMISSION_PCT%TYPE, 
    pMANAGER_ID     	EMPLOYEES.MANAGER_ID%TYPE,     
    pDEPARTMENT_ID  	EMPLOYEES.DEPARTMENT_ID%TYPE
)
IS
BEGIN

    INSERT INTO EMPLOYEES(
        EMPLOYEE_ID,   
        FIRST_NAME,    
        LAST_NAME,     
        EMAIL,         
        PHONE_NUMBER,  
        HIRE_DATE,     
        JOB_ID,        
        SALARY,        
        COMMISSION_PCT,
        MANAGER_ID,    
        DEPARTMENT_ID 
    ) VALUES (
        EMPLOYEES_SEQ.NEXTVAL,  
        pFIRST_NAME,    
        pLAST_NAME,     
        pEMAIL,         
        pPHONE_NUMBER,  
        pHIRE_DATE,     
        pJOB_ID,        
        pSALARY,        
        pCOMMISSION_PCT,
        pMANAGER_ID,    
        pDEPARTMENT_ID
        );
        
COMMIT;
EXCEPTION
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERRO ORACLE:' || SQLCODE || SQLERRM);
END;