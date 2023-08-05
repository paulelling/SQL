USE [DigitalStore]

INSERT INTO Orders (Order_ID, Order_Date, Customer_ID) VALUES (1, '7/1/2010', 1)

INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity) VALUES (1, 1, 10)


USE [DigitalStore]

SELECT TOP 50
Order_ID, Order_Date, Customer_ID
FROM Orders

SELECT TOP 50
Order_ID, Product_ID, Quantity
FROM OrderDetails


USE [DigitalStore]

UPDATE OrderDetails
SET Quantity = 20
WHERE Order_ID = 1


USE [DigitalStore]

DELETE FROM OrderDetails WHERE Order_ID = 1
