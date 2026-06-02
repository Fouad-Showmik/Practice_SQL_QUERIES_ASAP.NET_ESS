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
