CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(300) NOT NULL,
  current_age INT NOT NULL,
  current_job VARCHAR(300) NOT NULL
);

CREATE TABLE travel_packages(
  pack_id INT PRIMARY KEY AUTO_INCREMENT,
  pack_name VARCHAR(50) NOT NULL,
  purchase_count INT,
  price DOUBLE NOT NULL,
  departure_date DATETIME, 
  arrival_date DATETIME
);

CREATE TABLE purchases(
  travel_pack_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY(travel_pack_id, user_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (travel_pack_id) REFERENCES travel_packages(pack_id)
);

CREATE TABLE locations(
  loc_id INT PRIMARY KEY AUTO_INCREMENT,
  loc_name VARCHAR(150) NOT NULL,
  loc_country VARCHAR(300) NOT NULL
);

CREATE TABLE travel_packages_locations(
  loc_id INT NOT NULL,
  pack_id INT NOT NULL,
  FOREIGN KEY (loc_id) REFERENCES locations(loc_id),
  FOREIGN KEY (pack_id) REFERENCES travel_packages(pack_id)
);

INSERT INTO users (full_name, current_age, current_job)
VALUES
  ('Rafael Martins', 33, 'Arquiteto'),
  ('Amanda Rocha', 25, 'Desenvolvedora de Software'),
  ('Jonas Cabral', 18, 'Pintor'),
  ('Carol Domingues', 37, 'Contadora'),
  ('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages (pack_name, purchase_count, Price, departure_date, arrival_date)
VALUES
  ('Promoção 3 destinos', 0, 12500.99, '2022/09/25', '2022/10/12'),
  ('Vem Pro Verão', 0, 9650.99, '2022/10/16', '2022/10/26'),
  ('Cultura Francesa', 0, 3900.99, '2022/07/12', '2022/07/20'),
  ('Vem Pro Verão', 0, 7725.99, '2022/02/19', '2022/03/26'),
  ('Promoção 3 destinos', 0, 13500.99, '2022/09/13', '2022/10/18');


INSERT INTO purchases
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (3, 5),
  (5, 5);

INSERT INTO locations (loc_name, loc_country)
VALUES
  ('Cape Town', 'África do Sul'),
  ('Bali', 'Indonésia'),
  ('Marrakesh', 'Marrocos'),
  ('Paris', 'França'),
  ('Nova Iorque', 'Estados Unidos');
  
INSERT INTO travel_packages_locations
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (4, 3),
  (1, 4),
  (2, 4),
  (3, 5),
  (4, 5),
  (5, 5);
