
--Basic CTE


SELECT * FROM Production.TransactionHistory;


/*SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA*/

WITH ProductCostSummary AS(
	SELECT ProductID,
	SUM(ActualCost) AS TotalCost
	FROM Production.TransactionHistory
	GROUP BY ProductID
)

SELECT TOP 50
	P.ProductID,
	P.Name,
	T.TotalCost
	FROM ProductCostSummary AS T
	INNER JOIN Production.Product AS P
		ON T.ProductID = P.ProductID
	ORDER BY T.TotalCost DESC



SELECT * FROM Production.Product;
SELECT * FROM Purchasing.PurchaseOrderDetail;

WITH ProfitSummary AS (
	SELECT 
	ProductID,
	SUM(CAST(LineTotal AS NUMERIC) - UnitPrice) AS NetProfit
	FROM Purchasing.PurchaseOrderDetail
	GROUP BY ProductID
)

SELECT 
	PS.ProductID,
	PT.NAME,
	PS.NetProfit,
	PT.ProductNumber
	FROM ProfitSummary AS PS
	INNER JOIN Production.Product AS PT
		ON PS.ProductID = PT.ProductID
	ORDER BY PS.NetProfit DESC;


