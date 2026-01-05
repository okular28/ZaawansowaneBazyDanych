CREATE   PROCEDURE [SalesLT].[GetCustomerOrderHistory]
(
    @CustomerID INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Output TABLE 
    (
        Product NVARCHAR(50),
        OrderDate DATETIME,
        Quantity INT,
        TotalPrice MONEY
    );

    INSERT INTO @Output (Product, OrderDate, Quantity, TotalPrice)
    SELECT 
        p.Name,
        h.OrderDate,
        d.OrderQty,
        d.LineTotal
    FROM [SalesLT].[SalesOrderHeader] h
    INNER JOIN [SalesLT].[SalesOrderDetail] d 
        ON h.SalesOrderID = d.SalesOrderID
    INNER JOIN [SalesLT].[Product] p 
        ON d.ProductID = p.ProductID
    WHERE 
        h.CustomerID = @CustomerID;
    SELECT * FROM @Output ORDER BY OrderDate DESC;
END;