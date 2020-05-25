USE queries_unite;
CREATE VIEW amount_spent_by_user AS
SELECT
  user_id,
  (
    SELECT full_name
    FROM users AS U
    WHERE P.user_id = U.id
  ) AS user_name,
  SUM(package_price) AS amount
FROM purchases AS P
INNER JOIN travel_packages AS TP
ON P.package_id = TP.package_id
GROUP BY user_id
ORDER BY amount;

SELECT * FROM amount_spent_by_user;
