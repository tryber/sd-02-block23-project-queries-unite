USE queries_unite;

DELIMITER $$

CREATE FUNCTION average_amount_spent_given_age_range(idade_min INT, idade_max INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
  DECLARE media DOUBLE;
  SELECT AVG(TP.price)
  FROM queries_unite.purchases AS P
  INNER JOIN queries_unite.travel_packages AS TP
  ON TP.id = P.travel_package_id
  INNER JOIN queries_unite.users AS U
  ON U.id = P.user_id
  WHERE U.current_age BETWEEN idade_min AND idade_max
  INTO media;
  RETURN media;
END $$

DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
