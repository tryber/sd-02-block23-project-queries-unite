USE queries_unite;

CREATE VIEW travel_package_info AS
SELECT 
  p.travel_package_id,
  tp.package_name,
  p.user_id,
  u.full_name,
  tp.travel_cost
FROM purchases AS p
INNER JOIN travel_packages AS tp ON tp.id = p.travel_package_id
INNER JOIN users AS u ON u.id = p.user_id
ORDER BY tp.travel_cost DESC;
