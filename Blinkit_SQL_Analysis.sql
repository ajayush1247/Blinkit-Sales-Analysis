create database blinkit_db;
use blinkit_db;

SELECT count(*) AS total_customers
from customers;
show tables;
SELECT count(*) AS total_customers
from blinkit_customers;
SELECT count(*) AS total_order
from blinkit_orders;
SELECT count(*) AS total_order_items
from blinkit_order_items;
rename table blinkit_customers to customers;
rename table blinkit_orders to orders;
rename table blinkit_order_items to order_items;
rename table blinkit_products to products;
show tables;
SELECT COUNT(*) AS Total_Customers FROM customers;
SELECT COUNT(*) AS Total_Orders FROM orders;
SELECT COUNT(*) AS Total_Order_Items FROM order_items;
SELECT COUNT(*) AS Total_Products FROM products;
describe customers;
describe orders;
describe order_items;
describe products;
select 
       o.order_id,
       c.customer_id,
       o.order_date,
       o.order_total
from orders o
join customers c       
on o.customer_id=c.customer_id;
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE products;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;

select sum(order_total) AS Total_Revenue
from orders;
SELECT COUNT(order_id) AS Total_Orders
FROM orders;
SELECT ROUND(AVG(order_total),2) AS Average_Order_Value
FROM orders;
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM customers;
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.area,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    o.order_total
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
LIMIT 20;

SELECT
    c.area,
    ROUND(SUM(o.order_total),2) AS Total_Sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.area
ORDER BY Total_Sales DESC;

SELECT
    c.customer_name,
    ROUND(SUM(o.order_total),2) AS Total_Revenue
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT
    MONTH(order_date) AS Month,
    ROUND(SUM(order_total),2) AS Monthly_Sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY Month;

SELECT * FROM products LIMIT 5;

SELECT
    p.category,
    ROUND(AVG(p.margin_percentage),2) AS Avg_Profit_Margin
FROM products p
GROUP BY p.category
ORDER BY Avg_Profit_Margin DESC;

SELECT
    COUNT(DISTINCT o.order_id) AS Total_Orders,
    COUNT(DISTINCT o.customer_id) AS Total_Customers,
    ROUND(SUM(o.order_total),2) AS Total_Sales,
    ROUND(AVG(o.order_total),2) AS Average_Order_Value
FROM orders o;