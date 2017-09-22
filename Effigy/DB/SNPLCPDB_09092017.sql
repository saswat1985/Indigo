USE [SNPLCPDB]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstCity_MstState]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstCity]'))
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_MstCity_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_IsActive]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_MstCity_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_MstCountry_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MstCountry] DROP CONSTRAINT [DF_MstCountry_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_MstMenuMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstState_MstCountry]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstState]'))
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_MstCountry]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserBankDetail_MstBankMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserBankDetail]'))
ALTER TABLE [dbo].[tblMstUserBankDetail] DROP CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserDetail_MstCity]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserDetail]'))
ALTER TABLE [dbo].[tblMstUserDetail] DROP CONSTRAINT [FK_tblMstUserDetail_MstCity]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserDetail_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserDetail]'))
ALTER TABLE [dbo].[tblMstUserDetail] DROP CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserMaster_MstLanguage]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]'))
ALTER TABLE [dbo].[tblMstUserMaster] DROP CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserTreeStructure_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserTreeStructure]'))
ALTER TABLE [dbo].[tblMstUserTreeStructure] DROP CONSTRAINT [FK_tblMstUserTreeStructure_tblMstUserMaster]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserCategoryMapping_MstUserWorkCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserCategoryMapping]'))
ALTER TABLE [dbo].[tblMstUserCategoryMapping] DROP CONSTRAINT [FK_tblMstUserCategoryMapping_MstUserWorkCategory]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserCategoryMapping_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserCategoryMapping]'))
ALTER TABLE [dbo].[tblMstUserCategoryMapping] DROP CONSTRAINT [FK_tblMstUserCategoryMapping_tblMstUserMaster]
GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Roles]
GO

/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_UsersInRoles]
GO

/****** Object:  Table [dbo].[MstBankMaster]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstBankMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MstBankMaster]
GO

/****** Object:  Table [dbo].[MstCity]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstCity]') AND type in (N'U'))
DROP TABLE [dbo].[MstCity]
GO

/****** Object:  Table [dbo].[MstCountry]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstCountry]') AND type in (N'U'))
DROP TABLE [dbo].[MstCountry]
GO

/****** Object:  Table [dbo].[MstLanguage]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstLanguage]') AND type in (N'U'))
DROP TABLE [dbo].[MstLanguage]
GO

/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MstMenuMaster]
GO

/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MstMenuRoleMaster]
GO

/****** Object:  Table [dbo].[MstState]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstState]') AND type in (N'U'))
DROP TABLE [dbo].[MstState]
GO

/****** Object:  Table [dbo].[MstUserWorkCategory]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstUserWorkCategory]') AND type in (N'U'))
DROP TABLE [dbo].[MstUserWorkCategory]
GO

/****** Object:  Table [dbo].[tblMstUserBankDetail]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserBankDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserBankDetail]
GO

/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserDetail]
GO

/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserLoginDetail]
GO

/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserMaster]
GO

/****** Object:  Table [dbo].[tblMstUserTreeStructure]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserTreeStructure]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserTreeStructure]
GO

/****** Object:  Table [dbo].[tblMstUserCategoryMapping]    Script Date: 09/09/2017 16:53:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserCategoryMapping]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserCategoryMapping]
GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstBankMaster]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstCity]    Script Date: 09/09/2017 16:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MstCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NOT NULL,
	[StateId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MstCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstCountry]    Script Date: 09/09/2017 16:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MstCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_MstCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstLanguage]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstState]    Script Date: 09/09/2017 16:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MstState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NOT NULL,
	[CountryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_MstState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstUserWorkCategory]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserBankDetail]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 09/09/2017 16:53:03 ******/
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
	[RegisterRefrelCode] [nvarchar](50) NULL,
	[SelfRefrelCode] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserEntryId] [int] NULL,
 CONSTRAINT [PK_tblMstUserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 09/09/2017 16:53:03 ******/
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

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserTreeStructure]    Script Date: 09/09/2017 16:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblMstUserTreeStructure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ParentId] [int] NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserTreeStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[tblMstUserCategoryMapping]    Script Date: 09/09/2017 16:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblMstUserCategoryMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[UserEntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserCategoryMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO

ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO

ALTER TABLE [dbo].[MstCity]  WITH CHECK ADD  CONSTRAINT [FK_MstCity_MstState] FOREIGN KEY([StateId])
REFERENCES [dbo].[MstState] ([StateID])
GO

ALTER TABLE [dbo].[MstCity] CHECK CONSTRAINT [FK_MstCity_MstState]
GO

ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[MstCountry] ADD  CONSTRAINT [DF_MstCountry_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[MstMenuRoleMaster]  WITH CHECK ADD  CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles] FOREIGN KEY([AR_RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO

ALTER TABLE [dbo].[MstMenuRoleMaster] CHECK CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO

ALTER TABLE [dbo].[MstMenuRoleMaster]  WITH CHECK ADD  CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster] FOREIGN KEY([MM_MenuId])
REFERENCES [dbo].[MstMenuMaster] ([MenuId])
GO

ALTER TABLE [dbo].[MstMenuRoleMaster] CHECK CONSTRAINT [FK_MstMenuRoleMaster_MstMenuMaster]
GO

ALTER TABLE [dbo].[MstState]  WITH CHECK ADD  CONSTRAINT [FK_MstState_MstCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[MstCountry] ([CountryId])
GO

ALTER TABLE [dbo].[MstState] CHECK CONSTRAINT [FK_MstState_MstCountry]
GO

ALTER TABLE [dbo].[tblMstUserBankDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster] FOREIGN KEY([BankId])
REFERENCES [dbo].[MstBankMaster] ([Id])
GO

ALTER TABLE [dbo].[tblMstUserBankDetail] CHECK CONSTRAINT [FK_tblMstUserBankDetail_MstBankMaster]
GO

ALTER TABLE [dbo].[tblMstUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserDetail_MstCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[MstCity] ([CityId])
GO

ALTER TABLE [dbo].[tblMstUserDetail] CHECK CONSTRAINT [FK_tblMstUserDetail_MstCity]
GO

ALTER TABLE [dbo].[tblMstUserDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO

ALTER TABLE [dbo].[tblMstUserDetail] CHECK CONSTRAINT [FK_tblMstUserDetail_tblMstUserMaster]
GO

ALTER TABLE [dbo].[tblMstUserMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserMaster_MstLanguage] FOREIGN KEY([Language])
REFERENCES [dbo].[MstLanguage] ([Id])
GO

ALTER TABLE [dbo].[tblMstUserMaster] CHECK CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO

ALTER TABLE [dbo].[tblMstUserTreeStructure]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserTreeStructure_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO

ALTER TABLE [dbo].[tblMstUserTreeStructure] CHECK CONSTRAINT [FK_tblMstUserTreeStructure_tblMstUserMaster]
GO

ALTER TABLE [dbo].[tblMstUserCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserCategoryMapping_MstUserWorkCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[MstUserWorkCategory] ([Id])
GO

ALTER TABLE [dbo].[tblMstUserCategoryMapping] CHECK CONSTRAINT [FK_tblMstUserCategoryMapping_MstUserWorkCategory]
GO

ALTER TABLE [dbo].[tblMstUserCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserCategoryMapping_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO

ALTER TABLE [dbo].[tblMstUserCategoryMapping] CHECK CONSTRAINT [FK_tblMstUserCategoryMapping_tblMstUserMaster]
GO


