-- Day - 4:

-- 1. Create a SQ_Customers Table:
CREATE TABLE SQ_Customers (
	Customer_ID INT,
    Customer_Name VARCHAR(100)
);

-- 2. Insert Records Into a Table SQ_Customers:
INSERT INTO SQ_Customers (Customer_ID, Customer_Name) VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Sneha'),
(5, 'Karan');

-- 3. Create a SQ_Orders Table:
CREATE TABLE SQ_Orders (
	Order_ID INT,
    Customer_ID INT,
    Amount INT
);

-- 4. Insert a Records Into a Table SQ_Orders:
INSERT INTO SQ_Orders (Order_ID, Customer_ID, Amount) VALUES
(101, 1, 1200),
(102, 1, 1800),
(103, 2, 500),
(104, 2, 700),
(105, 3, 3000),
(106, 3, 2500),
(107, 4, 900),
(108, 5, 1500),
(109, 5, 1700);

-- 5. Fetch All Records From The Table SQ_Customers:
SELECT * FROM SQ_Customers;

-- 5. Fetch All Records From The Table SQ_Orders:
SELECT * FROM SQ_Orders;

-- TASK - 1: Find a Customers Whose Total Spend is Above The Overall Average Customer Spend:
SELECT
	C.Customer_ID,
    C.Customer_Name,
    SUM(O.Amount) AS Total_Spend
FROM SQ_Customers C
JOIN SQ_Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
HAVING SUM(O.Amount) > (
				SELECT
					AVG(Total_Customer_Spend)
				FROM (
						SELECT 
							Customer_ID,
							SUM(AMOUNT) AS Total_Customer_Spend
						FROM SQ_Orders
						GROUP BY Customer_ID
					) AS T
);

-- TASK - 2: Using CTE Find a Customers Whose Total Spend is Above The Overall Average Customer Spend:
WITH Customer_Spend AS (
    SELECT 
        C.Customer_ID,
        C.Customer_Name,
        SUM(O.Amount) AS Total_Spend
    FROM SQ_Customers C
    JOIN SQ_Orders O
        ON C.Customer_ID = O.Customer_ID
    GROUP BY C.Customer_ID, C.Customer_Name
)

SELECT *
FROM Customer_Spend
WHERE Total_Spend > (
    SELECT AVG(Total_Spend)
    FROM Customer_Spend
);
