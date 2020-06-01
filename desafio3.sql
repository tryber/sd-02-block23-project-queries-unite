use queries_unite;
alter table clone_troopers add column nickname varchar(50);
alter table clone_troopers modify current_age tinyint;
alter table clone_troopers rename column full_name to origin_name;
alter table clone_troopers add constraint name unique (origin_name);
alter table clone_troopers drop column current_job;

