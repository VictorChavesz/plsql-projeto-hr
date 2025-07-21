# Procedures

-`PRC_INSERE_FUNCIONARIO`: Insere funcionários com base nos parametros de entrada
-`PRC_ATUALIZA_SALARIO`: Atualiza o salario do funcionario com base em seu ID e salario informado, caso seja informado o ID incorreto é lançado o erro -20002,'EMPREGADO NÃO ENCONTRADO'
-`PRC_TRANSFERE_FUNCIONARIO`: Atualiza o departamento e gerente do funcionário informado com base em seu ID e DEPARTMENT_ID, caso os dados sejam informados de maneira incorreta é lançado o erro -20002,'ID EMPREGADO OU DEPARTAMENTO NAO ENCONTRADO'
-`PRC_GERA_RELATORIO_POR_DEPARTAMENTO`: Gera um relatóriom em CSV dos funcionários com base em um determindado departamento, sendo que o arquivo contem os dados referentes a ID do funcionário, nome completo, email, salario e job_id
-`PRC_VALIDA_SALARIO_ABAIXO_DO_PERMITIDO `: Válida salários de funcionários que estão abaixo do permitido os registrando na tabela 'SALARIOS_ABAIXO_DO_PERMITIDO', para não haver duplicidades caso o funcionário já esteja na tabela, apenas o seu salário será atualizado
-`PRC_VALIDA_SALARIO_ACIMA_DA_MEDIA_DEP`: Válida os salários de funcionários que estão acima da média do departamento os registrando na tabela 'SALARIOS_ACIMA_DA_MEDIA', para não haver duplicidades caso o funcionário já esteja na tabela, apenas o seu salário será atualizado
