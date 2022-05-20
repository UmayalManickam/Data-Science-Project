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
select * from language ; 
select * from  actor; 
select * from film_actor; 
select * from  inventory; 
select * from  film_text; 

-- TASK 1
select name,  title ,rental_rate, replacement_cost from film inner join film_category on film.film_id=film_category.film_id inner join category on film_category.category_id=category.category_id group by category.name order by rental_rate desc, replacement_cost desc;

-- TASK 2
select  actor_id ,concat(first_name,'  ',last_name) as full_name  from actor where actor_id in (select actor_id from film_actor where film_id  in(select film_id from film group by replacement_cost order by replacement_cost desc));

-- TASK 3
select film.film_id, sum(amount) from film inner join staff on film.film_id= staff.store_id inner join payment p on p.staff_id = staff.staff_id group by film.film_id order by sum(amount);

-- TASK 4
select flm.title, count(*) number_in_inventory from film flm inner join inventory inv on flm.film_id= inv.film_id where lower(flm.title)=lower('BROTHERHOOD BLANKET') group by flm.title;
select flm.title, count(*) number_in_inventory from film flm inner join inventory inv on flm.film_id= inv.film_id where lower(flm.title)=lower('SOUP WISDOM') group by flm.title;

-- TASK 5
 select cat.name category_name, sum(IFNULL(pay.amount, 0)) revenue from category cat left join film_category flm_cat on cat.category_id = flm_cat.category_id left join film fil on flm_cat.film_id = fil.film_id left join inventory inv on fil.film_id = inv.film_id left join rental ren on inv.inventory_id = ren.inventory_id left join payment pay on ren.rental_id = pay.rental_id;

-- TASK 6
select sum(p.amount) as revenue, f.title as cultural_movie from payment p inner join rental r on p.rental_id=r.rental_id inner join inventory i on i.inventory_id=r.inventory_id inner join film f on f.film_id=i.film_id where f.description like '%sumo%' or f.description like '%wrestler%' group by f.title order by revenue desc limit 5; 
select sum(p.amount) as revenue, f.title as cultural_movie from payment p inner join rental r on p.rental_id=r.rental_id inner join inventory i on i.inventory_id=r.inventory_id inner join film f on f.film_id=i.film_id where f.description like '%Ancient%' or f.description like '%china%' group by f.title order by revenue desc limit 5;

-- TASK 7
select * from country;
select * from country where country_id=44 and 103;

