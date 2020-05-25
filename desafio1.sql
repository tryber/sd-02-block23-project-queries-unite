CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE IF NOT EXISTS users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(200) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS travel_packages(
  id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(100) NOT NULL,
  departure_date DATE NOT NULL,
  arrival_date DATE NOT NULL,
  price DECIMAL(7, 2) NOT NULL,
  purchase_count INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS locations(
  id INT PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS travel_packages_locations(
  travel_package_id INT NOT NULL,
  location_id INT NOT NULL,
  PRIMARY KEY (travel_package_id, location_id),
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages(id),
  FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS purchases(
  user_id INT NOT NULL,
  travel_package_id INT NOT NULL,
  PRIMARY KEY (user_id, travel_package_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages(id)
);

DELIMITER $$

DROP TRIGGER IF EXISTS increment_travel_package_purchases $$

CREATE TRIGGER increment_travel_package_purchases
  AFTER INSERT ON purchases
  FOR EACH ROW
BEGIN
  UPDATE travel_packages
  SET purchase_count = purchase_count + 1
  WHERE id = NEW.travel_package_id;
END $$

DELIMITER ;

INSERT INTO users(full_name, current_age, current_job)
VALUES
  ('Rafael Martins', 33, 'Arquiteto'),
  ('Amanda Rocha', 25, 'Desenvolvedora de Software'),
  ('Jonas Cabral', 18, 'Pintor'),
  ('Carol Domingues', 37, 'Contadora'),
  ('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages(package_name, departure_date, arrival_date, price)
VALUES
  ('Promoção 3 destinos', '2022/09/25', '2022/10/12', 12500.99),
  ('Vem Pro Verão', '2022/10/16', '2022/10/26', 9650.99),
  ('Cultura Francesa', '2022/07/12', '2022/07/20', 3900.99),
  ('Vem pro Verão', '2022/02/19', '2022/03/26', 7725.99),
  ('Promoção 3 destinos', '2022/09/13', '2022/10/18', 13500.99);

INSERT INTO locations(city, country)
VALUES
  ('Cape Town', 'África do Sul'),
  ('Bali', 'Indonésia'),
  ('Marrakesh', 'Marrocos'),
  ('Paris', 'França'),
  ('Nova Iorque', 'Estados Unidos');

INSERT INTO travel_packages_locations(travel_package_id, location_id)
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
  (5, 4),
  (5, 5);

INSERT INTO purchases(user_id, travel_package_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 3),
  (5, 5);
