CREATE DATABASE IF NOT EXISTS queries_unite;
USE queries_unite;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(50) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE travel_packages (
  package_id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(30) NOT NULL,
  package_price DOUBLE(9,2) NOT NULL,
  departure_date DATETIME NOT NULL,
  return_date DATETIME NOT NULL,
  purchase_count INT DEFAULT 0
) ENGINE = InnoDB;

CREATE TABLE locations (
  locations_id INT PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE travel_packages_locations (
  package_id INT NOT NULL,
  location_id INT NOT NULL,
  PRIMARY KEY (package_id, location_id),
  FOREIGN KEY (package_id) REFERENCES travel_packages (package_id),
  FOREIGN KEY (location_id) REFERENCES locations (locations_id)
) ENGINE = InnoDB;

CREATE TABLE purchases (
  user_id INT NOT NULL,
  package_id INT NOT NULL,
  PRIMARY KEY (user_id, package_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (package_id) REFERENCES travel_packages (package_id)
) ENGINE = InnoDB;

INSERT INTO users (full_name, current_age, current_job) VALUES
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO locations (country, city) VALUES
('África do Sul', 'Cape Town'),
('Indonésia', 'Bali'),
('Marrocos', 'Marrakesh'),
('França', 'Paris'),
('Estados Unidos', 'Nova Iorque');

INSERT INTO travel_packages (package_name, departure_date, return_date, package_price) VALUES
('Promoção 3 destinos', '2022/09/25', '2022-10-12 00:00:00', 12500.99),
('Vem Pro Verão', '2022/10/16', '2022-10-26 00:00:00', 9650.99),
('Cultura Francesa', '2022/07/12', '2022-07-20 00:00:00', 3900.99),
('Vem Pro Verão', '2022/02/19', '2022-03-26 00:00:00', 7725.99),
('Promoção 3 destinos', '2022/09/13', '2022-10-18 00:00:00', 13500.99);

INSERT INTO purchases (user_id, package_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 3), (5, 5);

INSERT INTO travel_packages_locations (package_id, location_id) VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (3, 4), (4, 1), (4, 2), (5, 3), (5, 5), (5, 4);
