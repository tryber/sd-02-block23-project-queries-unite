USE queries_unite;

CREATE VIEW travel_package_info AS
  SELECT
    P.travel_package_id,
    TP.package_name AS travel_package_name,
    P.user_id,
    U.full_name AS user_name,
    TP.price AS cost
  FROM purchases AS P
  INNER JOIN users AS U
  ON U.id = P.user_id
  INNER JOIN travel_packages AS TP
  ON TP.id = P.travel_package_id
  ORDER BY cost DESC;
