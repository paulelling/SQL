USE [DigitalStore]

CREATE INDEX IDX_Customers
ON Customers (Last_Name, First_Name, Middle_Name)

DROP INDEX Customers.IDX_Customers

