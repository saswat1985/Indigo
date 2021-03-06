USE [SNPLCPDB]
GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 08/13/2017 02:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MstState]    Script Date: 08/13/2017 02:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MstCity]    Script Date: 08/13/2017 02:21:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MstCity](
	[CityId] [int] NOT NULL,
	[CityName] [varchar](100) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_MstCity_IsActive]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_MstCity_CreatedDate]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_MstCountry_CreatedDate]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstCountry] ADD  CONSTRAINT [DF_MstCountry_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_MstState_IsActive]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstState] ADD  CONSTRAINT [DF_MstState_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_MstState_CreatedDate]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstState] ADD  CONSTRAINT [DF_MstState_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  ForeignKey [FK_MstCity_MstState]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstCity]  WITH CHECK ADD  CONSTRAINT [FK_MstCity_MstState] FOREIGN KEY([StateId])
REFERENCES [dbo].[MstState] ([StateID])
GO
ALTER TABLE [dbo].[MstCity] CHECK CONSTRAINT [FK_MstCity_MstState]
GO
/****** Object:  ForeignKey [FK_MstState_CountryID]    Script Date: 08/13/2017 02:21:41 ******/
ALTER TABLE [dbo].[MstState]  WITH CHECK ADD  CONSTRAINT [FK_MstState_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[MstCountry] ([CountryId])
GO
ALTER TABLE [dbo].[MstState] CHECK CONSTRAINT [FK_MstState_CountryID]
GO
