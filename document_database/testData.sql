SELECT * FROM cars;
SELECT * FROM renters;
SELECT * FROM loaning;
SELECT * FROM users;
DELETE FROM users;

DELETE from loaning;
DELETE FROM cars;
DELETE FROM renters;



INSERT INTO cars (id, license, type, year, color)
  VALUES
  (1, "KFH271", "Volkswagen", "2003", "Black"),
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
  VALUES
  (1,  "Nagy Béla", "536012056314012", "06705519280"),
  (2,  "Kiss János", "509234527416861", "06306571231"),
  (3,  "Fekete Pál", "185512685049050", "06204458163"),
  (4,  "Nagy Károly", "684811260235354", "06309976544"),
  (5,  "Beton Károly", "116098956271829", "06703217455"),
  (6,  "Pogány Krisztián", "190532681943455", "06208893327"),
  (7,  "Kiss Bertalan", "890426785007182", "06708839214"),
  (8,  "Nádas Péter", "182666784821177", "06306659321"),
  (9,  "Rigó Zoltán", "099796949378155", "06205764585"),
  (10, "Nagy Péter", "587259761216499", "06304518753");




INSERT INTO loaning (id, renterId, carId, loanStart, numDay, dailyRate)
  VALUES
  (1,  1,  8, '2023.01.05', 21, 25000),
  (2,  2,  7, '2023.02.10', NULL, 13000),
  (3,  3,  6, '2022.12.22', NULL, 17500),
  (4,  4,  5, '2022.12.10', 40, 11500),
  (5,  5,  4, '2023.01.01', NULL, 67000),
  (6,  6,  3, '2022.12.12', NULL, 12000),
  (7,  7,  2, '2021.08.21', 70, 12000),
  (8,  8,  1, '2022.10.11', 90, 15000),
  (9,  9,  9, '2021.03.05', 44, 17000),
  (10, 10,  10, '2022.11.20', 50, 11000);


call autoberlesGen();