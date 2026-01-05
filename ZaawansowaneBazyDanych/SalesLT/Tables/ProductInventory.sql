CREATE TABLE [SalesLT].[ProductInventory] (
    [ProductID]    INT      NOT NULL,
    [Quantity]     INT      DEFAULT ((0)) NOT NULL,
    [ModifiedDate] DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_ProductInventory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

