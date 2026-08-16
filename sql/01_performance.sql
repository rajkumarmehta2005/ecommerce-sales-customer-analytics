USE ecommerce_analysis;

-- 1. Total Revenue, Cost & Profit

SELECT 
  SUM(Revenue) AS Total_Revenue,
  SUM(Cost) AS Total_Cost,
  SUM(Profit) AS Total_Profit
FROM sales;

-- 2. Total Orders, Customers & Quantity Sold

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity_Sold
FROM sales;

-- 3. Average Order Value (AOV)

SELECT
    ROUND(SUM(Revenue) / COUNT(DISTINCT Order_ID),2) AS Average_Order_Value
FROM sales;

-- 4. Overall Profit Margin

SELECT
    ROUND(SUM(Profit) / SUM(Revenue) * 100,2) AS Overall_Profit_Margin
FROM sales;

-- 