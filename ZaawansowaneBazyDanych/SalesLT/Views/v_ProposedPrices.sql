CREATE VIEW SalesLT.v_ProposedPrices AS
SELECT ProductID, Name, ProductNumber, StandardCost, ListPrice
FROM SalesLT.Product;