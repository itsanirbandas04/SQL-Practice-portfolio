-- Q11 — Category Sales Analysis by Selected Cities
-- [Medium]
--
-- Question:
-- For each product category, calculate total orders,
-- total sales, and average order amount.
--
-- Consider Completed orders from August 1–20, 2026
-- from Kolkata, Howrah, and Durgapur.
--
-- Include only categories with average order amount >= ₹15,000.
--
-- Sort by average order amount descending.

SELECT product_category,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_sales,
       ROUND(AVG(order_amount), 2) AS average_order_amount
FROM customer_orders
WHERE order_status = 'Completed'
  AND order_date BETWEEN '2026-08-01' AND '2026-08-20'
  AND city IN ('Kolkata', 'Howrah', 'Durgapur')
GROUP BY product_category
HAVING AVG(order_amount) >= 15000
ORDER BY average_order_amount DESC;
