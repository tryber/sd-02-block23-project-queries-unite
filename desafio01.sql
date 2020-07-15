CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE IF NOT EXISTS users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    current_age INT NOT NULL,
    current_job VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS package_name(
	id INT PRIMARY KEY AUTO_INCREMENT,
    package_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS travel_packages(
	id INT PRIMARY KEY AUTO_INCREMENT,
	purchase_count INT DEFAULT 0,
	package_name_id INT NOT NULL, 
	date_departure DATE NOT NULL,
	date_return DATE NOT NULL,
	price DOUBLE NOT NULL,
	FOREIGN KEY (package_name_id) REFERENCES package_name(id)
);

CREATE TABLE IF NOT EXISTS country(
	id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(70) NOT NULL
);

CREATE TABLE IF NOT EXISTS locations(
	id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(40) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE IF NOT EXISTS travel_packages_locations(
  PRIMARY KEY (travel_package_id, locations_id),
  travel_package_id INT NOT NULL,
  locations_id INT NOT NULL,
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages(id),
  FOREIGN KEY (locations_id) REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS purchases (
    PRIMARY KEY (users_id , travel_packages_id),
    users_id INT NOT NULL,
    travel_packages_id INT NOT NULL,
    FOREIGN KEY (travel_packages_id)
	REFERENCES travel_packages (id),
    FOREIGN KEY (users_id)
	REFERENCES users (id)
);

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
travel_packages (package_name_id, date_departure, date_return, price, purchase_count)
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

DELIMITER $$
CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
UPDATE travel_packages as tp
SET tp.purchase_count = tp.purchase_count + 1
WHERE tp.id = NEW.travel_packages_id;
END; $$
DELIMITER ;
