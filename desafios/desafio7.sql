/* Desafio 7 - VIEW top_3_locations Crie uma VIEW chamada top_3_locations,
 que exibe os top 3 destinos mais frequentados,
 de acordo com as especificações a seguir: id: Identificação única da localização;
 city: Nome da cidade;
 country: Nome do país;
 travel_amount: Quantidade de visitas à localização.Os resultados devem ser agrupados pela coluna identificadora do destino e ordenados pela quantidade de visitas à localização,
 de forma decrescente.Caso haja mais de uma localização com a mesma quantidade de visitas,
 o critério de desempate será a ordenação pelo id da localização,
 de forma crescente. */

CREATE VIEW top_3_locations AS
SELECT
  tpl.location_id,
  loc.city,
  loc.country,
  COUNT(pur.travel_package) AS travel_amount
FROM
  queries_unite.travel_packages_locations AS tpl
  INNER JOIN queries_unite.locations AS loc ON tpl.location_id = loc.id
  INNER JOIN queries_unite.purchase AS pur ON tpl.package_id = pur.travel_package
GROUP BY
  loc.id
ORDER BY
  travel_amount DESC
LIMIT
  3;
