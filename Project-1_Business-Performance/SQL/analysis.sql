CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

select * from orders limit 5;
SHOW COLUMNS FROM orders;
ALTER TABLE orders 
CHANGE `ï»¿order_id` order_id TEXT;


-- 1. EXECUTIVE KPI SNAPSHOT
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_items_sold,
    ROUND(SUM(total_amount),2) AS gross_revenue,
    ROUND(SUM(net_profit),2) AS total_net_profit,
    ROUND(AVG(total_amount),2) AS avg_order_value,
    ROUND(SUM(total_amount)/COUNT(DISTINCT order_id),2) AS revenue_per_order
FROM orders;

-- 2. YEARLY SALES TREND
SELECT
    order_year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY order_year
ORDER BY order_year;

-- 3. MONTHLY SALES PATTERN
SELECT
    order_year,
    order_month,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(total_amount),2) AS revenue
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 4. CATEGORY PROFITABILITY
SELECT
    category,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit,
    ROUND(AVG(net_profit),2) AS avg_profit_per_order
FROM orders
GROUP BY category
ORDER BY profit DESC;

-- 5. DISCOUNT IMPACT ANALYSIS
SELECT
    discount_flag,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit,
    ROUND(AVG(discount),3) AS avg_discount
FROM orders
GROUP BY discount_flag;


-- 6. CATEGORY PERFORMANCE MIX
SELECT
    category,
    SUM(quantity) AS items_sold,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY category
ORDER BY revenue DESC;

-- 7. TOP CUSTOMERS BY VALUE
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 15;

-- 8. CUSTOMER AGE SEGMENTATION
SELECT
    age_group,
    COUNT(DISTINCT customer_id) AS customers,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY age_group
ORDER BY profit DESC;


-- 9. RETURNS IMPACT
SELECT
    returned,
    COUNT(*) AS orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit
FROM orders
GROUP BY returned;



-- 10. DELIVERY PERFORMANCE
SELECT
    delivery_time_days,
    COUNT(order_id) AS orders,
    ROUND(AVG(net_profit),2) AS avg_profit,
    ROUND(AVG(total_amount),2) AS avg_order_value
FROM orders
GROUP BY delivery_time_days
ORDER BY delivery_time_days;

-- 11. REGIONAL BUSINESS PERFORMANCE
SELECT
    region,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(total_amount),2) AS revenue,
    ROUND(SUM(net_profit),2) AS profit,
    ROUND(AVG(delivery_time_days),1) AS avg_delivery_time
FROM orders
GROUP BY region
ORDER BY profit DESC;
