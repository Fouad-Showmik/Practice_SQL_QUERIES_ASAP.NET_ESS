--comparison operators 
-- ==
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Product' ORDER BY ORDINAL_POSITION

SELECT ProductNumber FROM Production.Product

SELECT NAME, COLOR, SIZE FROM Production.product WHERE ProductNumber = 'FR-M63S-40'

SELECT Color FROM Production.product

SELECT TOP 20 Name, ProductID FROM Production.Product Where Color = 'black'

--<> or not !=

SELECT Color,ProductID FROM Production.Product WHERE Color != 'Black'
SELECT Color,ProductID FROM Production.Product WHERE Color <> 'Black'
 
-- other comparison operators

SELECT Name, ListPrice FROM Production.product Where ListPrice >= 500

SELECT Name, Color FROM Production.Product Where Color ='Black' or Color ='Red'

SELECT Name, Color FROM Production.Product Where Color = 'Black' and Color = 'Red'

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Employee' ORDER BY ORDINAL_POSITION

SELECT DISTINCT JobTitle FROM HumanResources.Employee ORDER BY JobTitle

SELECT LoginID, JobTitle FROM HumanResources.Employee WHERE NOT JobTitle = 'Buyer' ORDER BY JobTitle

----In

SELECT NationalIDNumber, JobTitle FROM HumanResources.Employee WHERE JobTitle IN('Stocker','Tool Designer','Tool Designer')

----between (the range where start and endpoint is included)
SELECT Name, ListPrice FROM Production.Product Where ListPrice Between 200 and 1000

--- like

Select COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ProductDescription'

SELECT Description FROM Production.ProductDescription ORDER BY Description

SELECT Description, ProductDescriptionID FROM Production.ProductDescription WHERE Description LIKE 'Affordable%'

SELECT Description FROM Production.ProductDescription WHERE Description LIKE ('Affordable%') OR Description LIKE ('Le%')

SELECT Description FROM Production.ProductDescription WHERE Description LIKE ('Acier%') and Description LIKE ('Affordable%')

--IS NULL / IS NOT NULL

SELECT ProductID,Color FROM Production.Product Where Color IS NUll

SELECT Size FROM Production.Product

SELECT ProductID, Color, Size FROM Production.product WHERE Color IS NOT NULL AND Size Between '40' AND '60' 

 -- Exists

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Customer' ORDER BY ORDINAL_POSITION

SELECT COLUMN_NAME , DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'PurchaseOrderDetail' ORDER BY ORDINAL_POSITION


SELECT * FROM Purchasing.PurchaseOrderDetail

SELECT * FROM Production.Product



SELECT Name
FROM Production.Product 
WHERE EXISTS(
	SELECT ProductID
	FROM Purchasing.PurchaseOrderDetail
	Where PurchaseOrderDetail.ProductID = Production.Product.ProductID AND UnitPrice>5
)

SELECT Name
FROM Production.Product
WHERE EXISTS(
	SELECT 1 
	FROM Purchasing.PurchaseOrderDetail
	WHERE Production.Product.ProductID = PurchaseOrderDetail.ProductID AND StockedQty > 100
)


--Arithmetic operation

SELECT ProductID, ReceivedQty - (RejectedQty+StockedQty) AS Remain
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice <50

SELECT ProductID, (ListPrice/StandardCost) AS Profit FROM Production.Product  WHERE NOT StandardCost = '0'


---------------------Set
--Union (Remove Duplicates)

SELECT UnitPrice AS NewPrice FROM Purchasing.PurchaseOrderDetail 
UNION
SELECT  ListPrice FROM Production.Product

--unionAll(Keep the duplicates)

SELECT UnitPrice AS NewPrice FROM Purchasing.PurchaseOrderDetail 
UNION ALL
SELECT  ListPrice FROM Production.Product


--intersect(if the rows of 2 column queries match otherwise discarded)

SELECT * FROM Sales.Customer

SELECT ProductID, ModifiedDate FROM Production.Product
INTERSECT
SELECT CustomerID, ModifiedDate FROM Sales.Customer


--except (if a row is available on both queries, just discarded it. Otherwise, just show the row of the 1st query or circle if the row is not available on the second query or circle)
SELECT ProductID, ModifiedDate FROM Production.Product
EXCEPT
SELECT CustomerID, ModifiedDate FROM Sales.Customer