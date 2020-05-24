USE queries_unite;

DELIMITER $ $ CREATE FUNCTION average_amount_spent_given_age_range(ageMin INT, ageMAx INT) RETURNS INT READS SQL DATA BEGIN DECLARE reads_only INT;

SELECT
  AVG(tp.price)
FROM
  purchases p
  INNER JOIN users u ON u.current_age BETWEEN 30
  AND 50
  AND u.id = p.users_id
  INNER JOIN travel_packages tp ON p.travel_packages_id = tp.id INTO reads_only;

RETURN reads_only;

END $ $ DELIMITER;
