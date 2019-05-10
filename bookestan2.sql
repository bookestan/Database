CREATE DATABASE Bookestan
GO
USE Bookestan
GO
CREATE TABLE Books
(
	ID INT PRIMARY KEY IDENTITY,
	Mobile NVARCHAR(50),
	Univercity NVARCHAR(150),
	FName NVARCHAR(50),
	Price Decimal,
	CreateDate DATETIME2,
	ImageFile VARBINARY(MAX),
	StatusBook BIT
)
GO
-- create sp for paging 
GO
CREATE PROC USP_Pager
	@PageNumber INT,
	@RowCount INT
AS
BEGIN
	SELECT *
	FROM
		(
			SELECT ROW_NUMBER()
			OVER(ORDER BY id)'Row',*
			FROM Bookestan.dbo.Books
		)AS Data
	WHERE [Row]
	BETWEEN (@PageNumber-1)*@RowCount+1
	AND @PageNumber*@RowCount
END
