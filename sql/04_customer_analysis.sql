USE ecommerce_analysis;

-- 1. Customer Performance

SELECT
    Customer_ID,
    Customer_Name,
    Gender,
    Age,
    City,
    State,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Gender,
    Age,
    City,
    State
ORDER BY Total_Revenue DESC;

-- 2. Top 10 Customers by Revenue

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 3. Top 10 Customers by Profit

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- 4. Customer Order Frequency

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Orders DESC;

-- 5. Average Order Value by Customer

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(
        SUM(Revenue) / NULLIF(COUNT(DISTINCT Order_ID), 0),
        2
    ) AS Average_Order_Value
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Average_Order_Value DESC;

-- 6. Repeat vs One-Time Customers

SELECT
    Customer_Type,
    COUNT(*) AS Number_of_Customers
FROM (
    SELECT
        Customer_ID,
        CASE
            WHEN COUNT(DISTINCT Order_ID) = 1
                THEN 'One-Time Customer'
            ELSE 'Repeat Customer'
        END AS Customer_Type
    FROM sales
    GROUP BY Customer_ID
) AS customer_segments
GROUP BY Customer_Type;

-- 7. Repeat Customer Percentage

SELECT
    ROUND(
        SUM(
            CASE
                WHEN Total_Orders > 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Repeat_Customer_Percentage
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Total_Orders
    FROM sales
    GROUP BY Customer_ID
) AS customer_orders;

-- 8. Repeat Customers' Revenue

SELECT
    ROUND(SUM(Revenue), 2) AS Repeat_Customer_Revenue
FROM sales
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM sales
    GROUP BY Customer_ID
    HAVING COUNT(DISTINCT Order_ID) > 1
);

-- 9. Segment Customers by Order Frequency

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    CASE
        WHEN COUNT(DISTINCT Order_ID) = 1 THEN 'One-Time'
        WHEN COUNT(DISTINCT Order_ID) BETWEEN 2 AND 4 THEN 'Occasional'
        ELSE 'Frequent'
    END AS Customer_Segment
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Orders DESC;

-- 10. Count Customers in Each Segment

SELECT
    Customer_Segment,
    COUNT(*) AS Number_of_Customers,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Total_Revenue), 2) AS Average_Revenue_Per_Customer
FROM (
    SELECT
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS Total_Orders,
        SUM(Revenue) AS Total_Revenue,
        CASE
            WHEN COUNT(DISTINCT Order_ID) = 1 THEN 'One-Time'
            WHEN COUNT(DISTINCT Order_ID) BETWEEN 2 AND 4 THEN 'Occasional'
            ELSE 'Frequent'
        END AS Customer_Segment
    FROM sales
    GROUP BY Customer_ID
) AS customer_segments
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;

-- 11. Customer Analysis by State

SELECT
    State,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY State
ORDER BY Total_Revenue DESC;

-- 12. Performance by Gender

SELECT
    Gender,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Revenue), 0) * 100,
        2
    ) AS Profit_Margin
FROM sales
GROUP BY Gender
ORDER BY Total_Revenue DESC;

-- 13. Performance by Age Group

SELECT
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN '18-24' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
        WHEN '45-54' THEN 4
        WHEN '55+' THEN 5
    END;
