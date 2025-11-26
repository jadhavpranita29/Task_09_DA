Create Database Online_Sales_Analysis;

Use Online_Sales_Analysis;


CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO online_sales (order_id, product_id, product_name, order_date, amount) VALUES
(1, 101, 'Laptop', '2024-01-05', 55000.00),
(2, 102, 'Mobile', '2024-01-06', 15000.00),
(3, 103, 'Tablet', '2024-01-07', 22000.00),
(4, 104, 'Smartwatch', '2024-01-08', 8000.00),
(5, 105, 'Headphones', '2024-01-09', 1200.00),
(6, 106, 'Camera', '2024-01-18', 30000.00),
(7, 107, 'Keyboard', '2024-01-18', 900.00),
(8, 108, 'Mouse', '2024-01-19', 600.00),
(9, 109, 'Monitor', '2024-01-19', 12000.00),
(10, 110, 'Printer', '2024-01-20', 7000.00);

Select * From online_sales;


/* Extract Year & Month */

SELECT 
    order_id,
    product_name,
    amount,
    order_date,
    MONTH(order_date) AS month,
    YEAR(order_date) AS year
FROM online_sales;

/* Total Monthly Revenue */

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY order_date
ORDER BY order_date;


/* Count Monthly Orders */

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM online_sales
GROUP BY order_date
ORDER BY order_date;


/* Combined Revenue +Order Count */

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS avg_order_value
FROM online_sales
GROUP BY order_date
ORDER BY order_date;



/* Identify Peak Sales Month (Highest Revenue) */

SELECT TOP 1
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY order_date
ORDER BY total_revenue DESC;



/* Identify Month with Most Orders */

SELECT TOP 1
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM online_sales
GROUP BY order_date
ORDER BY total_orders DESC;



/* aggregate monthly revenue, count orders, filter by year, and sort results */


SELECT 
    FORMAT(order_date, 'MMMM-yyyy') AS month_year,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(amount) AS total_revenue
FROM online_sales
WHERE YEAR(order_date) = 2023
GROUP BY FORMAT(order_date, 'MMMM-yyyy')
ORDER BY total_revenue DESC;
















