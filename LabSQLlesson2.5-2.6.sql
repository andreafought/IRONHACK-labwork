#2.5
#1
select * from actor
where first_name = 'Scarlett';
#2
select count(*) from film   
#3
select min(rental_duration) as max_duration, max(rental_duration) as min_duration from film;
#4
select CONVERT(CHAR(5),GETDATE(avg(length)),108) from film;
#5
select distinct last_name from actor;
#6
select datediff(max(rental_date),min(rental_date)) from rental;
#8
select *, case when date_format(rental_date, '%W') in ('Saturday', 'Sunday')
          then 'weekend'
          else 'workday' end as day_type
from rental;

#9
select count(rental_id) from rental
where rental_date like '2006-02-%';
#2.6
#1
select distinct release_year from film;
#2
select title from film
where title like 'ARMAGEDDON%';
#3
select title from film
where title like '%APOLLO'
#4
SELECT title FROM film
ORDER BY length DESC
LIMIT 10;

#5
select count(*) from film
where special_features like '%Behind the Scenes%';

#6
ALTER TABLE staff
DROP COLUMN picture;
#7
INSERT INTO staff (first_name, last_name)
VALUES ('Tammy', 'Sanders');
#8
insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 1, select customer id from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER', select staff_id from staff
where first_name = 'Mike');
#9
