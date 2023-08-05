USE [DigitalStore]

--INSERT INTO Orders (Order_ID, Order_Date, Customer_ID) VALUES (2, '7/2/2010', 2)

SELECT 'Inner Join: only includes rows that match on both sides of the join'
SELECT TOP 50 
ORS.Order_ID, 
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM Orders ORS
INNER JOIN OrderDetails DETS ON ORS.Order_ID = DETS.Order_ID

SELECT 'Left Outer Join: includes rows from the left side of the join and matching rows from the right side of the join'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM Orders ORS
LEFT OUTER JOIN OrderDetails DETS ON ORS.Order_ID = DETS.Order_ID

SELECT 'Right Outer Join: includes rows from the right side of the join and matching rows from the left side of the join'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM Orders ORS
RIGHT OUTER JOIN OrderDetails DETS ON ORS.Order_ID = DETS.Order_ID

SELECT 'Left Outer Join: switching fields in the ON clause does not affect which rows are returned'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM Orders ORS
LEFT OUTER JOIN OrderDetails DETS ON DETS.Order_ID = ORS.Order_ID

SELECT 'Right Outer Join: switching fields in the ON clause does not affect which rows are returned'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM Orders ORS
RIGHT OUTER JOIN OrderDetails DETS ON DETS.Order_ID = ORS.Order_ID

SELECT 'Left Outer Join: includes rows from the left side of the join and matching rows from the right side of the join'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM OrderDetails DETS
LEFT OUTER JOIN Orders ORS ON DETS.Order_ID = ORS.Order_ID

SELECT 'Right Outer Join: includes rows from the right side of the join and matching rows from the left side of the join'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM OrderDetails DETS
RIGHT OUTER JOIN Orders ORS ON DETS.Order_ID = ORS.Order_ID

SELECT 'Left Outer Join: switching fields in the ON clause does not affect which rows are returned'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM OrderDetails DETS
LEFT OUTER JOIN Orders ORS ON ORS.Order_ID = DETS.Order_ID

SELECT 'Right Outer Join: switching fields in the ON clause does not affect which rows are returned'
SELECT TOP 50
ORS.Order_ID,
ORS.Order_Date,
ORS.Customer_ID,
DETS.Order_ID,
DETS.Product_ID,
DETS.Quantity
FROM OrderDetails DETS
RIGHT OUTER JOIN Orders ORS ON ORS.Order_ID = DETS.Order_ID



USE [DigitalStore]

SELECT
ORD.Order_ID, ORD.Order_Date, ORD.Customer_ID
, DETS.Order_ID, DETS.Product_ID, DETS.Quantity
FROM Orders ORD
CROSS JOIN OrderDetails DETS


SELECT
ORD.Order_ID, ORD.Order_Date, ORD.Customer_ID
FROM Orders ORD
UNION all
select DETS.Order_ID, DETS.Product_ID, DETS.Quantity
from OrderDetails DETS



