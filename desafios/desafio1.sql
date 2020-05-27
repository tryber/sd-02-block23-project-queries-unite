CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(50) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(50) NOT NULL
);

CREATE TABLE travel_packages(
  id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(50) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  purchase_count INT NOT NULL,
  going_date_package DATE NOT NULL,
  return_date_package DATE NOT NULL
);

CREATE TABLE locations(
  id INT PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) UNIQUE
);

CREATE TABLE purchases(
  user_id INT NOT NULL,
  travel_packages_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (travel_packages_id) REFERENCES travel_packages(id),
  PRIMARY KEY (user_id, travel_packages_id)
);

CREATE TABLE travel_packages_locations(
  id INT PRIMARY KEY AUTO_INCREMENT,
  travel_packages_id INT NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (travel_packages_id) REFERENCES travel_packages(id),
  FOREIGN KEY (location_id) REFERENCES locations(id)
);

INSERT INTO users(full_name, current_age, current_job)
VALUES
('Rafael Martins', 33, 'Arquiteto'),
('Amanda Rocha', 25, 'Desenvolvedora de Software'),
('Jonas Cabral', 18, 'Pintor'),
('Carol Domingues', 37, 'Contadora'),
('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO locations(city, country)
VALUES
('Cape Town', 'África do Sul'),
('Bali', 'Indonésia'),
('Marrakesh', 'Marrocos'),
('Paris', 'França'),
('Nova Iorque', 'Estados Unidos');

INSERT INTO travel_packages(package_name, price, purchase_count, going_date_package, return_date_package)
VALUES
('Promoção 3 destinos', 12500.99, 0, '2022-09-25', '2022-10-12'),
('Vem Pro Verão', 9650.99, 0, '2022-10-16', '2022-10-26'),
('Cultura Francesa', 3900.99, 0, '2022-07-12', '2022-07-20'),
('Vem Pro Verão', 7725.99, 0, '2022-02-19', '2022-03-26'),
('Promoção 3 destinos', 13500.99, 0, '2022-09-13', '2022-10-18');

INSERT INTO travel_packages_locations(travel_packages_id, location_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(3,4),
(4,1),
(4,2),
(5,3),
(5,4),
(5,5);

CREATE TRIGGER increment_travel_package_purchases
  AFTER INSERT ON purchases
  FOR EACH ROW
    UPDATE travel_packages SET purchase_count = purchase_count + 1
    WHERE id = NEW.travel_packages_id;
    
INSERT INTO purchases(user_id, travel_packages_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3),
(5, 5);
