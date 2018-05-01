use sakila
select first_name, last_name
from actor;

select UPPER(first_name, last_name) as actor_name
from actor;

select actor_ID, first_name, last_name
from actor
where first_name= 'Joe';

select actor_ID, first_name, last_name 
from actor
where last_name LIKE 'gen';

select actor_ID, first_name, last_name 
from actor
where last_name LIKE  'gen'
order by last_name, first_name;

select country_id, country
from country
where country IN ( 'Afghanistan',  'Bangladesh', 'China')
order by country;

alter table actor
add column middle_name VARCHAR(45)
after first_name;

alter table actor
modify column middle_name BLOB;

alter table actor
drop column middle_name;

select last_name, count(last_name) as ‘count_number’
from actor
group by last_name;

select last_name, count(last_name) as ‘count_number’
from actor
group by last_name
having count(last_name) >1;

update actor
set first_name = 'HARPO'
where first_name= 'GROUCHO';

select s.first_name, s.last_name, a.address
from staff as s
inner join address as a
on s.address_id = a.address_id;

select s.staff_id, sum(p.amount)
from payment as p
inner join staff as s
on p.staff_id = s.staff_id
where p.payment_date= '200508' LIKE ('200508')
group by p.staff_id;


select f.title, count(fa.actor_id) as number_of_actors
from film as f
inner join film_actor as fa
on f.film_id=fa.file_id
group by fa. actor_id;

select count(i.film_id) as number_of_copies
from inventory as i
inner join film as f
on i.film_id=f.film_id
group by i.film_id
having f.title= 'Hunchback Impossible';


select title
from film
where title LIKE 'K' or LIKE 'Q'
and  language_id IN (select language_id  from language where name= 'English');


select actor_id, first_name, last_name
from actor 
where actor_id IN 
    (select actor_id from film_actor where film_id IN
               ( select film_id from film where title= ‘Alone Trip’)
);
select first_name, last_name, email
from customer 
where address_id IN (select address_id from address where city_id IN
( select city_id from city where country_id IN
     （ select country_id in country where country = ‘ Canada’ ）) );
