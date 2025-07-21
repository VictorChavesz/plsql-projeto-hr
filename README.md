# Projeto PL/SQL – Simulação de Prova Prática com Schema HR

Este repositório contém os scripts e componentes de uma simulação prática de desenvolvimento PL/SQL, baseada no schema padrão **HR** do Oracle Database. O objetivo é demonstrar domínio em procedimentos armazenados, funções, gatilhos, agendamentos, manipulação de arquivos e uso de recursos avançados da linguagem PL/SQL.

---

## Objetivos Técnicos

- Implementação de **procedures** e **functions** para manipulação e consulta de dados
- Criação de **triggers** para validações e auditorias em tempo real
- Utilização de **cursos explícitos**, estruturas de controle, `%ROWTYPE` e `RECORD`
- Geração de arquivos com **UTL_FILE**
- Agendamento de tarefas automatizadas com **DBMS_SCHEDULER**
- Criação de **views** com **funções analíticas**

---

## Tecnologias Utilizadas

- **Oracle Database 21c+**
- **PL/SQL**
- **Oracle SQL Developer**

---

## Estrutura do Repositório

plsql-projeto-hr/ \
├── README.md \
├── scripts/ \
│ ├── procedures/ \
│ ├── functions/ \
│ ├── triggers/ \
│ ├── views/ \
│ ├── jobs/ \
├── test/ \
│ └── teste.sql \
└── tables_auxiliares.sql


---

## Descrição das Entregas

### Parte 1 – Criação de Objetos

#### Procedures

- `PROC_INSERE_FUNCIONARIO`: Insere um novo funcionário com os dados obrigatórios.
- `PROC_ATUALIZA_SALARIO`: Atualiza o salário de um funcionário, garantindo que o novo valor não seja inferior ao mínimo estabelecido para o cargo.
- `PROC_TRANSFERE_FUNCIONARIO`: Transfere um funcionário para outro departamento. Caso haja alteração, registra o evento na tabela `job_history`.

#### Functions

- `FNC_CALCULA_MEDIA_SALARIAL`: Retorna a média salarial dos funcionários de um departamento específico.
- `FNC_OBTEM_NOME_COMPLETO`: Retorna o nome completo (primeiro e último nome) de um funcionário, a partir do seu identificador.
- `FNC_VERIFICA_HIERARQUIA`: Verifica se um funcionário é gerente direto de outro (retorno booleano ou 1/0).

#### Triggers

- `TRG_LOG_SALARIO`: Registra alterações salariais em uma tabela de log, incluindo os valores antigo e novo, data e hora.
- `TRG_VALIDA_EMAIL_UNICO`: Impede a inserção de registros com endereços de e-mail duplicados, considerando variações de maiúsculas/minúsculas.
- `TRG_AUDITA_TRANSFERENCIA`: Audita modificações no campo `department_id`, registrando transferências entre departamentos.

---

### Parte 2 – Conceitos Avançados

#### Cursores, RECORD e %ROWTYPE

- Procedimento que percorre funcionários de um departamento utilizando **cursor explícito**.
- Funcionários com salário acima da média do departamento são inseridos em uma **tabela auxiliar**.
- Utilização adequada de **`%ROWTYPE`**, **`RECORD`** e estruturas de decisão.

#### Geração de Arquivo com UTL_FILE

- Procedure que gera um **arquivo .csv** contendo: ID, nome completo, e-mail, salário e cargo dos funcionários de um departamento.
- O nome do arquivo inclui a data de geração.

#### Agendamento com DBMS_SCHEDULER

- Job automatizado que executa diariamente à meia-noite.
- A procedure associada verifica **cargos com salários abaixo do mínimo permitido**, registrando as ocorrências em uma tabela de inconsistências.

#### Views e Funções Analíticas

- Criação de uma **VIEW** com os **três funcionários de maior salário por departamento**.
- Uso de funções analíticas como `RANK()` ou `DENSE_RANK()` para classificação.

---




