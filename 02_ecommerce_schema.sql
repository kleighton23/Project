USE ecommerce_sales;

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    state VARCHAR(50),
    city VARCHAR(50)
    );
    
CREATE TABLE orders (
	order_id VARCHAR(50) PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_mode VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    
CREATE TABLE order_items ( 
	order_items_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(50),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    quantity INT,
    amount DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    );
    
    
