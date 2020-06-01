-- Desafio 3 - Altere a tabela clone_troopers
-- Faça as seguintes alterações na tabela clone_troopers:
-- Adicione a coluna nickname, que deve ser do tipo VARCHAR(50), não nulo;
-- Altere a coluna current_age, de forma que seu tipo passe a ser TINYINT;
-- Altere o nome da coluna full_name para origin_name e garanta que não seja possível inserir nomes repetidos;
-- Exclua a coluna current_job.
ALTER TABLE
  clone_troopers
ADD
  COLUMN nickname VARCHAR(50) NOT NULL;

ALTER TABLE
  clone_troopers
MODIFY
  current_age TINYINT;

ALTER TABLE
  clone_troopers CHANGE full_name origin_name VARCHAR(100) UNIQUE;

ALTER TABLE
  clone_troopers DROP COLUMN job_id;
