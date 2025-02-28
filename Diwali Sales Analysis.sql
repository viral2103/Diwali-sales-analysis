-- Use the database where the table resides
USE practice;

-- Retrieve all data from the table
SELECT * FROM diwali_sales_data;

-- Describe the structure of the table
DESC diwali_sales_data;

-- Drop unnecessary columns 'Status' and 'unnamed1'
ALTER TABLE diwali_sales_data DROP COLUMN Status;
ALTER TABLE diwali_sales_data DROP COLUMN unnamed1;

-- Verify the table structure after altering
DESC diwali_sales_data;

-- Retrieve all data again to view the updated table
SELECT * FROM diwali_sales_data;

-- Analyze the total number of customers per age group
SELECT Age_Group, COUNT(Cust_name) AS TotalPersons 
FROM diwali_sales_data 
GROUP BY Age_Group 
ORDER BY TotalPersons DESC;

-- Analyze the total sales amount per age group
SELECT Age_Group, SUM(Amount) AS TotalAmountAgeGroup 
FROM diwali_sales_data 
GROUP BY Age_Group 
ORDER BY TotalAmountAgeGroup DESC;

-- Analyze customer count per age group and gender
SELECT Age_Group, Gender, COUNT(*) AS TotalGender 
FROM diwali_sales_data 
GROUP BY Age_Group, Gender 
ORDER BY Age_Group, Gender DESC;

-- Analyze the total number of customers by gender
SELECT Gender, COUNT(*) AS TotalGender 
FROM diwali_sales_data 
GROUP BY Gender 
ORDER BY TotalGender DESC;

-- Analyze total sales amount by gender
SELECT Gender, SUM(Amount) AS GenderWiseAmount 
FROM diwali_sales_data 
GROUP BY Gender 
ORDER BY GenderWiseAmount DESC;

-- Analyze total sales amount by occupation
SELECT Occupation, SUM(Amount) AS OccupationWiseAmount 
FROM diwali_sales_data 
GROUP BY Occupation 
ORDER BY OccupationWiseAmount DESC;

-- Analyze total sales amount by state
SELECT State, SUM(Amount) AS StateWiseAmount 
FROM diwali_sales_data 
GROUP BY State 
ORDER BY StateWiseAmount DESC;

-- Analyze total sales amount by zone
SELECT Zone, SUM(Amount) AS ZoneWiseAmount 
FROM diwali_sales_data 
GROUP BY Zone 
ORDER BY ZoneWiseAmount DESC;

-- Analyze total orders by state
SELECT State, SUM(Orders) AS StateWiseOrders 
FROM diwali_sales_data 
GROUP BY State, Amount 
ORDER BY StateWiseOrders DESC;

-- Analyze total orders by zone
SELECT Zone, SUM(Orders) AS ZoneWiseOrders 
FROM diwali_sales_data 
GROUP BY Zone 
ORDER BY ZoneWiseOrders DESC;

-- Analyze total orders by occupation
SELECT Occupation, SUM(Orders) AS OccupationWiseTotalOrders 
FROM diwali_sales_data 
GROUP BY Occupation 
ORDER BY OccupationWiseTotalOrders DESC;

-- Find the top 5 customers with the highest purchase amounts
SELECT Cust_name, SUM(Amount) AS HighestAmount, 
       RANK() OVER(ORDER BY SUM(Amount) DESC) AS Ranks 
FROM diwali_sales_data 
GROUP BY Cust_name  
LIMIT 5;

-- Analyze total customers by state
SELECT State, COUNT(Cust_name) AS StateWiseTotalCustomer 
FROM diwali_sales_data 
GROUP BY State 
ORDER BY StateWiseTotalCustomer DESC;

-- Analyze total customers and total sales amount by state
SELECT State, COUNT(Cust_name) AS StateWiseTotalCustomer, 
       SUM(Amount) AS TotalStateWiseAmount 
FROM diwali_sales_data 
GROUP BY State 
ORDER BY TotalStateWiseAmount DESC;

-- Find the top 5 states by total sales amount
SELECT State, COUNT(Cust_name) AS StateWiseTotalCustomer, 
       SUM(Amount) AS TotalStateWiseAmount, 
       RANK() OVER(ORDER BY SUM(Amount) DESC) AS Ranks 
FROM diwali_sales_data 
GROUP BY State 
LIMIT 5;

-- Analyze total customers by zone
SELECT Zone, COUNT(Cust_name) AS ZoneWiseTotalCustomer 
FROM diwali_sales_data 
GROUP BY Zone 
ORDER BY ZoneWiseTotalCustomer DESC;

-- Analyze total customers and sales amount by zone with rankings
SELECT Zone, COUNT(Cust_name) AS ZoneWiseTotalCustomer, 
       SUM(Amount) AS TotalZoneWiseAmount, 
       RANK() OVER(ORDER BY SUM(Amount) DESC) AS Ranks 
FROM diwali_sales_data 
GROUP BY Zone;

-- Analyze total customers by occupation
SELECT Occupation, COUNT(Cust_name) AS OccupationWiseTotalCustomer 
FROM diwali_sales_data 
GROUP BY Occupation 
ORDER BY OccupationWiseTotalCustomer DESC;

-- Analyze total customers and sales amount by occupation with rankings
SELECT Occupation, COUNT(Cust_name) AS OccupationWiseTotalCustomer, 
       SUM(Amount) AS TotalOccupationWiseAmount, 
       RANK() OVER(ORDER BY SUM(Amount) DESC) AS Ranks 
FROM diwali_sales_data 
GROUP BY Occupation limit 5;
