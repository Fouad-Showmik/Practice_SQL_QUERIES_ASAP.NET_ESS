---date & time functions

--getDate

SELECT * FROM Person.Person


SELECT GETDATE() AS CurrentTimeTrack --standard time upto 3 miliseconds


--SysDateTime

SELECT SYSDATETIME() AS CurrentTimeTrack -- return up to 7 places or nano seconds

--dateAdd (add/subtract day, month, year,hour)

SELECT DATEADD (day,7,ModifiedDate) AS UpdateDate
FROM Person.Person

SELECT DATEADD (Month,2,ModifiedDate) AS UpdateDate
FROM Person.Person

SELECT DATEADD (HOUR,2,ModifiedDate) AS UpdateDate
FROM Person.Person


--DATEDIFF (find the diff between two dates)

SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person'
ORDER BY ORDINAL_POSITION

SELECT * FROM Person.Person

SELECT DATEDIFF(YEAR, ModifiedDate, UpdatedModifiedDate) AS YearToUpdate
FROM Person.Person

--DatePart

SELECT DATEPART(Month,ModifiedDate)
FROM Person.Person

--DateName

SELECT DATENAME(Month, ModifiedDate)
FROM Person.Person

--EOMonth

SELECT EOMONTH(ModifiedDate)
FROM PErson.Person

--format

SELECT FORMAT(ModifiedDate, 'dd/mm/yyyy') AS NewFormat
FROM Person.Person

SELECT FORMAT(ModifiedDate, 'MMMM dd yyyy') As NewFormat
FROM Person.Person