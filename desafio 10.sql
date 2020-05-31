USE queries_unite;
DELIMITER $$

DROP FUNCTION IF EXISTS average_amount_spent_given_age_range $$
CREATE FUNCTION average_amount_spent_given_age_range(min_age INT, max_age INT)
RETURNS DOUBLE READS SQL DATA
BEGIN
    DECLARE avg_spent DOUBLE;
    SELECT AVG(t.price)
    FROM purchases p
    INNER JOIN users u ON p.user_id = u.id AND u.current_age BETWEEN min_age AND max_age
    INNER JOIN travel_packages t ON p.travel_package_id = t.id
    INTO avg_spent;
    RETURN avg_spent;
END $$

DELIMITER ;

SELECT average_amount_spent_given_age_range(30, 50);
