USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT
  P.user_id,
  U.full_name AS user_name,
  SUM(TP.price) AS amount
FROM purchases AS P
INNER JOIN users AS U
ON U.id = P.user_id
INNER JOIN travel_packages AS TP
ON TP.id = P.travel_package_id
GROUP BY P.user_id
ORDER BY amount;
