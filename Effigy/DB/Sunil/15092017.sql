USE [SNPLCPDB]
GO

/****** Object:  StoredProcedure [dbo].[uspMenuRoleMapper]    Script Date: 9/14/2017 11:34:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].uspUserRoleMapper
	-- Add the parameters for the stored procedure here
	@UserId int=null, 
	@SelectedItems nvarchar(max)=null,
	@CreatedBy int=null
AS
BEGIN
	
	SET NOCOUNT ON;

	delete from [dbo].[aspnet_UsersInRoles] where UserId =@UserId

	INSERT INTO [dbo].[aspnet_UsersInRoles] (RoleId, UserId, UserEntryID, UserEntryDate, UserEffectedDate)
    SELECT  items, @UserId, @CreatedBy, GETDATE(),1
    FROM [dbo].[Split] (@SelectedItems, ',')
    
END

GO


