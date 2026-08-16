CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE sales (
    Sales_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Customer_ID INT,
    Order_Date DATE,
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Quantity INT,
    Discount DECIMAL(5,2),
    Payment_Method VARCHAR(50),
    Year INT,
    Month INT,
    Month_Name VARCHAR(20),
    Quarter INT,
    Unit_Price DECIMAL(10,2),
    Unit_Cost DECIMAL(10,2),
    Revenue DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Profit_Margin DECIMAL(10,2),
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    City VARCHAR(100),
    State VARCHAR(100)
);

CREATE TABLE returns (
    Order_ID INT,
    Return_Date DATE,
    Return_Reason VARCHAR(100)
);