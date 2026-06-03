--join

-----inner join

SELECT * FROM Purchasing.PurchaseOrderDetail
SELECT * FROM Production.Product

SELECT P.ProductID, P.Name, P.Class 
FROM Production.Product AS P
INNER JOIN Purchasing.PurchaseOrderDetail AS Pur 
	ON Pur.ProductID = P.ProductID 
	WHERE P.Class IS NOT NULL



SELECT Pro.ProductID, Pro.Name, Pro.Color, Pro.Class , Pur.OrderQty, Pur.RejectedQty
FROM Production.Product AS Pro
INNER JOIN Purchasing.PurchaseOrderDetail AS Pur
	ON Pur.ProductID = Pro.ProductID WHERE Pro.Class IS NOT NULL AND Pro.Color IS NOT NULL

-----left join

SELECT Pur.ProductID, Pur.UnitPrice, Pro.Name,Pro.Color
FROM Purchasing.PurchaseOrderDetail AS Pur
LEFT OUTER JOIN Production.Product AS Pro
	ON Pur.ProductID = Pro.ProductID


	SELECT TABLE_SCHEMA, TABLE_NAME
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_TYPE = 'BASE TABLE'
	ORDER BY TABLE_SCHEMA


SELECT * FROM HumanResources.Department
SELECT * FROM HumanResources.EmployeeDepartmentHistory


---right join

SELECT ED.DepartmentID, D.Name
FROM HumanResources.EmployeeDepartmentHistory as ED
RIGHT OUTER JOIN HumanResources.Department as D
	ON D.DepartmentID = ED.DepartmentID


--self Join

SELECT * FROM Purchasing.Vendor

SELECT PrevEntry.BusinessEntityID AS PreviousEmployeeID,
		PrevEntry.ModifiedDate AS PreviousModifiedDate,
		NextEntry.BusinessEntityID AS NextEmployeeID,
		NextEntry.ModifiedDate AS NextModifiedDate
		
		FROM HumanResources.EmployeeDepartmentHistory as PrevEntry
			INNER JOIN HumanResources.EmployeeDepartmentHistory as NextEntry
			ON PrevEntry.DepartmentID = NextEntry.DepartmentID
			AND NextEntry.ModifiedDate = DATEADD(day, 7 , PrevEntry.ModifiedDate)


