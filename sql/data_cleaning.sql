-- Preview Dataset
SELECT *
FROM sales
LIMIT 10;

-- Total Records
SELECT COUNT(*) AS Total_Records
FROM sales;

-- Total Stores
SELECT COUNT(DISTINCT Store_Number) AS Total_Stores
FROM sales;

-- Total Weeks
SELECT COUNT(DISTINCT Date) AS Total_Weeks
FROM sales;

-- Date Range
SELECT
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM sales;

-- Check for NULL Values
SELECT
    SUM(Store_Number IS NULL) AS Store_NULL,
    SUM(Date IS NULL) AS Date_NULL,
    SUM(Weekly_Sales IS NULL) AS Sales_NULL,
    SUM(Holiday_Flag IS NULL) AS Holiday_NULL,
    SUM(Temperature IS NULL) AS Temperature_NULL,
    SUM(Fuel_Price IS NULL) AS Fuel_NULL,
    SUM(CPI IS NULL) AS CPI_NULL,
    SUM(Unemployment IS NULL) AS Unemployment_NULL
FROM sales;

-- Check for Negative Sales
SELECT *
FROM sales
WHERE Weekly_Sales < 0;

-- Check for Duplicate Records
SELECT
    Store_Number,
    Date,
    COUNT(*) AS Duplicate_Count
FROM sales
GROUP BY Store_Number, Date
HAVING COUNT(*) > 1;