---Clustered Index
SELECT * FROM Person.Person
---Person table already has one clustered index (Pk_BusinessEntityID) which is unique and sorted.
---The actual data row of Person table is already sorted through (Pk_BusinessEntityID).
---One table can only have one clustered index.

-----Non-Clustered Index

SELECT * FROM HumanResources.Employee;


CREATE NONCLUSTERED INDEX EmployeeInfo
ON HumanResources.Employee(JobTitle);

SELECT BusinessEntityID, HireDate
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'; 

--DROP INDEX EmployeeInfo ON HumanResources.Employee

