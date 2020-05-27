DELIMITER $$
CREATE PROCEDURE find_travel_packages_by_period (IN dep DATETIME, IN arr DATETIME)
BEGIN
  SELECT
    pack_id id,
    pack_name name,
    price,
    departure_date,
    arrival_date
  FROM travel_packages
  WHERE DATE(departure_date) >= dep
  AND DATE(arrival_date) <= arr;
END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
