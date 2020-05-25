USE queries_unite;

ALTER TABLE clone_troopers ADD nickname VARCHAR(50) NOT NULL;
ALTER TABLE clone_troopers MODIFY current_age TINYINT NOT NULL;
ALTER TABLE clone_troopers CHANGE COLUMN full_name origin_name VARCHAR(50) UNIQUE NOT NULL;
ALTER TABLE clone_troopers DROP COLUMN current_job;
