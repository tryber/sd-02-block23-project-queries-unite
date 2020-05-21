DELIMITER $$
CREATE PROCEDURE find_travel_packages_by_period (IN dep CHAR(10), IN arr CHAR(10))
BEGIN
  SELECT * FROM travel_packages
  WHERE departure_date >= STR_TO_DATE(dep,'%d/%m/%Y')
  AND arrival_date <= STR_TO_DATE(arr,'%d/%m/%Y');
END $$
DELIMITER ;

CALL find_travel_packages_by_period('17/07/2022', '25/10/2022');
