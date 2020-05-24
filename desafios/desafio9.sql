USE queries_unite;

CREATE PROCEDURE find_travel_packages_by_period (IN goingDate DATE, returnDate DATE)
SELECT
id,
package_name as 'name',
price,
TIMESTAMP(going_date_package) AS departure_date,
TIMESTAMP(return_date_package) AS arrival_date
FROM travel_packages
WHERE (going_date_package BETWEEN goingDate AND returnDate)
AND (return_date_package BETWEEN goingDate AND returnDate);

CALL find_travel_packages_by_period('2022-07-17', '2022-10-25');
