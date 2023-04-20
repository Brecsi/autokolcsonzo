

select * from cars; 
select * from loaners;
select * from loans;
select * from users;


delete from users;

delete from loans;

insert into loans (id, loanId, carId, loanStart, numberOfDays, dailyRate)
values
(5, 600, 2, '2023-03-15 12:45:29', 3, 13000);




INSERT cars 
      (license, type, year, color, dailyRate)
      VALUES
      ('HHH-414', 'Volkswagen', 2005, 'Black', 25000);


INSERT INTO loaners (id, name, licenseNum, phoneNum)
VALUES
  (11,'Jennifer Lopez', '6543210987654', '555-5433'),
  (12,'John Smith', '5432109876543', '555-4321'),
  (13,'Sarah Brown', '4321098765432', '555-5679'),
  (14,'Mike Williams', '32109876543098', '555-6756'),
  (15,'John Doe', '12345678901234', '301234567'),
  (16,'Jane Doe', '09876543210987', '300987654'),
  (17,'Robert Smith', '76543210987654', '307654321'),
  (18,'Sarah Johnson', '43210987654321', '304321098'),
  (19,'Mike Jones', '65432109876543', '30654321'),
  (20,'Emily Brown', '32109876543210', '30321098'),
  (21,'Samantha Lee', '98765432109876', '3098765432'),
  (22,'David Wang', '210987654321098', '302109876'),
  (23,'Rachel Green', '876543210987654', '308765432'),
  (24,'Mark Johnson', '76543210987676', '307654321');
