USE [master]
GO
/****** Object:  Database [SNPLCPDB]    Script Date: 08/02/2017 22:25:48 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SNPLCPDB')
BEGIN
CREATE DATABASE [SNPLCPDB] ON  PRIMARY 
( NAME = N'SNPLCPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SNPLCPDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SNPLCPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SNPLCPDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
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
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_aspnet_Roles]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_tblMstUserMaster_MstLanguage]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserMaster_MstLanguage]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]'))
ALTER TABLE [dbo].[tblMstUserMaster] DROP CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
/****** Object:  ForeignKey [FK_tblMstUserLoginDetail_tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserLoginDetail_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]'))
ALTER TABLE [dbo].[tblMstUserLoginDetail] DROP CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_aspnet_Roles]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 08/02/2017 22:26:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[chkLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[chkLogin]
GO
/****** Object:  StoredProcedure [dbo].[uspMenuMaster]    Script Date: 08/02/2017 22:26:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspMenuMaster]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspMenuMaster]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserLoginDetail_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]'))
ALTER TABLE [dbo].[tblMstUserLoginDetail] DROP CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserLoginDetail]
GO
/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserMaster_MstLanguage]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]'))
ALTER TABLE [dbo].[tblMstUserMaster] DROP CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserMaster]
GO
/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster] DROP CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MstMenuRoleMaster]
GO
/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblMstUserDetail]
GO
/****** Object:  Table [dbo].[MstLanguage]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstLanguage]') AND type in (N'U'))
DROP TABLE [dbo].[MstLanguage]
GO
/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MstMenuMaster]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 08/02/2017 22:25:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 08/02/2017 22:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[MstMenuMaster]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuMaster]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MstLanguage]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstLanguage]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[tblMstUserDetail]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMstUserDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[FirstName] [nvarchar](500) NULL,
	[LastName] [nvarchar](500) NULL,
	[EmailId] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[UserEntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MstMenuRoleMaster]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblMstUserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [varchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Language] [int] NULL,
	[IsActive] [bit] NULL,
	[UserEntryId] [int] NULL,
	[UserEntryDate] [datetime] NULL,
	[UserEffectedDate] [datetime] NULL,
 CONSTRAINT [PK_tblMstUserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMstUserLoginDetail]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 08/02/2017 22:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  StoredProcedure [dbo].[uspMenuMaster]    Script Date: 08/02/2017 22:26:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspMenuMaster]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create PROCEDURE [dbo].[uspMenuMaster]     
(    
 @MenuId int=0,
 @ApplicationID int=0,    
 @MenuText varchar(100)='''',    
 @MenuDesc varchar(100)='''',    
 @MenuOrder int =0,    
 @NavigateURL varchar(100)='''',    
 @CreatedBy int=0,    
 @ParentId int=0,    
 @ActiveFlag int=1,    
 @Type varchar(50)=''SEARCH'',    
 @RoleId varchar(100)='''',    
 @IsApply char(1)=''N'',    
 @MessageOut varchar(200)='''' OUTPUT,    
 @Column_name varchar(100)='''',    
 @SearchCriteria varchar(100)=''''    
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
   IF @Type=''SEARCH''    
    BEGIN    
     SET @varSearch=''select MenuId,MenuText,case when NavigateURL=''''#'''' then ''''Parent'''' else NavigateURL end as NavigateURL from MstMenuMaster where IsActive=1''    
                --FOR FILTERING ACTIVE AND INACTIVE RECORDS     
    IF @ActiveFlag=2    
     BEGIN    
      SET @varSearch=@varSearch + ''''    
     END    
    ELSE     
     BEGIN    
      SET @varSearch=@varSearch + '' AND  IsActive=''+ cast(@ActiveFlag as varchar)     
                    
     END     
    SET @varSearch=@varSearch + '' order by MenuText''    
    execute sp_executesql @varSearch    
   
    END    
    
      
    
                
   IF @Type=''SELECT_PARTICULAR_MENU''    
    BEGIN    
        
        
    SELECT MenuId,MenuText,MenuDesc,NavigateURL,OrderNo, CASE WHEN IsActive=''1'' THEN ''Active'' else ''InActive''     
        end as IsActive  FROM MstMenuMaster WHERE 1=1    
    END    
    
    
    
    
       
   IF @Type=''INSERT_MENU_ITEM''    
    BEGIN    
                 --Cheking whether Menu is already exist on corresponding Menutext and ParentId , IF not then insert otherwise flash message    
       IF NOT EXISTS    
      (SELECT * FROM  MstMenuMaster WHERE MenuText=@MenuText and ParentID=@ParentId)    
       BEGIN    
      --INSERT COUNTRY DETAILS    
       INSERT INTO MstMenuMaster    
       VALUES (@MenuText,@MenuDesc,@NavigateURL,@ParentId,@MenuOrder,@ApplicationID,@CreatedBy, getdate(),GETDATE(),@ActiveFlag)    
       SET @MessageOut=''''    
       END    
       ELSE    
       BEGIN    
       SET @MessageOut=''Exists''    
           
       END    
    END    
    
    
    
    
       
   IF @Type=''UPDATE_MENU_ITEM''    
    BEGIN    
                  
       UPDATE MstMenuMaster SET MenuText=@MenuText,MenuDesc=@MenuDesc,NavigateURL=@NavigateURL,ApplicationID=@ApplicationID,   
       OrderNo=@MenuOrder,ParentID=@ParentId,UserEntryID=@CreatedBy,IsActive=@ActiveFlag    
       WHERE MenuId=@MenuId    
       SET @MessageOut=''''    
         
    END    
       
    
    
    
             --USED IN MENU ROLE MAPPING MASTER      
             --USED FOR CHECKING CHECKBOXES OF MENU CORRESPONDING TO ROLE ASSIGNED TO THEM    
    IF @Type=''SELECT_MENUIDS_FOR_ROLEID''    
           BEGIN    
            select mrm.MM_MenuId,aspr.RoleName,mrm.AR_RoleId from MstMenuRoleMaster mrm left join Aspnet_Roles aspr     
            on mrm.AR_RoleId=aspr.RoleId    
            where mrm.AR_RoleId= @RoleId     
           END     
    
    
    
    
   --USED IN MENU ROLE MASTER    
            --MAPPING ROLE WITH SELECTED MENUS    
   IF @Type=''APPLY_ROLES_FOR_SELECTED_MENUS''    
           BEGIN    
             IF not exists(select * from MstMenuRoleMaster where MM_MenuId=@MenuId and AR_RoleId= @RoleId)    
               BEGIN    
                IF @IsApply=''Y''    
                 BEGIN    
					  INSERT INTO MstMenuRoleMaster(MM_MenuId,AR_RoleId,CreatedBy, CreatedDate)    
					  values(@MenuId,@RoleId,@CreatedBy, getdate())    
                 END    
               END    
             ELSE    
              BEGIN    
                 IF @IsApply=''N''    
                 BEGIN    
					 DELETE FROM MstMenuRoleMaster where MM_MenuId=@MenuId and AR_RoleId= @RoleId    
                 END    
              END    
           END      
    
    
    
             --USED IN MASTER PAGE    
             --FOR BINDING MENU    
   IF @Type=''BIND_MENU_CONTROL''    
     BEGIN    
     SELECT DISTINCT lmm.MenuID,lmm.MenuText,lmm.NavigateURL    
     ,lmm.ParentId , lmm.OrderNo from MstMenuMaster lmm    
      inner join MstMenuRoleMaster mrm on lmm.MenuID=mrm.MM_MenuId    
     where lmm.Isactive=''1''   
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
    
     --IF @Type=''VALIDATE_USER_ROLE_MENU''    
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
       
   SELECT @MessageOut= ''ProcName: uspMenuMaster ErrorState :'' + CAST(ERROR_STATE() AS VARCHAR) + ''  ErrorNumber :''+ CAST(ERROR_NUMBER() AS VARCHAR) + ''   ErrorLine:''+ CAST(ERROR_LINE() AS VARCHAR) + ''  Error_Msg  ''+ ERROR_MESSAGE()     
  -- EXECUTE [dbo].[uspLogError] @ProcName=''uspMenuMaster''    
   RETURN -1    
       
   END CATCH    
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 08/02/2017 22:26:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[chkLogin]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[chkLogin]
(
	@Type varchar(100)='''',
	@UserName varchar(100)='''',
	@Password nvarchar(100)='''',
	@TransactionPwd nvarchar(100)='''',
	@UserLoginId int=0,
	@OutRes int=0 OUTPUT,
	@UserID int=0 output,
	@RoleID int=0 output,
	@CultureID nvarchar(50)=null output
)



as 
begin

IF @Type=''CHECKLOGIN''
begin
set @OutRes = (SELECT count(*) FROM [tblMstUserMaster]
		WHERE Username = @Username And Password = @Password and IsActive=1)
		select case @OutRes
		when 1 then 1 --success Login 
		else
		0  --Bad login
		end 
  if @OutRes!=0
  begin
 SELECT     @UserID= AU.UserId,@RoleID=isnull((select top 1 RoleId from aspnet_UsersInRoles where UserId=au.UserId order by RoleId),0),
			@CultureID=isnull(ML.LanguageCode,''en-GB'')
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

IF @Type =''GETUSERMAILID''
begin
SELECT     UserName,Password
FROM         tblMstUserMaster
WHERE     (UserName = @UserName)
     
end

IF @Type=''ATTANDANCELOGIN''
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

IF @Type=''UPDATE_U_PASSWORD''
BEGIN
	update tblMstUserMaster set Password=@Password,UserEntryId=@UserLoginId,UserEffectedDate=GETDATE() where UserId=@UserLoginId
END



IF @Type =''GET_U_PWD''
begin
	SELECT     Password, UserName
FROM         tblMstUserMaster
WHERE     (UserId = @UserLoginId)
end		
		
end
' 
END
GO
/****** Object:  ForeignKey [FK_MstMenuRoleMaster_aspnet_Roles]    Script Date: 08/02/2017 22:25:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster]  WITH CHECK ADD  CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles] FOREIGN KEY([AR_RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MstMenuRoleMaster_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[MstMenuRoleMaster]'))
ALTER TABLE [dbo].[MstMenuRoleMaster] CHECK CONSTRAINT [FK_MstMenuRoleMaster_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_tblMstUserMaster_MstLanguage]    Script Date: 08/02/2017 22:25:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserMaster_MstLanguage]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]'))
ALTER TABLE [dbo].[tblMstUserMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserMaster_MstLanguage] FOREIGN KEY([Language])
REFERENCES [dbo].[MstLanguage] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserMaster_MstLanguage]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserMaster]'))
ALTER TABLE [dbo].[tblMstUserMaster] CHECK CONSTRAINT [FK_tblMstUserMaster_MstLanguage]
GO
/****** Object:  ForeignKey [FK_tblMstUserLoginDetail_tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserLoginDetail_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]'))
ALTER TABLE [dbo].[tblMstUserLoginDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tblMstUserLoginDetail_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[tblMstUserLoginDetail]'))
ALTER TABLE [dbo].[tblMstUserLoginDetail] CHECK CONSTRAINT [FK_tblMstUserLoginDetail_tblMstUserMaster]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_aspnet_Roles]    Script Date: 08/02/2017 22:25:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_aspnet_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_aspnet_UsersInRoles_tblMstUserMaster]    Script Date: 08/02/2017 22:25:51 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_aspnet_UsersInRoles_tblMstUserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK_aspnet_UsersInRoles_tblMstUserMaster]
GO
