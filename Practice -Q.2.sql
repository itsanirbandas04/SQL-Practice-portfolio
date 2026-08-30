-- Q2 — Easy+
-- Order Search by Amount, Status and Date

-- Question:
-- Retrieve the order_id, customer_name, city, order_amount,
-- order_status, and order_date for orders where:
-- order_amount is between ₹8,000 and ₹30,000
-- order_status is either Completed or Pending
-- order_date is between August 3, 2026 and August 15, 2026
--
-- Sort the results by order_date descending
-- and then order_amount descending.


SELECT
    order_id,
    customer_name,
    city,
    order_amount,
    order_status,
    order_date
FROM customer_orders
WHERE order_amount BETWEEN 8000 AND 30000
  AND (order_status = 'Completed' OR order_status = 'Pending')
  AND order_date BETWEEN '2026-08-03' AND '2026-08-15'
ORDER BY order_date DESC,
         order_amount DESC;
