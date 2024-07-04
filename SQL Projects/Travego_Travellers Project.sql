create database Travego;
use Travego;
create table Passenger (	
	Passenger_Id int,
    Passenger_name varchar(20),
    Category varchar(20),
    Gender varchar(20),
    Boarding_city varchar(20),
    Destination_city varchar(20),
    Distance int,
    Bus_type varchar(20)
    );
    
    create table Price (
	Id int,
	Bus_type varchar(20),
    Distance int,
    Price int
    );
    
    insert into Passenger values (1, 'Sejal', 'AC' ,'F', 'Bengaluru' , 'Chennai', 350, 'Sleeper'),
							  (2, 'Anmol', 'Non-AC', 'M', 'Mumbai' , 'Hyderabad', 700, 'Sitting'),
                              (3, 'Pallavi', 'AC' ,'F', 'Panaji' , 'Bengaluru', 600, 'Sleeper'),
                              (4, 'Khusboo', 'AC', 'F', 'Chennai' , 'Mumbai', 1500, 'Sleeper'),
                              (5, 'Udit', 'Non-AC', 'M', 'Trivandrum' , 'Panaji', 1000, 'Sleeper'),
                              (6, 'Ankur', 'AC', 'M', 'Nagpur' , 'Hyderabad', 500, 'Sitting'),
                              (7, 'Hemant', 'Non-AC', 'M', 'Panaji' , 'Mumbai', 700, 'Sleeper'),
                              (8, 'Manish', 'Non-AC', 'M', 'Hyderabad' , 'Bengaluru', 500, 'Sitting'),
                              (9, 'Piyush', 'AC', 'M', 'Pune' , 'Nagpur', 700, 'Sitting');
                              
insert into price values (1,'Sleeper', 350,770),
                         (2,'Sleeper', 500,1100),
                         (3,'Sleeper', 600,1320),
                         (4,'Sleeper', 700,1540),
                         (5,'Sleeper', 1000,2200),
                         (6,'Sleeper', 1200,2640),
                         (7,'Sleeper', 1500,2700),
                         (8,'Sitting', 500,620),
                         (9,'Sitting', 600,744),
                         (10,'Sitting', 700, 868),
                         (11,'Sitting', 1000,1240),
                         (12,'Sitting', 1200,1488),
                         (13,'Sitting', 1500,1860);
                         
show tables;
select * from Passenger;
select *from price;

-- Qa. How many female passengers traveled a minimum distance of 600 KMs?
Select  gender, count(*) as Female_Passengers
From Passenger
Where Gender = 'F' and Distance >= 600;

-- Qb. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus?

Select *From Passenger
Where Distance > 500 and Bus_type = 'sleeper';

-- Qc. Select passenger names whose names start with the character 'S'?
select * from Passenger
where Passenger_name  like 'S%';

/* Qd. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
	Destination City, Bus type, and Price in the output.*/
    
select p.passenger_name, p.boarding_city, p.destination_city, p.bus_type, pr.price
from Passenger p
join Price pr on p.passenger_id = pr.id;

-- Qe. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select P.Passenger_name , Pr.Price
from Passenger P
join  Price Pr on P.Bus_type = Pr.Bus_type and P.Distance = Pr.Distance 
where P.Distance= 1000 and P.Bus_type = 'Sitting';

-- Qf. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
    -- or
select P.Passenger_name, P.Bus_type, Pr.Price
from Passenger P
join Price Pr on P.Bus_type = Pr.Bus_type and P.Distance = Pr.Distance
where P.Passenger_name = 'Pallavi';
-- or-- 
select bus_type,price 
from price
where distance=(select distance from passenger where passenger_name='Pallavi');
    
-- Qg. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper?
update Passenger
set Category = 'Non-AC'
where Bus_type = 'Sleeper';
select * from passenger;

-- Qh. Delete an entry from the table where the passenger name is Piyush and commit this change in the database?
delete from Passenger
where Passenger_name = 'Piyush';
commit;

-- Qi. Truncate the table passenger and comment on the number of rows in the table (explain if required)?

Truncate table passenger;

select count(*) as num_rows
from Passenger;

-- Qj. Delete the table passenger from the database?
drop table Passenger;
