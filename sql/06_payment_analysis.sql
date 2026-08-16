USE ecommerce_analysis;

-- 1. Overall Payment Method Performance

SELECT
    Payment_Method,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- 2. Most Popular Payment Method

SELECT
    Payment_Method,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC
LIMIT 1;

-- 3. Revenue by Payment Method

SELECT
    Payment_Method,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- 4. Payment Method Share of Revenue

SELECT
    Payment_Method,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        SUM(SUM(Revenue)) OVER (),
        2
    ) AS Revenue_Share_Percent
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- 5. Payment Method + Profitability

SELECT
    Payment_Method,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Payment_Method
ORDER BY Total_Profit DESC;