USE queries_unite;

DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(IN starter date, IN finisher date)
BEGIN
    SELECT 
  id,
  package_name AS name,
  travel_cost AS price,
  TIMESTAMP(start_date) AS departure_date,
  TIMESTAMP(end_date) AS arrival_date
FROM travel_packages
WHERE start_date > TIMESTAMP(starter) AND end_date < TIMESTAMP(finisher);
END $$

DELIMITER ;

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
