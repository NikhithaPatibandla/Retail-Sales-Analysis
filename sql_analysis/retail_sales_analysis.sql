
-- ====================================================
-- Retail Sales Analysis - SQL Exploration
-- Dataset: Superstore
-- Author: Nikhitha Patibandla
-- Description: Business insights using MYSQL
-- ====================================================

CREATE DATABASE retail_analysis;
USE retail_analysis;

-- ====================================================
-- Overall Business Performance
-- ====================================================

SELECT 
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM cleaned_superstore;

-- ====================================================
-- Category Level Profitability
-- ====================================================

SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales),2) AS Profit_Margin
FROM cleaned_superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- ====================================================
-- Regional Level Profitability
-- ====================================================

SELECT 
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales),2) AS Profit_Margin
FROM cleaned_superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- ====================================================
-- Discount Impact Analysis
-- ====================================================

SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low Discount'
        WHEN Discount <= 0.5 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Level,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM cleaned_superstore
GROUP BY Discount_Level
ORDER BY Avg_Profit DESC;

DESCRIBE cleaned_superstore;

ALTER TABLE cleaned_superstore
CHANGE `Sub-Category` Sub_Category VARCHAR(50);

ALTER TABLE cleaned_superstore
CHANGE `Product Name` Product_Name TEXT;

-- ====================================================
-- Loss Making Sub-Categories
-- ====================================================

SELECT 
    Sub_Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM cleaned_superstore
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;

-- ====================================================
-- Top 5 Loss-Making Products
-- ====================================================

SELECT 
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM cleaned_superstore
GROUP BY Product_Name
ORDER BY Total_Profit ASC
LIMIT 5;