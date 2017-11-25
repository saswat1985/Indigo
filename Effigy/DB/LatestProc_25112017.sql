USE [SNPLCPDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_RawURLEntry]    Script Date: 11/25/2017 16:24:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_RawURLEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_RawURLEntry]
GO

/****** Object:  StoredProcedure [dbo].[USP_GetDomain]    Script Date: 11/25/2017 16:24:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GetDomain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GetDomain]
GO

/****** Object:  StoredProcedure [dbo].[InsertUserPaymentDetails]    Script Date: 11/25/2017 16:24:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertUserPaymentDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertUserPaymentDetails]
GO

USE [SNPLCPDB]
GO

/****** Object:  StoredProcedure [dbo].[USP_RawURLEntry]    Script Date: 11/25/2017 16:24:37 ******/
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
declare @domainName nvarchar(max)
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
	
	EXECUTE USP_GetDomain @domainname = @domainName OUT, @URL = @EnterURL
	
	IF not exists(select * from tblRawUniqueURL where DomainName=@domainname)
		Begin
			INSERT INTO tblRawUniqueURL
                      (MasterId, UniqueURL,DomainName, IsValidate)
			VALUES     (@EntryId,@EnterURL,@domainname, 'false')
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

/****** Object:  StoredProcedure [dbo].[USP_GetDomain]    Script Date: 11/25/2017 16:24:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_GetDomain] 
(
	@URL nvarchar(max)='',
	@DomainName nvarchar(max) Output
)

AS
Begin
DECLARE @Var NVARCHAR(1000)
SET @Var=@URL;

WITH cteWithoutWWW (Domain)
as
(
    SELECT
      case when PATINDEX('%www.%', @Var) > 0 then
            SUBSTRING(@Var, PATINDEX('%www.%', @Var) + 4, LEN(@Var) - PATINDEX('%www.%', @Var))
      else
            @Var
      end
),
cteWithoutHTTP (Domain)
as
(
      select
      case when PATINDEX('http://%', Domain) > 0 then
            SUBSTRING(Domain, PATINDEX('http://%', Domain) + 7, LEN(Domain) - PATINDEX('http://%', Domain))
      when PATINDEX('https://%', Domain) > 0 then
            SUBSTRING(Domain, PATINDEX('https://%', Domain) + 8, LEN(Domain) - PATINDEX('https://%', Domain))
      else
            Domain
      end
      from cteWithoutWWW
),
cteWithoutSlash (Domain)
as
(
      select
      case when CHARINDEX('/', Domain) > 0 then
            SUBSTRING(Domain, 0, CHARINDEX('/', Domain))
      else
            Domain
      end
      from cteWithoutHTTP
)
select @DomainName=Domain from cteWithoutSlash
end
GO

/****** Object:  StoredProcedure [dbo].[InsertUserPaymentDetails]    Script Date: 11/25/2017 16:24:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertUserPaymentDetails]
	-- Add the parameters for the stored procedure here
	@TransitionID varchar(50)='',
	@UserID int=0,
	@PaidAmount money=0.0,
	@IsGstInvoice bit=0,
	@GstNumber int=0,
	@GstHolderName varchar(100)=null,
	@GstHolderAddress varchar(500)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [dbo].[tblMstUserPaymentDetail]
           (
           [TransitionID]
           ,[UserID]
           ,[PaidAmount]
           ,[IsGstInvoice],
			[GstNumber],
			[GstHolderName],
			[GstHolderAddress]
           )
     VALUES
           (@TransitionID,@UserID,@PaidAmount,@IsGstInvoice,@GstNumber,@GstHolderName,@GstHolderAddress)
END

GO


