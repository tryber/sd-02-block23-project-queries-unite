USE queries_unite;

CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
UPDATE travel_packages SET purchase_count = purchase_count + 1
WHERE id = NEW.travel_package_id;
