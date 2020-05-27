USE queries_unite;

CREATE VIEW top_3_locations AS
SELECT
  s.id,
  s.city,
  s.country,
  COUNT(s.locations_id) AS travel_amount
FROM
  purchases AS p
  INNER JOIN (
    SELECT
      tpl.travel_package_id,
      l.id,
      l.city,
      c.country,
      tpl.locations_id
    FROM
      travel_packages_locations AS tpl
      INNER JOIN locations AS l ON l.id = tpl.locations_id
      INNER JOIN country AS c ON c.id = l.country_id
  ) AS s ON s.travel_package_id = p.travel_packages_id
GROUP BY
  s.city,
  s.country,
  s.id
ORDER BY
  travel_amount DESC,
  id ASC
LIMIT
  3;
