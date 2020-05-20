CREATE DATABASE IF NOT EXISTS queries_unite;

USE queries_unite;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(300) NOT NULL,
    current_age INT NOT NULL,
    current_job VARCHAR(300) NOT NULL
);

CREATE TABLE purchases(
  travel_pack_id INT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE travel_packages(
  pack_id INT PRIMARY KEY AUTO_INCREMENT,
  pack_name VARCHAR(50) NOT NULL,
  purchase_count INT,
  PRICE DOUBLE NOT NULL
);

CREATE TABLE locations(
  loc_id INT PRIMARY KEY AUTO_INCREMENT,
  loc_name VARCHAR(150) NOT NULL,
  loc_country VARCHAR(300) NOT NULL
);