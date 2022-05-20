use sakila;
select * from city; 
select * from country;
select * from address;
select * from customer;
select * from staff;
select * from store;
select * from payment;
select * from rental;
select * from film;
select * from film_category;
select * from category;
select * from language; 
select * from  actor; 
select * from film_actor; 
select * from inventory; 
select * from film_text; 

-- TASK 1
select concat(first_name,' ',last_name) as 'List of Actors',last_update from actor;
-- TASK 2.1
select concat(first_name,'  ',last_name) as Actor_Name from actor;
-- TASK 2.2
select First_Name, count(first_name) as COUNT from actor group by first_name;
select Last_Name ,count(last_name) as COUNT from actor group by last_name;
-- TASK 2.3
select count(distinct first_name) as COUNT_1,count(distinct last_name) as COUNT_2 from actor;
select first_name,last_name from actor group by first_name having count(first_name and last_name)=1;
-- TASK 3
select first_name from actor group by first_name having count(first_name)<2;
select first_name from actor group by first_name having count(first_name)>1;
select last_name  from actor group by last_name having count(last_name) <2;
select last_name  from actor group by last_name having count(last_name) >1;
-- TASK 4
select * from film;
-- TASK 5
select rating, count(rating) from film  group by  rating ;
select * from film where rating= 'R';
select * from film where rating != 'R';
select * from film where rating= 'G';
select * from film where rating = 'PG';
-- TASK 6.A
select title as MOVIE_NAME from film where replacement_cost<=9;
-- TASK 6.B
select title as MOVIE_NAME from film where replacement_cost between 15 and 20;
-- TASK 6.C
select title, max(replacement_cost), min(rental_rate) from film;
-- TASK 7
select title as 'Movie Name',count(actor_id) as 'Number of Actors' from film_actor inner join film on film_actor.film_id= film.film_id group by title;
-- TASK 8
select title from film where title like 'K%' or title like'Q%';
-- TASK 9
select concat(first_name,' ',last_name) as 'Actor Name' from actor where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title='Agent Truman'));
-- TASK 10
select Title as 'Movie Name',Description from film where film_id in (select film_id from film_category where category_id in(select category_id from category where name ='family'));
-- TASK 11
select * from inventory;
select title as 'Movie Name',count(rental_id) as 'Times Rented' from rental join inventory on  rental.inventory_id =inventory.inventory_id join film on inventory.film_id = film.film_id group by title order by count(rental_id) desc;
-- TASK 12
select name as 'Category Name',avg(rental_rate) as 'Avg Rental Price',avg(replacement_cost) as 'Avg Replacement Cost',(avg(replacement_cost) - avg(rental_rate)) as Difference from film_category inner join  film USING (film_id) inner join category using (category_id) group by category_id having difference > 15 ;
-- TASK 13
select name as Film_Name,count(film_id) as No_of_film from film_category inner join category on film_category.category_id= category.category_id  having no_of_film between 60 and 70 order by no_of_film;

