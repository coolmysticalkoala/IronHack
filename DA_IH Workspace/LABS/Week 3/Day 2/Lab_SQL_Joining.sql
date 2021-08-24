SELECT category.name
FROM category;

# Question 1
SELECT 
    category.name, COUNT(film_category.film_id) AS total_films
FROM
    category
        INNER JOIN
    film_category ON film_category.category_id = category.category_id
GROUP BY category.name;

# Question 2
SELECT 
    actor.first_name,
    actor.last_name,
    COUNT(film_actor.actor_id) AS most_active_actor
FROM
    actor
        INNER JOIN
    film_actor ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(film_actor.actor_id) DESC;

# Question 3
SELECT 
    COUNT(rental.rental_id) AS most_active_customer,
    customer.customer_id,
    customer.first_name,
    customer.last_name
FROM
    customer
        INNER JOIN
    rental ON customer.customer_id = rental.customer_id;
    
# Question 5
SELECT 
    staff.staff_id,
    staff.first_name,
    staff.last_name,
    address,
    district
FROM
    staff
        INNER JOIN
    address ON staff.address_id = address.address_id;
    
# Question 6
SELECT 
    round(SUM(payment.amount)) as total_amount, staff.first_name, staff.last_name
FROM
    staff
        INNER JOIN
    payment ON staff.staff_id = payment.staff_id
WHERE
    payment_date > 2005 - 08 - 01 < 2005 - 08 - 31;

# Question 7
SELECT 
release_year,
film.title,
COUNT(actor.actor_id) AS actors_listed

FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
	INNER JOIN actor
		ON film_actor.actor_id = actor.actor_id
        GROUP BY title
        ORDER BY actors_listed DESC;
        
# Question 8
SELECT 
    ROUND(SUM(payment.amount)) AS total_paid,
    customer.first_name,
    customer.last_name
FROM
    customer
        INNER JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name DESC;

# Bonus
SELECT 
    film.title,
    film.release_year,
    COUNT(rental.rental_id) AS total_rentals
FROM
    film
        INNER JOIN
    inventory ON film.film_id = inventory.film_id
        INNER JOIN
    store ON inventory.store_id = store.store_id
        INNER JOIN
    rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY total_rentals DESC
LIMIT 5;

 
 
 
 
