USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT 
buy.user_id, u.full_name as user_name,
sum(price) AS amount
FROM purchases AS buy
INNER JOIN travel_packages AS pack ON pack.id = buy.travel_packages_id
INNER JOIN users AS u ON buy.user_id = u.id
GROUP BY buy.user_id
ORDER BY sum(price);
