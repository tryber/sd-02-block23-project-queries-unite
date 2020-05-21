USE queries_unite;

DROP VIEW IF EXISTS travel_package_info;

CREATE VIEW travel_package_info AS
    SELECT 
        p.travel_package_id,
        t.name AS travel_package_name,
        p.user_id,
        u.full_name AS user_name,
        t.price AS cost
    FROM
        purchases p
            INNER JOIN
        users u ON p.user_id = u.id
            INNER JOIN
        travel_packages t ON p.travel_package_id = t.id
    ORDER BY cost DESC;
