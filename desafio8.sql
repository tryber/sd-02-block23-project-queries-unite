USE queries_unite;

CREATE VIEW top_3_locations AS
SELECT 
  MIN(travel_cost * purchase_count) AS lowest_revenue,
  MAX(travel_cost * purchase_count) AS biggest_revenue,
  AVG(travel_cost * purchase_count) AS average_revenue,
  SUM(travel_cost * purchase_count) AS total_revenue
FROM travel_packages;
