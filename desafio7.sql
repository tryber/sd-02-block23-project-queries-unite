USE queries_unite;

CREATE VIEW top_3_locations AS
SELECT 
  tpl.location_id AS id,
  l.city,
  l.country,
  COUNT(p.travel_package_id) AS travel_amount
FROM travel_packages_locations AS tpl
INNER JOIN locations AS l ON l.id = tpl.location_id
INNER JOIN purchases p ON p.travel_package_id = tpl.travel_package_id
GROUP BY l.id
ORDER BY travel_amount DESC, tpl.location_id
LIMIT 3;