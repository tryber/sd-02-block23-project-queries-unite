USE queries_unite;

DELIMITER $$

DROP PROCEDURE IF EXISTS find_travel_packages_by_period $$

CREATE PROCEDURE find_travel_packages_by_period(IN data_ida DATE, IN data_volta DATE)
BEGIN
  SELECT
    id,
    package_name AS name,
    price,
    departure_date,
    arrival_date
  FROM queries_unite.travel_packages
  WHERE
    departure_date BETWEEN data_ida AND data_volta
    AND arrival_date BETWEEN data_ida AND data_volta;
END $$

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
