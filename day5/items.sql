USE College;

CREATE TABLE Items (
    Item_ID INT PRIMARY KEY,
    Item_Name VARCHAR(50) NOT NULL,
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Quantity INT,
    Supplier_Name VARCHAR(50),
    Purchase_Date DATE,
    Status VARCHAR(20)
);

INSERT INTO Items VALUES
(1, 'Laptop', 'Electronics', 55000, 10, 'ABC Traders', '2026-01-10', 'Available'),
(2, 'Mouse', 'Accessories', 500, 50, 'XYZ Suppliers', '2026-01-12', 'Available'),
(3, 'Keyboard', 'Accessories', 1200, 30, 'ABC Traders', '2026-01-15', 'Unavailable'),
(4, 'Printer', 'Electronics', 15000, 5, 'Tech World', '2026-01-18', 'Available'),
(5, 'Chair', 'Furniture', 2500, 20, 'Office Mart', '2026-01-20', 'Out of Stock'),
(6, 'Table', 'Furniture', 4500, 15, 'Home Decor', '2026-02-01', 'Available'),
(7, 'Monitor', 'Electronics', 12000, 12, 'Tech World', '2026-02-05', 'Unavailable'),
(8, 'Headphones', 'Accessories', 1800, 25, 'Sound Hub', '2026-02-08', 'Pending'),
(9, 'Mobile', 'Electronics', 25000, 8, 'ABC Traders', '2026-02-10', 'Available'),
(10, 'USB Cable', 'Accessories', 250, 100, 'XYZ Suppliers', '2026-02-12', 'Out of Stock'),
(11, 'Notebook', 'Stationery', 80, 200, 'Paper House', '2026-02-15', 'Available'),
(12, 'Pen', 'Stationery', 20, 500, 'Paper House', '2026-02-18', 'Unavailable'),
(13, 'Scanner', 'Electronics', 8500, 6, 'Tech World', '2026-03-01', 'Available'),
(14, 'Bookshelf', 'Furniture', 6000, 4, 'Office Mart', '2026-03-05', 'Discontinued'),
(15, 'Webcam', 'Accessories', 2200, 18, 'Sound Hub', '2026-03-08', 'Available'),
(16, 'Tablet', 'Electronics', 30000, 7, 'ABC Traders', '2026-03-10', 'Pending'),
(17, 'Office Desk', 'Furniture', 7500, 9, 'Home Decor', '2026-03-12', 'Available'),
(18, 'Marker', 'Stationery', 50, 150, 'Paper House', '2026-03-15', 'Out of Stock'),
(19, 'Speaker', 'Accessories', 3500, 14, 'Sound Hub', '2026-03-18', 'Discontinued'),
(20, 'Projector', 'Electronics', 40000, 3, 'Tech World', '2026-03-20', 'Available');
SELECT * FROM Items;
SELECT Item_Name, Category
FROM Items;
SELECT *
FROM Items
WHERE Status = 'Available';
SELECT Item_Name, Category, Price * Quantity AS tot_amount
FROM Items;
SELECT *
FROM Items
WHERE Supplier_Name = 'ABC Traders';
SELECT
    MIN(Price) AS Minimum_Price,
    MAX(Price) AS Maximum_Price,
    AVG(Price) AS Average_Price
FROM Items;
SELECT COUNT(*) AS Out_of_Stock_Count
FROM Items
WHERE Status = 'Out of Stock';
SELECT *FROM items WHERE price >= 100 AND price <= 200;
SELECT *
FROM Items
WHERE Status IN ('Available', 'Pending');
SELECT *
FROM Items
WHERE Item_Name LIKE '%L';
SELECT *
FROM Items
WHERE Item_Name LIKE 'L%';
SELECT *
FROM Items
WHERE Item_Name LIKE '%L%';
SELECT *
FROM Items
WHERE Address LIKE '%pune%';
SELECT *
FROM Items
WHERE Supplier_Name LIKE '%ABC%';
SELECT *
FROM Items
ORDER BY Item_Name ASC;
SELECT *
FROM Items
ORDER BY Item_Name DESC;

-- Display items supplied by ABC Traders
SELECT *
FROM Items
WHERE Supplier_Name = 'ABC Traders';

-- Display items whose status is Available
SELECT *
FROM Items
WHERE Status = 'Available';

-- Display items with price equal to 2500
SELECT *
FROM Items
WHERE Price = 2500;

-- Display Electronics items with price greater than 10000
SELECT *
FROM Items
WHERE Category = 'Electronics'
AND Price > 10000;

-- Display items belonging to Furniture or Stationery
SELECT *
FROM Items
WHERE Category = 'Furniture'
OR Category = 'Stationery';

-- Display items whose status is not Available
SELECT *
FROM Items
WHERE NOT Status = 'Available';

-- Display items with price above 1000 and quantity above 10
SELECT *
FROM Items
WHERE Price > 1000
AND Quantity > 10;

-- Display items with price between 1000 and 10000
SELECT *
FROM Items
WHERE Price BETWEEN 1000 AND 10000;

-- Display items with quantity between 10 and 50
SELECT *
FROM Items
WHERE Quantity BETWEEN 10 AND 50;

-- Display items purchased between February 1 and March 1
SELECT *
FROM Items
WHERE Purchase_Date BETWEEN '2026-02-01' AND '2026-03-01';

-- Display items whose price is outside the range 500 to 5000
SELECT *
FROM Items
WHERE Price NOT BETWEEN 500 AND 5000;

-- Display items belonging to selected categories
SELECT *
FROM Items
WHERE Category IN ('Electronics', 'Furniture', 'Accessories');

-- Display items supplied by ABC Traders, Tech World or Sound Hub
SELECT *
FROM Items
WHERE Supplier_Name IN ('ABC Traders', 'Tech World', 'Sound Hub');

-- Display items with Available, Pending or Unavailable status
SELECT *
FROM Items
WHERE Status IN ('Available', 'Pending', 'Unavailable');

-- Display items excluding Electronics and Furniture
SELECT *
FROM Items
WHERE Category NOT IN ('Electronics', 'Furniture');

-- Display items whose name starts with M
SELECT *
FROM Items
WHERE Item_Name LIKE 'M%';

-- Display items whose name ends with r
SELECT *
FROM Items
WHERE Item_Name LIKE '%r';

-- Display items whose name contains oo
SELECT *
FROM Items
WHERE Item_Name LIKE '%oo%';

-- Display items whose name starts with S
SELECT *
FROM Items
WHERE Item_Name LIKE 'S%';

-- Display suppliers whose name starts with A
SELECT *
FROM Items
WHERE Supplier_Name LIKE 'A%';

-- Display items whose name contains exactly 5 characters
SELECT *
FROM Items
WHERE Item_Name LIKE '_____';

-- Display items where supplier name is NULL
SELECT *
FROM Items
WHERE Supplier_Name IS NULL;

-- Display items where status is not NULL
SELECT *
FROM Items
WHERE Status IS NOT NULL;

-- Display items where price is NULL
SELECT *
FROM Items
WHERE Price IS NULL;

-- Display items where quantity is not NULL
SELECT *
FROM Items
WHERE Quantity IS NOT NULL;

-- Display all items in ascending order of price
SELECT *
FROM Items
ORDER BY Price ASC;

-- Display all items in descending order of quantity
SELECT *
FROM Items
ORDER BY Quantity DESC;

-- Display Electronics items with price between 10000 and 50000
SELECT *
FROM Items
WHERE Category = 'Electronics'
AND Price BETWEEN 10000 AND 50000;

-- Display available items supplied by ABC Traders
SELECT *
FROM Items
WHERE Supplier_Name = 'ABC Traders'
AND Status = 'Available';

-- Display items starting with P and price greater than 1000
SELECT *
FROM Items
WHERE Item_Name LIKE 'P%'
AND Price > 1000;

-- Display the top 5 most expensive items
SELECT *
FROM Items
ORDER BY Price DESC
LIMIT 5;

-- Display items in descending order of purchase date
SELECT *
FROM Items
ORDER BY Purchase_Date DESC;

UPDATE Items
SET Quantity = Quantity + 5
WHERE Item_Name = 'Laptop';

UPDATE Items
SET Status = 'Pending'
WHERE Supplier_Name = 'ABC Traders';

UPDATE Items
SET Price = Price + 500,
    Quantity = Quantity - 2
WHERE Item_ID = 20;