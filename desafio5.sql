DROP VIEW IF EXISTS travel_package_info;
CREATE VIEW travel_package_info AS
	SELECT tpl.travel_packages_locations_id AS travel_package_id,
		tpack.travel_package_name,
        purch.user_id,
        users.full_name AS user_name,
        purch.price as cost
	FROM travel_packages_locations AS tpl
    INNER JOIN travel_packages AS tpack ON tpl.travel_package_id = tpack.travel_package_id
    INNER JOIN purchases AS purch ON tpl.travel_packages_locations_id = purch.travel_packages_locations_id
    INNER JOIN users AS users ON users.id = purch.user_id
    ORDER BY cost DESC;

SELECT * FROM travel_package_info;
