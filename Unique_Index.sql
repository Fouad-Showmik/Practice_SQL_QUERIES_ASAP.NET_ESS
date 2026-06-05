----Unique Index


--SELECT * FROM Person.Person

CREATE UNIQUE NONCLUSTERED INDEX Info
ON Person.Person(rowguid)

SELECT BusinessEntityID, rowguid
FROM Person.Person

---It ensure unique rowguid 