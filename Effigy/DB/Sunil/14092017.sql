



create FUNCTION [dbo].[Split](@String varchar(MAX), @Delimiter char(1))       
returns @temptable TABLE (items varchar(MAX))       
as       
begin      
    declare @idx int       
    declare @slice varchar(8000)       

    select @idx = 1       
        if len(@String)<1 or @String is null  return       

    while @idx!= 0       
    begin       
        set @idx = charindex(@Delimiter,@String)       
        if @idx!=0       
            set @slice = left(@String,@idx - 1)       
        else       
            set @slice = @String       

        if(len(@slice)>0)  
            insert into @temptable(Items) values(@slice)       

        set @String = right(@String,len(@String) - @idx)       
        if len(@String) = 0 break       
    end   
return 
end;

-----------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE uspMenuRoleMapper
	-- Add the parameters for the stored procedure here
	@RoleId int=null, 
	@SelectedMenus nvarchar(max)=null,
	@CreatedBy int=null,
	@CreatedDate datetime=null
AS
BEGIN
	
	SET NOCOUNT ON;

	delete from [dbo].[MstMenuRoleMaster] where AR_RoleId=@RoleId

	INSERT INTO [dbo].[MstMenuRoleMaster] (MM_MenuId, AR_RoleId, CreatedBy, CreatedDate, Active_Flag)
    SELECT  items,@RoleId,@CreatedBy,@CreatedDate,1
    FROM [dbo].[Split] (@SelectedMenus, ',')
    
END
GO
