# E-commerce Data Normalization & SQL Analysis

## Overview
This project demonstrates the process of taking a denormalized e-commerce dataset and transforming it into a structured relational database using SQL.

The goal of the project was to practice:

- relational database design
- data cleaning in SQL
- normalization of raw operational data
- writing SQL queries for analysis

The final dataset is structured so it can support analytics queries and business reporting.

## Dataset
The starting dataset is a raw e-commerce sales table stored in Excel.

It contains customer information, order details, and product purchases in a single table.

Because the data is denormalized, customer and order information is repeated across many rows, which makes analysis difficult.

## Database Structure
The dataset was normalized into three main tables:

- customers – customer information
- orders – order level data
- order_items – products within each order

Primary and foreign keys were used to create relationships between the tables.

## Project Steps
The project is organized into the following steps:

- Raw Data – original dataset
- Schema Creation – relational database structure
- Normalization – splitting the dataset into multiple tables
- Validation Queries – checks for duplicates and data issues
- Analysis Queries – example business questions
- Dashboard View – combined dataset for reporting tools

## Tools Used

- SQL (MySQL)
- Excel
- GitHub

## Example Analysis
Example queries included in the project explore:

- top customers by total spending
- revenue trends over time
- product performance
