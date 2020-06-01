use queries_unite;

delimiter $$
create function average_amount_spent_given_age_range(age1 int, age2 int)
returns double
deterministic
return (select avg(cost) from purchases p
join users u on p.users_id = u.id
join travel_packages t on t.id = p.travel_packages_id
where u.current_age <= age2 and u.current_age >= age1);
$$ delimiter ;

select average_amount_spent_given_age_range(30, 50);
