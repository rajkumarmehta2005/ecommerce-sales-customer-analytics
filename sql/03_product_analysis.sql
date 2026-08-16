USE ecommerce_analysis;

-- 1. Revenue and Profit by Category

SELECT
    Category,
    SUM(Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
	ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- 2. Category Profit Margin

SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- 3. Highest Revenue Category

SELECT
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 4. Product Performance

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    SUM(Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
ORDER BY Total_Revenue DESC;

-- 5. Top 10 Products by Revenue

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 6. Top 10 Products by Profit

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Total_Profit DESC
LIMIT 10;

-- 7. Bottom 10 Products by Revenue

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Total_Revenue ASC
LIMIT 10;

-- 8. Bottom 10 Products by Profit

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Total_Profit ASC
LIMIT 10;

-- 9. Loss-Making Products

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- 10. Profit Margin by Product

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Profit_Margin DESC;

-- 11. Top 10 Products by Profit Margin

SELECT
    Product_ID,
    Product_Name,
    Category,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category
ORDER BY Profit_Margin DESC
LIMIT 10;

-- 12. Sub-Category Performance

SELECT
    Category,
    Sub_Category,
    SUM(Quantity) AS Total_Quantity_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Category, Sub_Category
ORDER BY Total_Revenue DESC;