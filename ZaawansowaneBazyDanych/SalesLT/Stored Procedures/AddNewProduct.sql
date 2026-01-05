CREATE   PROCEDURE [SalesLT].[AddNewProduct]
(
    @Name NVARCHAR(50),
    @ProductCategoryID NVARCHAR(50),
    @UnitPrice MONEY,
    @Quantity INT
)
AS
BEGIN
	SET NOCOUNT ON;

	IF @UnitPrice <= 0
    BEGIN;
        THROW 500012, 'Błąd: Cena produktu musi być większa od zera.', 1;
    END

    IF @Quantity < 0
    BEGIN;
        THROW 500011, 'Błąd: Ilość w magazynie nie może być ujemna.', 1;
    END

	IF NOT EXISTS (SELECT 1 FROM [SalesLT].[ProductCategory] WHERE ProductCategoryID = @ProductCategoryID)
    BEGIN;
        THROW 500010, 'Błąd: Podana kategoria produktu (ID) nie istnieje w bazie.', 1;
    END

	BEGIN TRANSACTION;
    BEGIN TRY
	DECLARE @GenProductNumber NVARCHAR(50);
        SET @GenProductNumber = LEFT(@Name, 3) + '-' + RIGHT(CAST(NEWID() AS NVARCHAR(36)), 8);
	INSERT INTO [SalesLT].[Product]
        (
            [Name],
            [ProductNumber],
            [StandardCost],
            [ListPrice],
            [ProductCategoryID],
            [SellStartDate],
            [rowguid],
            [ModifiedDate]
        )
        VALUES
        (
            @Name,
            @GenProductNumber,
            @UnitPrice * 0.6,
            @UnitPrice,
            @ProductCategoryID,
            GETDATE(),
            NEWID(),
            GETDATE()
        );
		DECLARE @NewProductID INT = SCOPE_IDENTITY();
		INSERT INTO [SalesLT].[ProductInventory]
        (
            [ProductID],
            [Quantity],
            [ModifiedDate]
        )
        VALUES
        (
            @NewProductID,
            @Quantity,
            GETDATE()
        );
	COMMIT TRANSACTION
	END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
        PRINT 'Wystąpił błąd! Transakcja wycofana.';
		THROW;
    END CATCH
END;