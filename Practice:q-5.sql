-- Q5 — Medium+
-- Order Priority Classification

-- Question:
-- Retrieve the order_id, customer_name, city, product_category,
-- order_amount, order_status, and order_date for orders from
-- Kolkata, Howrah, or Durgapur between August 1 and August 15, 2026.
--
-- Treat any NULL order_status as "unknown".
--
-- Create an order_priority column:
-- Completed order with amount >= ₹20,000 → High Priority
-- Completed order with amount between ₹10,000 and below ₹20,000
-- → Medium Priority
-- All other orders → Normal Priority
--
-- Sort by priority:
-- High → Medium → Normal
-- and within each priority by order amount descending.


SELECT
    order_id,
    customer_name,
    city,
    product_category,
    order_amount,
    COALESCE(order_status, 'unknown') AS order_status,
    order_date,
    CASE
        WHEN order_amount >= 20000
             AND COALESCE(order_status, 'unknown') = 'Completed'
            THEN 'High Priority'
        WHEN order_amount >= 10000
             AND order_amount < 20000
             AND COALESCE(order_status, 'unknown') = 'Completed'
            THEN 'Medium Priority'
        ELSE 'Normal Priority'
    END AS order_priority
FROM customer_orders
WHERE city IN ('Kolkata', 'Howrah', 'Durgapur')
  AND order_date BETWEEN '2026-08-01' AND '2026-08-15'
ORDER BY
    CASE
        WHEN order_amount >= 20000
             AND COALESCE(order_status, 'unknown') = 'Completed'
            THEN 1
        WHEN order_amount >= 10000
             AND order_amount < 20000
             AND COALESCE(order_status, 'unknown') = 'Completed'
            THEN 2
        ELSE 3
    END ASC,
    order_amount DESC;
