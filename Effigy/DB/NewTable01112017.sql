USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstBusinessType]    Script Date: 11/01/2017 09:16:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstBusinessType]') AND type in (N'U'))
DROP TABLE [dbo].[MstBusinessType]
GO

/****** Object:  Table [dbo].[MstWebSiteStatus]    Script Date: 11/01/2017 09:16:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstWebSiteStatus]') AND type in (N'U'))
DROP TABLE [dbo].[MstWebSiteStatus]
GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstBusinessType]    Script Date: 11/01/2017 09:16:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MstBusinessType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessType] [nvarchar](max) NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MstBusinessType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [SNPLCPDB]
GO

/****** Object:  Table [dbo].[MstWebSiteStatus]    Script Date: 11/01/2017 09:16:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MstWebSiteStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteStatus] [nvarchar](max) NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MstWebSiteStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


