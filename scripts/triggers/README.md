# Triggers

--`TRG_AUDITA_TRANSFERENCIA`: Trigger responsável por inserir os dados nas tabelas JOB_HISTORY e LOG_JOB_HISTORY, caso o evento seja um UPDATE ou DELETE os dados necessários são inseridos na tabela JOB_HISTORY, como data de inicio e data final de um funcionário em um departamento, caso o evento seja diferente de um INSERT o dados são inseridos na tabela LOG_JOB_HISTORY

--`TRG_LOG_SALARIO`: Trigger responsável por inserir os dados na tabela LOG_SALARIO_EMPREGADOS caso haja alguma alteração na coluna SALARY de EMPLOYEES

--`TRG_VALIDA_EMAIL_UNICO`: Trigger responsável por validar se um email inserido ou alterado já está sendo utilizado, caso ja esteja lança o erro -20002, 'EMAIL JA UTILIZADO'

--`TRG_VALIDA_SALARIO`: Trigger responsável por validar se um salrio inserido ou alterado já está dentro da faixa permitida para o cargo, caso não esteja lança o erro -20002, 'SALARIO NAO PERMITIDO PARA O CARGO: '

