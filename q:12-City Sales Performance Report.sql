-- Q12 — City Sales Performance Report
-- [Medium+]
--
-- Question:
-- For each city, calculate total orders, total sales,
-- and average order amount.
--
-- Consider Completed orders during August 2026.
--
-- Classify cities:
-- Excellent          → Total Sales >= ₹50,000
-- Good               → Total Sales >= ₹30,000 and < ₹50,000
-- Needs Improvement  → Otherwise
--
-- Include only cities with at least 2 orders
-- and total sales >= ₹30,000.
--
-- Sort: Excellent → Good → Needs Improvement,
-- then total sales descending.

SELECT city,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_sales,
       ROUND(AVG(order_amount), 2) AS average_order_amount,
       CASE
           WHEN SUM(order_amount) >= 50000 THEN 'excellent'
           WHEN SUM(order_amount) >= 30000
                AND SUM(order_amount) < 50000 THEN 'Good'
           ELSE 'Needs improvement'
       END AS sales_performance_category
FROM customer_orders
WHERE order_status = 'Completed'
  AND order_date BETWEEN '2026-08-01' AND '2026-08-31'
GROUP BY city
HAVING COUNT(order_id) >= 2
   AND SUM(order_amount) >= 30000
ORDER BY
    CASE
        WHEN SUM(order_amount) >= 50000 THEN 1
        WHEN SUM(order_amount) >= 30000
             AND SUM(order_amount) < 50000 THEN 2
        ELSE 3
    END ASC,
    total_sales DESC;
