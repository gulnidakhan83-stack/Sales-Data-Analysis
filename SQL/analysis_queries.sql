USE sales_analysis;

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM sales_data;

-- 2. Total revenue
SELECT SUM(total_price) AS total_revenue
FROM sales_data;

-- 3. Average order value
SELECT AVG(total_price) AS average_order_value
FROM sales_data;

-- 4. Highest order value
SELECT MAX(total_price) AS highest_order_value
FROM sales_data;

-- 5. Lowest order value
SELECT MIN(total_price) AS lowest_order_value
FROM sales_data;

-- 6. Revenue by category
SELECT
    category,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;

-- 7. Revenue by sub-category
SELECT
    sub_category,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY sub_category
ORDER BY total_revenue DESC;

-- 8. Revenue by region
SELECT
    region,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC;

-- 9. Top 10 customers by revenue
SELECT
    customer_name,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 10. Orders above average order value
SELECT
    order_id,
    customer_name,
    total_price
FROM sales_data
WHERE total_price > (
    SELECT AVG(total_price)
    FROM sales_data
)
ORDER BY total_price DESC;

-- 11. Order value category
SELECT
    order_id,
    customer_name,
    total_price,
    CASE
        WHEN total_price >= 5000 THEN 'High Value'
        WHEN total_price >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM sales_data
ORDER BY total_price DESC;

-- 12. Total quantity and revenue by category
SELECT
    category,
    SUM(quantity) AS total_quantity_sold,
    SUM(total_price) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;