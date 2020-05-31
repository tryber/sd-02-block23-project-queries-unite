USE queries_unite;

DROP VIEW IF EXISTS travel_package_info;

CREATE VIEW travel_package_info AS
    SELECT 
        pur.travel_package_id,
        tr.name AS travel_package_name,
        pur.user_id,
        us.full_name AS user_name,
        tr.price AS cost
    FROM
        purchases pur
            INNER JOIN
        users us ON pur.user_id = us.id
            INNER JOIN
        travel_packages tr ON pur.travel_package_id = tr.id
    ORDER BY cost DESC;
    