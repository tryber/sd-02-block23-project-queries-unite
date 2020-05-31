USE queries_unite;

DROP VIEW IF EXISTS top_3_locations;

CREATE VIEW top_3_locations AS
    SELECT 
        l.id,
        l.city,
        l.country,
        COUNT(p.travel_package_id) AS travel_amount
    FROM
        locations l
            INNER JOIN
        travel_packages_locations t ON l.id = t.location_id
            INNER JOIN
        purchases p ON p.travel_package_id = t.travel_package_id
    GROUP BY l.id
    ORDER BY travel_amount DESC , l.id
    LIMIT 3;
