-- Day - 3:

-- 1. Create SQ_Products Table:
CREATE TABLE SQ_Products (
	Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(100),
    Price INT
);

-- 2. Insert Records Into a Table SQ_Products:
INSERT INTO SQ_Products (Product_ID, Product_Name, Category, Price) VALUES
(1, 'iPhone 14', 'Electronics', 70000),
(2, 'Samsung Galaxy', 'Electronics', 55000),
(3, 'Bluetooth Headset','Electronics', 3000),
(4, 'Laptop Bag', 'Accessories', 1500),
(5, 'Wireless Mouse', 'Accessories', 1200),
(6, 'Mechanical Keyboard','Accessories', 4500),
(7, 'Running Shoes', 'Footwear', 2500),
(8, 'Formal Shoes', 'Footwear', 3500),
(9, 'Sandals', 'Footwear', 1200);

-- 3. Fetch All Records:
SELECT * FROM SQ_Products;

-- TASK - 1: Using Correlated Sub-Query Find a Products Priced Above Their Category's Average.
SELECT
	P1.Product_ID,
    P1.Product_Name,
    P1.Category,
    P1.Price
FROM SQ_Products P1
WHERE P1.Price > (
		SELECT
			AVG(P2.Price) AS Category_Average_Price
		FROM SQ_Products P2
		WHERE P2.Category = P1.Category
);

-- TASK - 2: Using CTE Find a Products Priced Above Their Category's Average.
WITH Category_Average_Price AS (
	SELECT
		Product_ID,
        Product_Name,
		Category,
        Price,
        AVG(Price) OVER (PARTITION BY Category)AS Category_Average_Price
	FROM SQ_Products
)
SELECT
	Product_ID,
    Product_Name,
    Category,
    Price
FROM Category_Average_Price
WHERE Price > Category_Average_Price;

-- TASK - 3: Using WINDOW FUNCTION Find a Products Priced Above Their Category's Average.
SELECT
	Product_ID,
    Product_Name,
    Category,
    Price
FROM (
	SELECT
		Product_ID,
        Product_Name,
        Category,
        Price,
        AVG(Price) OVER (PARTITION BY Category) AS Category_Average_Price
	FROM SQ_Products
)t
WHERE Price > Category_Average_Price;