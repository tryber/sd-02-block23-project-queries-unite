DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases AFTER INSERT
ON purchases
FOR EACH ROW
BEGIN
  UPDATE travel_packages SET purchase_count = purchase_count + 1
  WHERE travel_packages.pack_id = NEW.travel_pack_id;
END $$

DELIMITER ;
