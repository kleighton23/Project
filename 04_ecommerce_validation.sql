USE ecommerce_sales;

-- Purpose: To validate that raw_sales was properly normalized into 
-- customers, orders, and order_items tables


-- Customer Validation --

-- Expected unique customers
SELECT COUNT(*) as expected_customers
FROM(SELECT DISTINCT TRIM(CustomerName), TRIM(State), TRIM(City)
	FROM raw_sales) t;

-- Actual customers
SELECT COUNT(*) as actual_customers
FROM customers;

-- Orders Validation --

-- Expected unique orders
SELECT COUNT(DISTINCT `Order ID`) as expected_orders
FROM raw_sales;

-- Actual unique orders
SELECT COUNT(*) as actual_orders
FROM orders;

-- Checking for duplicate order ids
SELECT order_id, COUNT(*) as duplicate_orders
FROM orders
GROUP BY order_id
HAVING COUNT(*)>1;


-- Order Items Validation

-- Expected order items
SELECT COUNT(*) as expected_order_items
FROM raw_sales;

-- Actual order items
SELECT COUNT(*) as actual_order_items
FROM order_items;

-- Referential Integrity checksum table

-- Checking for orphaned order items (should return zero)
SELECT oi.order_id
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL; 

-- Checking for orphaned orders (should return zero)
SELECT o.customer_id
FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;