
--multiple CTE

SELECT * FROM Production.ProductInventory;

WITH InventoryAnalysis AS(
	SELECT 
		ProductID,
		SUM(Quantity) AS TotalQuantity
		FROM Production.ProductInventory
		GROUP BY ProductID
),

PricingAnalysis AS (
	SELECT
	Price.ProductID,
	SUM(Price.ListPrice * InventAs.TotalQuantity) AS TotalCost
	FROM Production.ProductListPriceHistory AS Price
	INNER JOIN InventoryAnalysis AS InventAs
		ON InventAs.ProductID = Price.ProductID
		GROUP BY Price.ProductID
),

ProfitAnalysis AS (
	SELECT 
	ProductID,
	SUM(ActualCost*Quantity) AS SellingCost
	FROM Production.TransactionHistory
	GROUP BY ProductID
)

SELECT
ProfitAnalysis.ProductID,
Production.product.Name,
ROUND(SUM(ProfitAnalysis.SellingCost - PricingAnalysis.TotalCost), 3) AS FinalProfit
FROM ProfitAnalysis 
INNER JOIN PricingAnalysis 
	ON ProfitAnalysis.ProductID = PricingAnalysis.ProductID
INNER JOIN Production.Product 
	ON ProfitAnalysis.ProductID = Production.Product.ProductID
GROUP BY ProfitAnalysis.ProductID, Production.product.Name