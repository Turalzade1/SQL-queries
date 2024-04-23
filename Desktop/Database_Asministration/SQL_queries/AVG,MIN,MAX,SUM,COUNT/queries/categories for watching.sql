-- Finding average rental duration of every watched film categories(over 5)
SELECT c.name AS category, ROUND(AVG(f.rental_duration), 2) AS avg_rental_duration
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING AVG(f.rental_duration) > 5;