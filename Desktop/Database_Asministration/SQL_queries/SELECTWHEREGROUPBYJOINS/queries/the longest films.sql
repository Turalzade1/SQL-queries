-- Finding the longest rented films(10)
SELECT f.title, f.rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY f.rental_duration DESC
LIMIT 10;