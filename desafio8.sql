USE queries_unite;
CREATE VIEW revenue_report AS
SELECT
  MIN(revenue) AS lowest_revenue,
  MAX(revenue) AS biggest_revenue,
  AVG(revenue) AS average_revenue,
  SUM(revenue) AS total_revenue
FROM
(
  SELECT P.package_id, SUM(package_price) AS revenue
  FROM travel_packages AS TP
  INNER JOIN purchases AS P
  ON TP.package_id = P.package_id
  GROUP BY TP.package_id
) AS R;

SELECT * FROM revenue_report;
