-- Q10 — City-wise Completed Sales Summary
-- [Medium]
--
-- Question:
-- For each city, calculate total orders, total sales,
-- and highest order amount.
--
-- Consider Completed orders only.
--
-- Include only cities with at least 2 completed orders
-- and total sales > ₹35,000.
--
-- Sort by total sales descending.

SELECT city,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_sales,
       MAX(order_amount) AS high_amount
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY city
HAVING COUNT(order_id) >= 2
   AND SUM(order_amount) > 35000
ORDER BY total_sales DESC;
