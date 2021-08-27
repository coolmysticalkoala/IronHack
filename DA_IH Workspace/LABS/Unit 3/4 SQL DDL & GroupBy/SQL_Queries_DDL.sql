USE sakila;

-- Query 1 -- Get release years --

SELECT 
    release_year
FROM
    film;

-- Query 2 -- Get all films with ARMAGEDDON in the title --

SELECT 
    film.title
FROM
    film
WHERE
    film.title LIKE '%ARMAGEDDON%';
    
 -- Query 3 -- Get all films which title ends with APOLLO --
 
SELECT 
    film.title
FROM
    film
WHERE
    film.title LIKE '%APOLLO';
    
-- Query 4 -- Get 10 the longest films -- 

SELECT 
    film.title, film.length
FROM
    film
GROUP BY film_id
ORDER BY film.length DESC
LIMIT 10;       
    
-- Query 5 -- How many films include Behind the Scenes content? --

SELECT 
    count(film.title) AS film_features
FROM
    film
WHERE
    special_features LIKE '%Behind the Scenes%';
        
-- Query 6 -- Drop column picture from staff --

ALTER TABLE staff
DROP COLUMN picture;

-- Query 7 -- 
/*A new person is hired to help Jon. 
Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.*/
 
 #SELECT * FROM customer
 #SELECT * FROM staff
 
INSERT INTO staff 
VALUES (3, 'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilastaff.org', 2 , 1, 'Tammy', null, '2006-02-15 03:57:16');

-- Query 8 -- 
/* Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
 You can use current date for the rental_date column in the rental table. 
 Hint: Check the columns in the table rental and see what information you would need to add there.
 You can query those pieces of information. For eg., you would notice that you need customer_id information as well.*/

INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (null, '2021-08-26 03:57:16', 4, 130, null, 1, '2021-08-26 03:57:16');

/* select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';*/

/*select *
from customer
where last_name = "Hunter";*/

/*select *
from staff
where last_name = 'Hillyer';*/

/*select *
from inventory 
where film_id = 1 AND store_id = 1;/

/*select *
from film
where film.title LIKE "%Academy%";*/

SELECT * 
FROM rental
WHERE rental_date LIKE "%2021%";

-- Query 9 -- 
/*Delete non-active users, but first, 
create a backup table deleted_users to store customer_id, email,
 and the date for the users that would be deleted. Follow these steps:

Check if there are any non-active users
Create a table backup table as suggested
Insert the non active users in the table backup table
Delete the non active users from the table customer*/

CREATE TABLE deleted_users AS SELECT customer_id, email, create_date FROM
    customer
WHERE
    customer.active = '0';
    
SELECT 
    COUNT(*)
FROM
    deleted_users;
    
SELECT 
    COUNT(*)
FROM
    customer;
    
DELETE FROM customer 
WHERE
    customer.active = '0';
   
