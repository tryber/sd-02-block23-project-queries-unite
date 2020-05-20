CREATE VIEW amount_spent_by_user AS
SELECT
  u.id user_id,
  u.full_name user_name,
  j.amount FROM users u
INNER JOIN (
  SELECT p.user_id, SUM(price) amount FROM purchases p
  INNER JOIN travel_packages tp ON tp.pack_id = p.travel_pack_id
  GROUP BY p.user_id
  ) j ON u.id = j.user_id
ORDER BY amount;
