-- Q8 — City Sales Performance Classification
-- [Medium+]
--
-- Question:
-- For each city, calculate total orders, total sales,
-- average order amount, and high-value orders (>= ₹20,000).
-- Consider Completed orders only.
--
-- Classify cities:
-- Top Performer   → Total Sales >= ₹50,000
-- Good Performer  → Total Sales >= ₹30,000 and < ₹50,000
-- Low Performer   → Total Sales < ₹30,000
--
-- Include only cities with at least 2 orders
-- and total sales >= ₹30,000.
--
-- Sort: Top → Good → Low, then total sales descending.

SELECT city,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_sales,
       ROUND(AVG(order_amount), 2) AS average_order_value,
       COUNT(CASE WHEN order_amount >= 20000 THEN 1 END) AS high_value_orders,
       CASE
           WHEN SUM(order_amount) >= 50000 THEN 'Top Performer'
           WHEN SUM(order_amount) >= 30000
                AND SUM(order_amount) < 50000 THEN 'Good Performer'
           WHEN SUM(order_amount) < 30000 THEN 'Low Performer'
       END AS sales_category
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY city
HAVING COUNT(order_status) >= 2
   AND SUM(order_amount) >= 30000
ORDER BY
    CASE
        WHEN SUM(order_amount) >= 50000 THEN 1
        WHEN SUM(order_amount) >= 30000
             AND SUM(order_amount) < 50000 THEN 2
        ELSE 3
    END ASC,
    total_sales DESC;
