# E-commerce Data Normalization & SQL Analysis

## Overview
This project demonstrates the process of transforming a denormalized e-commerce dataset into a structured relational database using SQL.

The goal of the project was to practice:
- relational database design
- data cleaning in SQL
- normalization of operational data
- writing SQL queries for analysis
- preparing data for dashboards and reporting tools

The final dataset is structured to support reporting and visualization tools such as Power BI.

---

## Dataset
The starting dataset is a raw e-commerce sales table stored in Excel.

It contains:
- customer information
- order details
- product purchases

All data originally existed in a single denormalized table, which resulted in repeated customer and order information across multiple rows.

---

## Database Structure
The dataset was normalized into three relational tables:

**customers**
- customer_id (Primary Key)
- customer_name
- state

**orders**
- order_id (Primary Key)
- customer_id (Foreign Key)
- order_date

**order_items**
- order_item_id (Primary Key)
- order_id (Foreign Key)
- product_category
- revenue

Primary and foreign keys were used to enforce relationships between tables.

---

## Project Steps
The project workflow includes:

1. Raw Data – original dataset in Excel  
2. Schema Creation – relational database structure  
3. Normalization – splitting the dataset into multiple tables  
4. Validation Queries – checking for duplicates and data issues  
5. Analysis Queries – answering business questions  
6. Dashboard View – creating a reporting-ready dataset  

---

## Example Analysis
Example queries explore:

- Top customers by total spending
- Revenue trends over time
- Product category performance
- Revenue by state

---

## Dashboard

A Power BI dashboard was created using the cleaned and normalized dataset.

The dashboard includes:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue trend by month
- Revenue by category
- Revenue by state
- Top customers by revenue

### Dashboard Preview
![Dashboard]<img width="972" height="546" alt="ecommerce_dashboard_preview" src="https://github.com/user-attachments/assets/3b30b95d-29ca-42c5-9ed4-22ea589f33bb" />


---

## Tools Used

- SQL (MySQL)
- Microsoft Excel
- Microsoft Power BI
- GitHub

---

## Project Goal
The goal of this project was to practice the full analytics workflow:

Raw Data → Data Cleaning → Data Modeling → SQL Analysis → Dashboard Visualization
