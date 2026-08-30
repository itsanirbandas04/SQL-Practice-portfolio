-- Q4 — Medium
-- Order Value Segmentation

-- Question:
-- Retrieve the order_id, customer's name in uppercase,
-- city, and order amount.
--
-- Replace any NULL discount with 0.
--
-- Create a new column called customer_segment:
-- ₹25,000 or more       → High Value
-- ₹10,000 to below ₹25,000 → Medium Value
-- Below ₹10,000          → Low Value
--
-- Sort the results by order amount in descending order.


SELECT
    order_id,
    UPPER(customer_name) AS customer_name,
    city,
    order_amount,
    COALESCE(discount, 0) AS discount,
    CASE
        WHEN order_amount >= 25000 THEN 'High Value'
        WHEN order_amount >= 10000
             AND order_amount < 25000 THEN 'Medium Value'
        WHEN order_amount < 10000 THEN 'Low Value'
    END AS customer_segment
FROM customer_orders
ORDER BY order_amount DESC;
