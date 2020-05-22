ALTER TABLE clone_troopers ADD COLUMN nickname VARCHAR(50) NOT NULL;

ALTER TABLE clone_troopers MODIFY current_age TINYINT;

ALTER TABLE clone_troopers CHANGE full_name origin_name VARCHAR(50) UNIQUE;

ALTER TABLE clone_troopers DROP current_job;
