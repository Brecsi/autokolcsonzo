﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2023.03.06. 9:17:59
-- Server version: 5.5.5-10.1.38-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS autoberles;

CREATE DATABASE IF NOT EXISTS autoberles
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

--
-- Set default database
--
USE autoberles;

--
-- Create table `users`
--
CREATE TABLE IF NOT EXISTS users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(26) NOT NULL,
  lastName VARCHAR(32) NOT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  userName VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  number INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create index `email` on table `users`
--
ALTER TABLE users 
  ADD UNIQUE INDEX email(email);

--
-- Create index `userName` on table `users`
--
ALTER TABLE users 
  ADD UNIQUE INDEX userName(userName);

--
-- Create table `renters`
--
CREATE TABLE IF NOT EXISTS renters (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  license VARCHAR(15) NOT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `cars`
--
CREATE TABLE IF NOT EXISTS cars (
  id INT(11) NOT NULL AUTO_INCREMENT,
  license VARCHAR(6) NOT NULL,
  type VARCHAR(100) NOT NULL,
  year INT(11) DEFAULT NULL,
  color VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create index `rendszam` on table `cars`
--
ALTER TABLE cars 
  ADD UNIQUE INDEX rendszam(license);

--
-- Create table `loaning`
--
CREATE TABLE IF NOT EXISTS loaning (
  id INT(11) NOT NULL AUTO_INCREMENT,
  renterId INT(11) DEFAULT NULL,
  carId INT(11) DEFAULT NULL,
  loanStart DATETIME NOT NULL,
  numDay INT(11) DEFAULT NULL,
  dailyRate INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE loaning 
  ADD CONSTRAINT FK_kolcsonzes_autok_id1 FOREIGN KEY (carId)
    REFERENCES cars(id);

--
-- Create foreign key
--
ALTER TABLE loaning 
  ADD CONSTRAINT FK_kolcsonzes_berlok_id FOREIGN KEY (renterId)
    REFERENCES renters(id);

DELIMITER $$

--
-- Create procedure `autoberlesGen`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE autoberlesGen()
BEGIN
DELETE
  FROM loaning;
DELETE
  FROM cars;
DELETE
  FROM renters;



INSERT INTO cars (id, license, type, year, color)
  VALUES (1, "KFH271", "Volkswagen", "2003", "Black"),
  (2, "OEJ813", "Mercedes", "2018", "Grey"),
  (3, "AXE809", "BMW", "2022", "Black"),
  (4, "KEG600", "Ford", "2001", "Blue"),
  (5, "BFG915", "Suzuki", "1999", "Red"),
  (6, "LKE642", "Peugeot", "2005", "Blue"),
  (7, "KYR241", "Cadillac", "2018", "White"),
  (8, "HJY381", "Daewoo", "1997", "Green"),
  (9, "ABU885", "Koenigsegg", "2020", "Yellow"),
  (10, "SKY845", "Nissan", "2004", "Blue");


INSERT INTO renters (id, name, license, phone)
  VALUES (1, "Nagy Béla", "536012056314012", "06705519280"),
  (2, "Kiss János", "509234527416861", "06306571231"),
  (3, "Fekete Pál", "185512685049050", "06204458163"),
  (4, "Nagy Károly", "684811260235354", "06309976544"),
  (5, "Beton Károly", "116098956271829", "06703217455"),
  (6, "Pogány Krisztián", "190532681943455", "06208893327"),
  (7, "Kiss Bertalan", "890426785007182", "06708839214"),
  (8, "Nádas Péter", "182666784821177", "06306659321"),
  (9, "Rigó Zoltán", "099796949378155", "06205764585"),
  (10, "Nagy Péter", "587259761216499", "06304518753");




INSERT INTO loaning (id, renterId, carId, loanStart, numDay, dailyRate)
  VALUES (1, 1, 8, '2023.01.05', 21, 25000),
  (2, 2, 7, '2023.02.10', NULL, 13000),
  (3, 3, 6, '2022.12.22', NULL, 17500),
  (4, 4, 5, '2022.12.10', 40, 11500),
  (5, 5, 4, '2023.01.01', NULL, 67000),
  (6, 6, 3, '2022.12.12', NULL, 12000),
  (7, 7, 2, '2021.08.21', 70, 12000),
  (8, 8, 1, '2022.10.11', 90, 15000),
  (9, 9, 9, '2021.03.05', 44, 17000),
  (10, 10, 10, '2022.11.20', 50, 11000);

SELECT
  *
FROM cars;
SELECT
  *
FROM renters;
SELECT
  *
FROM loaning;
SELECT
  *
FROM users;
END
$$

DELIMITER ;

-- 
-- Dumping data for table renters
--
INSERT INTO renters VALUES
(1, 'Nagy Béla', '536012056314012', '06705519280'),
(2, 'Kiss János', '509234527416861', '06306571231'),
(3, 'Fekete Pál', '185512685049050', '06204458163'),
(4, 'Nagy Károly', '684811260235354', '06309976544'),
(5, 'Beton Károly', '116098956271829', '06703217455'),
(6, 'Pogány Krisztián', '190532681943455', '06208893327'),
(7, 'Kiss Bertalan', '890426785007182', '06708839214'),
(8, 'Nádas Péter', '182666784821177', '06306659321'),
(9, 'Rigó Zoltán', '099796949378155', '06205764585'),
(10, 'Nagy Péter', '587259761216499', '06304518753');

-- 
-- Dumping data for table cars
--
INSERT INTO cars VALUES
(1, 'KFH271', 'Volkswagen', 2003, 'Black'),
(2, 'OEJ813', 'Mercedes', 2018, 'Grey'),
(3, 'AXE809', 'BMW', 2022, 'Black'),
(4, 'KEG600', 'Ford', 2001, 'Blue'),
(5, 'BFG915', 'Suzuki', 1999, 'Red'),
(6, 'LKE642', 'Peugeot', 2005, 'Blue'),
(7, 'KYR241', 'Cadillac', 2018, 'White'),
(8, 'HJY381', 'Daewoo', 1997, 'Green'),
(9, 'ABU885', 'Koenigsegg', 2020, 'Yellow'),
(10, 'SKY845', 'Nissan', 2004, 'Blue');

-- 
-- Dumping data for table users
--
-- Table autoberles.users does not contain any data (it is empty)

-- 
-- Dumping data for table loaning
--
INSERT INTO loaning VALUES
(1, 1, 8, '2023-01-05 00:00:00', 21, 25000),
(2, 2, 7, '2023-02-10 00:00:00', NULL, 13000),
(3, 3, 6, '2022-12-22 00:00:00', NULL, 17500),
(4, 4, 5, '2022-12-10 00:00:00', 40, 11500),
(5, 5, 4, '2023-01-01 00:00:00', NULL, 67000),
(6, 6, 3, '2022-12-12 00:00:00', NULL, 12000),
(7, 7, 2, '2021-08-21 00:00:00', 70, 12000),
(8, 8, 1, '2022-10-11 00:00:00', 90, 15000),
(9, 9, 9, '2021-03-05 00:00:00', 44, 17000),
(10, 10, 10, '2022-11-20 00:00:00', 50, 11000);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;