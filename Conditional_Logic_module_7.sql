--Conditional Logic

--case == good for multi layered logic

select * from Person.Person

SELECT DISTINCT EmailPromotion
FROM Person.Person

SELECT BusinessEntityID, FirstName, EmailPromotion,
CASE 
	WHEN EmailPromotion = 0 THEN 'No Promotion'
	WHEN EmailPromotion = 1 THEN 'Internal Promotion'
	WHEN EmailPromotion = 2 THEN 'All Promotion'
	ELSE 'Unknow'
END AS PromotionStatus
FROM Person.Person

SELECT * FROM Production.Product

SELECT DISTINCT SafetyStockLevel
FROM Production.Product


SELECT ProductID, Name, SafetyStockLevel,
CASE
	WHEN SafetyStockLevel = 4 THEN 'Low'
	WHEN SafetyStockLevel = 60 THEN 'Moderate'
	WHEN SafetyStockLevel = 100 THEN 'High'
	WHEN SafetyStockLevel = 500 THEN 'Moderate High'
	WHEN SafetyStockLevel = 800 THEN 'Extreme High'
	WHEN SafetyStockLevel = 1000 THEN 'Extreme'
	ELSE 'Unknown'
END AS SafetyStatus
FROM Production.Product


--iif (condition, true, false)

SELECT FirstName,
IIF(EmailPromotion = 0, 'Probation', 'Permanent') AS Identifier
FROM Person.Person


--ISNULL (Take one argument and fallback)
SELECT * FROM Production.Product

SELECT ProductID, ISNULL(Color, 'Default') AS CleanedColor
FROM Production.Product


SELECT ProductId,
	ISNULL(Size, 'Default') AS CleanedSize
FROM Production.Product


---coalesce == takes multiple argument

SELECT  FirstName,
COALESCE(Title, MiddleName, 'N/A') AS NewTable
From Person.Person

---NullIF ==opposite of IsNUll

SELECT ProductID, Name, 
NULLIF(ListPrice, StandardCost) AS Profit
FROM Production.Product