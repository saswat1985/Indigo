USE [SNPLCPDB]
GO
/****** Object:  StoredProcedure [dbo].[InsertUserPaymentDetails]    Script Date: 11/24/2017 23:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertUserPaymentDetails]
	-- Add the parameters for the stored procedure here
	@TransitionID varchar(50)='',
	@UserID int=0,
	@PaidAmount money=0.0,
	@IsGstInvoice bit=0,
	@GstNumber varchar='',
	@GstHolderName varchar(100)='',
	@GstHolderAddress varchar(500)=''
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
