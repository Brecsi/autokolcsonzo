CREATE DATABASE autokolcsonzo
CHARACTER SET utf8
COLLATE utf8_hungarian_ci;


CREATE TABLE autokolcsonzo.cars (
  id int(11) NOT NULL,
  license varchar(6) NOT NULL,
  type varchar(100) NOT NULL,
  year int(11) DEFAULT NULL,
  color varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE autokolcsonzo.cars
ADD UNIQUE INDEX license (license);

CREATE TABLE autokolcsonzo.loaners (
  id int(11) NOT NULL,
  name varchar(100) NOT NULL,
  licenseNum varchar(15) NOT NULL,
  phoneNum varchar(15) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

CREATE TABLE autokolcsonzo.users (
  id int(11) NOT NULL,
  firstName varchar(255) DEFAULT NULL,
  lastName varchar(255) DEFAULT NULL,
  gender varchar(255) DEFAULT NULL,
  userName varchar(255) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  number int(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

ALTER TABLE autokolcsonzo.users
ADD UNIQUE INDEX userName (userName);

ALTER TABLE autokolcsonzo.users
ADD UNIQUE INDEX email (email);

CREATE TABLE autokolcsonzo.loans (
  id int(11) NOT NULL,
  loanId int(11) DEFAULT NULL,
  carId int(11) DEFAULT NULL,
  loanStart datetime NOT NULL,
  numberOfDays int(11) DEFAULT NULL,
  dailyRate decimal(10, 0) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;