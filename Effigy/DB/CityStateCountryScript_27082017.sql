USE [SNPLCPDB]
GO
/****** Object:  ForeignKey [FK_MstCity_MstState]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO
/****** Object:  ForeignKey [FK_MstState_CountryID]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_CountryID]
GO
/****** Object:  Table [dbo].[MstCity]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_IsActive]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_CreatedDate]
GO
DROP TABLE [dbo].[MstCity]
GO
/****** Object:  Table [dbo].[MstState]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_CountryID]
GO
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [DF_MstState_IsActive]
GO
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [DF_MstState_CreatedDate]
GO
DROP TABLE [dbo].[MstState]
GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstCountry] DROP CONSTRAINT [DF_MstCountry_CreatedDate]
GO
DROP TABLE [dbo].[MstCountry]
GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 08/27/2017 03:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MstCountry_CreatedDate]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_MstCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstCountry] ON
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (1, N'India', 1, 1, CAST(0x0000A7DD00000000 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (2, N'Pakistan', 1, 1, CAST(0x0000A7DC0027E3F3 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (3, N'Nepal', 1, 1, CAST(0x0000A7DC0028E1CD AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstCountry] OFF
/****** Object:  Table [dbo].[MstState]    Script Date: 08/27/2017 03:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NOT NULL,
	[CountryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MstState_IsActive]  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MstState_CreatedDate]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MstState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstState] ON
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Andaman & Nicobar', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Andhra Pradesh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Arunachal Pradesh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Assam', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bihar', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Chandigarh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Chattisgarh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Dadra & Nagar Haveli', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Daman & Diu', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Delhi', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Goa', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Gujarat', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Haryana', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Himachal Pradesh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Jammu & Kashmir', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Jharkhand', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Karnataka', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Kerala', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Lakshadweep', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Madhya Pradesh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Maharashtra', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Manipur', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Meghalaya', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Mizoram', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Nagaland', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Odisha', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Puducherry', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Punjab', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Rajasthan', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Sikkim', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Tamil Nadu', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Tripura', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Uttar Pradesh', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Uttarakhand', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'West Bengal', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Telangana', 1, 1, 1, CAST(0x0000A7DB01294C2B AS DateTime), NULL, CAST(0x0000A7DB01294C2B AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'Lahore', 2, 1, 1, CAST(0x0000A7DC0036138D AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstState] OFF
/****** Object:  Table [dbo].[MstCity]    Script Date: 08/27/2017 03:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NOT NULL,
	[StateId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_MstCity_IsActive]  DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MstCity_CreatedDate]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MstCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_MstCity_MstState]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstCity]  WITH CHECK ADD  CONSTRAINT [FK_MstCity_MstState] FOREIGN KEY([StateId])
REFERENCES [dbo].[MstState] ([StateID])
GO
ALTER TABLE [dbo].[MstCity] CHECK CONSTRAINT [FK_MstCity_MstState]
GO
/****** Object:  ForeignKey [FK_MstState_CountryID]    Script Date: 08/27/2017 03:58:50 ******/
ALTER TABLE [dbo].[MstState]  WITH CHECK ADD  CONSTRAINT [FK_MstState_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[MstCountry] ([CountryId])
GO
ALTER TABLE [dbo].[MstState] CHECK CONSTRAINT [FK_MstState_CountryID]
GO
