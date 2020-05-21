use queries_unite;
create view coisa as
select
(select count(*) * t.cost from purchases p
where p.travel_packages_id = t.id) as val
from travel_packages t;

create view revenue_report as
select
min(val) as lowest_revenue,
max(val) as biggest_revenue,
avg(val) as average_revenue,
sum(val) as total_revenue
from coisa;
