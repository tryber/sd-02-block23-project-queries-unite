-- Desafio 6 - VIEW amount_spent_by_user
-- Crie uma VIEW chamada amount_spent_by_user, que mostre o nome e total gasto em viagens até o momento por todos as pessoas presentes no sistema, conforme as especificações a seguir:
-- user_id: Identificação única da pessoa;
-- user_name: Nome da pessoa;
-- amount: Total gasto pela pessoa.
-- Os gastos devem estar agrupados e ordenados de forma crescente.

CREATE VIEW amount_spent_by_user AS
SELECT
  us.id AS user_id,
  us.full_name AS user_name,
  SUM(tp.total_coast) AS amount
FROM
  queries_unite.users AS us
  INNER JOIN queries_unite.purchase AS pur ON us.id = pur.user_id
  INNER JOIN queries_unite.travel_packages AS tp ON pur.travel_package = tp.id
GROUP BY
  pur.user_id
ORDER BY
  amount;
