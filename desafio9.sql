USE queries_unite;
DELIMITER $$
DROP PROCEDURE IF EXISTS find_travel_packages_by_period $$
CREATE PROCEDURE find_travel_packages_by_period(IN departure DATE, arrive DATE)
BEGIN
    SELECT id, name, price, departure_date, arrive_date
    FROM travel_packages
    WHERE departure_date >= departure AND arrive_date <= arrive;
END $$

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
