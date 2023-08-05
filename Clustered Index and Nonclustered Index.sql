SET NOCOUNT ON;
USE tempdb;
GO

-- Helper function GetNums to generate a sequence of numbers
IF OBJECT_ID('dbo.GetNums') IS NOT NULL DROP FUNCTION dbo.GetNums;
GO
CREATE FUNCTION dbo.GetNums(@n AS BIGINT) RETURNS TABLE
AS
RETURN
  WITH
  L0   AS(SELECT 1 AS c UNION ALL SELECT 1),
  L1   AS(SELECT 1 AS c FROM L0 AS A CROSS JOIN L0 AS B),
  L2   AS(SELECT 1 AS c FROM L1 AS A CROSS JOIN L1 AS B),
  L3   AS(SELECT 1 AS c FROM L2 AS A CROSS JOIN L2 AS B),
  L4   AS(SELECT 1 AS c FROM L3 AS A CROSS JOIN L3 AS B),
  L5   AS(SELECT 1 AS c FROM L4 AS A CROSS JOIN L4 AS B),
  Nums AS(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS n FROM L5)
  SELECT TOP (@n) n FROM Nums ORDER BY n;
GO



-- Create a table called T1 and populate it with sample data
IF OBJECT_ID('dbo.T1', 'U') IS NOT NULL DROP TABLE dbo.T1;

CREATE TABLE dbo.T1
(
  col1   INT IDENTITY NOT NULL,
  col2   VARCHAR(100) NOT NULL,
  filler CHAR(2000) NULL,
  CONSTRAINT PK_T1 PRIMARY KEY CLUSTERED(col1)
);

INSERT INTO dbo.T1(col2)
  SELECT 'String ' + CAST(n AS VARCHAR(10))
  FROM dbo.GetNums(100) AS Nums;
GO




-- Test 2, with ORDER BY, after adding covering nc index
CREATE NONCLUSTERED INDEX idx_nc_col2 ON dbo.T1(col2, col1);
GO


DECLARE @s AS VARCHAR(MAX);
SET @s = '';

SELECT @s = @s + col2 + ';'
FROM dbo.T1
ORDER BY col1;

SELECT @s;




select *
from t1



