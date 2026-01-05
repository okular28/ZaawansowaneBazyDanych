CREATE VIEW [234340].TheBestCustomer AS SELECT TOP 10
    c.CustomerID,
    c.FirstName,
    c.LastName,
	SUM(sod.OrderQty) AS TotalCount
FROM 
    [234340].[Customer] c
INNER JOIN 
    SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
INNER JOIN 
    SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY 
    c.CustomerID, 
    c.FirstName, 
    c.LastName
ORDER BY 
    TotalCount DESC;