-- create login to SQL Server
CREATE LOGIN [Backlog] WITH PASSWORD=N'*******', DEFAULT_DATABASE=[DBS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
 
-- create database user and associate with SQL Server login 
CREATE USER [Backlog] FOR LOGIN [Backlog] WITH DEFAULT_SCHEMA=[dbo]
GO
 
-- grant permissions to database user
GRANT permission ON object TO user
GO
