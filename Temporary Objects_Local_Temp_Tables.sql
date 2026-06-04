--local temp table

SELECT * FROM Production.product;
SELECT * FROM Sales.SalesOrderDetail;

CREATE TABLE #ProductSalesLocal(
	ProductID INT,
	Name NVARCHAR(50),
	TotalSales DECIMAL(38, 6),
	CreatedDate DATETIME DEFAULT GETDATE()
	)

	INSERT INTO #ProductSalesLocal(ProductID, Name, TotalSales)
	SELECT 
	P.ProductID,
	P.Name,
	SUM(SOD.LineTotal) AS TotalSales
	FROM Production.Product AS P
	INNER JOIN Sales.SalesOrderDetail AS SOD
		ON P.ProductID = SOD.ProductID
	GROUP BY P.ProductID, P.Name

	SELECT * FROM #ProductSalesLocal

