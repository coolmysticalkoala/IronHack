# Query 1
SELECT 
    film.title, COUNT(inventory_id) AS copies_number
FROM
    inventory
        INNER JOIN
    film ON inventory.film_id = film.film_id
WHERE
    film.title = 'Hunchback Impossible';

# Query 2
SELECT 
    film.title, 
    release_year,
    length
FROM
    film
WHERE
    film.length > (SELECT 
            AVG(length)
        FROM
            film)
ORDER BY length DESC;

# Query 3
SELECT 
   actor.last_name,
    actor.first_name
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id IN (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'Alone Trip'))
                    ORDER BY last_name DESC;

# Query 4
SELECT 
    title, category
FROM
    film_list
WHERE
    category = 'family';

# Query 5
SELECT 
    last_name, first_name, email
FROM
    country
        LEFT JOIN
    customer ON country.country_id = customer.customer_id
WHERE
    country = 'Canada';
    
# Query 6 

SELECT 
    film.title
FROM
    film
    INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
WHERE
    film_actor.actor_id IN 
    (SELECT 
            actor.last_name,
                actor.first_name,
                COUNT(actor.actor_id) AS featured_films
        FROM
            film
                INNER JOIN
            film_actor ON film.film_id = film_actor.film_id
                INNER JOIN
            actor ON film_actor.actor_id = actor.actor_id
        GROUP BY actor.actor_id
        ORDER BY COUNT(actor.actor_id) DESC
        LIMIT 1);

# Query 7
SELECT 
    film.title
FROM
    rental
WHERE
    customer_id IN (SELECT 
            customer.first_name,
                customer.last_name,
                SUM(amount) AS total
        FROM
            customer
                INNER JOIN
            payment ON customer.customer_id = payment.customer_id
        GROUP BY customer.customer_id
        ORDER BY total DESC
        LIMIT 1);






 




