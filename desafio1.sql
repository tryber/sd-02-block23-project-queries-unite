CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE travel_packages (
  id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  travel_cost DECIMAL(9, 2) NOT NULL,
  purchase_count INT DEFAULT 0
)ENGINE=InnoDB;

CREATE TABLE locations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE travel_packages_locations (
  travel_package_id INT NOT NULL,
  location_id INT NOT NULL,
  PRIMARY KEY (travel_package_id, location_id),
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages(id),
  FOREIGN KEY (location_id) REFERENCES locations(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS purchases (
  user_id INT NOT NULL,
  travel_package_id INT NOT NULL,
  PRIMARY KEY (user_id, travel_package_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (travel_package_id) REFERENCES travel_packages(id)
)ENGINE=InnoDB;

CREATE TRIGGER increment_travel_package_purchases
AFTER INSERT ON purchases
FOR EACH ROW
UPDATE travel_packages SET purchase_count = purchase_count + 1
WHERE id = NEW.travel_package_id;

INSERT INTO users(id, full_name, current_age, current_job) VALUES
  (1, 'Rafael Martins', 33, 'Arquiteto'),
  (2, 'Amanda Rocha', 25, 'Desenvolvedora de Software'),
  (3, 'Jonas Cabral', 18, 'Pintor'),
  (4, 'Carol Domingues', 37, 'Contadora'),
  (5, 'Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages(id, package_name, start_date, end_date, travel_cost) VALUES 
  (1, 'Promoção 3 destinos', '2022-09-25', '2022-10-12', 12500.99),
  (2, 'Vem Pro Verão', '2022-10-16', '2022-10-26', 9650.99),
  (3, 'Cultura Francesa', '2022-07-12', '2022-07-20', 3900.99),
  (4, 'Vem Pro Verão', '2022-02-19', '2022-03-26', 7725.99),
  (5, 'Promoção 3 destinos', '2022-09-13', '2022-10-18', 13500.99);
    
INSERT INTO locations(id, city, country) VALUES
  (1, 'Cape Town', 'África do Sul'),
  (2, 'Bali', 'Indonésia'),
  (3, 'Marrakesh', 'Marrocos'),
  (4, 'Paris', 'França'),
  (5, 'Nova Iorque', 'Estados Unidos');

INSERT INTO travel_packages_locations(travel_package_id, location_id) VALUES
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
    
INSERT INTO purchases(user_id, travel_package_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 3),
  (5, 5);
