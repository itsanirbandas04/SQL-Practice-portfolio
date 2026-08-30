-- Q3 — Medium
-- Product Category Sales Analysis

-- Question:
-- For each product_category, calculate:
-- 1. Total number of orders
-- 2. Total sales
-- 3. Average order value
--
-- Consider only Completed orders.
--
-- Display only those product categories where
-- total sales are at least ₹20,000.
--
-- Sort the results by total sales in descending order.


SELECT
    product_category,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_sales,
    ROUND(AVG(order_amount), 2) AS average_order_value
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY product_category
HAVING SUM(order_amount) >= 20000
ORDER BY total_sales DESC;
