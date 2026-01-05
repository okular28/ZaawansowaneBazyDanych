CREATE FUNCTION [Student_234340].[ufn_IsPriceHigherThanCurrent](@JsonProduct NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @Result BIT = 0;
	DECLARE @JsonPrice MONEY;
    DECLARE @RealPrice MONEY;
    DECLARE @ProductID INT;
	SELECT TOP 1 
        @ProductID = ProductID, 
        @JsonPrice = Price
    FROM OPENJSON(@JsonProduct)
    WITH (ProductID INT '$.ProductID', Price MONEY '$.Price');
	SELECT @RealPrice = ListPrice
    FROM SalesLT.Product
    WHERE ProductID = @ProductID;
	IF (@JsonPrice > @RealPrice)
        SET @Result = 1;
    RETURN @Result;
END;