-- Actors and last film which they rolled
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    last_movie.title AS last_movie
FROM 
    actor a
INNER JOIN LATERAL (
    SELECT 
        f.title
    FROM 
        film_actor fa
    JOIN 
        film f ON fa.film_id = f.film_id
    WHERE 
        fa.actor_id = a.actor_id
    ORDER BY 
        f.release_year DESC
    LIMIT 1
) AS last_movie ON true;