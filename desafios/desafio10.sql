/* Desafio 10 - FUNCTION average_amount_spent_given_age_range Você deve criar uma FUNCTION
 chamada average_amount_spent_given_age_range, que recebe como parâmetros uma idade mínima e uma
 idade máxima.Sua FUNCTION deve retornar apenas o valor médio gasto em compras de pacotes nessa
 faixa etária.O resultado retornado pelo cálculo deve ser do tipo DOUBLE.Para validar sua FUNCTION,
 execute - a com os parâmetros idade mínima e idade máxima, com os respectivos valores de 30 e 50 anos. */

USE queries_unite;

DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(ageMin INT, ageMax INT) RETURNS DECIMAL(10, 2) READS SQL DATA
BEGIN
DECLARE amount DECIMAL(10, 2);
SELECT
  AVG(tp.total_coast)
FROM
  purchases AS pur
  INNER JOIN users AS us ON pur.user_id = us.id
  INNER JOIN travel_packages AS tp ON pur.travel_package = tp.id
WHERE
  us.current_age BETWEEN ageMin
  AND ageMAX INTO amount;

RETURN amount;

END $$
DELIMITER ;

SELECT
  average_amount_spent_given_age_range(30, 50);
