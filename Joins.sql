SELECT TOP(5) e.EmployeeID,e.JobTitle,a.AddressID,a.AddressText 
FROM Employees AS e
INNER JOIN Addresses AS a
ON E.AddressID = a.AddressID
ORDER BY AddressID ASC;


SELECT TOP(50) e.FirstName,e.LastName,t.Name,a.AddressText 
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
ORDER BY e.FirstName,e.LastName;

SELECT e.EmployeeID,e.FirstName,e.LastName,d.[Name] AS DepartmentName 
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID AND d.[Name] = 'Sales'
ORDER BY e.EmployeeID ASC;


SELECT TOP(5) e.EmployeeID,e.FirstName,e.Salary,d.[Name] AS DepartmentName 
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID AND e.Salary > 15000
ORDER BY e.DepartmentID;

--SELECT TOP(3) e.EmployeeID,e.FirstName
--FROM Employees AS e
--LEFT JOIN EmployeesProjects AS p ON e.EmployeeID = p.EmployeeID
--LEFT JOIN Projects AS t ON p.ProjectID = t.ProjectID 
--ORDER BY EmployeeID;


SELECT e.FirstName,e.LastName,e.HireDate,d.[Name] AS DeptName 
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID AND e.HireDate >'1/1/1999' AND d.[Name] IN ('Sales','Finance')
ORDER BY e.HireDate;


--SELECT TOP(5) e.EmployeeID,e.FirstName, t.[Name] AS ProjectName
--FROM Employees AS e
--JOIN EmployeesProjects AS p ON e.EmployeeID = p.EmployeeID
--JOIN Projects AS t ON p.ProjectID = t.ProjectID  
--AND t.StartDate > '13/8/2002'
--AND t.EndDate = NULL
--ORDER BY e.EmployeeID;

SELECT e.EmployeeID,e.FirstName,t.[Name] AS ProjectName 
FROM Employees AS e
JOIN EmployeesProjects AS p ON e.EmployeeID = p.EmployeeID
JOIN Projects AS t ON p.ProjectID = t.ProjectID 
WHERE e.EmployeeID= 24


