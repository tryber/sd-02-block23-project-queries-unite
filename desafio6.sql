USE queries_unite;

DROP VIEW IF EXISTS amount_spent_by_user;

CREATE VIEW amount_spent_by_user AS
    SELECT p.user_id, u.full_name AS user_name, SUM(t.price) AS amount
    FROM purchases p
    INNER JOIN users u ON p.user_id = u.id
    INNER JOIN travel_packages t ON p.travel_package_id = t.id
    GROUP BY p.user_id
    ORDER BY amount;
