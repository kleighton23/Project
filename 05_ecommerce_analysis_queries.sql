USE ecommerce_sales;

-- Revenue by Month --

-- Shows evenue by month with month over month change
WITH monthly_revenue as(
SELECT 
	DATE_FORMAT(o.order_date, '%Y-%m') as month, 
	SUM(oi.amount) as revenue
FROM orders o
JOIN order_items oi 
	ON o.order_id = oi.order_id
GROUP BY month
)
SELECT
	month,
	revenue,
    revenue - LAG(revenue) OVER(ORDER BY month) as vs_last_month
FROM monthly_revenue
ORDER BY month;
    
-- Profit by State --

-- Shows total profits per State sorted in descending order
WITH state_orders as(
SELECT
	c.state,
    o.order_id
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
)
SELECT 
	so.state,
    SUM(oi.profit) as profit
FROM state_orders so
JOIN order_items oi 
	ON so.order_id = oi.order_id
GROUP BY so.State
ORDER BY profit DESC;

-- Top 10 Customers by Lifetime Value (LTV) --

-- Shows the top 10 highest spending customers
WITH customer_orders AS (
    SELECT
        c.customer_name AS name,
        o.order_id,
        SUM(oi.amount) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY name, o.order_id
)
SELECT
    name,
    SUM(revenue) AS ltv
FROM customer_orders
GROUP BY name
ORDER BY ltv DESC, name
LIMIT 10;

-- Top 3 Best Selling Subcategories --

-- Ranked by total quantity sold
SELECT
    subcategory,
    SUM(quantity) AS quantity_sold
FROM order_items
GROUP BY subcategory
ORDER BY quantity_sold DESC, subcategory
LIMIT 3;


-- Top 3 Most Profitable Subcategories --

-- Ranked by total profit generated
SELECT
    subcategory,
    SUM(profit) AS total_profit
FROM order_items
GROUP BY subcategory
ORDER BY total_profit DESC, subcategory
LIMIT 3;

-- Payment Mode Distribution --

-- Shows percentage of orders by payment method
SELECT
    payment_mode,
    ROUND(COUNT(*) * 100.0 / (
        SELECT COUNT(*)
        FROM orders
    ), 2) AS percentage
FROM orders
GROUP BY payment_mode
ORDER BY percentage DESC;