USE ecommerce_sales;

-- Combines customers, orders, and order_items into a single dataset
-- used for BI dashboards
CREATE VIEW ecommerce_dashboard as
	SELECT 
		o.order_id,
        o.order_date,
        YEAR(o.order_date) as year,
        MONTH(o.order_date) as month,
        c.customer_name,
        c.state,
        c.city,
        oi.category,
        oi.subcategory,
        oi.quantity,
        oi.amount as revenue,
        oi.profit,
        o.payment_mode
	FROM orders o
	JOIN customers c
		ON o.customer_id = c.customer_id
	JOIN order_items oi
		ON o.order_id = oi.order_id;
        