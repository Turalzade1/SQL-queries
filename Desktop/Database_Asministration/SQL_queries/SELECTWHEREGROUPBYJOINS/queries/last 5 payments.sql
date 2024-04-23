-- last 5 payments which customers paid
SELECT c.first_name, c.last_name, p.payment_date, p.amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY p.payment_date DESC
LIMIT 5;