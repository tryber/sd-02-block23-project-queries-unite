use queries_unite;

delimiter $$

create trigger increment_travel_package_purchases after insert on purchases
for each row
begin
update travel_packages t set purchase_count = purchase_count + 1 where t.id = new.travel_packages_id;
end $$

delimiter ;
