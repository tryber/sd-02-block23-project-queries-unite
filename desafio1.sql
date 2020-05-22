create database if not exists queries_unite;
use queries_unite;

create table users (
id int primary key auto_increment,
full_name varchar(50),
current_age int not null,
current_job varchar(50)
) engine=InnoDB;

create table travel_packages (
id int primary key auto_increment,
cost double not null,
package varchar(50),
start_date date not null,
end_date date not null,
purchase_count int default 0
);

create table locations (
id int primary key auto_increment,
country varchar(50),
city varchar(50)
);

create table travel_packages_locations (
id int primary key auto_increment,
travel_packages_id int not null,
locations_id int not null,
foreign key (travel_packages_id) references travel_packages(id),
foreign key (locations_id) references locations(id)
);

create table purchases (
id int primary key auto_increment,
travel_packages_id int not null,
users_id int not null,
foreign key (users_id) references users(id),
foreign key (travel_packages_id) references travel_packages(id)
);

insert into users (full_name, current_age, current_job) value
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

insert into travel_packages (package, cost, start_date, end_date) value
('Promoção 3 destinos', '12500.99', '2022-09-25', '2022-10-12'),
('Vem Pro Verão', 9650.99, '2022-10-16', '2022-10-26'),
('Cultura Francesa', '3900.99', '2022-07-12', '2022-07-20'),
('Vem Pro Verão', 7725.99, '2022-02-19', '2022-03-26'),
('Promoção 3 destinos', 13500.99, '2022-09-13', '2022-10-18');

insert locations (city, country) value
('Cape Town', 'África do Sul'),
('Bali', 'Indonésia'),
('Marrakesh', 'Marrocos'),
('Paris', 'França'),
('Nova Iorque', 'Estados Unidos');

insert into purchases (travel_packages_id, users_id) value
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(3, 5),
(5, 5);

insert travel_packages_locations (travel_packages_id, locations_id) value
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 4),
(4, 1), (4, 2),
(5, 3), (5, 5), (5, 4);
