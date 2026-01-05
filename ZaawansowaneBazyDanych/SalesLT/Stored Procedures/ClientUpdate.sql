CREATE   PROCEDURE [SalesLT].[ClientUpdate]
(
    @Name NVARCHAR(50),
    @Surname [P0_surname].[Nazwisko], 
    @Email NVARCHAR(50),
    @Phone NVARCHAR(25),
    @PwdHash VARCHAR(128),
    @PwdSalt VARCHAR(10),
	@NewName NVARCHAR(50),
    @NewSurname [P0_surname].[Nazwisko], 
    @NewEmail NVARCHAR(50),
    @NewPhone NVARCHAR(25),
    @NewPwdHash VARCHAR(128),
    @NewPwdSalt VARCHAR(10)
)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM [234340].[Customer] WHERE Phone = @Phone AND EmailAddress = @Email AND LastName = @Surname AND FirstName = @Name AND PasswordHash = @PwdHash AND PasswordSalt = @PwdSalt)
		UPDATE [234340].[Customer]
		SET FirstName = @NewName, LastName = @NewSurname, EmailAddress = @NewEmail, Phone = @NewPhone, PasswordHash = @NEwPwdHash, PasswordSalt = @NewPwdSalt
		WHERE Phone = @Phone AND EmailAddress = @Email AND LastName = @Surname AND FirstName = @Name AND PasswordHash = @PwdHash AND PasswordSalt = @PwdSalt;
		ELSE PRINT 'USER DOES NOT EXIST';
	END;