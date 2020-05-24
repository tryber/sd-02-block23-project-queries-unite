USE queries_unite;

-- Tks Cremosinho

DELIMITER cremosinho

CREATE FUNCTION average_amount_spent_given_age_range(smallAge INT, maxAge INT)
RETURNS DOUBLE(8, 2) READS SQL DATA
BEGIN
DECLARE average DECIMAL(8, 2);
SELECT AVG(tpac.price) FROM purchases AS pur
INNER JOIN users AS us ON us.id = pur.user_id
INNER JOIN travel_packages AS tpac ON tpac.id = pur.travel_packages_id
WHERE us.current_age BETWEEN smallAge AND maxAge
INTO average;
RETURN average;
END cremosinho

DELIMITER ;

SELECT average_amount_spent_given_age_range(30,50);
