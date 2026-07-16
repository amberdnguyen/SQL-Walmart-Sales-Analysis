-- Create Database
CREATE DATABASE walmart_db;

-- Use Database
USE walmart_db;

-- Create Sales Table
CREATE TABLE sales (
    Store_Number INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Holiday_Flag TINYINT,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,3),
    CPI DECIMAL(10,3),
    Unemployment DECIMAL(5,3)
);

-- Load CSV Data
LOAD DATA LOCAL INFILE 'C:/Users/AD/Downloads/Walmart_sales_analysis.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    Store_Number,
    @Date,
    Weekly_Sales,
    Holiday_Flag,
    Temperature,
    Fuel_Price,
    CPI,
    Unemployment
)
SET Date = STR_TO_DATE(@Date, '%m/%d/%Y');