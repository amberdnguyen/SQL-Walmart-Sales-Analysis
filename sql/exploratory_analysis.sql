/*=========================================================
Business Question 1
Sales Summary by Store
(Total, Average, Highest, and Lowest Weekly Sales)
=========================================================*/
SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales,
    AVG(Weekly_Sales) AS Average_Sales,
    MAX(Weekly_Sales) AS Highest_Sales,
    MIN(Weekly_Sales) AS Lowest_Sales
FROM sales
GROUP BY Store_Number
ORDER BY Total_Sales DESC
LIMIT 10;


/*=========================================================
Business Question 2
Which Store Has the Highest Weekly Sales?
=========================================================*/
SELECT
    Store_Number,
    MAX(Weekly_Sales) AS Highest_Sales
FROM sales
GROUP BY Store_Number
ORDER BY Highest_Sales DESC
LIMIT 1;


/*=========================================================
Business Question 3
Total Weekly Sales During Holiday Weeks by Store
=========================================================*/
SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales
FROM sales
WHERE Holiday_Flag = 1
GROUP BY Store_Number
ORDER BY Total_Sales DESC;


/*=========================================================
Business Question 4
Which Store Has the Highest Average Sales
During Non-Holiday Weeks?
=========================================================*/
SELECT
    Store_Number,
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
WHERE Holiday_Flag = 0
GROUP BY Store_Number
ORDER BY Average_Sales DESC
LIMIT 1;


/*=========================================================
Business Question 5
Top 5 Stores by Total Weekly Sales
=========================================================*/
SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales
FROM sales
GROUP BY Store_Number
ORDER BY Total_Sales DESC
LIMIT 5;


/*=========================================================
Business Question 6
Bottom 5 Stores by Average Weekly Sales
=========================================================*/
SELECT
    Store_Number,
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
GROUP BY Store_Number
ORDER BY Average_Sales ASC
LIMIT 5;


/*=========================================================
Business Question 7
How Many Stores Have Average Weekly Sales
Greater Than $1,000,000?
=========================================================*/
SELECT 
COUNT(*) AS Number_of_High_Average_Sales_Stores
FROM (
    SELECT
        Store_Number
    FROM sales
    GROUP BY Store_Number
    HAVING AVG(Weekly_Sales) > 1000000
) AS High_Sales_Stores;


/*=========================================================
Business Question 8
How Many Stores Have Total Sales
Greater Than $250,000,000?
=========================================================*/
SELECT 
COUNT(*) AS Number_of_High_Total_Sales_Stores
FROM (
    SELECT
        Store_Number
    FROM sales
    GROUP BY Store_Number
    HAVING SUM(Weekly_Sales) > 250000000
) AS High_Sales_Stores;


/*=========================================================
Business Question 9
Which Store Has the Highest Average Sales
During Holiday Weeks?
=========================================================*/
SELECT
    Store_Number,
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
WHERE Holiday_Flag = 1
GROUP BY Store_Number
ORDER BY Average_Sales DESC
LIMIT 1;


/*=========================================================
Business Question 10
Which Store Has the Largest Difference Between
Highest and Lowest Weekly Sales?
=========================================================*/
SELECT
    Store_Number,
    MAX(Weekly_Sales) - MIN(Weekly_Sales) AS Sales_Difference
FROM sales
GROUP BY Store_Number
ORDER BY Sales_Difference DESC
LIMIT 1;


/*=========================================================
Business Question 11
Which Store Has the Smallest Difference Between
Highest and Lowest Weekly Sales?
=========================================================*/
SELECT
    Store_Number,
    MAX(Weekly_Sales) - MIN(Weekly_Sales) AS Sales_Difference
FROM sales
GROUP BY Store_Number
ORDER BY Sales_Difference ASC
LIMIT 1;


/*=========================================================
Business Question 12
Average Weekly Sales During Holiday
vs Non-Holiday Weeks
=========================================================*/
SELECT
    CASE
        WHEN Holiday_Flag = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS Week_Type,
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
GROUP BY Holiday_Flag
ORDER BY Holiday_Flag DESC;


/*=========================================================
Business Question 13
Which Store Has the Highest Average Temperature?
=========================================================*/
SELECT
    Store_Number,
    AVG(Temperature) AS Average_Temperature
FROM sales
GROUP BY Store_Number
ORDER BY Average_Temperature DESC
LIMIT 1;


/*=========================================================
Business Question 14
Which Store Has the Lowest Average Temperature?
=========================================================*/
SELECT
    Store_Number,
    AVG(Temperature) AS Average_Temperature
FROM sales
GROUP BY Store_Number
ORDER BY Average_Temperature ASC
LIMIT 1;


/*=========================================================
Business Question 15
Average Weekly Sales When Temperature
Is Greater Than 80°F
=========================================================*/
SELECT
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
WHERE Temperature > 80;


/*=========================================================
Business Question 16
Average Weekly Sales When Temperature
Is Below 40°F
=========================================================*/
SELECT
    AVG(Weekly_Sales) AS Average_Sales
FROM sales
WHERE Temperature < 40;