-- how many films do have in each category?
SELECT c.name AS category, COUNT(f.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY film_count DESC;