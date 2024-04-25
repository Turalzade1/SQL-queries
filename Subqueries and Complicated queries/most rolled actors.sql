-- actors who rolled in the most films
SELECT 
    actor_id,
    first_name,
    last_name,
    (SELECT COUNT(*) 
     FROM film_actor 
     WHERE film_actor.actor_id = actor.actor_id
    ) AS total_movies,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS actor_rank
FROM actor
GROUP BY actor_id
ORDER BY total_movies DESC;