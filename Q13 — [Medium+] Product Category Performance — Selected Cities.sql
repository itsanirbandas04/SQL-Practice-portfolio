-- Q13 — Product Category Performance — Selected Cities
-- [Medium+]
--
-- Question:
-- For each product category, calculate total orders,
-- total sales, average order amount, and highest order amount.
--
-- Consider Completed orders during August 2026
-- from Kolkata, Howrah, and Durgapur.
--
-- Include only categories with:
-- Average order amount > ₹12,000
-- Total sales >= ₹35,000
--
-- Sort by total sales descending,
-- then average order amount descending.

SELECT product_category,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_sales,
       ROUND(AVG(order_amount), 2) AS average_order_amount,
       MAX(order_amount) AS high_amount
FROM customer_orders
WHERE order_status = 'Completed'
  AND order_date BETWEEN '2026-08-01' AND '2026-08-31'
  AND city IN ('Kolkata', 'Howrah', 'Durgapur')
GROUP BY product_category
HAVING AVG(order_amount) > 12000
   AND SUM(order_amount) >= 35000
ORDER BY total_sales DESC,
         average_order_amount DESC;
