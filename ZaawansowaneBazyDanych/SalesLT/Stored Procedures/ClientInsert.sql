CREATE   PROCEDURE [SalesLT].[ClientInsert]
(
    @Name NVARCHAR(50),
    @Surname [P0_surname].[Nazwisko], 
    @Email NVARCHAR(50),
    @Phone NVARCHAR(25),
    @PwdHash VARCHAR(128),
    @PwdSalt VARCHAR(10)
)
AS
BEGIN
	SET NOCOUNT ON;
	IF [SalesLT].[CheckClientExistence](@Name, @Surname, @Email, @Phone) = 0
		INSERT INTO [234340].[Customer](
			[NameStyle],
			[FirstName],
			[LastName],
			[EmailAddress],
			[Phone],
			[PasswordHash],
			[PasswordSalt],
			[rowguid],
			[ModifiedDate]
		)
		VALUES(
			0,
			@Name,
			@Surname,
			@Email,
			@Phone,
			@PwdHash,
			@PwdSalt,
			NEWID(),
			GETDATE()
		)
		ELSE PRINT 'USER EXISTS';
	END;