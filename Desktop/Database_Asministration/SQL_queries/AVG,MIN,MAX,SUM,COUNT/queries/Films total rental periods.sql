-- Films with a total rental period of 5 to 10 days
SELECT
    f.title,
    SUM(f.rental_duration) AS total_rental_duration
FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
WHERE f.rental_duration BETWEEN 5 AND 10
GROUP BY f.title
ORDER BY total_rental_duration DESC;