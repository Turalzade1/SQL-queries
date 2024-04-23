-- the actors which rolled greater 10 hours
SELECT 
    a.first_name, 
    a.last_name, 
    SUM(f.length) AS total_length
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
GROUP BY 
    a.first_name, a.last_name
HAVING 
    SUM(f.length) > 600
ORDER BY 
    total_length DESC; -- (10 * 60)
