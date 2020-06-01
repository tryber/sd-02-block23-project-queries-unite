-- Desafio 5 - VIEW travel_package_info
-- Crie uma VIEW chamada travel_package_info, que deve mostrar todas as compras cadastradas
-- no sistema, exibindo os resultados da seguinte forma:
-- travel_package_id: Identificação única do pacote de viagens;
-- travel_package_name: Nome do pacote de viagens;
-- user_id: Identificação única da pessoa;
-- user_name: Nome da pessoa;
-- cost: Custo total da viagem.
-- Os resultados da VIEW devem ser ordenados pelo custo total das viagens de forma decrescente.

CREATE VIEW travel_package_info AS
SELECT
  pur.travel_package AS travel_package_id,
  tp.package_name AS travel_package_name,
  pur.user_id AS user_id,
  us.full_name AS user_name,
  pa.total_coast AS cost
FROM
  queries_unite.purchases AS pur
  INNER JOIN queries_unite.travel_packages as tp ON pur.travel_package = tp.id
  INNER JOIN queries_unite.users AS us ON pur.user_id = us.id
  INNER JOIN queries_unite.travel_packages as pa ON pur.travel_package = pa.id
ORDER BY
  cost DESC;

SELECT * FROM travel_package_info;
