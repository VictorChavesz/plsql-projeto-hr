GRANT CREATE JOB TO HR1;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
    job_name                => 'HR1.JOB_PRC_VALIDA_SALARIO_ABAIXO_DO_PERMITIDO',
    job_type                => 'STORED_PROCEDURE',
    job_action              => 'HR1.PRC_VALIDA_SALARIO_ABAIXO_DO_PERMITIDO',
    number_of_arguments     => 0,
    start_date              => TRUNC(SYSTIMESTAMP),
    repeat_interval         => 'FREQ = DAILY',
    end_date                => TRUNC(SYSTIMESTAMP) + 5
    );
END;

