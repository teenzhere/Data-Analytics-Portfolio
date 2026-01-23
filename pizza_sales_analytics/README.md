<p align="center">
<img width="253" height="53" alt="Heading_pizzastoreAnalysis" src="https://github.com/user-attachments/assets/18774b5d-9608-4b3b-838b-5c1b9a04dbb8" />
</p>

**Project Type: Data Analysis & Visualization**<br>
**Tools Used: SQL, Power BI, Excel**

1️⃣ **Problem Statement**

A pizza company requires a robust and scalable data analytics solution to manage and analyze a large volume of sales data (approximately 50,000 combined records). The goal is to extract meaningful business insights related to:

Sales trends and order patterns

Menu performance across pizza types and sizes

Customer purchasing preferences

Key business performance metrics

Interactive dashboards are created to visualize daily and monthly sales trends, sales by pizza type and size, and top and bottom sellers. The objective is to enable data-driven decisions that improve operations, menu strategy, and profitability.

2️⃣ **Dataset Source**

Source: Dataset obtained from Kaggle

Contents: CSV files containing order details, pizza types, quantities, prices, and timestamps

Volume: ~50,000 combined rows of historical sales data

Purpose: Used to analyze trends, order patterns, menu performance, and customer preferences

3️⃣ **Key Performance Indicators (KPIs)**

Total Revenue: Sum of total price of all pizza orders

Average Order Value: Total revenue divided by total orders

Total Pizzas Sold: Sum of quantities of all pizzas sold

Total Orders: Count of all orders

Average Pizzas per Order: Total pizzas sold divided by total orders

4️⃣ **Charts & Visualizations**

Daily Trend for Total Orders – Bar chart showing daily fluctuations<br>
Monthly Trend for Total Orders – Line chart identifying peak order hours<br>
Sales by Pizza Category – Pie chart showing contribution of each pizza category<br>
Sales by Pizza Size – Pie chart showing popularity of pizza sizes<br>
Total Pizzas Sold by Category – Funnel chart comparing pizza category performance<br>
Top 5 Best Pizzas by Revenue – Bar chart highlighting top-selling pizzas<br>
Bottom 5 Pizzas by Revenue – Bar chart highlighting underperforming pizzas<br>
Top 5 Best Pizzas by Quantity – Bar chart highlighting top-selling pizzas<br>
Bottom 5 Pizzas by Quantity – Bar chart highlighting underperforming pizzas<br>
Top 5 Best Pizzas by Total Orders – Bar chart highlighting top-selling pizzas<br>
Bottom 5 Pizzas by Total Orders – Bar chart highlighting underperforming pizzas

5️⃣ **Step-by-Step Solution Plan**
Step 1: Data Collection

Load the CSV files containing order, pizza, and sales information into a SQL database or analysis environment.

Step 2: Data Cleaning & Processing (SQL)

Handle missing values, duplicates, and inconsistencies

Standardize date formats, pizza categories, sizes, and prices

Step 3: Data Transformation (SQL)

Join relevant tables to create a unified dataset

Calculate total sales, order value, and total pizzas sold

Step 4: Data Analysis (SQL)

Compute KPIs: total revenue, total orders, average order value, average pizzas per order

Identify top and bottom selling pizzas

Analyze sales performance by date, pizza type, and size

Step 5: Data Visualization (Power BI)

Import processed dataset into Power BI

Build interactive charts for daily/monthly trends, sales by category/size, top/bottom sellers

Step 6: Dashboard Development

Design a dynamic dashboard with filters and slicers

Enable stakeholders to explore insights interactively

Step 7: Insights & Business Impact

Uncover trends, customer preferences, and menu performance

Provide actionable insights to inform strategic decisions, improve operations, and increase profitability

6️⃣ **SQL Query Examples**

Total Revenue

SELECT SUM(quantity * price) AS total_revenue
FROM sales;


Average Order Value

SELECT SUM(quantity * price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM sales;


Top 5 Best Sellers

SELECT pizza_name, SUM(quantity) AS total_sold
FROM sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 5;

7️⃣ **Sample Dashboard Screenshot**


Interactive dashboard showing KPIs, sales trends, and top-selling pizzas.

8️⃣ **Author**

Teena Thomas – Data Analyst
