---filtered index

SELECT * FROM HumanResources.Employee;

CREATE NONCLUSTERED INDEX Info
ON HumanResources.Employee(JobTitle)
Include(NationalIDNumber, MaritalStatus)

SELECT NationalIDNumber, MaritalStatus
FROM HumanResources.Employee
WHERE JobTitle = 'Research and Development Manager';

SELECT COUNT(JobTitle)
FROM HumanResources.Employee
WHERE JobTitle = 'Research and Development Manager'


