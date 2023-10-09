CREATE PROCEDURE usp_GetHoldersFullName
AS
BEGIN
    SELECT CONCAT(FirstName, ' ', LastName) AS FullName
    FROM AccountHolders;
END;

---------------------------------------------------

CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan
    @BalanceThreshold DECIMAL(18, 4)
AS
BEGIN
    SELECT AH.FirstName, AH.LastName
    FROM AccountHolders AH
    INNER JOIN (
        SELECT AccountHolderId, SUM(Balance) AS TotalBalance
        FROM Accounts
        GROUP BY AccountHolderId
    ) AS AccountSum ON AH.Id = AccountSum.AccountHolderId
    WHERE AccountSum.TotalBalance > @BalanceThreshold
    ORDER BY AH.FirstName, AH.LastName;
END;

---------------------------------------------------

CREATE FUNCTION ufn_CalculateFutureValue
(
    @InitialSum DECIMAL(18, 4),
    @YearlyInterestRate FLOAT,
    @NumberOfYears INT
)
RETURNS DECIMAL(18, 4)
AS
BEGIN
    DECLARE @FutureValue DECIMAL(18, 4);

    SET @FutureValue = @InitialSum * POWER((1 + @YearlyInterestRate), @NumberOfYears);

    RETURN ROUND(@FutureValue, 4); 
END;

-------------------------------------------------

CREATE PROCEDURE usp_CalculateFutureValueForAccount
    @AccountId INT,
    @InterestRate FLOAT
AS
BEGIN
    DECLARE @FirstName NVARCHAR(MAX);
    DECLARE @LastName NVARCHAR(MAX);
    DECLARE @CurrentBalance DECIMAL(18, 4);
    DECLARE @FutureValue DECIMAL(18, 4);

    SELECT @FirstName = AH.FirstName,
           @LastName = AH.LastName,
           @CurrentBalance = A.Balance
    FROM AccountHolders AS AH
    INNER JOIN Accounts AS A ON AH.Id = A.AccountHolderId
    WHERE A.Id = @AccountId;

    SET @FutureValue = dbo.ufn_CalculateFutureValue(@CurrentBalance, @InterestRate, 5);

    SELECT @AccountId AS AccountId,
           @FirstName AS FirstName,
           @LastName AS LastName,
           @CurrentBalance AS CurrentBalance,
           @FutureValue AS FutureValue;
END;


-------------------------------------------------------------------



