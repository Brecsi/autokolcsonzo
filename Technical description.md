### SQL Database description:

## Table descriptions: 

# cars table: 

Contains informations about cars: 

car Id,
 car Licenseplate number (3 letters, 3 numbers),
  car type,
   year manufactured,
    color

# loaners table:
Contains informations about people in database:

loaner id, 
 loaner name, 
  loaner license number (15 characters),
   loaner phone number (hungarian phone number, 11 characters)

# loan table: 
Contains informations about loans in database:

id: id of loan
loanId: loaner's id from 'loaners' table
carId: car's id from 'cars' table,
loanStart: start of loan given in DATE format,
numberOfDays: number of days the car has been loaned. (if value is NULL -> car is still loaned out),
dailyRate: decimal, daily charge rate for loaned car