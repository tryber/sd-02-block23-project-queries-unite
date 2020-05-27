USE DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(min_age INT, max_age INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
  DECLARE avg_amount DOUBLE;
  SELECT AVG(tp.price) FROM purchases p
  INNER JOIN users u ON p.user_id = u.id
  INNER JOIN travel_packages tp ON tp.pack_id = p.travel_pack_id
  WHERE u.current_age BETWEEN min_age AND max_age
  INTO avg_amount;
  RETURN avg_amount;
END $$

DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
