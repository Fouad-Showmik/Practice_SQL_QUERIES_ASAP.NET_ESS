SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA

--aggregation

--count(*) ==> calculae the total rows of a table including null values

SELECT * FROM Person.Person

SELECT COUNT(*) AS Total
FROM Person.Person

---count(column name) non-nullable rows for a column

SELECT COUNT(AdditionalContactInfo) as ActualContactInfo
FROM Person.Person

---Count(Distinct Column) non-null unique values of a column

SELECT COUNT(DISTINCT City) as UniqueCity
FROM Person.Address

---sum

SELECT * FROM Production.Product

SELECT SUM(ListPrice) as TotalListPrice
FROM Production.Product

--avg

SELECT AVG(ListPrice) AS AverageListPrice
FROM Production.Product


--Min
 SELECT DATA_TYPE
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE COLUMN_NAME = 'Name'

 SELECT MIN(Name)
 FROM Production.Product

 SELECT MIN(ListPrice)
 FROM Production.Product 

 --Max

 SELECT MAX(ListPrice) AS MaximumPrice
 FROM Production.product

 SELECT * FROM Production.Product

 --group by

 SELECT SafetyStockLevel, SUM(ListPrice) AS TotalListPrice
 FROM Production.Product
 GROUP BY SafetyStockLevel


 SELECT SafetyStockLevel, AVG(ListPrice) AS AVGListPrice
 FROM Production.Product
 WHERE ListPrice > 100
 GROUP BY SafetyStockLevel 

 --having
 

 SELECT SafetyStockLevel, SUM(ListPrice) AS TotalListPrice
 FROM Production.Product
 GROUP BY SafetyStockLevel
 HAVING SUM(ListPrice) > 500