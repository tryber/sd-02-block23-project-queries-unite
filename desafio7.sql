USE queries_unite;

DROP VIEW IF EXISTS top_3_locations;

CREATE VIEW top_3_locations AS
SELECT
  L.id,
  L.city,
  L.country,
  (
    SELECT SUM(purchase_count) FROM travel_packages AS TP
    WHERE EXISTS (
      SELECT * FROM travel_packages_locations AS TPL
      WHERE TPL.location_id = L.id AND TPL.travel_package_id = TP.id
    )
  ) AS travel_amount
FROM locations AS L
ORDER BY travel_amount DESC, L.id
LIMIT 3;
