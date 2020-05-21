create view amount_spent_by_user as
select
u.id as user_id,
u.full_name as user_name,
(select sum(t.cost) from purchases p
join travel_packages t on t.id = p.travel_packages_id
where p.users_id = u.id
) as amount
from queries_unite.users u
order by amount;
