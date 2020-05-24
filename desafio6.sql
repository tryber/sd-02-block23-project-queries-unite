USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT 
  p.user_id,
  u.full_name AS user_name,
  SUM(t.travel_cost) AS amount
FROM purchases AS p
INNER JOIN users AS u ON p.user_id = u.id
INNER JOIN travel_packages AS t ON p.travel_package_id = t.id
GROUP BY p.user_id
ORDER BY amount ASC;
