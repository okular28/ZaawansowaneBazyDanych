CREATE FUNCTION [Student_234340].[ufn_TableIsPriceHigher](@JsonArray NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN (
    SELECT 
        p.Name,
        [Student_234340].[ufn_IsPriceHigherThanCurrent](
            N'{"ProductID":' + CAST(j.ProductID AS NVARCHAR) + 
            N',"Price":' + CAST(j.Price AS NVARCHAR) + N'}'
        ) AS CzyDrozej
    FROM 
        OPENJSON(@JsonArray) 
        WITH (ProductID INT, Price MONEY) AS j
    INNER JOIN 
        SalesLT.Product p ON j.ProductID = p.ProductID
);