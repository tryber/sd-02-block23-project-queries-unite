USE queries_unite;
CREATE VIEW top_3_locations AS
SELECT
  L.locations_id AS id,
  L.city,
  L.country,
  COUNT(L.locations_id) AS travel_amount
FROM purchases AS P
INNER JOIN travel_packages_locations AS TPL
ON P.package_id = TPL.package_id
INNER JOIN locations AS L
ON L.locations_id = TPL.location_id
GROUP BY L.locations_id
ORDER BY travel_amount DESC, id
LIMIT 3;

SELECT * FROM top_3_locations;
