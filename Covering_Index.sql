--Covering Index

--A simple type of non clustered index where sql server call query without touching the actual table. It uses the index answer the query.

SELECT * FROM Production.Product;

CREATE NONCLUSTERED INDEX ProductInfo
ON Production.Product(ProductID, ProductNumber, Color)

SELECT Name
FROM Production.Product
WHERE Color IS NOT NULL

--DROP INDEX ProductInfo ON Production.product
