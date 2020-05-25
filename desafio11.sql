USE queries_unite;

DELIMITER $$

DROP TRIGGER IF EXISTS increment_travel_package_purchases $$

CREATE TRIGGER increment_travel_package_purchases
  AFTER INSERT ON purchases
  FOR EACH ROW
BEGIN
  UPDATE travel_packages
  SET purchase_count = purchase_count + 1
  WHERE id = NEW.travel_package_id;
END $$

DELIMITER ;

SELECT
  id,
  purchase_count
FROM queries_unite.travel_packages;
