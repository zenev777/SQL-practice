SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID;

SELECT DepartmentID, MIN(Salary) AS MinSalary
FROM Employees
WHERE DepartmentID IN(2, 5, 7) AND HireDate > '01/01/2000'
GROUP BY DepartmentID
ORDER BY DepartmentID;


SELECT DepartmentID, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) < 30000 OR MAX(Salary) > 70000;


SELECT COUNT(Salary) AS [Count]
FROM employees
WHERE ManagerID IS NULL;
