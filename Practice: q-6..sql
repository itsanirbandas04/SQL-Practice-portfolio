-- Q6 — Medium+
-- City-wise Completed Order Performance

-- Question:
-- For each city, calculate:
-- 1. Total number of completed orders
-- 2. Total completed sales
-- 3. Average completed order value
-- 4. Number of high-value orders where order_amount >= ₹20,000
--
-- Consider only Completed orders.
--
-- Display only cities where total completed sales are at least ₹20,000.
--
-- Sort by total completed sales in descending order.


SELECT
    city,
    COUNT(order_status) AS total_completed_orders,
    SUM(order_amount) AS total_completed_sales,
    ROUND(AVG(order_amount), 2) AS average_completed_order_value,
    COUNT(CASE
        WHEN order_amount >= 20000 THEN 1
    END) AS high_value_orders
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY city
HAVING SUM(order_amount) >= 20000
ORDER BY total_completed_sales DESC;
