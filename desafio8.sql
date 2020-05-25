USE queries_unite;

DROP VIEW IF EXISTS revenue_report;

CREATE VIEW revenue_report AS
SELECT
  MIN(price * purchase_count) AS lowest_revenue,
  MAX(price * purchase_count) AS biggest_revenue,
  AVG(price * purchase_count) AS average_revenue,
  SUM(price * purchase_count) AS total_revenue
FROM travel_packages;
