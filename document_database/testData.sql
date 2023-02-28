SELECT * FROM cars;
SELECT * FROM loaners;
SELECT * FROM loans;
SELECT * FROM users;


DELETE FROM cars;
DELETE FROM loaners;
DELETE FROM loans;
DELETE FROM users;


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


INSERT INTO loaners (id, name, licenseNum, phoneNum)
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



INSERT INTO loans (id, loanId, carId, loanStart, numberOfDays, dailyRate)
  VALUES
  (1, 1, 3, 20230105, 21, 25000),
  (2, 4, 2, 20230210, NULL, 13000),
  (3, 8, 1, 20221222, NULL, 17500),
  (4, 5, 5, 20221210, 40, 11500),
  (5, 2, 9, 20230101, NULL, 67000);