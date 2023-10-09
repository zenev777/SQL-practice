CREATE OR Alter PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
 SELECT FirstName AS [First Name], LastName AS [Last Name]
 FROM Employees
 WHERE Salary >= 35000;

 ----------------------------------------------------------------

CREATE OR ALTER PROCEDURE usp_GetEmployeesSalaryAboveNumber 
(@SalaryThreshold DECIMAL(18, 4))
AS
BEGIN
    SELECT FirstName, LastName
    FROM Employees
    WHERE Salary >= @SalaryThreshold;
END;

-----------------------------------------------------------------

CREATE OR ALTER PROCEDURE usp_GetTownsStartingWith 
(@Town VARCHAR(50))
AS
BEGIN
    SELECT [NAME] AS Town
    FROM Towns
	WHERE LEFT([Name], LEN(@Town)) = @Town
END;

-----------------------------------------------------------------

CREATE OR ALTER PROCEDURE usp_GetEmployeesFromTown
(@Town VARCHAR(50))
AS
BEGIN
    SELECT FirstName AS [First Name], LastName AS [Last Name]
    FROM Employees AS e
	JOIN Addresses AS a ON e.AddressID=a.AddressID
	JOIN Towns AS t ON a.TownID = t.TownID AND t.[Name]= @Town
END;

------------------------------------------------------------------

CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(7)
AS
BEGIN
 DECLARE @salaryLevel VARCHAR(7)

  IF(@salary<30000) 
	SET @salaryLevel = 'Low'  
  ELSE IF(@salary<=50000) 
	SET @salaryLevel = 'Average'
  ELSE 
	SET @salaryLevel= 'High'

  RETURN @salaryLevel
END;

SELECT 
	Salary
	,dbo.ufn_GetSalaryLevel ([Salary]) AS SalaryLevel
FROM [Employees]

----------------------------------------------------------

CREATE PROCEDURE usp_EmployeesBySalaryLevel
    @SalaryLevel VARCHAR(20)
AS
BEGIN
    SELECT FirstName, LastName
    FROM Employees
    WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel;
END;

--------------------------------------------------------

CREATE FUNCTION ufn_IsWordComprised
(
    @setOfLetters NVARCHAR(MAX),
    @word NVARCHAR(MAX)
)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT = 1; 

    DECLARE @charIndex INT = 1;
    DECLARE @charCount INT = LEN(@word);

    WHILE @charIndex <= @charCount
    BEGIN
        DECLARE @char NVARCHAR(1);
        SET @char = SUBSTRING(@word, @charIndex, 1);

        IF CHARINDEX(@char, @setOfLetters) = 0
        BEGIN
            SET @result = 0;
            BREAK;
        END

        SET @charIndex = @charIndex + 1;
    END

    RETURN @result;
END;