USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT
	tp.id AS travel_package_id,
    pn.package_name AS travel_package_name, 
    u.id AS user_id,
    u.full_name AS user_name,
    tp.price AS cost
FROM
travel_packages AS tp
    INNER JOIN purchases as pur ON pur.travel_packages_id = tp.id
  INNER JOIN users AS u ON u.id = pur.users_id
  INNER JOIN package_name AS pn ON pn.id = tp.package_name_id
  ORDER BY cost;

SELECT * FROM travel_package_info;

DROP VIEW travel_package_info;
