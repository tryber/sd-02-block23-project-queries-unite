select 
max(total_price) as lowest_revenue,
min(total_price) as biggest_revenue,
round(avg(total_price * purchase_count), 6) as average_revenue,
round(sum(total_price * purchase_count), 2) as total_revenue
from queries_unite.travel_packages;
