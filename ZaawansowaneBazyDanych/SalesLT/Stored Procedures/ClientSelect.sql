CREATE PROCEDURE [SalesLT].[ClientSelect]
(
    @CustomerID INT = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @LastName [P0_surname].[Nazwisko] = NULL, 
    @EmailAddress NVARCHAR(50) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		CustomerID,
		FirstName,
		LastName,
		EmailAddress,
		Phone,
		CompanyName
	FROM [234340].[Customer]
	WHERE
	(@CustomerID IS NULL OR CustomerID = @CustomerID)
	AND
	(@FirstName IS NULL OR FirstName = @FirstName)
	AND
	(@LastName IS NULL OR LastName = @LastName)
	AND
	(@EmailAddress IS NULL OR EmailAddress = @EmailAddress);
END;