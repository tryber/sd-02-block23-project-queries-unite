# k3 Easter Egg pq Cremosinho é valioso <3
USE queries_unite;

DELIMITER cremosinho

CREATE FUNCTION average_amount_spent_given_age_range(age_starter INT, age_finisher INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
  DECLARE avg_value DOUBLE(9, 2);
  SELECT 
    AVG(tp.travel_cost)
  FROM purchases AS p
  INNER JOIN users AS u ON u.id = p.user_id
  INNER JOIN travel_packages AS tp ON tp.id = p.travel_package_id
  WHERE u.current_age BETWEEN age_starter AND age_finisher
  INTO avg_value;
  RETURN avg_value;
END cremosinho

DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
