USE queries_unite;

CREATE VIEW top_3_locations AS
SELECT
tloc.location_id as id,
loc.city,
loc.country,
COUNT(pur.travel_packages_id) as travel_amount
FROM travel_packages_locations as tloc
INNER JOIN locations as loc on tloc.location_id = loc.id
INNER JOIN purchases as pur on pur.travel_packages_id = tloc.travel_packages_id
GROUP BY loc.id
ORDER BY travel_amount DESC
LIMIT 3;
