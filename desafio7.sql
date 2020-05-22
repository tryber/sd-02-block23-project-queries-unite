use queries_unite;
create view top_3_locations as
select 
l.id,
l.city,
l.country,
count(p.travel_packages_id) as travel_amount
from
locations l
inner join
travel_packages_locations tpl ON l.id = tpl.locations_id
inner join
purchases p on p.travel_packages_id = tpl.travel_packages_id
group by l.id
order by travel_amount desc , l.id
limit 3;
