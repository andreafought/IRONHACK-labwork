# LAB -- Queries -- Andrea Fought
#1
select title,length, 
rank() over (partition by length order by title) as 'rank'
from film
where length is not null and title is not null;

#2
select title, length, rating, 
rank() over(partition by length order by rating) as 'rank'
from film
where length is not null and title is not null;

#3
select a.name, b from category a
join film_category b
on a.category_id = b.category_id
join film c
on b.film_id = c.film_id
group by name;

#4
select a.first_name, a.last_name, rank() over (partition by c.film_id order by a.first_name ASC) as 'rank' from actor a
join film_actor b
on a.actor_id = b.actor_id
join film c
on b.film_id = c.film_id
limit 1;

#5
select a.first_name, a.last_name, rank() over (partition by b.rental_id order by a.first_name) as 'rank' from customer a
join rental b
on a.customer_id = b.customer_id
limit 1;
