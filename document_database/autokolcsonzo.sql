select * from cars;
select * from loaning;
select * from renters;
select * from users;


-- 2003 ut�n gy�rtott aut�k n�vekv� sorrendben
  select * from cars
    where year >= 2003
    order by year;

-- 2023 ut�n b�rl�k neve
  select renters.name, loanStart from loaning 
    inner join renters on renters.id = renterId
  where YEAR(loanStart) > 2022;

-- 70-es telefonsz�mmal rendelkez� b�rl�k
  select name, phone from renters
  where phone LIKE '%70%';


 # get http://localhost:3000/renters

select * from renters;