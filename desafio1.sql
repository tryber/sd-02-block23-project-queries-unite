CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE if NOT EXISTS users(
id int primary key auto_increment,
full_name VARCHAR(100) not null,
current_age int not null,
current_job varchar(200) not null
);

CREATE TABLE if not exists travel_packages(
id int primary key auto_increment,
package_name VARCHAR(100) not null,
start_date datetime not null,
end_date datetime not null,
total_price double not null,
purchase_count int default 0
);

CREATE TABLE locations(
id int primary key auto_increment,
city VARCHAR(100) not null,
country varchar(100) not null
);

CREATE TABLE travel_package_location(
travel_id int,
location_id int,
foreign key (travel_id) references travel_packages(id),
foreign key (location_id) references locations(id),
primary key (travel_id, location_id)
);

CREATE TABLE purchases(
user_id int,
travel_id int,
foreign key (travel_id) references travel_packages(id),
foreign key (user_id) references users(id),
primary key (travel_id, user_id)
);

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages as tp
SET tp.purchase_count = tp.purchase_count + 1
WHERE tp.id =  NEW.travel_id;
END; $$
DELIMITER ;

insert into users (full_name, current_age, current_job)
values
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimento');

insert into travel_packages (package_name, start_date, end_date, total_price)
values 
('Promoção 3 destinos', '2022/09/25', '2022/10/12', 12500.99),
('Vem Pro Verão', '2022/10/16', '2022/10/26', 9650.99),
('Cultura Francesa', '2022/07/12', '2022/07/20', 3900.99),
('Vem pro Verão', '2022/02/19', '2022/03/26', 7725.99),
('Promoção 3 destinos', '2022/09/13', '2022/10/18', 13500.99);

insert into locations (city, country)
values 
('Cape Town', 'África do Sul'),
('Bali', 'Indonesia'),
('Marrakesh', 'Marrocos'),
('Paris', 'França'),
('Nova Iorque', 'Estados Unidos');

insert into travel_package_location (travel_id, location_id)
values 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 4),
(4, 1),
(4, 2),
(5, 3),
(5, 4),
(5, 5);

insert into purchases (user_id, travel_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(5, 5);
