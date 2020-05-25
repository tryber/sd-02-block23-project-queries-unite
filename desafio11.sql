USE queries_unite;

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
  UPDATE travel_packages
  SET purchase_count = purchase_count + 1
  WHERE package_id = NEW.package_id;
END $$
DELIMITER ;

SELECT package_id as id, purchase_count FROM travel_packages;
