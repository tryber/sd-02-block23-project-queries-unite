DROP TRIGGER IF EXISTS increment_travel_package_purchases;

DELIMITER $$

CREATE TRIGGER increment_travel_package_purchases
    AFTER INSERT ON purchases 
    FOR EACH ROW
BEGIN
    UPDATE travel_packages_locations
    SET purchase_count = purchase_count + 1
    WHERE travel_packages_locations_id = NEW.travel_packages_locations_id;
END $$

DELIMITER ;
