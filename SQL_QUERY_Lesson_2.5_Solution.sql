-- 1. Select all the actors with the first name ‘Scarlett’.
USE sakila;

select * from sakila.actor;

select * from sakila.actor 
where first_name = 'Scarlett';

select * from sakila.actor 
where first_name like 'Scarlett';

-- 2.How many films (movies) are available for rent and how many films have been rented?

select * from sakila.inventory;
select * from rental;
SELECT COUNT( inventory_id ) as 'no_of_rented'
FROM rental
WHERE return_date is null;
select * from film;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select min(length) as shortest_movie_duration, max(length) as longest_movie_duration from film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

select avg(length) from sakila.film;  -- for reference
select date_format((length),time) '%I') as average_movie_duration  from sakila.film;
select substr(length, 1, 2) as '%I-%i'  from sakila.film ;

-- 5. How many distinct (different) actors' last names are there?
select count(distinct(last_name)) as 'different_names' from sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select * from rental;

 select rental_id, rental_date, substr(rental_date, 6, 2) as month, substr(rental_date, 9, 2) as weekday from sakila.rental 
 limit 20;
 
 -- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select rental_id, rental_date, substr(rental_date, 9, 2) as day_type from sakila.rental, 
case when dayofweek(dttime) in (1,7) then 'Weekend' else 'Weekday' ;
/*CASE
WHEN day_type in (1, 2, 3, 4, 5)  then 'weekday'
WHEN day_type in (8, 9, 10, 11, 12)then 'weekday'
WHEN day_type in (15, 16, 17, 18, 19) then 'weekday'
WHEN day_type in ( then 'In Debt - contract ongoing'
ELSE 'No status'
END AS 'Status Description',status AS 'previous status'
FROM sakila.rental;*/

select rental_id, rental_date, date_format(CONVERT(left(rental_date,10),date), '%d-%m-%Y') as day_type  from sakila.rental
where(case when dayofweek(dttime) in (1,7) then 'Weekend') else 'Weekday' ;

-- Get release years.
select release_year  from sakila.film;

-- Get all films with ARMAGEDDON in the title.
select *  from sakila.film;
select *  from sakila.film where title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
select *  from sakila.film where title like '%APOLLO';
  
-- Get 10 the longest films. 
SELECT * FROM sakila.film 
ORDER BY length desc LIMIT 10;
 
-- How many films include Behind the Scenes content

SELECT film_id, title, special_features FROM sakila.film where special_features like 'Behind the Scenes';




