use queries_unite;
create view top_3_location as
select loc.id, loc.city, loc.country, count(tpl.travel_id) as travel_amount
from locations as loc
inner join travel_package_location as tpl on tpl.location_id = loc.id
inner join purchases as pu on pu.travel_id = tpl.travel_id
group by loc.id
order by travel_amount desc
limit 3;
