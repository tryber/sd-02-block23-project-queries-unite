USE queries_unite;
DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(IN departure_date DATETIME, IN arrival_date DATETIME)
BEGIN
  SELECT
    package_id AS id,
    package_name AS name,
    package_price AS price,
    TP.departure_date,
    return_date AS arrival_date
  FROM travel_packages AS TP
  WHERE TP.departure_date > departure_date
  AND TP.return_date < arrival_date;
END $$
DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
