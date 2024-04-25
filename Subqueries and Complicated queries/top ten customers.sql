-- 10 custoemrs who paid the most
SELECT 
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount_spent
FROM customer
JOIN (
    SELECT 
        customer_id,
        SUM(amount) AS amount_spent
    FROM payment
    GROUP BY customer_id
    ORDER BY amount_spent DESC
    LIMIT 10
) AS top_customers ON customer.customer_id = top_customers.customer_id
ORDER BY amount_spent DESC;