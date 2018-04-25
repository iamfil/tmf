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

SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (2, N'Bitcoin Cash 101', CAST(N'2018-04-23T17:15:26.260' AS DateTime), 1, 2, CAST(N'2018-04-23T17:15:26.260' AS DateTime))

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (3, N'Ethereum for Dummies', CAST(N'2018-04-23T17:15:51.863' AS DateTime), 1, 2, CAST(N'2018-04-23T17:15:51.863' AS DateTime))

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (4, N'Crypto 101', CAST(N'2018-04-23T17:16:01.240' AS DateTime), 1, 2, CAST(N'2018-04-23T17:16:01.240' AS DateTime))

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (5, N'How to buy stocks', CAST(N'2018-04-23T17:16:42.470' AS DateTime), 1, 2, CAST(N'2018-04-23T17:16:42.470' AS DateTime))

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (6, N'How to lose all your money', CAST(N'2018-04-23T17:16:53.873' AS DateTime), 1, 2, CAST(N'2018-04-23T17:16:53.873' AS DateTime))

INSERT [dbo].[Product] ([ProductId], [Name], [DateCreated], [IsActive], [ProductTypeId], [DateModified]) VALUES (7, N'Calls and Puts 101', CAST(N'2018-04-23T17:17:31.013' AS DateTime), 1, 2, CAST(N'2018-04-23T17:17:31.013' AS DateTime))

SET IDENTITY_INSERT [dbo].[Product] OFF

SET IDENTITY_INSERT [dbo].[Offer] ON 

INSERT [dbo].[Offer] ([OfferId], [ProductId], [Description], [Price], [DateCreated], [NumberOfMonths], [DateModified]) VALUES (1, 3, N'Something something for 24 months!', CAST(1000.00 AS Decimal(6, 2)), CAST(N'2018-04-23T17:20:10.123' AS DateTime), 24, CAST(N'2018-04-23T17:20:10.123' AS DateTime))

SET IDENTITY_INSERT [dbo].[Offer] OFF

SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (1, N'elizabeth.mitchell@test.com', N'Elizabeth', N'Mitchell', CAST(N'2019-04-05T00:00:00.000' AS DateTime), CAST(N'2019-04-05T00:00:00.000' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (2, N'mike.riley@test.com', N'Mike', N'Riley', CAST(N'2019-04-05T00:00:00.000' AS DateTime), CAST(N'2019-04-05T00:00:00.000' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (3, N'jessica.gibson@test.com', N'Jessica', N'Gibson', CAST(N'2018-04-23T17:07:27.287' AS DateTime), CAST(N'2018-04-23T17:07:27.287' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (4, N'oliver.cole@fakemail.com', N'Oliver', N'Cole', CAST(N'2018-04-23T17:08:33.427' AS DateTime), CAST(N'2018-04-23T17:08:33.427' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (5, N'lauren.anderson@example.com', N'Lauren', N'Anderson', CAST(N'2018-04-23T17:08:47.833' AS DateTime), CAST(N'2018-04-23T17:08:47.833' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (6, N'tiffany.smith@test.com', N'Tiffany', N'Smith', CAST(N'2018-04-23T17:09:21.623' AS DateTime), CAST(N'2018-04-23T17:09:21.623' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (7, N'robert.stephens@example.com', N'Robert', N'Stephens', CAST(N'2018-04-23T17:09:32.567' AS DateTime), CAST(N'2018-04-23T17:09:32.567' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (8, N'alexandra.long@fakemail.com', N'Alexandria', N'Long', CAST(N'2018-04-23T17:09:41.470' AS DateTime), CAST(N'2018-04-23T17:09:41.470' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (9, N'adam.bell@example.com', N'Adam', N'Bell', CAST(N'2018-04-23T17:09:50.040' AS DateTime), CAST(N'2018-04-23T17:09:50.040' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (10, N'shannon.bailey@fakemail.com', N'Shannon', N'Bailey', CAST(N'2018-04-23T17:10:05.293' AS DateTime), CAST(N'2018-04-23T17:10:05.293' AS DateTime))

INSERT [dbo].[Customer] ([CustomerId], [EmailAddress], [FirstName], [LastName], [DateCreated], [DateModified]) VALUES (11, N'leonardo.harrison@example.com', N'Leonardo', N'Harrison', CAST(N'2018-04-23T17:10:17.303' AS DateTime), CAST(N'2018-04-23T17:10:17.303' AS DateTime))

SET IDENTITY_INSERT [dbo].[Customer] OFF

SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OfferId], [PurchaseDate], [CustomerId]) VALUES (1, 1, CAST(N'2018-04-23T17:20:55.597' AS DateTime), 1)

SET IDENTITY_INSERT [dbo].[Order] OFF




COMMIT TRANSACTION

END