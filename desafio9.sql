USE queries_unite;
DELIMITER $$

-- DROP PROCEDURE find_travel_packages_by_period;

CREATE PROCEDURE find_travel_packages_by_period(
in data_inicial datetime,
data_final datetime
)
BEGIN
SELECT id, package_name as name, total_price as price, start_date as departure_date, end_date as arrival_date
FROM travel_packages
WHERE date(start_date) >= data_inicial and date(end_date) <= data_final;
END $$;

DELIMITER ;

call find_travel_packages_by_period('2022-07-17', '2022-10-25');
