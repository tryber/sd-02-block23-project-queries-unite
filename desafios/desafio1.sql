CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE IF NOT EXISTS jobs(
	id INT PRIMARY KEY auto_increment,
    job_name VARCHAR(50) NOT NULL
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY auto_increment,
    full_name VARCHAR(120) NOT NULL,
    current_age INT NOT NULL,
    job_id INT NOT NULL,
    FOREIGN KEY(job_id) references jobs(id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS travel_packages(
	id INT PRIMARY KEY auto_increment,
    package_name VARCHAR(100) NOT NULL,
    date_going DATE NOT NULL,
    date_back DATE NOT NULL,
    total_coast DECIMAL(10,2) NOT NULL
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS purchase(
    user_id INT NOT NULL,
    travel_package INT NOT NULL,
    PRIMARY KEY(travel_package, user_id),
    FOREIGN KEY(user_id) references users(id),
	FOREIGN KEY(travel_package) references travel_packages(id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS locations(
	id INT PRIMARY KEY auto_increment,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS travel_packages_locations(
	package_id INT NOT NULL,
    location_id INT NOT NULL,
    PRIMARY KEY(package_id, location_id),
    FOREIGN KEY(package_id) references travel_packages(id),
	FOREIGN KEY(location_id) references locations(id)
)engine=InnoDB;

INSERT INTO jobs (job_name)
	VALUES
		("Arquiteto(a)"),
        ("Desenvolvedor(a) de Software"),
        ("Pintor(a)"),
        ("Contador(a)"),
        ("Engenheiro(a) de Alimentos");

INSERT INTO users (full_name, current_age, job_id)
	VALUES
		("Rafael Martins", 33, 1),
        ("Amanda Rocha", 25, 2),
        ("Jonas Cabral", 18, 3),
        ("Carol Domingues", 37, 4),
        ("Sabrina Ferreira", 45, 5);
        
INSERT INTO locations (city, country)
	VALUES
		("Cape Town", "África do Sul"),
        ("Bali", "Indonésia"),
        ("Marrakesh", "Marrocos"),
        ("Paris", "França"),
        ("Nova Iorque", "Estados Unidos");

INSERT INTO travel_packages (package_name, date_going, date_back, total_coast)
	VALUES
		("Promoção 3 destinos", "2022-09-25", "2022-10-12", 12500.99),
        ("Vem Pro Verão", "2022-10-16", "2022-10-26", 9650.99),
        ("Cultura Francesa", "2022-07-12", "2022-07-20", 3900.99),
        ("Vem Pro Verão", "2022-02-19", "2022-03-26", 7725.99),
        ("Promoção 3 destinos", "2022-09-13", "2022-10-18", 13500.99);
        
INSERT INTO purchase (user_id, travel_package)
		VALUES
			(1,1),
            (2,2),
            (3,3),
            (4,4),
            (5,3),
            (5,5);
INSERT INTO travel_packages_locations (package_id, location_id)
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
