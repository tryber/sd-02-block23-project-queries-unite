CREATE VIEW travel_package_info AS
SELECT
    tp.pack_id travel_package_id,
    tp.pack_name travel_package_name,
    p.user_id,
    u.full_name user_name,
    tp.price cost
FROM purchases p
INNER JOIN users u ON p.user_id = u.id
INNER JOIN travel_packages tp ON tp.pack_id = p.travel_pack_id
ORDER BY cost DESC;
