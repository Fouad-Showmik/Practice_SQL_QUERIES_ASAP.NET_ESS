---string functions


SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA


SELECT * FROM Person.Address 

--concate (add two or more expressions)

SELECT CONCAT(AddressLine1, StateProvinceID, PostalCode) AS FullAddress 
FROM Person.Address 
ORDER BY AddressLine1


---substring

SELECT * FROM Production.Product

SELECT SUBSTRING(ProductNumber, 4, 7) AS UpdatedName
FROM Production.Product

SELECT SUBSTRING('FLUTTER MOBILE',1,7) AS EXTRACTED

--left

SELECT LEFT(ProductNumber,2) AS ShortProductNumber
FROM Production.Product

--right

SELECT RIGHT(ProductNumber,4) AS ShortProductNumber
FROM Production.Product

--len
SELECT LEN(Name) AS ProductNameLen
FROM Production.Product
ORDER BY Name

--trim --(to remove leading and trailing spaces)
SELECT TRIM(AddressLine1) AS TrimmedAddress
FROM Person.Address

--ltrim
SELECT LTRIM(AddressLine1) AS TrimmedAddress
FROM Person.Address

--rtrim
SELECT RTRIM(AddressLine1) AS TrimmedAddress
FROM Person.Address

---replace ---REPLACE(string, from_string, new_string)

SELECT REPLACE(ProductNumber, '-', '') AS ProductNumber
FROM Production.Product

--replcae permanently--------------------------

UPDATE.Production.Product
SET ProductNumber = REPLACE (ProductNumber, '-', '')



--string split

SELECT AddressLine1
FROM Person.Address
CROSS APPLY string_split(AddressLine1, ' ') AS INITIAL


--string_agg

SELECT * FROM Person.person

SELECT EmailPromotion, STRING_AGG(CAST(FirstName AS varchar(max)), ',') AS UpdatedEmailProm
FROM Person.Person
GROUP BY EmailPromotion






