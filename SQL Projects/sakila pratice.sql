use sakila;
select * from actor;
select * from category;
select * from film;
select * from film_category;
select * from customer;
select * from staff;
-- 1
select sum(count) from (select count(*) as count from actor group by last_name having count(*)>1)as s; 
select last_name,count(*) as count from actor group by last_name having count(*)>1;

-- 2 what is the most common last name
select last_name ,count(*) as count from actor group by last_name order by count desc limit 1;

-- 3 how many actor dont share the last name 
select sum(count) from(select count(*) as count from actor group by last_name having count(*)=1)as a;
select last_name ,count(*) as count from actor group by last_name having count(*)=1;

-- 4 how many last name in db
select count(last_name) from actor;-- with repatation of last_name
select count(distinct last_name)from actor;-- without repatation of last_name
select count( distinct last_name)from customer;
select count( distinct last_name)from staff;

-- 5 list the actor name who share the last name (comma seperated values)
select last_name ,group_concat(first_name separator',') from actor group by last_name having count(first_name)>1;
select first_name ,group_concat(last_name separator',') from actor group by first_name having count(last_name)>1;

-- 6 what is the average running time for all the files
select avg(length) from film;

-- 7 what is the average running time for each category
select name,  avg(length)from film,category group by name ;
select category_id ,avg(f .length) from film f join film_category fc on f.film_id=fc.film_id group by category_id;


-- 8 which actor has done maximum films 
select first_name ,last_name,actor_id from actor where actor_id=(select actor_id from film_actor group by actor_id order by count(film_id)desc limit 1);
select actor_id,count(film_id) from film_actor group by actor_id order by count(film_id)desc limit 1;

-- 9 which film has hired most actors
select title from (select film_id,count(distinct actor_id)as actor_count from film_actor group by film_id order by actor_count  desc limit 1)as s,film where s.film_id=film.film_id;
select film_id,count(distinct actor_id)as actor_count from film_actor group by film_id order by actor_count  desc limit 1;
select film_id,title from film where film_id=508;

-- how many payment meet this criteria year=2005 ,payment=5 or above 5
select * from payment where year(payment_date)=2005 and amount>=5;
select count(payment_id) from payment where year(payment_date)=2005 and amount>=5;
