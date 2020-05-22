USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT
buy.travel_packages_id AS travel_package_id,
packages.package_name AS travel_package_name,
buy.user_id,
u.full_name AS user_name,
packages.price AS cost
FROM purchases AS buy
INNER JOIN travel_packages AS packages ON packages.id = buy.travel_packages_id
INNER JOIN users AS u ON u.id = buy.user_id
ORDER BY packages.price DESC;
