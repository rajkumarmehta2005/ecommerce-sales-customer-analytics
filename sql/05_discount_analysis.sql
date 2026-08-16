USE ecommerce_analysis;

 -- 1. Performance by Discount
 
 SELECT
    Discount,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Discount
ORDER BY Discount;

-- 2. Group Discounts into Levels

SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.05 THEN 'Low Discount'
        WHEN Discount <= 0.10 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Level,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Discount_Level
ORDER BY Total_Revenue DESC;

-- 3. Compare Discount vs Profit

SELECT
    Discount,
    ROUND(AVG(Revenue), 2) AS Average_Revenue,
    ROUND(AVG(Profit), 2) AS Average_Profit,
    ROUND(
        AVG(Profit) / NULLIF(AVG(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Discount
ORDER BY Discount;

-- 4. Highest Discount Orders

SELECT
    Order_ID,
    Customer_ID,
    Product_Name,
    Discount,
    Quantity,
    ROUND(Revenue, 2) AS Revenue,
    ROUND(Profit, 2) AS Profit
FROM sales
ORDER BY Discount DESC
LIMIT 20;