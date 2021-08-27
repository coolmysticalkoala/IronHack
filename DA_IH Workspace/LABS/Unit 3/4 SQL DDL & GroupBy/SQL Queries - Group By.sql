# Query 1
SELECT 
    actor.last_name, COUNT(actor.last_name) AS appeared_times
FROM
    actor
GROUP BY actor.last_name
HAVING appeared_times = 1
ORDER BY last_name ASC;

# Query 2
SELECT 
    actor.last_name, COUNT(actor.last_name) AS appeared_times
FROM
    actor
GROUP BY actor.last_name
HAVING appeared_times > 1
ORDER BY last_name ASC;

# Query 3
SELECT 
    staff.last_name, staff.first_name, COUNT(rental.rental_id) AS total_rentals
FROM
    rental
        JOIN
    staff ON rental.staff_id = staff.staff_id
GROUP BY staff.last_name
ORDER BY total_rentals DESC;

# Query 4
SELECT 
    COUNT(film.film_id) as films_released, release_year
FROM
    film
GROUP BY release_year;
    
# Query 5
SELECT 
    film.rating, COUNT(film.film_id) AS total_films_rated
FROM
    film
GROUP BY film.rating
ORDER BY total_films_rated DESC;

# Query 6
SELECT 
    film.rating, ROUND(AVG(film.length),2) AS avg_duration
FROM
    film
GROUP BY film.rating
ORDER BY avg_duration DESC;

# Query 7
SELECT 
    film.rating, ROUND(AVG(film.length),2) AS avg_film_length
FROM
    film
GROUP BY film.rating
HAVING avg_film_length > 120;

