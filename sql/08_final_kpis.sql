USE ecommerce_analysis;

-- 1. Overall Business Performance

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales;

-- 2. Average Order Value

SELECT
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Order_ID), 0),
        2
    ) AS Average_Order_Value
FROM sales;

-- 3. Average Revenue per Customer

SELECT
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Customer_ID), 0),
        2
    ) AS Average_Revenue_Per_Customer
FROM sales;

-- 4. Overall Return Rate

SELECT
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID;
    