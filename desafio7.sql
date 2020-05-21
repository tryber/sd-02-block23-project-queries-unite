CREATE VIEW top_3_locations AS
SELECT
  j.loc_id id,
  j.loc_name city,
  j.loc_country country,
  COUNT(travel_pack_id) travel_amount
FROM purchases p
INNER JOIN 
  (SELECT
    tpl.pack_id,
    l.loc_name,
    l.loc_country,
    l.loc_id
  FROM travel_packages_locations tpl
  INNER JOIN locations l ON l.loc_id = tpl.loc_id) j ON j.pack_id = p.travel_pack_id
GROUP BY j.loc_name, j.loc_country, j.loc_id
ORDER BY travel_amount DESC, id ASC 
LIMIT 3;
