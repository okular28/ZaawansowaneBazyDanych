CREATE FUNCTION [234340].[ufn_ProductsJsonByCategory](
	@CategoryName NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Dzejdon NVARCHAR(MAX)
	SET @Dzejdon = (
		SELECT 
			p.Name AS ProductName,
            p.ProductNumber AS ProductNumber,
            p.ListPrice AS ProductListPrice,
            p.StandardCost AS ProductStandardCost
		FROM
			SalesLT.Product p
		INNER JOIN 
            SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
		WHERE
			pc.Name = @CategoryName
		FOR JSON PATH
	);
	RETURN @Dzejdon;
END;