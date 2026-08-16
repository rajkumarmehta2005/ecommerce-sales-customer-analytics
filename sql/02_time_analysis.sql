USE ecommerce_analysis;

-- 1. Revenue and Profit by Year

SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales
GROUP BY Year
ORDER BY Year;

-- 2. Quarterly Performance

SELECT
    Year,
    Quarter,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- 3. Best Quarter

SELECT
    Year,
    Quarter,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Year, Quarter
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 4. Monthly Revenue & Profit

SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;

-- 5. Best Revenue Month

SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Year, Month, Month_Name
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 6. Best Profitable Month

SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Year, Month, Month_Name
ORDER BY Total_Profit DESC
LIMIT 1;

-- 7. MoM Revenue Growth

WITH monthly_sales AS (
    SELECT
        Year,
        Month,
        Month_Name,
        SUM(Revenue) AS Total_Revenue
    FROM sales
    GROUP BY Year, Month, Month_Name
),
monthly_growth AS (
    SELECT
        Year,
        Month,
        Month_Name,
        Total_Revenue,
        LAG(Total_Revenue) OVER (
            ORDER BY Year, Month
        ) AS Previous_Month_Revenue
    FROM monthly_sales
)
SELECT
    Year,
    Month,
    Month_Name,
    ROUND(Total_Revenue, 2) AS Total_Revenue,
    ROUND(Previous_Month_Revenue, 2) AS Previous_Month_Revenue,
    ROUND(
        (
            (Total_Revenue - Previous_Month_Revenue)
            / NULLIF(Previous_Month_Revenue, 0)
        ) * 100,
        2
    ) AS MoM_Growth_Percent
FROM monthly_growth
ORDER BY Year, Month;
