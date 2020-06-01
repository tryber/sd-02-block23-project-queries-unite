/* Desafio 13 - FULLTEXT INDEX users_current_job_index
Para facilitar estudos internos do perfil das pessoas que compram os pacotes de viagens,
adicione um FULLTEXT INDEX chamado users_current_job_index na coluna current_job da tabela users. */

USE queries_unite;

CREATE FULLTEXT INDEX users_current_job_index ON users(current_job);
