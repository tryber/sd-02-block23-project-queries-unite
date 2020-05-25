use queries_unite;
create view travel_package_info as
select tp.id as travel_package_id, tp.package_name as travel_package_name, pu.user_id, us.full_name as user_name, tp.total_price as cost
from queries_unite.travel_packages as tp
inner join queries_unite.purchases as pu on tp.id = pu.travel_id
inner join queries_unite.users as us on us.id = pu.user_id
order by cost desc;
