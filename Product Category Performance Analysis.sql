-- Q7 — Medium+
-- Product Category Performance Analysis

-- Question:
-- For each product_category, calculate:
-- 1. Total number of orders
-- 2. Total sales
-- 3. Average order value
-- 4. Number of high-value orders where order_amount >= ₹20,000
--
-- Consider only Completed orders.
--
-- Display only categories where:
-- 1. Total sales >= ₹30,000
-- 2. Total orders >= 2
-- 3. Average order amount >= ₹15,000
--
-- Sort first by average order value descending
-- and then by total sales descending.


SELECT
    product_category,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_sales,
    ROUND(AVG(order_amount), 2) AS average_order_value,
    COUNT(
        CASE
            WHEN order_amount >= 20000 THEN 1
        END
    ) AS high_value_orders
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY product_category
HAVING SUM(order_amount) >= 30000
   AND COUNT(order_id) >= 2
   AND AVG(order_amount) >= 15000
ORDER BY average_order_value DESC,
         total_sales DESC;
