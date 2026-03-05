USE ecommerce_sales;

-- Step 1: Insert unique customers
-- TRIM() removes extra spaces in names, states, and cities
-- DISTINCT ensures we don’t insert duplicate customers
INSERT INTO customers (customer_name, state, city)
SELECT DISTINCT TRIM(CustomerName), TRIM(State), TRIM(City)
FROM raw_sales;

-- Step 2: Insert one row per order
-- We pick the earliest order date for each Order ID to ensure
-- only one customer/order combination is inserted.
-- TRIM() ensures extra spaces in customer info do not break the join
INSERT INTO orders(order_id, customer_id, order_date, payment_mode)
SELECT 
	r.`Order ID`,
	c.customer_id,
    r.`Order Date` as order_date,
    MIN(r.PaymentMode) as payment_mode
FROM raw_sales r
JOIN customers c 
	ON TRIM(c.customer_name) = TRIM(r.CustomerName)
    AND TRIM(c.state) = TRIM(r.State)
    AND TRIM(c.city) = TRIM(r.City)
JOIN (SELECT `Order ID`, MIN(`Order Date`) as earliest_date
	FROM raw_sales
    GROUP BY `Order ID`
    ) first_order 
ON r.`Order ID` = first_order.`Order ID`
AND r.`Order Date` = first_order.earliest_date
GROUP BY r.`Order ID`, c.customer_id;


-- STEP 3: Insert data into order_items table 
-- TRIM() Removes extra spaces in category and subcategory to ensure normalization
INSERT INTO order_items(order_id, category, subcategory, quantity, amount, profit)
	SELECT 
		r.`Order ID`,
        TRIM(r.Category),
        TRIM(r.`Sub-Category`),
        r.Quantity,
        r.Amount,
        r.Profit
	FROM raw_sales r
	JOIN orders o 
    ON r.`Order ID` = o.order_id;
    
