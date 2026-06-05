--included Columns

SELECT * FROM Production.Product;

CREATE NONCLUSTERED INDEX Info
ON Production.Product(SafetyStockLevel)
INCLUDE(ReorderPoint);

SELECT ProductID, ReorderPoint
FROM Production.Product


--To prevent Key look up for ReorderPoint. Attaching ReorderPoint as Include says the server, to look at it, after finishes the sorting. No need to go and look up the table. 