SELECT TOP(50) Username,SUBSTRING(Email, CHARINDEX('@', Email)+1,LEN(Email))[Email Provider]
FROM Users
ORDER BY [Email Provider], Username;


SELECT TOP(50) [Name],FORMAT([Start],'yyyy-MM-dd') Start
FROM Games
WHERE YEAR([Start]) BETWEEN 2011 AND 2012
ORDER BY [Start],[Name]; 