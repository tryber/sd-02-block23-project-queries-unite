DROP VIEW IF EXISTS revenue_report;
CREATE VIEW revenue_report AS
	SELECT 
		MIN(price) AS lowest_revenue,
		MAX(price) AS biggest_revenue,
		AVG(price) AS average_revenue, 
		SUM(price) AS total_revenue
	FROM (SELECT SUM(purch.price) AS price
		FROM travel_packages_locations as tpl, purchases AS purch
		WHERE purch.travel_packages_locations_id = tpl.travel_packages_locations_id
		GROUP BY tpl.travel_packages_locations_id) AS price_table;
        
SELECT * FROM revenue_report;
