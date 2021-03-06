USE [master]
GO
/****** Object:  Database [SNPLCPDB]    Script Date: 09/03/2017 10:25:32 ******/
CREATE DATABASE [SNPLCPDB] ON  PRIMARY 
( NAME = N'SNPLCPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SNPLCPDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SNPLCPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SNPLCPDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SNPLCPDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SNPLCPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SNPLCPDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SNPLCPDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SNPLCPDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SNPLCPDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SNPLCPDB] SET ARITHABORT OFF
GO
ALTER DATABASE [SNPLCPDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SNPLCPDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SNPLCPDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SNPLCPDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SNPLCPDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SNPLCPDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SNPLCPDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SNPLCPDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SNPLCPDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SNPLCPDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SNPLCPDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [SNPLCPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SNPLCPDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SNPLCPDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SNPLCPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SNPLCPDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SNPLCPDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SNPLCPDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SNPLCPDB] SET  READ_WRITE
GO
ALTER DATABASE [SNPLCPDB] SET RECOVERY FULL
GO
ALTER DATABASE [SNPLCPDB] SET  MULTI_USER
GO
ALTER DATABASE [SNPLCPDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SNPLCPDB] SET DB_CHAINING OFF
GO
USE [SNPLCPDB]
GO
/****** Object:  ForeignKey [FK_MstState_CountryID]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_CountryID]
GO
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_aspnet_Roles]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_MstMenuMaster]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserBankDetail_MstBankMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserBankDetail] DROP CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserMaster_MstLanguage]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserMaster] DROP CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
/****** Object:  ForeignKey [FK_MstCity_MstState]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_aspnet_Roles]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserLoginDetail_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserLoginDetail] DROP CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserDetail_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserDetail] DROP CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster]
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 09/03/2017 10:25:38 ******/
DROP PROCEDURE [dbo].[chkLogin]
GO
/****** Object:  StoredProcedure [dbo].[Usp_City]    Script Date: 09/03/2017 10:25:38 ******/
DROP PROCEDURE [dbo].[Usp_City]
GO
/****** Object:  StoredProcedure [dbo].[uspMenuMaster]    Script Date: 09/03/2017 10:25:38 ******/
DROP PROCEDURE [dbo].[uspMenuMaster]
GO
/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserDetail] DROP CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster]
GO
DROP TABLE [dbo].[tblMstUserDetail]
GO
/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserLoginDetail] DROP CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
DROP TABLE [dbo].[tblMstUserLoginDetail]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
DROP TABLE [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  Table [dbo].[MstCity]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_IsActive]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_CreatedDate]
GO
DROP TABLE [dbo].[MstCity]
GO
/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserMaster] DROP CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
DROP TABLE [dbo].[tblMstUserMaster]
GO
/****** Object:  Table [dbo].[tblMstUserBankDetail]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserBankDetail] DROP CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster]
GO
DROP TABLE [dbo].[tblMstUserBankDetail]
GO
/****** Object:  StoredProcedure [dbo].[Usp_Country]    Script Date: 09/03/2017 10:25:38 ******/
DROP PROCEDURE [dbo].[Usp_Country]
GO
/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster]
GO
DROP TABLE [dbo].[MstMenuRoleMaster]
GO
/****** Object:  Table [dbo].[MstState]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_CountryID]
GO
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [DF_MstState_IsActive]
GO
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [DF_MstState_CreatedDate]
GO
DROP TABLE [dbo].[MstState]
GO
/****** Object:  Table [dbo].[MstUserWorkCategory]    Script Date: 09/03/2017 10:25:35 ******/
DROP TABLE [dbo].[MstUserWorkCategory]
GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstCountry] DROP CONSTRAINT [DF_MstCountry_CreatedDate]
GO
DROP TABLE [dbo].[MstCountry]
GO
/****** Object:  Table [dbo].[MstLanguage]    Script Date: 09/03/2017 10:25:35 ******/
DROP TABLE [dbo].[MstLanguage]
GO
/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 09/03/2017 10:25:35 ******/
DROP TABLE [dbo].[MstMenuMaster]
GO
/****** Object:  Table [dbo].[MstBankMaster]    Script Date: 09/03/2017 10:25:35 ******/
DROP TABLE [dbo].[MstBankMaster]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/03/2017 10:25:35 ******/
DROP TABLE [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
	[UserEntryID] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserAffectedDate] [datetime] NULL,
 CONSTRAINT [PK__aspnet_Roles__32E0915F] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[aspnet_Roles] ON
INSERT [dbo].[aspnet_Roles] ([RoleId], [RoleName], [Description], [IsActive], [UserEntryID], [UserEntryDate], [UserAffectedDate]) VALUES (1, N'Admin', N'Admin role', 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[aspnet_Roles] OFF
/****** Object:  Table [dbo].[MstBankMaster]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstBankMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](200) NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
	[UserEntryId] [int] NULL,
 CONSTRAINT [PK_MstBankMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstMenuMaster](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuText] [varchar](100) NULL,
	[MenuDesc] [varchar](100) NULL,
	[NavigateURL] [varchar](256) NULL,
	[ParentID] [int] NULL,
	[OrderNo] [int] NULL,
	[ApplicationID] [int] NULL,
	[UserEntryID] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserAffectedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MstMenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MstLanguage]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstLanguage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](100) NULL,
	[LanguageCode] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MstLanguage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstLanguage] ON
INSERT [dbo].[MstLanguage] ([Id], [LanguageName], [LanguageCode], [IsActive]) VALUES (1, N'English', N'EN-gb', 1)
SET IDENTITY_INSERT [dbo].[MstLanguage] OFF
/****** Object:  Table [dbo].[MstCountry]    Script Date: 09/03/2017 10:25:35 ******/
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
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (1, N'India', 1, 1, CAST(0x0000A7D500000000 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (2, N'pakistan', 1, 1, CAST(0x0000A7DC00CD8FE5 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (3, N'Japan', 1, 1, CAST(0x0000A7DC011A1481 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (4, N'Japan', 1, 1, CAST(0x0000A7DC011A2C49 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (5, N'Japan', 1, 1, CAST(0x0000A7DC011A4EA4 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (6, N'Sri Lanka', 1, 1, CAST(0x0000A7DE00985191 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (7, N'Sri Lanka', 1, 1, CAST(0x0000A7DE00991929 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (8, N'Nepal', 1, 1, CAST(0x0000A7DE009CFB88 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (9, N'USA', 1, 1, CAST(0x0000A7DE009D1927 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (10, N'England', 1, 1, CAST(0x0000A7DE009D28A3 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (11, N'France', 1, 1, CAST(0x0000A7DE009D332C AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (12, N'Bhutan', 0, 1, CAST(0x0000A7DE01807AEB AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (13, N'Thailand', 0, 1, CAST(0x0000A7DE0180D801 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (14, N'', 0, 1, CAST(0x0000A7E000A2779C AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (15, N'', 0, 1, CAST(0x0000A7E000A2B19B AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (16, N'', 0, 1, CAST(0x0000A7E000A40B6C AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (17, N'North Koria', 0, 1, CAST(0x0000A7E1008F2E90 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (18, N'North Koria', 0, 1, CAST(0x0000A7E1008F3B21 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstCountry] OFF
/****** Object:  Table [dbo].[MstUserWorkCategory]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstUserWorkCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](max) NULL,
	[CategoryDesc] [nvarchar](max) NULL,
	[CategoryPrice] [decimal](18, 2) NULL,
	[CatIntroPercentage] [int] NULL,
	[CatWorkPercentage] [int] NULL,
	[UserEntryId] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
 CONSTRAINT [PK_MstUserWorkCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstUserWorkCategory] ON
INSERT [dbo].[MstUserWorkCategory] ([Id], [CategoryCode], [CategoryName], [CategoryDesc], [CategoryPrice], [CatIntroPercentage], [CatWorkPercentage], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (1, N'CP0', N'CP0', N'Zero Category', CAST(2500.00 AS Decimal(18, 2)), 12, 10, 1, NULL, NULL)
INSERT [dbo].[MstUserWorkCategory] ([Id], [CategoryCode], [CategoryName], [CategoryDesc], [CategoryPrice], [CatIntroPercentage], [CatWorkPercentage], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (2, N'CP1', N'CP1', N'First Category', CAST(30000.00 AS Decimal(18, 2)), 12, 10, 1, NULL, NULL)
INSERT [dbo].[MstUserWorkCategory] ([Id], [CategoryCode], [CategoryName], [CategoryDesc], [CategoryPrice], [CatIntroPercentage], [CatWorkPercentage], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (3, N'CP2', N'CP2', N'Second Category', CAST(50000.00 AS Decimal(18, 2)), 12, 10, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstUserWorkCategory] OFF
/****** Object:  Table [dbo].[MstState]    Script Date: 09/03/2017 10:25:35 ******/
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
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Andaman & Nicobar', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Andhra Pradesh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Arunachal Pradesh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Assam', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bihar', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Chandigarh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Chattisgarh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Dadra & Nagar Haveli', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Daman & Diu', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Delhi', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Goa', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Gujarat', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Haryana', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Himachal Pradesh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Jammu & Kashmir', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Jharkhand', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Karnataka', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Kerala', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Lakshadweep', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Madhya Pradesh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Maharashtra', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Manipur', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Meghalaya', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Mizoram', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Nagaland', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Odisha', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Puducherry', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Punjab', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Rajasthan', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Sikkim', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Tamil Nadu', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Tripura', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Uttar Pradesh', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Uttarakhand', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'West Bengal', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Telangana', 1, 1, 1, CAST(0x0000A7D6012DB77D AS DateTime), NULL, CAST(0x0000A7D6012DC75A AS DateTime))
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'Alaska', 9, 1, 1, CAST(0x0000A7DF0087417C AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstState] OFF
/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 09/03/2017 10:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstMenuRoleMaster](
	[MR_SNo] [int] IDENTITY(1,1) NOT NULL,
	[MM_MenuId] [int] NULL,
	[AR_RoleId] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[Active_Flag] [bit] NULL,
 CONSTRAINT [PK_MstMenuRoleMaster] PRIMARY KEY CLUSTERED 
(
	[MR_SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Usp_Country]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_Country] (
	 @Action VARCHAR(100) = ''
	,@CountryID INT = ''
	,@CountryName VARCHAR(100) = ''	
	,@IsActive BIT = ''
	,@CreatedBy INT = ''
	,@CreatedDate DATETIME = ''
	,@ModifiedBy INT = ''
	,@ModifiedDate DATETIME = ''
	,@SqlMsg NVARCHAR(max) OUTPUT
	)
AS
BEGIN
	SET @SqlMsg = ''

	BEGIN TRY
		IF (@Action = 'GETLIST')
		BEGIN
			SELECT MRC.CountryId
				,MRC.CountryName	
				,MRC.IsActive
				,CASE MRC.IsActive
					WHEN 1
						THEN 'Enable'
					ELSE 'Disable'
					END AS [Status]
			FROM MstCountry(nolock)MRC
			ORDER BY MRC.CountryName
		END
	END TRY

	BEGIN CATCH
		SET @SqlMsg = 'Sql server exception - ' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  Table [dbo].[tblMstUserBankDetail]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMstUserBankDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[BankId] [int] NULL,
	[BranchName] [nvarchar](max) NULL,
	[IFSCCode] [nvarchar](100) NULL,
	[BranchAddress] [nvarchar](max) NULL,
	[ACHolderName] [nvarchar](100) NULL,
	[ACNo] [nvarchar](50) NULL,
	[ACTypeId] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
	[UserEntryId] [int] NULL,
 CONSTRAINT [PK_tblMstUserBankDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMstUserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [varchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Language] [int] NULL,
	[AcceptTermCondition] [bit] NULL,
	[IsActive] [bit] NULL,
	[UserEntryId] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblMstUserMaster] ON
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (1, N'SCP-1', N'Admin', N'Admin', 1, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (2, N'SCP-2', N'SCP-2', N'1234', 1, 1, 1, 0, CAST(0x0000A7DB00A2692D AS DateTime), CAST(0x0000A7DB00A2692D AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (3, N'SCP-3', N'SCP-3', N'1234', 1, 1, 1, 0, CAST(0x0000A7DB00A2E8D3 AS DateTime), CAST(0x0000A7DB00A2E8D3 AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (4, N'SCP-4', N'SCP-4', N'1234', 1, 1, 1, 0, CAST(0x0000A7DD009744A2 AS DateTime), CAST(0x0000A7DD009744A2 AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (5, N'SCP-5', N'SCP-5', N'1234', 1, 1, 1, 0, CAST(0x0000A7DD00979BF8 AS DateTime), CAST(0x0000A7DD00979BF8 AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (6, N'SCP-6', N'SCP-6', N'1234', 1, 1, 1, 0, CAST(0x0000A7DD0099485A AS DateTime), CAST(0x0000A7DD0099485A AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (7, N'SCP-7', N'SCP-7', N'uK8ZvTak', 1, 1, 1, 0, CAST(0x0000A7DF00788430 AS DateTime), CAST(0x0000A7DF00788430 AS DateTime))
INSERT [dbo].[tblMstUserMaster] ([UserId], [UserCode], [UserName], [Password], [Language], [AcceptTermCondition], [IsActive], [UserEntryId], [UserEntryDate], [UserEffectedDate]) VALUES (8, N'SCP-8', N'SCP-8', N'15hBdGb9', 1, 1, 1, 0, CAST(0x0000A7E300A4BFFD AS DateTime), CAST(0x0000A7E300A4BFFD AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMstUserMaster] OFF
/****** Object:  Table [dbo].[MstCity]    Script Date: 09/03/2017 10:25:38 ******/
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
SET IDENTITY_INSERT [dbo].[MstCity] ON
INSERT [dbo].[MstCity] ([CityId], [CityName], [StateId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Gurgaon', 13, 1, 1, CAST(0x0000A7E20098546B AS DateTime), NULL, NULL)
INSERT [dbo].[MstCity] ([CityId], [CityName], [StateId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Kanpur', 33, 1, 1, CAST(0x0000A7E200F910DD AS DateTime), NULL, NULL)
INSERT [dbo].[MstCity] ([CityId], [CityName], [StateId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Lucknow', 33, 1, 1, CAST(0x0000A7E200F939C0 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCity] ([CityId], [CityName], [StateId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'New Delhi', 10, 1, 1, CAST(0x0000A7E200F95C57 AS DateTime), NULL, NULL)
INSERT [dbo].[MstCity] ([CityId], [CityName], [StateId], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Old Delhi', 10, 1, 1, CAST(0x0000A7E200F96BF9 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[MstCity] OFF
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[PkID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserEntryID] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMstUserLoginDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AuthId] [uniqueidentifier] NULL,
	[BrowserType] [nvarchar](500) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[CityName] [nvarchar](max) NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[LoginTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserLoginDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblMstUserLoginDetail] ON
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (1, 1, N'037e6d0f-8e2c-42de-ac15-629a567820ae', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400D4D8C2 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (2, 1, N'eecc2d9e-26cc-452b-97e8-3a5bf89442e3', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400D70116 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (3, 1, N'b92c3878-30f9-4871-8d1b-d1ca452cd901', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400D82A32 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (4, 1, N'cc61713d-4d21-4bfc-9b0f-47a39c276c61', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400DA4DEB AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (5, 1, N'91da06dc-3968-4366-88b2-d893c877af8a', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400DB46EA AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (6, 1, N'bd4a5d2c-67bc-4666-a991-74cfe68f2290', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400DC0EC8 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (7, 1, N'34f46b11-3bbc-4ea6-9279-eec48d2f3969', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400DCED1B AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (8, 1, N'382e837e-106c-4fd7-a6c3-dc5801d0170e', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400E70301 AS DateTime), CAST(0x0000A7D400E745B2 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (9, 1, N'100ba64e-4eb5-4712-9b44-798ac9eaaeba', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400E75885 AS DateTime), CAST(0x0000A7D400E75D71 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (10, 1, N'ef007ef0-e79c-4ebc-a647-0567ada6fe8d', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400FA1093 AS DateTime), CAST(0x0000A7D400FA181C AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (11, 1, N'd5d9dcb8-d9e3-4f1c-b4f2-2188b6ff99a1', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400FA1ECA AS DateTime), CAST(0x0000A7D400FA2D1A AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (12, 1, N'254b5f31-9532-4e8d-aa13-0aa3e47d7f9c', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400FA3420 AS DateTime), CAST(0x0000A7D400FAC77F AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (13, 1, N'ee0e1b51-8897-40cd-8494-f3758a83bc93', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400FACAB3 AS DateTime), CAST(0x0000A7D400FACF2B AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (14, 1, N'44c9d9fc-e1dc-4bc3-a798-33c78ef12eb8', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7D400FB1B93 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (15, 1, N'f4761a0f-a54a-4b5d-9ca8-2cf9b6a8c91b', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7D700A661ED AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (16, 1, N'a388be93-f6bb-4368-afe4-526b28cdbf95', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7D8017B0DBC AS DateTime), CAST(0x0000A7D8017B1F76 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (17, 1, N'438a33bc-baa2-4cb5-b0d9-03ead0e3b0c4', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DA00743E08 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (18, 1, N'b4c6e1a8-f432-4de9-a831-6b02565af94b', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DA00851E1F AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (19, 1, N'ed01a96c-ddc1-4137-95db-ffc25849e0f7', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DB0082AEA8 AS DateTime), CAST(0x0000A7DB00831E91 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (20, 2, N'8ceb1d30-94e8-4c77-8572-567728d712e5', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DB00A3AFF1 AS DateTime), CAST(0x0000A7DB00A3D7CC AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (21, 1, N'abcf8ded-8ba5-4d35-9b02-9d40e2fc09fe', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DC00CD5DF7 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (22, 1, N'593039e8-adc4-43f2-b642-768fae5b3fed', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DC0119E1E1 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (23, 1, N'ede17f1d-9b74-44ad-b680-7d83eaf00ea2', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DC012DF7EE AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (24, 1, N'f4ed1436-49d2-415a-bb46-b0e56fc93288', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DC0131D50A AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (25, 1, N'f724f146-5be7-465f-a2a9-b3c498b085db', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD0090B449 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (26, 1, N'b255f574-f46f-44bb-881f-77b0d32504aa', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD00918EEB AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (27, 1, N'8370c183-43a7-40cc-b7d6-28b19b6cd751', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD0093BCA9 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (28, 1, N'6f8bbf5b-46a2-4ebe-a3bd-177a3bb00ee7', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD0096AEFC AS DateTime), CAST(0x0000A7DD00972B9E AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (29, 6, N'308501e8-7568-42b0-8304-19022536e579', N'Firefox', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD0099860C AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (30, 2, N'2cb2d4a3-ec40-4ea1-b379-1574c5af3f3d', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD009DF49E AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (31, 1, N'580e68ac-50fc-4d22-8170-264aad35179f', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD009EAE10 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (32, 1, N'60a1bb94-181b-4998-9db1-f1c48b5d8c86', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DD009F3D90 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (33, 1, N'2b510713-5c5d-48a2-b5b8-5d3267d11a3a', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DE008B39E1 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (34, 1, N'e8958fc0-1f86-4401-97a2-d0965b31e5d0', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DE00930141 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (35, 1, N'7181bb3a-b313-43da-95ec-8078a2b0477f', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DE017670B2 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (36, 1, N'3f2a4d73-ca56-4943-ad8d-814920eacd4a', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DE017D27C8 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (37, 1, N'3c657f66-a3d1-48d3-b687-d1c0ed9a8baf', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF00784E44 AS DateTime), CAST(0x0000A7DF00785AB1 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (38, 7, N'29a95f2c-b184-462e-a586-e465a4fc1da1', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF0079539D AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (39, 1, N'81694bf3-09ac-470e-970e-f5c256271d3c', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF007A53F6 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (40, 1, N'43e54815-77f7-4832-9e9b-42169df972fe', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF00842970 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (41, 1, N'3e57b0ad-4449-4c61-a1b6-b2a4ad32493f', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF0086D498 AS DateTime), CAST(0x0000A7DF0088167D AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (42, 1, N'c39d973e-b17f-491a-9c71-686ff9b97de7', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF0092C9EE AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (43, 1, N'9e2314ca-5a2f-4690-baba-ea3ffa456c76', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF0094E8FB AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (44, 1, N'8c22c1a7-627f-4bec-97d1-f513b0bcbceb', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7DF0097888F AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (45, 1, N'8602a444-6913-4b15-a8c7-38a27114d3e6', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E0009B0C36 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (46, 1, N'f73dbb3e-e05d-4b1b-bd18-748dff4cb4e2', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E000A26EA1 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (47, 1, N'1f6d626a-49de-4baf-a0b3-9017cc514d42', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E1008E8CE8 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (48, 1, N'fad1f42a-bf19-4441-88b7-3b02f08e6c7b', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E10093B290 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (49, 1, N'c0f0ca73-3a79-4051-8dc9-33cd3cb386bd', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E1009C8AD8 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (50, 1, N'4d53e59c-b259-4d78-b2b8-479bbc19d0f6', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E1009DC85F AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (51, 1, N'4880f2b9-d3bb-4696-87e0-1c593f8c4200', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E200964B2B AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (52, 1, N'e0fd810f-4152-4638-82d5-fa072a614b8f', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E200F27757 AS DateTime), NULL)
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (53, 1, N'527d3c03-e351-461e-a53a-b9d3f3921b4b', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E200F8EC6A AS DateTime), CAST(0x0000A7E200FA2205 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (54, 1, N'44e294a4-7bb2-45aa-9af5-4eea88781b5e', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E300A3685D AS DateTime), CAST(0x0000A7E300A43211 AS DateTime))
INSERT [dbo].[tblMstUserLoginDetail] ([Id], [UserId], [AuthId], [BrowserType], [IPAddress], [CityName], [Latitude], [Longitude], [LoginTime], [LogoutTime]) VALUES (55, 8, N'dd10189e-8355-4f42-b038-5054d23285fc', N'Chrome', N'::1', NULL, NULL, NULL, CAST(0x0000A7E300A51A4C AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblMstUserLoginDetail] OFF
/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMstUserDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[FirstName] [nvarchar](500) NULL,
	[LastName] [nvarchar](500) NULL,
	[EmailId] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[AlteranateContact] [nvarchar](max) NULL,
	[IsWelcomeMailSend] [bit] NULL,
	[IsMemberShipTaken] [bit] NULL,
	[UserType] [int] NULL,
	[PersonalIdType] [int] NULL,
	[PersonalIdNo] [nvarchar](max) NULL,
	[UserImage] [nvarchar](max) NULL,
	[CurrentAddress] [nvarchar](max) NULL,
	[PinCode] [nvarchar](50) NULL,
	[CityId] [int] NULL,
	[RefrelCode] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserEntryId] [int] NULL,
 CONSTRAINT [PK_tblMstUserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblMstUserDetail] ON
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (1, 2, N'saswat', N'gupta', N'saswatwhorule@gmail.com', N'09643082168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (2, 3, N'saswat', N'gupta', N'saswatwhorule@gmail.com', N'9643082168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (3, 4, N'saswat', N'gupta', N'saswatwhorule@gmail.com', N'9643082168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'aa', NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (4, 5, N'saswat', N'gupta', N'saswatwhorule@gmail.com', N'9643082168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'qwqwqw', NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (5, 6, N'Amit', N'Kumar', N'saswatwhorule', N'96532222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ddww', NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (6, 7, N'Shika', N'Gupta', N'shikhacool1989@gmail.com', N'7530811394', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'8878787', NULL, NULL, NULL)
INSERT [dbo].[tblMstUserDetail] ([Id], [UserId], [FirstName], [LastName], [EmailId], [ContactNo], [AlteranateContact], [IsWelcomeMailSend], [IsMemberShipTaken], [UserType], [PersonalIdType], [PersonalIdNo], [UserImage], [CurrentAddress], [PinCode], [CityId], [RefrelCode], [EntryDate], [UpdateDate], [UserEntryId]) VALUES (7, 8, N'Sunil', N'sharma', N'sunil.dadheech87@gmail.com', N'4545454545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblMstUserDetail] OFF
/****** Object:  StoredProcedure [dbo].[uspMenuMaster]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[uspMenuMaster]     
(    
 @MenuId int=0,
 @ApplicationID int=0,    
 @MenuText varchar(100)='',    
 @MenuDesc varchar(100)='',    
 @MenuOrder int =0,    
 @NavigateURL varchar(100)='',    
 @CreatedBy int=0,    
 @ParentId int=0,    
 @ActiveFlag int=1,    
 @Type varchar(50)='SEARCH',    
 @RoleId varchar(100)='',    
 @IsApply char(1)='N',    
 @MessageOut varchar(200)='' OUTPUT,    
 @Column_name varchar(100)='',    
 @SearchCriteria varchar(100)=''    
)    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 BEGIN TRANSACTION    
  BEGIN     
  TRY    
   declare @varSearch nvarchar(4000)             
   IF @Type='SEARCH'    
    BEGIN    
     SET @varSearch='select MenuId,MenuText,case when NavigateURL=''#'' then ''Parent'' else NavigateURL end as NavigateURL from MstMenuMaster where IsActive=1'    
                --FOR FILTERING ACTIVE AND INACTIVE RECORDS     
    IF @ActiveFlag=2    
     BEGIN    
      SET @varSearch=@varSearch + ''    
     END    
    ELSE     
     BEGIN    
      SET @varSearch=@varSearch + ' AND  IsActive='+ cast(@ActiveFlag as varchar)     
                    
     END     
    SET @varSearch=@varSearch + ' order by MenuText'    
    execute sp_executesql @varSearch    
   
    END    
    
      
    
                
   IF @Type='SELECT_PARTICULAR_MENU'    
    BEGIN    
        
        
    SELECT MenuId,MenuText,MenuDesc,NavigateURL,OrderNo, CASE WHEN IsActive='1' THEN 'Active' else 'InActive'     
        end as IsActive  FROM MstMenuMaster WHERE 1=1    
    END    
    
    
    
    
       
   IF @Type='INSERT_MENU_ITEM'    
    BEGIN    
                 --Cheking whether Menu is already exist on corresponding Menutext and ParentId , IF not then insert otherwise flash message    
       IF NOT EXISTS    
      (SELECT * FROM  MstMenuMaster WHERE MenuText=@MenuText and ParentID=@ParentId)    
       BEGIN    
      --INSERT COUNTRY DETAILS    
       INSERT INTO MstMenuMaster    
       VALUES (@MenuText,@MenuDesc,@NavigateURL,@ParentId,@MenuOrder,@ApplicationID,@CreatedBy, getdate(),GETDATE(),@ActiveFlag)    
       SET @MessageOut=''    
       END    
       ELSE    
       BEGIN    
       SET @MessageOut='Exists'    
           
       END    
    END    
    
    
    
    
       
   IF @Type='UPDATE_MENU_ITEM'    
    BEGIN    
                  
       UPDATE MstMenuMaster SET MenuText=@MenuText,MenuDesc=@MenuDesc,NavigateURL=@NavigateURL,ApplicationID=@ApplicationID,   
       OrderNo=@MenuOrder,ParentID=@ParentId,UserEntryID=@CreatedBy,IsActive=@ActiveFlag    
       WHERE MenuId=@MenuId    
       SET @MessageOut=''    
         
    END    
       
    
    
    
             --USED IN MENU ROLE MAPPING MASTER      
             --USED FOR CHECKING CHECKBOXES OF MENU CORRESPONDING TO ROLE ASSIGNED TO THEM    
    IF @Type='SELECT_MENUIDS_FOR_ROLEID'    
           BEGIN    
            select mrm.MM_MenuId,aspr.RoleName,mrm.AR_RoleId from MstMenuRoleMaster mrm left join Aspnet_Roles aspr     
            on mrm.AR_RoleId=aspr.RoleId    
            where mrm.AR_RoleId= @RoleId     
           END     
    
    
    
    
   --USED IN MENU ROLE MASTER    
            --MAPPING ROLE WITH SELECTED MENUS    
   IF @Type='APPLY_ROLES_FOR_SELECTED_MENUS'    
           BEGIN    
             IF not exists(select * from MstMenuRoleMaster where MM_MenuId=@MenuId and AR_RoleId= @RoleId)    
               BEGIN    
                IF @IsApply='Y'    
                 BEGIN    
					  INSERT INTO MstMenuRoleMaster(MM_MenuId,AR_RoleId,CreatedBy, CreatedDate)    
					  values(@MenuId,@RoleId,@CreatedBy, getdate())    
                 END    
               END    
             ELSE    
              BEGIN    
                 IF @IsApply='N'    
                 BEGIN    
					 DELETE FROM MstMenuRoleMaster where MM_MenuId=@MenuId and AR_RoleId= @RoleId    
                 END    
              END    
           END      
    
    
    
             --USED IN MASTER PAGE    
             --FOR BINDING MENU    
   IF @Type='BIND_MENU_CONTROL'    
     BEGIN    
     SELECT DISTINCT lmm.MenuID,lmm.MenuText,lmm.NavigateURL    
     ,lmm.ParentId , lmm.OrderNo from MstMenuMaster lmm    
      inner join MstMenuRoleMaster mrm on lmm.MenuID=mrm.MM_MenuId    
     where lmm.Isactive='1'   
      and mrm.AR_RoleId in     
     (    
      select aspur.RoleId from     
      aspnet_Roles aspur     
      left join aspnet_UsersInRoles aspuir on aspur.RoleId=aspuir.RoleId    
      left join tblMstUserMaster aspu on aspu.UserId=aspuir.UserId     
      where aspu.UserId=@CreatedBy and aspuir.UserId=aspu.UserId    
      )     
     order by OrderNo    
     END    
    
    
    
    
               --USED IN MASTER PAGE     
               --VALIDATE USER FOR ROLE EITHER HE CAN ACCESS OR NOT    
    
     --IF @Type='VALIDATE_USER_ROLE_MENU'    
     --BEGIN    
     --SELECT count(*) as cnt from     
     --   aspnet_Roles aspur     
     --   left join aspnet_UsersInRoles aspuir on aspur.RoleId=aspuir.RoleId    
     --   left join MstEmployee aspu on aspu.UserId=aspuir.UserId     
     --   where aspu.username=@CreatedBy and aspuir.UserId=aspu.UserId    
     --   and aspur.RoleId in(    
     --select AR_RoleId from MstMenuRoleMaster mrm inner join     
     --Menu_Master lmm on lmm.Menu_ID=mrm.MM_MenuId    
     --where lower(lmm.Menu_Url)=lower(@NavigateURL)    
     --)    
     --END    
    
    
    
   COMMIT TRANSACTION    
   RETURN 1    
   END TRY    
   BEGIN CATCH    
   ROllBACK TRANSACTION    
       
   SELECT @MessageOut= 'ProcName: uspMenuMaster ErrorState :' + CAST(ERROR_STATE() AS VARCHAR) + '  ErrorNumber :'+ CAST(ERROR_NUMBER() AS VARCHAR) + '   ErrorLine:'+ CAST(ERROR_LINE() AS VARCHAR) + '  Error_Msg  '+ ERROR_MESSAGE()     
  -- EXECUTE [dbo].[uspLogError] @ProcName='uspMenuMaster'    
   RETURN -1    
       
   END CATCH    
END
GO
/****** Object:  StoredProcedure [dbo].[Usp_City]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_City] (
	@Action VARCHAR(100) = ''
	,@CityID INT = ''
	,@CityName VARCHAR(100) = ''
	,@StateID INT = ''
	,@CountryID INT = ''
	,@IsActive BIT = ''
	,@CreatedBy INT = ''
	,@CreatedDate DATETIME = ''
	,@ModifiedBy INT = ''
	,@ModifiedDate DATETIME = ''
	,@SqlMsg NVARCHAR(max) OUTPUT
	)
AS
BEGIN
	SET @SqlMsg = ''

	BEGIN TRY
		IF (@Action = 'GETLIST')
		BEGIN
			SELECT  MRC.CityId,
			     MRC.CityName,
			    MRS.StateId
				,MRS.StateName
				,MRS.IsActive
				,CASE MRS.IsActive
					WHEN 1
						THEN 'Enable'
					ELSE 'Disable'
					END AS [Status]
				
			FROM MstCity AS MRC
			INNER JOIN MstState AS MRS ON MRC.StateId = MRS.StateID
			ORDER BY MRC.StateId,MRC.CityName
		END
	END TRY

	BEGIN CATCH
		SET @SqlMsg = 'Sql server exception - ' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 09/03/2017 10:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[chkLogin]
(
	@Type varchar(100)='',
	@UserName varchar(100)='',
	@Password nvarchar(100)='',
	@TransactionPwd nvarchar(100)='',
	@UserLoginId int=0,
	@OutRes int=0 OUTPUT,
	@UserID int=0 output,
	@RoleID int=0 output,
	@CultureID nvarchar(50)=null output
)



as 
begin

IF @Type='CHECKLOGIN'
begin
set @OutRes = (SELECT count(*) FROM [tblMstUserMaster]
		WHERE Username = @Username And Password COLLATE Latin1_General_CS_AS = @Password and IsActive=1)
		select case @OutRes
		when 1 then 1 --success Login 
		else
		0  --Bad login
		end 
  if @OutRes!=0
  begin
 SELECT     @UserID= AU.UserId,@RoleID=isnull((select top 1 RoleId from aspnet_UsersInRoles where UserId=au.UserId order by RoleId),0),
			@CultureID=isnull(ML.LanguageCode,'en-GB')
			FROM  tblMstUserMaster AS AU LEFT OUTER JOIN
               MstLanguage AS ML ON AU.Language = ML.Id LEFT OUTER JOIN
               aspnet_UsersInRoles AS AUR ON AU.UserId = AUR.UserId
					 where au.UserName=@UserName and Password=@Password
  end
  else
  begin
  set @UserID=0
  set @RoleID=0
  set @CultureID=null
  end
		
             
end

IF @Type ='GETUSERMAILID'
begin
SELECT     UserName,Password
FROM         tblMstUserMaster
WHERE     (UserName = @UserName)
     
end

IF @Type='ATTANDANCELOGIN'
BEGIN
SELECT     @UserID= AU.UserId,@RoleID=ISNULL(AUR.RoleId,0)
FROM         tblMstUserMaster AS AU LEFT OUTER JOIN
                      aspnet_UsersInRoles AS AUR ON AU.UserId = AUR.UserId
					 where au.UserName=@UserName
					 set @OutRes=1
					 
	IF @UserID is null
	begin
	 set @OutRes=0
	 set @UserID=0
	 set @RoleID=0
	 set @CultureID=null
	end
					 
					
END

IF @Type='UPDATE_U_PASSWORD'
BEGIN
	update tblMstUserMaster set Password=@Password,UserEntryId=@UserLoginId,UserEffectedDate=GETDATE() where UserId=@UserLoginId
END



IF @Type ='GET_U_PWD'
begin
	SELECT     Password, UserName
FROM         tblMstUserMaster
WHERE     (UserId = @UserLoginId)
end		
		
end
GO
/****** Object:  ForeignKey [FK_MstState_CountryID]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstState]  WITH CHECK ADD  CONSTRAINT [FK_MstState_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[MstCountry] ([CountryId])
GO
ALTER TABLE [dbo].[MstState] CHECK CONSTRAINT [FK_MstState_CountryID]
GO
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_aspnet_Roles]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstMenuRoleMaster]  WITH CHECK ADD  CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles] FOREIGN KEY([AR_RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[MstMenuRoleMaster] CHECK CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_MstMenuMaster]    Script Date: 09/03/2017 10:25:35 ******/
ALTER TABLE [dbo].[MstMenuRoleMaster]  WITH CHECK ADD  CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster] FOREIGN KEY([MM_MenuId])
REFERENCES [dbo].[MstMenuMaster] ([MenuId])
GO
ALTER TABLE [dbo].[MstMenuRoleMaster] CHECK CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserBankDetail_MstBankMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserBankDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster] FOREIGN KEY([BankId])
REFERENCES [dbo].[MstBankMaster] ([Id])
GO
ALTER TABLE [dbo].[tblMstUserBankDetail] CHECK CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserMaster_MstLanguage]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserMaster_MstLanguage] FOREIGN KEY([Language])
REFERENCES [dbo].[MstLanguage] ([Id])
GO
ALTER TABLE [dbo].[tblMstUserMaster] CHECK CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
/****** Object:  ForeignKey [FK_MstCity_MstState]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[MstCity]  WITH CHECK ADD  CONSTRAINT [FK_MstCity_MstState] FOREIGN KEY([StateId])
REFERENCES [dbo].[MstState] ([StateID])
GO
ALTER TABLE [dbo].[MstCity] CHECK CONSTRAINT [FK_MstCity_MstState]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_aspnet_Roles]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserLoginDetail_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserLoginDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
ALTER TABLE [dbo].[tblMstUserLoginDetail] CHECK CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_tblMstUserDetail_tblMstUserMaster]    Script Date: 09/03/2017 10:25:38 ******/
ALTER TABLE [dbo].[tblMstUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
ALTER TABLE [dbo].[tblMstUserDetail] CHECK CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster]
GO
