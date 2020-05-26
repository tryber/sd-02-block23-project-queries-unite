DROP FUNCTION IF EXISTS average_amount_spent_given_age_range;
DELIMITER $$
CREATE FUNCTION average_amount_spent_given_age_range(min_age TINYINT, max_age TINYINT)
RETURNS DOUBLE READS SQL DATA
BEGIN
	DECLARE average_amount DOUBLE;
    SELECT AVG(price)
    FROM purchases AS p
    WHERE (SELECT id FROM users WHERE current_age BETWEEN min_age AND max_age
		AND id = p.user_id)
	INTO average_amount;
    RETURN average_amount;
END $$

SELECT average_amount_spent_given_age_range(30, 50);
