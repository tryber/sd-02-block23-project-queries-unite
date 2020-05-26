DROP VIEW IF EXISTS top_3_locations;
CREATE VIEW top_3_locations AS
    SELECT loc.location_id as id, 
       loc.location_city AS city,
       loc.location_country AS country,
       COUNT(*) AS travel_amount
    FROM travel_packages_locations as tpl, purchases, locations AS loc
    WHERE tpl.travel_packages_locations_id = purchases.travel_packages_locations_id
    AND (loc.location_id = tpl.location_id_1 
        OR loc.location_id = tpl.location_id_2
        OR loc.location_id = tpl.location_id_3)
    GROUP BY id
    ORDER BY travel_amount DESC, id ASC;

SELECT * FROM top_3_locations;
