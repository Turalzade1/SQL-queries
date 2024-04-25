--Average rental duration for category
SELECT
    category_id,
    name AS category_name,
    (SELECT title 
     FROM film 
     WHERE film_id = (
         SELECT film_id 
         FROM film_category 
         WHERE film_category.category_id = category.category_id
         ORDER BY rental_duration 
         LIMIT 1
     )
    ) AS least_rented_movie,
    (SELECT AVG(rental_duration) 
     FROM film 
     WHERE film_id IN (
         SELECT film_id 
         FROM film_category 
         WHERE film_category.category_id = category.category_id
     )
    ) AS avg_rental_duration
FROM category
ORDER BY avg_rental_duration;