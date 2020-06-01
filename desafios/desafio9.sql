/* Desafio 9 - PROCEDURE find_travel_packages_by_period Você deve criar uma PROCEDURE chamada
 find_travel_packages_by_period, que simula a funcionalidade de busca com filtros.
 Essa PROCEDURE deve receber 2 parâmetros de entrada: a data prevista de ida e a data previsa de volta.Ao ser executada ela deve retornar somente os resultados contidos dentro da faixa de datas especificadas.Para validar sua PROCEDURE,
 execute - a com os parâmetros data inicial e data final, com os respectivos valores
 de 17 / 07 / 2022 ('2022-07-17') e 25 / 10 / 2022 ('2022-10-25'). */
USE queries_unite;

DELIMITER $$
CREATE PROCEDURE find_travel_packages_by_period(IN departure DATETIME, IN arrival DATETIME) BEGIN
SELECT
  id,
  package_name AS `name`,
  total_coast AS price,
  date_going AS departure_date,
  date_back AS arrival_date
FROM
  travel_packages
WHERE
  DATE(date_going) >= departure
  AND DATE(date_back) <= arrival;

END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
