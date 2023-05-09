

select * from cars; 
select * from loaners;
select * from loans;
select * from users;


delete from users;
delete from loaners where id = 0;
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


#lekérdezések
#get users
  select id, firstName, lastName, gender, userName, email, number from users;


#get carsRentalState
  select DISTINCT c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate, IF  (l.numberOfDays is null, 'Not available', 'Available') as numberOfDays from cars c 
  left join loans l on c.id = l.carId
  order by c.id;

#még nem bérelt autók
  select DISTINCT c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate, IF  (l.numberOfDays is null, 'Not available', 'Available') as numberOfDays from cars c 
  left join loans l on c.id = l.carId
    where l.id is null
  order by c.id;

#bérelt és nincs vissza hozva
select DISTINCT  c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate, IF  (l.numberOfDays is null, 'Not available', 'Available') as numberOfDays from cars c 
  inner join loans l on c.id = l.carId
    where l.numberOfDays is null
  order by c.id;

#bérelt és vissza hozva
select DISTINCT l.id as rentId, c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate, IF  (l.numberOfDays is null, 'Not available', 'Available') as numberOfDays from cars c 
  inner join loans l on c.id = l.carId
    where l.numberOfDays is not null
  order by c.id;


#Kimutatja, hogy mely autók állnak rendelkezésre, és melyek nem
#get carsAvailability
#---------------------------------------------


  select DISTINCT c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate,  'Available' as Available from cars c 
  left join loans l on c.id = l.carId
    where l.id is null
  union
select DISTINCT  c.id as carId, c.license, c.type, c.year, c.color, c.dailyRate, 'Not available' as Available from cars c 
  inner join loans l on c.id = l.carId
    where l.numberOfDays is null
  union
select *, 'Avaliable' as Available from cars 
  where id not in (
  select DISTINCT c.id as carId from cars c 
  left join loans l on c.id = l.carId
    where l.id is null
  union
select DISTINCT  c.id as carId from cars c 
  inner join loans l on c.id = l.carId
    where l.numberOfDays is null);
#-----------------------------------------
