#LAB GROUB BY - ANDREA FOUGHT

#1
select distinct last_name from actor
group by last_name
having count(last_name) = 1;

#2
select distinct last_name from actor
group by last_name
having count(last_name) <> 1;

#3
select first_name, count(*) from rental a
inner join staff b
on a.staff_id = b.staff_id
group by first_name;


#4

select release_year, count(film_id) as number_films from film
group by release_year;

#5

select rating, count(film_id) as Number_of_films from film
group by rating;

#6

select rating, round(AVG(length),2) as avg_length from film
group by rating;


#7

select rating, round(AVG(length),2) as avg_length from film
group by rating
having length > 120;

