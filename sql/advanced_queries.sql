/*=========================================================
Advanced SQL 1
Categorize Weekly Sales Using CASE WHEN
=========================================================*/

SELECT
    CASE
        WHEN Weekly_Sales >= 2000000 THEN 'High'
        WHEN Weekly_Sales >= 1000000 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category,
    COUNT(*) AS Number_of_Weeks
FROM sales
GROUP BY Sales_Category;


/*=========================================================
Advanced SQL 2
Classify Stores by Average Weekly Sales
Using a Subquery
=========================================================*/

SELECT
    Store_Number,
    Average_Sales,
    CASE
        WHEN Average_Sales >= 2000000 THEN 'High'
        WHEN Average_Sales >= 1000000 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM (
    SELECT
        Store_Number,
        AVG(Weekly_Sales) AS Average_Sales
    FROM sales
    GROUP BY Store_Number
) AS Store_Averages;


/*=========================================================
Advanced SQL 3
Classify Stores by Average Weekly Sales
Using a Common Table Expression (CTE)
=========================================================*/

WITH Store_Averages AS
(
    SELECT
        Store_Number,
        AVG(Weekly_Sales) AS Average_Sales
    FROM sales
    GROUP BY Store_Number
)

SELECT
    Store_Number,
    Average_Sales,
    CASE
        WHEN Average_Sales >= 2000000 THEN 'High'
        WHEN Average_Sales >= 1000000 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM Store_Averages;


/*=========================================================
Advanced SQL 4
Rank Stores by Total Weekly Sales
Using ROW_NUMBER()
=========================================================*/

SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales,
    ROW_NUMBER() OVER(
        ORDER BY SUM(Weekly_Sales) DESC
    ) AS Ranking
FROM sales
GROUP BY Store_Number;


/*=========================================================
Advanced SQL 5
Rank Stores by Total Weekly Sales
Using RANK()
=========================================================*/

SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales,
    RANK() OVER(
        ORDER BY SUM(Weekly_Sales) DESC
    ) AS Ranking
FROM sales
GROUP BY Store_Number;


/*=========================================================
Advanced SQL 6
Rank Stores by Total Weekly Sales
Using DENSE_RANK()
=========================================================*/

SELECT
    Store_Number,
    SUM(Weekly_Sales) AS Total_Sales,
    DENSE_RANK() OVER(
        ORDER BY SUM(Weekly_Sales) DESC
    ) AS Ranking
FROM sales
GROUP BY Store_Number;