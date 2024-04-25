-- total, average, maximum spending of custumoers
WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spending,
        AVG(p.amount) AS avg_spending,
        MAX(p.amount) AS max_spending
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
)

SELECT
    customer_id,
    first_name,
    last_name,
    total_spending,
    avg_spending,
    max_spending,
    NTILE(4) OVER (ORDER BY total_spending DESC) AS spending_category
FROM CustomerSpending;