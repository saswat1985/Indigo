USE [SNPLCPDB]
GO
/****** Object:  Table [dbo].[MstPersonalIDType]    Script Date: 11/27/2017 23:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstPersonalIDType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonalIdType] [nvarchar](50) NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MstPersonalIDType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MstPersonalIDType] ON
INSERT [dbo].[MstPersonalIDType] ([Id], [PersonalIdType], [UserEntryDate], [UserEffectedDate], [IsActive]) VALUES (1, N'Aadhar card', NULL, NULL, 1)
INSERT [dbo].[MstPersonalIDType] ([Id], [PersonalIdType], [UserEntryDate], [UserEffectedDate], [IsActive]) VALUES (2, N'Voter ID card', NULL, NULL, 1)
INSERT [dbo].[MstPersonalIDType] ([Id], [PersonalIdType], [UserEntryDate], [UserEffectedDate], [IsActive]) VALUES (3, N'Pan Card', NULL, NULL, 1)
INSERT [dbo].[MstPersonalIDType] ([Id], [PersonalIdType], [UserEntryDate], [UserEffectedDate], [IsActive]) VALUES (4, N'Passport', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[MstPersonalIDType] OFF



-------------------------------------

Alter table tblMstUserDetail add Gender nvarchar(50) null;
GO

Alter table tblMstUserDetail add DOB datetime null;
GO
