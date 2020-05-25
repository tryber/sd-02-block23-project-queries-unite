USE queries_unite;

DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(min_age INT, max_age INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
  DECLARE average_value DOUBLE;

  SELECT AVG(package_price)
  FROM travel_packages AS TP
  INNER JOIN purchases AS P
  ON TP.package_id = P.package_id
  INNER JOIN users AS U
  ON U.id = P.user_id
  WHERE U.current_age > min_age
  AND U.current_age < max_age
  INTO average_value;

  RETURN average_value;
END $$
DELIMITER ;

SELECT average_amount_spent_given_age_range(30,50);
