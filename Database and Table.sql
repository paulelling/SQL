CREATE DATABASE DigitalStore

DROP DATABASE DigitalStore


USE [DigitalStore]

CREATE TABLE Orders
(
  Order_ID int not null,
  Order_Date datetime not null,
)


USE [DigitalStore]

ALTER TABLE Orders
ADD Customer_ID int not null


USE [DigitalStore]

ALTER TABLE Orders
DROP COLUMN Customer_ID


USE [DigitalStore]

CREATE TABLE OrderDetails
(
  Order_ID int not null,
  Product_ID int not null,
  Quantity int not null
)

