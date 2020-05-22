ALTER TABLE queries_unite.clone_troppers ADD COLUMN nickname varchar(50) not null;
ALTER TABLE queries_unite.clone_troppers MODIFY current_age tinyint;
ALTER TABLE queries_unite.clone_troppers CHANGE full_name origin_name varchar(100) not null unique;
ALTER TABLE queries_unite.clone_troppers DROP current_job;
