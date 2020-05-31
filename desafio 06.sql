USE queries_unite;

DROP VIEW IF EXISTS amount_spent_by_user;

CREATE VIEW amount_spent_by_user AS
    SELECT 
        pur.user_id,
        us.full_name AS user_name,
        SUM(tp.price) AS amount
        FROM purchases pur
        INNER JOIN users us ON pur.user_id = us.id
        INNER JOIN travel_packages tp ON pur.travel_package_id = tp.id
        GROUP BY pur.user_id
        ORDER BY amount;
