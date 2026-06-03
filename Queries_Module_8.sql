--sub queries

--Exists

SELECT * FROM Sales.SalesOrderDetail
SELECT * FROM Sales.SalesOrderHeader

SELECT A.CustomerID, A.CreditCardID, A.SalesOrderID
FROM Sales.SalesOrderHeader AS A
WHERE EXISTS(
	SELECT 1
	FROM Sales.SalesOrderDetail AS B
	WHERE B.SalesOrderID = A.SalesOrderID
)

--not exists
SELECT * FROM HumanResources.Employee
SELECT * FROM Sales.SalesPerson

SELECT 
    A.BusinessEntityID, 
    A.JobTitle
FROM HumanResources.Employee AS A
WHERE NOT EXISTS (
    SELECT 1
    FROM Sales.SalesPerson AS B
    WHERE B.BusinessEntityID = A.BusinessEntityID 
);