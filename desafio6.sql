DROP VIEW IF EXISTS amount_spent_by_user;
CREATE VIEW amount_spent_by_user AS
	SELECT user_id, 
		(SELECT full_name FROM users WHERE id = purch.user_id) AS user_name,
        SUM(price) AS amount
    FROM purchases AS purch
    GROUP BY user_id
    ORDER BY amount;
    
SELECT * FROM amount_spent_by_user;