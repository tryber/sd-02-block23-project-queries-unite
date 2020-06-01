/* Desafio 12 - INDEX users_full_name_index
Para facilitar a busca por pessoas cadastradas no sistema, adicione um INDEX chamado
users_full_name_index na coluna full_name da tabela users. */

USE queries_unite;

CREATE INDEX users_full_name_index ON users(full_name);
