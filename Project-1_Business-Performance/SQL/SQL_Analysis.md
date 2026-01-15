SQL Analysis – E-Commerce Business Performance & Operations Risk
=

Objective
=
SQL was used to explore, validate, and analyze e-commerce transactional data to understand business performance, profitability, customer behavior, and operational risk.
Each query was written to answer a specific business question and to validate metrics later used in Power BI dashboards.

Database Setup & Validation
=
CREATE DATABASE ecommerce_analytics;

USE ecommerce_analytics;

SHOW COLUMNS FROM orders;

ALTER TABLE orders 

CHANGE `ï»¿order_id` order_id TEXT;
Purpose:
•	Created analytics database
•	Verified schema and column types
•	Fixed encoding issue in order_id column
Business value:
•	Ensured the dataset was clean, readable, and reliable before analysis.

Query 1 – Executive KPI Snapshot
=
SELECT
COUNT(DISTINCT order_id) AS total_orders,
COUNT(DISTINCT customer_id) AS total_customers,
SUM(quantity) AS total_items_sold,
ROUND(SUM(total_amount),2) AS gross_revenue,
ROUND(SUM(net_profit),2) AS total_net_profit,
ROUND(AVG(total_amount),2) AS avg_order_value,
ROUND(SUM(total_amount)/COUNT(DISTINCT order_id),2) AS revenue_per_order
FROM orders;
Business Question:
•	How is the business performing overall?
What this provides:
•	Core executive KPIs
•	Revenue, profitability, customer activity
•	Order efficiency metrics
Used in:
•	Power BI Executive Overview – KPI cards

Query 2 – Yearly Sales Trend
=
SELECT
order_year,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY order_year
ORDER BY order_year;
Business Question:
•	Is the business growing year over year?
What this provides:
•	Annual revenue and profit performance
•	Long-term growth trends
Used in:
•	Power BI Revenue & Profit trend analysis

Query 3 – Monthly Sales Pattern
=
SELECT
order_year,
order_month,
COUNT(DISTINCT order_id) AS orders,
ROUND(SUM(total_amount),2) AS revenue
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
Business Question:
•	Are there seasonal patterns or performance fluctuations?
What this provides:
•	Month-by-month sales visibility
•	Trend volatility and seasonality
Used in:
•	Power BI Monthly Revenue & Profit trend charts

Query 4 – Category Profitability
=
SELECT
category,
COUNT(DISTINCT order_id) AS orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit,
ROUND(AVG(net_profit),2) AS avg_profit_per_order
FROM orders
GROUP BY category
ORDER BY profit DESC;
Business Question:
•	Which product categories actually drive profit?
What this provides:
•	Category-level revenue vs profitability
•	Profit efficiency per order
Used in:
•	Power BI Category Revenue & Profit analysis

Query 5 – Discount Impact Analysis
=
SELECT
discount_flag,
COUNT(DISTINCT order_id) AS orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit,
ROUND(AVG(discount),3) AS avg_discount
FROM orders
GROUP BY discount_flag;
Business Question:
•	Do discounts increase sales at the cost of profitability?
What this provides:
•	Performance of discounted vs non-discounted orders
•	Profit impact of promotions
Used in:
•	Power BI Discount vs Returns & Profitability visuals

Query 6 – Category Performance Mix
=
SELECT
category,
SUM(quantity) AS items_sold,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY category
ORDER BY revenue DESC;
Business Question:
•	Which categories drive volume vs value?
What this provides:
•	Product demand patterns
•	Revenue and profit contribution
Used in:
•	Power BI Category contribution analysis

Query 7 – Top Customers by Value
=
SELECT
customer_id,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 15;
Business Question:
•	Who are the most valuable customers?
What this provides:
•	High-value customer identification
•	Revenue concentration analysis
Used for:
•	Customer segmentation logic in Power BI

Query 8 – Customer Age Segmentation
=
SELECT
age_group,
COUNT(DISTINCT customer_id) AS customers,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY age_group
ORDER BY profit DESC;
Business Question:
•	Which age groups drive the business?
What this provides:
•	Revenue and profit by customer segment
•	Market targeting insights
Used in:
•	Power BI Market & Customer Insights page

Query 9 – Returns Impact
=
SELECT
returned,
COUNT(*) AS orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY returned;
Business Question:
•	How do returns affect revenue and profit?
What this provides:
•	Financial impact of returned orders
•	Profit leakage visibility
Used in:
•	Power BI Operations & Risk page – Profit impact analysis

Query 10 – Delivery Performance
=
SELECT
delivery_time_days,
COUNT(order_id) AS orders,
ROUND(AVG(net_profit),2) AS avg_profit,
ROUND(AVG(total_amount),2) AS avg_order_value
FROM orders
GROUP BY delivery_time_days
ORDER BY delivery_time_days;
Business Question:
•	Does delivery time influence order value and profitability?
What this provides:
•	Operational efficiency insight
•	Service quality impact
Used in:
•	Power BI Return Rate vs Delivery Time analysis

Query 11 – Regional Business Performance
=
SELECT
region,
COUNT(DISTINCT order_id) AS orders,
ROUND(SUM(total_amount),2) AS revenue,
ROUND(SUM(net_profit),2) AS profit,
ROUND(AVG(delivery_time_days),1) AS avg_delivery_time
FROM orders
GROUP BY region
ORDER BY profit DESC;
Business Question:
•	Which regions are strongest and which show operational risk?
What this provides:
•	Market performance comparison
•	Logistics efficiency by region
Used in:
•	Power BI Regional & Risk dashboards


Key SQL Outcomes:
=
•	Built executive KPI logic
•	Identified category and regional drivers
•	Quantified discount and return risk
•	Analyzed delivery performance impact
•	Created analytical foundation for Power BI dashboards

