create view amount_spent_by_user as
select us.id as user_id, us.full_name as user_name, sum(tp.total_price) as amount
from queries_unite.users as us
inner join queries_unite.purchases as pu on pu.user_id = us.id
inner join queries_unite.travel_packages as tp on pu.travel_id = tp.id
group by us.id
order by amount;
