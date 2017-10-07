USE [SNPLCPDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_RawURLEntry]    Script Date: 10/07/2017 09:02:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[USP_RawURLEntry]
(
	@UserEntryId int=0,
	@RawURLString nvarchar(max)

)
As 
Begin
declare @EntryCode varchar(max)='',@EntryId int=0,@intFlag INT,@URLEntryCount int=0
SET @intFlag = 1
SELECT @EntryCode='CP0-'+CONVERT(varchar(50),(COALESCE(max(Id),0)+1)),@EntryId=(COALESCE(max(Id),0)+1) FROM tblRawURL


INSERT INTO [tblRawURL]
           ([URLEntryCode]
           ,[UserEntryId]
           ,[UserEntryDate])
     VALUES
           (@EntryCode,@UserEntryId,GETDATE())     
           
INSERT INTO tblRawURLDetail 
SELECT @EntryId ,items ,'true' ,GETDATE() FROM dbo.Split(@RawURLString,',') 
  
IF OBJECT_ID('tempdb..#tempUrl') IS NOT NULL DROP TABLE #tempUrl

Select ROW_NUMBER() OVER (ORDER BY(SELECT 0)) AS SNo,URL as EnterURL,Id as detailId into #tempUrl from tblRawURLDetail where MasterId=@EntryId         

select @URLEntryCount=COUNT(*) from #tempUrl

	WHILE (@intFlag <=@URLEntryCount)
	BEGIN
	declare @EnterURL nvarchar(500)='',@DetailId int=0
	
	select @EnterURL=EnterURL,@DetailId=detailId from #tempUrl where SNo=@intFlag
	
	IF not exists(select * from tblRawUniqueURL where UniqueURL=@EnterURL)
		Begin
			INSERT INTO tblRawUniqueURL
                      (MasterId, UniqueURL, IsValidate)
			VALUES     (@EntryId,@EnterURL, 'false')
		End
	Else
		begin
			Update tblRawURLDetail set IsUnique='false' where Id=@DetailId
		end

	SET @intFlag = @intFlag + 1
	END
Select MasterId,URL,case when IsUnique=1 then 'G' else 'R' end as urlStatus from tblRawURLDetail where MasterId=@EntryId

end


GO


