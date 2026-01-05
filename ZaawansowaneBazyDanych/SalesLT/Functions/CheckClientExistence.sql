CREATE   FUNCTION [SalesLT].[CheckClientExistence]
(
	
	@Name NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Email NVARCHAR(50),
    @Phone NVARCHAR(25)
	)
RETURNS BIT
AS
BEGIN
	DECLARE @TF BIT = 0;
	IF EXISTS (SELECT 1 FROM [234340].[Customer] WHERE Phone = @Phone AND EmailAddress = @Email AND LastName = @LastName AND FirstName = @Name)
	SET @TF = 1;

	RETURN @TF;
END;