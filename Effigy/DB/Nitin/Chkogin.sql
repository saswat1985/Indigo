USE [SNPLCPDB]
GO
/****** Object:  StoredProcedure [dbo].[chkLogin]    Script Date: 09/11/2017 07:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[chkLogin]
(
	@Type varchar(100)='',
	@UserName varchar(100)='',
	@Password nvarchar(100)='',
	@TransactionPwd nvarchar(100)='',
	@UserLoginId int=0,
	@OutRes int=0 OUTPUT,
	@UserID int=0 output,
	@RoleID int=0 output,
	@CultureID nvarchar(50)=null output,
	@UserEntryDateTime datetime=null output
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
			@CultureID=isnull(ML.LanguageCode,'en-GB'),
			@UserEntryDateTime=AU.UserEntryDate
			
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
  Set @UserEntryDateTime=null
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

