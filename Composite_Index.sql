---composite index

-- A simple index contains two or more columns.
SELECT * FROM HumanResources.Department;

CREATE NONCLUSTERED INDEX DepGroupInfo
ON HumanResources.Department(DepartmentID, Name);

SELECT GroupName
FROM HumanResources.Department

---Physically sorting the rows using clustered index and column Name


--DROP INDEX DepGroupInfo ON HumanResources.Department