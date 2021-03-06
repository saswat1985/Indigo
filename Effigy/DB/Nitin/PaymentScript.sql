USE [SNPLCPDB]
GO
/****** Object:  ForeignKey [FK_tblMstUserPaymentDetail_tblMstUserMaster]    Script Date: 11/23/2017 08:07:53 ******/
ALTER TABLE [dbo].[tblMstUserPaymentDetail] DROP CONSTRAINT [FK_tblMstUserPaymentDetail_tblMstUserMaster]
GO
/****** Object:  Table [dbo].[tblMstUserPaymentDetail]    Script Date: 11/23/2017 08:07:53 ******/
ALTER TABLE [dbo].[tblMstUserPaymentDetail] DROP CONSTRAINT [FK_tblMstUserPaymentDetail_tblMstUserMaster]
GO
ALTER TABLE [dbo].[tblMstUserPaymentDetail] DROP CONSTRAINT [DF_tblMstUserPaymentDetail_IsGstInvoice]
GO
ALTER TABLE [dbo].[tblMstUserPaymentDetail] DROP CONSTRAINT [DF_tblMstUserPaymentDetail_CreatedDate]
GO
DROP TABLE [dbo].[tblMstUserPaymentDetail]
GO
/****** Object:  Table [dbo].[tblMstUserPaymentDetail]    Script Date: 11/23/2017 08:07:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMstUserPaymentDetail](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[TransitionID] [varchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
	[PaidAmount] [money] NOT NULL,
	[IsGstInvoice] [bit] NOT NULL CONSTRAINT [DF_tblMstUserPaymentDetail_IsGstInvoice]  DEFAULT ((0)),
	[GstNumber] [int] NULL,
	[GstHolderName] [varchar](100) NULL,
	[GstHolderAddress] [varchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_tblMstUserPaymentDetail_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblMstUserPaymentDetail] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_tblMstUserPaymentDetail_tblMstUserMaster]    Script Date: 11/23/2017 08:07:53 ******/
ALTER TABLE [dbo].[tblMstUserPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblMstUserPaymentDetail_tblMstUserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblMstUserMaster] ([UserId])
GO
ALTER TABLE [dbo].[tblMstUserPaymentDetail] CHECK CONSTRAINT [FK_tblMstUserPaymentDetail_tblMstUserMaster]
GO

DROP PROCEDURE [dbo].[InsertUserPaymentDetails]


GO
/****** Object:  StoredProcedure [dbo].[InsertUserPaymentDetails]    Script Date: 11/23/2017 08:08:29 ******/
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
