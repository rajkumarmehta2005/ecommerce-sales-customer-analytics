USE ecommerce_analysis;

-- 1. Overall Return Rate

SELECT
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID;
    
-- 2. Return Reasons

SELECT
    r.Return_Reason,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders
FROM returns r
GROUP BY r.Return_Reason
ORDER BY Returned_Orders DESC;

-- 3. Return Rate by Product

SELECT
    s.Product_ID,
    s.Product_Name,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID
GROUP BY
    s.Product_ID,
    s.Product_Name
ORDER BY Return_Rate DESC;

-- 4. Return Rate by Category

SELECT
    s.Category,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID
GROUP BY s.Category
ORDER BY Return_Rate DESC;

-- 5. Revenue Associated With Returned Orders

SELECT
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    ROUND(SUM(s.Revenue), 2) AS Returned_Order_Revenue,
    ROUND(SUM(s.Profit), 2) AS Returned_Order_Profit
FROM sales s
INNER JOIN returns r
    ON s.Order_ID = r.Order_ID;
    
-- 6. Monthly Return Trend

SELECT
    YEAR(r.Return_Date) AS Year,
    MONTH(r.Return_Date) AS Month,
    MONTHNAME(r.Return_Date) AS Month_Name,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders
FROM returns r
GROUP BY
    YEAR(r.Return_Date),
    MONTH(r.Return_Date),
    MONTHNAME(r.Return_Date)
ORDER BY
    Year,
    Month;
    
-- 7. Return Rate by Month

SELECT
    YEAR(s.Order_Date) AS Year,
    MONTH(s.Order_Date) AS Month,
    MONTHNAME(s.Order_Date) AS Month_Name,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID
GROUP BY
    YEAR(s.Order_Date),
    MONTH(s.Order_Date),
    MONTHNAME(s.Order_Date)
ORDER BY
    Year,
    Month;
    
-- 8. Return Rate by Customer

SELECT
    s.Customer_ID,
    s.Customer_Name,
    COUNT(DISTINCT s.Order_ID) AS Total_Orders,
    COUNT(DISTINCT r.Order_ID) AS Returned_Orders,
    ROUND(
        COUNT(DISTINCT r.Order_ID) * 100.0 /
        NULLIF(COUNT(DISTINCT s.Order_ID), 0),
        2
    ) AS Return_Rate
FROM sales s
LEFT JOIN returns r
    ON s.Order_ID = r.Order_ID
GROUP BY
    s.Customer_ID,
    s.Customer_Name
HAVING COUNT(DISTINCT r.Order_ID) > 0
ORDER BY Return_Rate DESC;
