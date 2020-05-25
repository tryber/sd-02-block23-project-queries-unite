CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
id INT PRIMARY KEY auto_increment,
full_name VARCHAR(50) NOT NULL,
current_age INT NOT NULL,
current_job VARCHAR(70) NOT NULL
);

CREATE TABLE packages(
id INT PRIMARY KEY auto_increment,
package_name VARCHAR(100) NOT NULL
);

CREATE TABLE travel_packages(
id INT PRIMARY KEY auto_increment,
quantity_purchases INT default 0,
packages_id INT NOT NULL,
departure_date DATE NOT NULL,
arrival_date DATE NOT NULL,
price DOUBLE NOT NULL,
FOREIGN KEY (packages_id) REFERENCES packages(id)
);

CREATE TABLE country(
id INT PRIMARY KEY auto_increment,
country_name VARCHAR(10) NOT NULL
);

CREATE TABLE location(
id INT PRIMARY KEY auto_increment,
city VARCHAR(30) NOT NULL,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE travel_packages_locations(
PRIMARY KEY (travel_package_id, location_id),
travel_package_id INT NOT NULL,
location_id INT NOT NULL,
FOREIGN KEY (travel_package_id) REFERENCES trave_packages(id),
FOREIGN KEY (location_id) REFERENCES location(id),
);

CREATE TABLE purchases(
PRIMARY KEY(users_id, travel_packages_id),
users_id INT NOT NULL,
travel_packages_id INT NOT NULL,
FOREIGN KEY (travel_packages_id) REFERENCES travel_packages(id),
FOREIGN KEY (users_id) REFERENCES users(id)
);

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
BEFORE INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages AS TP
SET TP.quantity_purchases = TP.quantity_purchases + 1
WHERE TP.id =  NEW.travel_packages_id;
END; $$
DELIMITER ;

INSERT INTO
  country (country)
VALUES
  ('África do Sul'),
  ('Indonésia'),
  ('Marrocos'),
  ('França'),
  ('Estados Unidos');

INSERT INTO
  locations (city, country_id)
VALUES
  ('Cape Town', 1),
  ('Bali', 2),
  ('Marrakesh', 3),
  ('Paris', 4),
  ('Nova Iorque', 5);

INSERT INTO
  users (full_name, current_age, current_job)
VALUES
  ('Rafael Martins', 33, 'Arquiteto'),
  ('Amanda Rocha', 25, 'Desenvolvedora de Software'),
  ('Jonas Cabral', 18, 'Pintor'),
  ('Carol Domingues', 37, 'Contadora'),
  (
    'Sabrina Ferreira',
    45,
    'Engenheira de Alimentos'
  );

INSERT INTO
  package_name (package_name)
VALUES
  ('Promoção 3 destinos'),
  ('Vem Pro Verão'),
  ('Cultura Francesa');

INSERT INTO
  travel_packages (package_name_id, date_going, date_return, price, purchase_count)
VALUES
  (1, '2022/09/25', "2022/10/12", 12500.99, 1),
  (2, "2022/10/16", "2022/10/26", 9650.99, 1),
  (3, "2022/07/12", "2022/07/20", 3900.99, 2),
  (2, "2022/02/19", "2022/03/26", 7725.99, 1),
  (1, "2022/09/13", "2022/10/18", 13500.99, 1);

INSERT INTO
  travel_packages_locations (travel_package_id, locations_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (3, 4),
  (4, 1),
  (4, 2),
  (5, 3),
  (5, 5),
  (5, 4);

INSERT INTO
  purchases (users_id, travel_packages_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 3),
  (5, 5);
  