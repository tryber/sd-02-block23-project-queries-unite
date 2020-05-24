USE queries_unite;
DELIMITER $$

CREATE PROCEDURE find_travel_packages_by_period(IN datein DATE, IN dateout DATE)
BEGIN
    SELECT tp.id, pn.package_name AS name,
    tp.price, tp.date_going AS departure_date, 
    tp.date_return AS arrival_date
    FROM travel_packages AS tp
    INNER JOIN package_name as pn ON tp.package_name_id = pn.id
    WHERE DATE(tp.date_going) >= datein and DATE(tp.date_return) <= dateout
    GROUP BY tp.id;
END $$
DELIMITER ;
CALL find_travel_packages_by_period('2022-07-17','2022-10-25');
