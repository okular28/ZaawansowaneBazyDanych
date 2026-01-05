CREATE TABLE [234340].[Customer] (
    [CustomerID]   INT                                                IDENTITY (1, 1) NOT NULL,
    [NameStyle]    [dbo].[NameStyle]                                  CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)) NOT NULL,
    [Title]        NVARCHAR (8)                                       NULL,
    [FirstName]    [dbo].[Name]                                       NOT NULL,
    [MiddleName]   [dbo].[Name]                                       NULL,
    [LastName]     [P0_surname].[Nazwisko]                            NOT NULL,
    [Suffix]       NVARCHAR (10)                                      NULL,
    [CompanyName]  NVARCHAR (128)                                     NULL,
    [SalesPerson]  NVARCHAR (256)                                     NULL,
    [EmailAddress] NVARCHAR (50)                                      NULL,
    [Phone]        [dbo].[Phone]                                      NULL,
    [PasswordHash] VARCHAR (128)                                      NOT NULL,
    [PasswordSalt] VARCHAR (10)                                       NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER                                   CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate] DATETIME                                           CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [ValidFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN DEFAULT (sysutcdatetime()) NOT NULL,
    [ValidTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[234340].[CustomerHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
    ON [234340].[Customer]([EmailAddress] ASC);

