use queries_unite;
create view revenue_report as
select 
min(total_price * purchase_count) as lowest_revenue,
max(total_price * purchase_count) as biggest_revenue,
round(avg(total_price * purchase_count), 6) as average_revenue,
round(sum(total_price * purchase_count), 2) as total_revenue
from queries_unite.travel_packages;
