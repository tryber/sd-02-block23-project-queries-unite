CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
	id INT PRIMARY KEY auto_increment,
    full_name VARCHAR(50) NOT NULL,
    current_age TINYINT SIGNED NOT NULL,
    current_job VARCHAR(50) NOT NULL
)engine=InnoDB;

CREATE TABLE travel_packages(
	travel_package_id INT PRIMARY KEY auto_increment,
    travel_package_name VARCHAR(50) UNIQUE NOT NULL,
    purchase_count TINYINT SIGNED NOT NULL DEFAULT 0
)engine=InnoDB;

CREATE TABLE locations(
	location_id INT PRIMARY KEY auto_increment,
    location_city VARCHAR(50) UNIQUE NOT NULL,
	location_country VARCHAR(50) UNIQUE NOT NULL
)engine=InnoDB;

CREATE TABLE travel_packages_locations(
	travel_packages_locations_id INT PRIMARY KEY auto_increment,
	travel_package_id INT NOT NULL,
    location_id_1 INT NOT NULL,
    location_id_2 INT,
    location_id_3 INT,
	FOREIGN KEY (travel_package_id) REFERENCES travel_packages(travel_package_id),
    FOREIGN KEY (location_id_1) REFERENCES locations(location_id),
    FOREIGN KEY (location_id_2) REFERENCES locations(location_id),
    FOREIGN KEY (location_id_3) REFERENCES locations(location_id)
)engine=InnoDB;

CREATE TABLE purchases(
	purchase_id INT PRIMARY KEY auto_increment,
    user_id INT,
    travel_packages_locations_id INT,
    departure_date DATE NOT NULL,
	arrival_date DATE NOT NULL,
    price DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (travel_packages_locations_id) REFERENCES travel_packages_locations(travel_packages_locations_id),
	FOREIGN KEY (user_id) REFERENCES users(id)
)engine=InnoDB;


INSERT INTO users (full_name, current_age, current_job)
       VALUES ('Rafael Martins', 33, 'Arquiteto'),
              ('Amanda Rocha,', 25, ' Desenvolvedora de Software'),
              ('Jonas Cabral', 18, 'Pintor'),
              ('Carol Domingues', 37, 'Contadora'),
              ('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages (travel_package_name, purchase_count)
       VALUES ('Promoção 3 destinos', 2),
              ('Vem Pro Verão', 2),
              ('Cultura Francesa', 2);
              
INSERT INTO locations (location_city, location_country)
       VALUES ('Cape Town', 'África do Sul'),
              ('Bali', 'Indonésia'),
              ('Marrakesh', 'Marrocos'),
              ('Paris', 'França'),
              ('Nova Iorque', 'Estados Unidos');
              
INSERT INTO travel_packages_locations (travel_package_id, location_id_1, location_id_2, location_id_3)
	VALUES (1, 1, 2, 3),
           (2, 4, 5, NULL),
           (3, 4, NULL, NULL),
           (2, 1, 2, NULL),
           (1, 3, 5, 4);
           
INSERT INTO purchases (user_id, travel_packages_locations_id, departure_date, arrival_date, price)
	VALUES (1, 1, '2022-09-25', '2022-10-12', 12500.99),
		   (2, 2, '2022-10-16', '2022-10-26', 9650.99),
           (3, 3, '2022-07-12', '2022-07-20', 3900.00),
           (4, 4, '2022-02-19', '2022-03-26', 7725.99),
           (5, 3, '2022-07-12', '2022-07-20', 3900.99),
           (5, 5, '2022-09-13', '2022-10-18', 13500.99);
           