SELECT COUNT(*) FROM WizzardDeposits;

SELECT MAX(MagicWandSize) AS LongestMagicWand FROM WizzardDeposits;

Select 
	DepositGroup
	,MAX(MagicWandSize) AS  MaxMagicWandSize
FROM WizzardDeposits
GROUP BY DepositGroup;


Select 
	DepositGroup
	,SUM(DepositAmount) AS  DepositAmount
FROM WizzardDeposits
GROUP BY DepositGroup;


Select 
	DepositGroup
	,SUM(DepositAmount) AS  DepositAmount
FROM WizzardDeposits
WHERE MagicWandCreator='Ollivander family'
GROUP BY DepositGroup;


Select 
	DepositGroup
	,SUM(DepositAmount) AS  DepositAmount
FROM WizzardDeposits
WHERE MagicWandCreator='Ollivander family' 
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY DepositAmount DESC;

SELECT
	DepositGroup
	,MagicWandCreator
	,MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator ,DepositGroup;

SELECT AgeGroups, COUNT(*) AS WizardCount FROM
(SELECT FirstName, Age, 
	CASE 
	 WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
	 WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
	 WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
	 WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
	 WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
	 WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
	 ELSE '[61+]'
END AS AgeGroups
 FROM WizzardDeposits) AS AgeGrouped
 GROUP BY AgeGroups;


SELECT DISTINCT LEFT(FirstName, 1) AS first_letter
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
ORDER BY first_letter;


SELECT
    DepositGroup,
    IsDepositExpired,
    AVG(DepositInterest) AS AverageInterest
FROM WizzardDeposits
WHERE DepositStartDate > '1985-01-01'
GROUP BY
    DepositGroup,
    IsDepositExpired
ORDER BY
    DepositGroup DESC,
    IsDepositExpired ASC;


