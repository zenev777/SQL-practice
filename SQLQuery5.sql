SELECT FirstName,LastName FROM Employees
WHERE FirstName LIKE 'Sa%';

SELECT FirstName,LastName FROM Employees
WHERE LastName LIKE '%ei%';

SELECT FirstName, LastName FROM Employees
WHERE DepartmentID IN (3,10) AND HireDate 
BETWEEN '1995-01-01' AND '2005-12-31';

SELECT FirstName, LastName, JobTitle FROM Employees
WHERE JobTitle NOT LIKE '%engineer%';

SELECT [Name] FROM Towns
WHERE LEN([Name]) = 5 OR LEN([Name]) = 6
ORDER BY [Name];

SELECT TownID,[Name] FROM Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name];

SELECT TownID,[Name] FROM Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name];

CREATE VIEW V_EmployeesHiredAfter2000
AS
SELECT FirstName,LastName 
FROM Employees
WHERE HireDate > '2000-12-31';


SELECT FirstName,LastName 
FROM Employees
WHERE LEN(LastName) = 5;

SELECT EmployeeID, FirstName,LastName, Salary,
DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary between 10000 AND 50000
ORDER BY Salary DESC;

