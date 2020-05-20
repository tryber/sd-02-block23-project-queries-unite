CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    current_age INT NOT NULL,
    current_job VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS travel_packages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(8 , 2) NOT NULL,
    purchase_count INT DEFAULT 0
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS locations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS travel_packages_locations (
    travel_package_id INT NOT NULL,
    location_id INT NOT NULL,
    departure_date DATE NOT NULL,
    arrive_date DATE NOT NULL,
    PRIMARY KEY(travel_package_id, location_id),
    CONSTRAINT fk_travel_packages_locations_travel_packages FOREIGN KEY (travel_package_id)
        REFERENCES travel_packages (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_travel_packages_locations_locations FOREIGN KEY (location_id)
        REFERENCES locations (id)
        ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS purchases (
    user_id INT NOT NULL,
    travel_package_id INT NOT NULL,
    PRIMARY KEY(user_id, travel_package_id),
    CONSTRAINT fk_purchases_users FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_purchases_travel_packages FOREIGN KEY (travel_package_id)
        REFERENCES travel_packages (id)
        ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

INSERT INTO users(full_name, current_age, current_job)
VALUES
    ('Rafael Martins', 33, 'Arquiteto'),
    ('Amanda Rocha', 25, 'Desenvolvedora de Software'),
    ('Jonas Cabral', 18, 'Pintor'),
    ('Carol Domingues', 37, 'Contadora'),
    ('Sabrina Ferreira', 45, 'Engenheira de Alimentos');

INSERT INTO travel_packages(name, price)
VALUES 
    ('Promoção 3 destinos', 12500.99),
    ('Vem Pro Verão', 9650.99),
    ('Cultura Francesa', 3900.99),
    ('Vem Pro Verão', 7725.99),
    ('Promoção 3 destinos', 13500.99);
    
INSERT INTO locations(city, country)
VALUES
    ('Cape Town', 'África do Sul'),
    ('Bali', 'Indonésia'),
    ('Marrakesh', 'Marrocos'),
    ('Paris', 'França'),
    ('Nova Iorque', 'Estados Unidos');

INSERT INTO 
    travel_packages_locations(travel_package_id, location_id, departure_date, arrive_date)
VALUES
    (1, 1, '2022-09-25', '2022-10-12'),
    (1, 2, '2022-09-25', '2022-10-12'),
    (1, 3, '2022-09-25', '2022-10-12'),
    (2, 4, '2022-10-16', '2022-10-26'),
    (2, 5, '2022-10-16', '2022-10-26'),
    (3, 4, '2022-07-12', '2022-07-20'),
    (4, 1, '2022-02-19', '2022-03-26'),
    (4, 2, '2022-02-19', '2022-03-26'),
    (5, 3, '2022-09-13', '2022-10-18'),
    (5, 5, '2022-09-13', '2022-10-18'),
    (5, 4, '2022-09-13', '2022-10-18');
    


USE queries_unite;
DELIMITER $$

DROP FUNCTION IF EXISTS BuyPackage $$
CREATE FUNCTION BuyPackage(user_id_param INT, travel_package_id_param INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE user_name VARCHAR(100);
    DECLARE package_name VARCHAR(100);
    SELECT u.full_name FROM users u WHERE u.id = user_id_param INTO user_name;
    SELECT t.name FROM travel_packages t WHERE t.id = travel_package_id_param INTO package_name;
    INSERT INTO purchases(user_id, travel_package_id) 
    VALUES(user_id_param, travel_package_id_param);
    UPDATE travel_packages 
    SET purchase_count = (SELECT COUNT(travel_package_id) 
                          FROM purchases 
                          WHERE travel_package_id = id)
    WHERE travel_package_id_param = id;
    RETURN CONCAT(user_name, ' comprou o pacote ', package_name);
END $$

DELIMITER ;

SELECT BuyPackage(1, 1);
SELECT BuyPackage(2, 2);
SELECT BuyPackage(3, 3);
SELECT BuyPackage(4, 4);
SELECT BuyPackage(5, 3);
SELECT BuyPackage(5, 5);
