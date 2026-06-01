--select
SELECT FirstName, MiddleName, LastName
FROM Person.Person

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION

SELECT StandardCost, ListPrice
FROM Production.Product


--where

SELECT ListPrice
FROM Production.product
WHERE ListPrice>200