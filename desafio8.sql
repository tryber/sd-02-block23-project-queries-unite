CREATE VIEW revenue_report AS
SELECT
  MIN(soma) lowest_revenue,
  MAX(soma) biggest_revenue,
  ROUND(AVG(soma), 2) average_revenue,
  ROUND(SUM(soma), 2) total_revenue
FROM (
  SELECT 
  p.travel_pack_id,
  SUM(tp.price) as soma
  FROM purchases p
  INNER JOIN travel_packages as tp ON tp.pack_id = p.travel_pack_id
  GROUP BY travel_pack_id
      ) joined;
