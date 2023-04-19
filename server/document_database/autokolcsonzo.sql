

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