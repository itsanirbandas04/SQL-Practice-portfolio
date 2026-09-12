-- Q9 — Product Category Net Sales Analysis
-- [Hard]
--
-- Question:
-- For each product category, calculate total orders,
-- gross sales, total discount amount, net sales,
-- and average net order value.
--
-- Consider Completed orders only.
--
-- Include only categories with at least 2 orders
-- and total net sales >= ₹25,000.
--
-- Sort by net sales descending,
-- then average net order value descending.

SELECT product_category,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS gross_sales,
       SUM(COALESCE(discount, 0)) AS total_discount_amount,
       SUM(order_amount * (discount / 100)) AS net_sales,
       AVG(order_amount - discount) AS average_net_order_value
FROM customer_orders
WHERE order_status = 'Completed'
GROUP BY product_category
HAVING COUNT(order_id) >= 2
   AND SUM(order_amount - discount) >= 25000
ORDER BY net_sales DESC,
         average_net_order_value DESC;
