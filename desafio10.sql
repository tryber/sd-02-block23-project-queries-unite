USE queries_unite;

DELIMITER $$

-- DROP FUNCTION average_amount_spent_given_age_range;

CREATE FUNCTION average_amount_spent_given_age_range(min_age int, max_age int)
RETURNS DOUBLE READS SQL DATA
BEGIN
return
	(
	select avg(tp.total_price)
	from travel_packages as tp
	inner join purchases as pu on pu.travel_id = tp.id
	inner join users as us on pu.user_id = us.id
	where us.current_age between min_age and max_age
			);
END $$;

DELIMITER ;

select average_amount_spent_given_age_range(30, 50);
