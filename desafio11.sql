DELIMITER $ $ CREATE TRIGGER increment_travel_package_purchases BEFORE
INSERT
  ON purchases FOR EACH ROW BEGIN
UPDATE
  travel_packages as tp
SET
  tp.purchase_count = tp.purchase_count + 1
WHERE
  tp.id = NEW.travel_packages_id;

END;

$ $ DELIMITER;
