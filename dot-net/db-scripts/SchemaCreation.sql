USE [commercelite]

SET NUMERIC_ROUNDABORT OFF

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON


IF OBJECT_ID(N'[dbo].[Product]', 'U')  IS NULL

BEGIN

PRINT N'Creating [dbo].[Product]'

IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NULL
CREATE TABLE [dbo].[Product]
(
[ProductId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL,
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Product_DateCreated] DEFAULT (getdate()),
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Product_IsActive] DEFAULT ((0)),
[ProductTypeId] [int] NOT NULL,
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Product_DateModified] DEFAULT (getdate())
)

PRINT N'Creating primary key [PK_Product] on [dbo].[Product]'

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_Product' AND object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED  ([ProductId])

PRINT N'Creating [dbo].[ProductType]'

IF OBJECT_ID(N'[dbo].[ProductType]', 'U') IS NULL
CREATE TABLE [dbo].[ProductType]
(
[ProductTypeId] [int] NOT NULL IDENTITY(1, 1),
[Type] [nvarchar] (100) NOT NULL,
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_ProductType_DateCreated] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_ProductType_DateModified] DEFAULT (getdate())
)

PRINT N'Creating primary key [PK_ProductType] on [dbo].[ProductType]'

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_ProductType' AND object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] ADD CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED  ([ProductTypeId])

PRINT N'Creating [dbo].[Offer]'

IF OBJECT_ID(N'[dbo].[Offer]', 'U') IS NULL
CREATE TABLE [dbo].[Offer]
(
[OfferId] [int] NOT NULL IDENTITY(1, 1),
[ProductId] [int] NOT NULL,
[Description] [nvarchar] (100) NOT NULL,
[Price] [decimal] (6, 2) NOT NULL,
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Offer_DateCreated] DEFAULT (getdate()),
[NumberOfMonths] [int] NOT NULL,
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Offer_DateModified] DEFAULT (getdate())
)

PRINT N'Creating primary key [PK_Offer] on [dbo].[Offer]'

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_Offer' AND object_id = OBJECT_ID(N'[dbo].[Offer]'))
ALTER TABLE [dbo].[Offer] ADD CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED  ([OfferId])

PRINT N'Creating [dbo].[Order]'

IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NULL
CREATE TABLE [dbo].[Order]
(
[OrderId] [int] NOT NULL IDENTITY(1, 1),
[OfferId] [int] NOT NULL,
[PurchaseDate] [datetime] NOT NULL CONSTRAINT [DF_Order_PurchaseDate] DEFAULT (getdate()),
[CustomerId] [int] NOT NULL
)

PRINT N'Creating primary key [PK_Order] on [dbo].[Order]'

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_Order' AND object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED  ([OrderId])

PRINT N'Creating [dbo].[Customer]'

IF OBJECT_ID(N'[dbo].[Customer]', 'U') IS NULL
CREATE TABLE [dbo].[Customer]
(
[CustomerId] [int] NOT NULL IDENTITY(1, 1),
[EmailAddress] [nvarchar] (100) NULL,
[FirstName] [nvarchar] (100) NOT NULL,
[LastName] [nvarchar] (100) NOT NULL,
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Customer_DateCreated] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Customer_DateModified] DEFAULT (getdate())
)

PRINT N'Creating primary key [PK_Customer] on [dbo].[Customer]'

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'PK_Customer' AND object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  ([CustomerId])

PRINT N'Adding foreign keys to [dbo].[Order]'

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Customer]', 'F') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]', 'U'))
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Order_Offer]', 'F') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]', 'U'))
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [FK_Order_Offer] FOREIGN KEY ([OfferId]) REFERENCES [dbo].[Offer] ([OfferId])

PRINT N'Adding foreign keys to [dbo].[Offer]'

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Offer_Product]', 'F') AND parent_object_id = OBJECT_ID(N'[dbo].[Offer]', 'U'))
ALTER TABLE [dbo].[Offer] ADD CONSTRAINT [FK_Offer_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId])

PRINT N'Adding foreign keys to [dbo].[Product]'

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]', 'F') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]', 'U'))
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [FK_Product_ProductType] FOREIGN KEY ([ProductTypeId]) REFERENCES [dbo].[ProductType] ([ProductTypeId])


END
ELSE
BEGIN
	PRINT 'Schema Exists, stopping.'
END
