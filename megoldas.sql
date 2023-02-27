-- database creation (adatbazis elkeszitese)

CREATE DATABASE autoberles
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

	CREATE TABLE autoberles.berlok (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nev VARCHAR(100) NOT NULL,
  jogositvany VARCHAR(15) NOT NULL,
  telefonszam VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB;

CREATE TABLE autoberles.autok (
  id INT(11) NOT NULL AUTO_INCREMENT,
  rendszam VARCHAR(6) NOT NULL,
  tipus VARCHAR(100) NOT NULL,
  evjarat INT(11) DEFAULT NULL,
  szin VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE autoberles.autok 
  ADD UNIQUE INDEX rendszam(rendszam);

CREATE TABLE autoberles.kolcsonzes (
  id INT(11) NOT NULL AUTO_INCREMENT,
  berloid INT(11) DEFAULT NULL,
  autoid INT(11) DEFAULT NULL,
  berletkezdete DATETIME NOT NULL,
  napokszama INT(11) DEFAULT NULL,
  napidij INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;






