ALTER TABLE clone_troopers ADD COLUMN nickname VARCHAR(50) NOT NULL;

ALTER TABLE clone_troopers MODIFY current_age TINYINT;

ALTER TABLE clone_troopers Change full_name orign_name VARCHAR(50) UNIQUE;

ALTER TABLE clone_troopers DROP COLUMN current_job;

SHOW COLUMNS FROM clone_troopers;
