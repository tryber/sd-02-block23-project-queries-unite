use queries_unite;
delimiter $$
drop procedure if exists find_travel_packages_by_period $$
create procedure find_travel_packages_by_period(in date1 date,in date2 date)
begin
select 
id,
package as name,
cost as price,
start_date as departure_date,
end_date as arrive_date
from travel_packages t
where
start_date >= date1 and
end_date <= date2;
end $$
delimiter ;

call
find_travel_packages_by_period('2022-07-17', '2022-10-25');