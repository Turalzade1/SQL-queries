-- the most cities which payment of amount to per customer
SELECT
    ci.city,
    AVG(p.amount) AS avg_payment_per_customer
FROM city ci
    JOIN address a ON ci.city_id = a.city_id
    JOIN customer c ON a.address_id = c.address_id
    JOIN payment p ON c.customer_id = p.customer_id
GROUP BY ci.city
ORDER BY avg_payment_per_customer DESC
LIMIT 10;