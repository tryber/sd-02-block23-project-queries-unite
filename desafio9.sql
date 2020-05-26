DROP PROCEDURE IF EXISTS find_travel_packages_by_period;
DELIMITER $$
CREATE PROCEDURE find_travel_packages_by_period(IN departure DATE, arrival DATE)
BEGIN 
    SELECT
        p.travel_packages_locations_id AS id,
        (SELECT travel_package_name FROM travel_packages AS tp, travel_packages_locations AS tpl
                WHERE p.travel_packages_locations_id = tpl.travel_packages_locations_id
                AND tpl.travel_package_id = tp.travel_package_id) AS name,
        p.price,
        p.departure_date,
        p.arrival_date
    FROM purchases AS p
    HAVING p.departure_date >= departure AND p.arrival_date <= arrival;
END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
