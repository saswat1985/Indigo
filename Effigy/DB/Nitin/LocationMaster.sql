USE [SNPLCPDB]
GO
/****** Object:  StoredProcedure [dbo].[Usp_Country]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP PROCEDURE [dbo].[Usp_Country]
GO
/****** Object:  StoredProcedure [dbo].[Usp_City]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP PROCEDURE [dbo].[Usp_City]
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP PROCEDURE [dbo].[chkLogin]
GO
ALTER TABLE [dbo].[MstState] DROP CONSTRAINT [FK_MstState_CountryID]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [FK_MstCity_MstState]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_CreatedDate]
GO
ALTER TABLE [dbo].[MstCity] DROP CONSTRAINT [DF_MstCity_IsActive]
GO
/****** Object:  Table [dbo].[MstState]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP TABLE [dbo].[MstState]
GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP TABLE [dbo].[MstCountry]
GO
/****** Object:  Table [dbo].[MstCity]    Script Date: 8/21/2017 6:33:35 PM ******/
DROP TABLE [dbo].[MstCity]
GO
/****** Object:  Table [dbo].[MstCity]    Script Date: 8/21/2017 6:33:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MstCity](
	[CityId] [int] NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MstCountry]    Script Date: 8/21/2017 6:33:35 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MstState]    Script Date: 8/21/2017 6:33:35 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[MstCountry] ON 

GO
INSERT [dbo].[MstCountry] ([CountryId], [CountryName], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifyDate]) VALUES (1, N'India', 1, 1, CAST(N'2017-08-20 00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MstCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[MstState] ON 

GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'Andaman & Nicobar', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Andhra Pradesh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Arunachal Pradesh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Assam', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bihar', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Chandigarh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Chattisgarh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Dadra & Nagar Haveli', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Daman & Diu', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Delhi', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Goa', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Gujarat', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Haryana', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Himachal Pradesh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Jammu & Kashmir', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Jharkhand', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Karnataka', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Kerala', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Lakshadweep', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Madhya Pradesh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Maharashtra', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Manipur', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Meghalaya', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Mizoram', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Nagaland', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Odisha', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Puducherry', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Punjab', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Rajasthan', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Sikkim', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Tamil Nadu', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Tripura', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Uttar Pradesh', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Uttarakhand', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'West Bengal', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
INSERT [dbo].[MstState] ([StateID], [StateName], [CountryID], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Telangana', 1, 1, 1, CAST(N'2017-08-21 18:18:31.030' AS DateTime), NULL, CAST(N'2017-08-21 18:18:44.567' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MstState] OFF
GO
ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MstCity] ADD  CONSTRAINT [DF_MstCity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MstCity]  WITH CHECK ADD  CONSTRAINT [FK_MstCity_MstState] FOREIGN KEY([StateId])
REFERENCES [dbo].[MstState] ([StateID])
GO
ALTER TABLE [dbo].[MstCity] CHECK CONSTRAINT [FK_MstCity_MstState]
GO
ALTER TABLE [dbo].[MstState]  WITH CHECK ADD  CONSTRAINT [FK_MstState_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[MstCountry] ([CountryId])
GO
ALTER TABLE [dbo].[MstState] CHECK CONSTRAINT [FK_MstState_CountryID]
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 8/21/2017 6:33:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_City]    Script Date: 8/21/2017 6:33:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_Country]    Script Date: 8/21/2017 6:33:35 PM ******/
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
