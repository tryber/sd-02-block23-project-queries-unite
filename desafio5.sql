create view travel_package_info as
select
t.id as travel_package_id,
t.package as travel_package_name,
u.id as user_id,
full_name as user_name,
t.cost
from queries_unite.purchases p
join travel_packages t on t.id = p.travel_packages_id
join users u on u.id = p.users_id
order by t.cost desc;
