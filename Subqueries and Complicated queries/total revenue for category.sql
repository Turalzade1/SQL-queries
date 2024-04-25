-- total revenue and percentage for category
SELECT 
    c.category_id,
    c.name AS category_name,
    SUM(p.amount) AS total_revenue,
    ROUND((SUM(p.amount) / SUM(SUM(p.amount)) OVER ()) * 100, 2) AS revenue_percentage
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    c.category_id, c.name
ORDER BY 
    total_revenue DESC;