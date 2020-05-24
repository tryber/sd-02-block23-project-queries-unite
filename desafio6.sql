USE queries_unite;

CREATE VIEW amount_spent_by_user AS
SELECT
  u.id,
  u.full_name AS fullName,
  SUM(tp.price) AS amount
FROM
  users u
  INNER JOIN purchases pur ON pur.users_id = u.id
  INNER JOIN travel_packages tp ON tp.id = pur.travel_packages_id
GROUP BY
  u.id
ORDER BY
  amount;

select
  *
from
  amount_spent_by_user;

DROP VIEW amount_spent_by_user;
