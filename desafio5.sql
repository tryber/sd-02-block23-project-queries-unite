USE queries_unite;
CREATE VIEW travel_package_info AS
SELECT
  package_id AS travel_package_id,
  (
    SELECT package_name
    FROM travel_packages AS TP
    WHERE P.package_id = TP.package_id
  ) AS travel_package_name,
  user_id,
  (
    SELECT full_name
    FROM users AS U
    WHERE P.user_id = U.id
  ) AS user_name,
  (
    SELECT package_price
    FROM travel_packages AS TP
    WHERE P.package_id = TP.package_id
  ) AS cost
FROM purchases AS P
ORDER BY cost DESC;

SELECT * FROM travel_package_info;
