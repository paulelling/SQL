USE [DigitalStore]

CREATE TABLE Customers
(
  Customer_ID int not null,
  First_Name varchar(30) not null,
  Middle_name varchar(30) not null,
  Last_Name varchar(30) not null,
  SSN varchar(9) not null
)

ALTER TABLE Customers
ADD CONSTRAINT PK_Customer PRIMARY KEY (Customer_ID)

ALTER TABLE Customers
ADD CONSTRAINT UK_SSN UNIQUE (SSN)

ALTER TABLE Customers
ADD CONSTRAINT CK_SSN CHECK (IsNumeric(SSN) = 1)


USE [DigitalStore]

CREATE TABLE Products
(
  Product_ID int not null,
  Product_Name varchar(50) not null
)

ALTER TABLE Products
ADD CONSTRAINT PK_Products PRIMARY KEY (Product_ID)

ALTER TABLE Products
ADD CONSTRAINT UK_Products UNIQUE (Product_Name)


USE [DigitalStore]

CREATE TABLE Orders
(
  Order_ID int not null,
  Order_Date datetime not null,
  Customer_ID int not null
)

ALTER TABLE Orders
ADD CONSTRAINT PK_Orders PRIMARY KEY (Order_ID)

ALTER TABLE Orders
ADD CONSTRAINT CK_Order_Date CHECK (IsDate(Order_Date) = 1)


USE [DigitalStore]

CREATE TABLE OrderDetails
(
  Order_ID int not null,
  Product_ID int not null,
  Quantity int not null
)

ALTER TABLE OrderDetails
ADD CONSTRAINT PK_OrderDetails PRIMARY KEY (Order_ID, Product_ID)

ALTER TABLE OrderDetails
ADD CONSTRAINT CK_Quantity CHECK (IsNumeric(Quantity) = 1)


USE [DigitalStore]

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_Order_ID
FOREIGN KEY (Order_ID)
REFERENCES Orders(Order_ID)

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_Product_ID
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID)

ALTER TABLE Orders
ADD CONSTRAINT FK_Customer_ID
FOREIGN KEY(Customer_ID)
REFERENCES Customers(Customer_ID)



