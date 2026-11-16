-- 1. Monthly sales trend
SELECT 
    SUBSTR(`Order Date`, 7, 4) || '-' || SUBSTR(`Order Date`, 4, 2) AS Month,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month ASC;

-- 2. Top 10 products by sales
SELECT 
    `Product Name`,
    `Category`,
    `Sub-Category`,
    SUM(Sales) AS Total_Sales,
    COUNT(`Order ID`) AS Total_Orders
FROM sales_data
GROUP BY `Product ID`, `Product Name`, `Category`, `Sub-Category`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3. Sales performance by region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT `Order ID`) AS Order_Count
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales ASC;

-- 4. Top 10 customers by spending
SELECT 
    `Customer Name`,
    Segment,
    SUM(Sales) AS Total_Spent,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sales_data
GROUP BY `Customer ID`, `Customer Name`, Segment
ORDER BY Total_Spent DESC
LIMIT 10;
