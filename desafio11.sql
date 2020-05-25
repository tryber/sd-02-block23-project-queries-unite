USE queries_unite;

-- DROP TRIGGER increment_travel_package_purchases;
-- colocado no desafio 1 tbm
DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages as tp
SET tp.purchase_count = tp.purchase_count + 1
WHERE tp.id =  NEW.travel_id;
END; $$
DELIMITER ;

SELECT
id,
purchase_count
FROM queries_unite.travel_packages;
