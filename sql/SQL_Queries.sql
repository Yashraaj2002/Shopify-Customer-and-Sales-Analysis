-- kpi_queries.sql

-- ✅ 1. Net Sales (Total revenue in USD)
SELECT ROUND(SUM(total_price_usd), 2) AS net_sales
FROM shopify_orders;

💡 Total sales amounted to $4.18M, indicating strong overall revenue performance during the period.

-- ✅ 2. Total Quantity Sold
SELECT SUM(quantity) AS total_quantity
FROM shopify_orders;

💡 A total of 7,534 items were sold, reflecting healthy product movement across categories.

-- ✅ 3. Net Average Order Value (AOV)
SELECT ROUND(SUM(total_price_usd) / COUNT(DISTINCT order_number), 2) AS net_avg_order_value
FROM shopify_orders;

💡 Insight: Average order value stands at $562.80, suggesting a high-value product mix or successful upselling strategies.

-- ✅ 4. Total Unique Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM shopify_orders;

💡 4,431 unique customers made purchases, highlighting a broad customer base.

-- ✅ 5. Single-Order Customers
SELECT COUNT(*) AS single_order_customers
FROM (
    SELECT customer_id
    FROM shopify_orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_number) = 1
) AS one_time;

💡 2,392 customers placed only one order, representing 54% of the customer base.

-- ✅ 6. Repeat Customers
SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id
    FROM shopify_orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_number) > 1
) AS repeat;

💡 2,039 customers made repeat purchases, signaling strong customer retention and satisfaction.

-- ✅ 7. Repeat Rate (%)
SELECT 
    ROUND(100.0 * repeat.repeat_customers / total.total_customers, 2) AS repeat_rate_percentage
FROM
    (SELECT COUNT(DISTINCT customer_id) AS total_customers FROM shopify_orders) total,
    (SELECT COUNT(*) AS repeat_customers
     FROM (
         SELECT customer_id
         FROM shopify_orders
         GROUP BY customer_id
         HAVING COUNT(DISTINCT order_number) > 1
     ) AS repeat) repeat;

💡 The repeat customer rate is 46%, indicating nearly half of customers returned for additional purchases.

-- ✅ 8. Lifetime Value (LTV)
SELECT ROUND(SUM(total_price_usd) / COUNT(DISTINCT customer_id), 2) AS avg_lifetime_value
FROM shopify_orders;

💡 Customer lifetime value is $943.60, reflecting high per-customer revenue potential.

-- ✅ 9. Purchase Frequency
SELECT ROUND(COUNT(DISTINCT order_number) * 1.0 / COUNT(DISTINCT customer_id), 2) AS purchase_frequency
FROM shopify_orders;
-- Insight: On average, each customer places 1.68 orders, suggesting opportunities to increase purchase frequency through re-engagement.

-- ✅ 10. Regional Overview by City (Net Sales)
SELECT city, ROUND(SUM(total_price_usd), 2) AS net_sales
FROM shopify_orders
GROUP BY city
ORDER BY net_sales DESC
LIMIT 10;

💡 Washington is the top-performing city with $120K in sales, followed by Houston ($90K), New York ($75K), and El Paso ($74K), indicating strong urban market presence.

-- ✅ 11. Net Sales by Payment Gateway
SELECT gateway, ROUND(SUM(total_price_usd), 2) AS net_sales,
       ROUND(100.0 * SUM(total_price_usd) / (SELECT SUM(total_price_usd) FROM shopify_orders), 2) AS percentage
FROM shopify_orders
GROUP BY gateway
ORDER BY net_sales DESC;

 💡 Shopify Payments is the preferred method, accounting for 58% of sales, followed by PayPal (17%) and Gift Cards (16%), suggesting trust in integrated payment options.

-- ✅ 12. Net Sales by Product Type
SELECT product_type, ROUND(SUM(total_price_usd), 2) AS net_sales
FROM shopify_orders
GROUP BY product_type
ORDER BY net_sales DESC;

💡 Running Shoes lead with $1.5M in sales, followed by Tennis Shoes ($0.9M), Walking Shoes ($0.6M), and Cycling Shoes ($0.5M). Accessories, Clogs, and Water Shoes show sales below $100K, indicating low product traction.

-- ✅ 13. Net Sales Trend Over Time (Daily for 1-Week Analysis)
SELECT DATE(invoice_date) AS sales_date,
       ROUND(SUM(total_price_usd), 2) AS daily_net_sales
FROM shopify_orders
WHERE invoice_date::date BETWEEN '2025-03-18' AND '2025-03-24'
GROUP BY sales_date
ORDER BY sales_date;

💡 Sales peaked on March 24th ($683K) and March 22nd ($643K), while March 18th and 23rd were the lowest-performing days, suggesting weekday-end surges and midweek lulls that can guide campaign timing.
