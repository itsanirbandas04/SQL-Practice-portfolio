-- Q1 — Easy
-- Customer Order Filtering

-- Question:
-- Retrieve the order_id, customer_name, product_category,
-- order_amount, and order_status for all customers from Kolkata
-- whose orders are Completed and have an order_amount of at least ₹10,000.
--
-- Sort the results by order_amount in descending order.


SELECT
    order_id,
    customer_name,
    product_category,
    order_amount,
    order_status
FROM customer_orders
WHERE city = 'Kolkata'
  AND order_status = 'Completed'
  AND order_amount >= 10000
ORDER BY order_amount DESC;
