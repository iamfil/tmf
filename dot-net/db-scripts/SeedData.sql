USE [commercelite]

IF EXISTS (SELECT * FROM [dbo].[ProductType])
BEGIN
	PRINT 'Seed data exists, stopping'
END
ELSE
BEGIN

SET NUMERIC_ROUNDABORT OFF

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON

SET DATEFORMAT YMD

SET XACT_ABORT ON

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

PRINT(N'Drop constraints from [dbo].[Product]')
ALTER TABLE [dbo].[Product] NOCHECK CONSTRAINT [FK_Product_ProductType]

PRINT(N'Drop constraint FK_Offer_Product from [dbo].[Offer]')
ALTER TABLE [dbo].[Offer] NOCHECK CONSTRAINT [FK_Offer_Product]

PRINT(N'Add 2 rows to [dbo].[ProductType]')
SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT INTO [dbo].[ProductType] ([ProductTypeId], [Type], [DateCreated], [DateModified]) VALUES (1, N'Print', '2018-04-01 22:19:03.960', '2018-04-01 22:19:03.960')
INSERT INTO [dbo].[ProductType] ([ProductTypeId], [Type], [DateCreated], [DateModified]) VALUES (2, N'Online', '2018-04-01 22:19:03.960', '2018-04-01 22:19:03.960')
SET IDENTITY_INSERT [dbo].[ProductType] OFF

PRINT(N'Add 1 row to [dbo].[Product]')
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT INTO [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (1, N'Stock Advisor', '2018-04-01 22:11:11.843', 1, 1, '2018-04-01 22:18:07.173')
SET IDENTITY_INSERT [dbo].[Product] OFF

PRINT(N'Add constraints to [dbo].[Product]')
ALTER TABLE [dbo].[Product] WITH CHECK CHECK CONSTRAINT [FK_Product_ProductType]
ALTER TABLE [dbo].[Offer] WITH CHECK CHECK CONSTRAINT [FK_Offer_Product]
COMMIT TRANSACTION

END