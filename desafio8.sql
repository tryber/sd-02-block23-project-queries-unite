USE queries_unite;

CREATE VIEW revenue_report AS
SELECT
  MIN(s.amount) AS lowest_revenue,
  MAX(s.amount) AS biggest_revenue,
  ROUND(AVG(s.amount), 6) AS average_revenue,
  ROUND(SUM(s.amount), 2) AS total_revenue
FROM
  (
    SELECT
      SUM(tp.price) AS amount
    FROM
      users u
      INNER JOIN purchases p ON p.users_id = u.id
      INNER JOIN travel_packages tp ON tp.id = p.travel_packages_id
    GROUP BY
      tp.id
  ) AS s;

SELECT
  *
FROM
  revenue_report;

DROP VIEW revenue_report;
