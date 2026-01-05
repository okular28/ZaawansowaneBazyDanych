CREATE   PROCEDURE [Student_0].[TopProductsPriceChanger]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Name,
        ListPrice,
        (ListPrice - (ListPrice * 0.00)) AS NewPrice
    FROM #TopProducts;
END;