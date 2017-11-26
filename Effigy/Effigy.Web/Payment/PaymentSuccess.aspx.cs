using Effigy.Entity.DBContext;
using Effigy.Service.Factory;
using System;
using Effigy.Utility;
using Effigy.Service.Contract;

namespace Effigy.Web.Payment
{
    public partial class PaymentSuccess : BasePage
    {
        private string transectionId = string.Empty;
        private int userID;
        private string gstNumber = string.Empty;
        private bool isGstInvoice;
        private decimal amount;
        private string gstHolderName = string.Empty;
        private string gstHolderAddress = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            GetBasicDetails();
        }
        private void GetBasicDetails()
        {
            if (Request.QueryString.HasKeys())
            {
                if (Request.QueryString["TN"] != null && Request.QueryString["UI"] != null && Request.QueryString["GN"] != null &&
                    Request.QueryString["GI"] != null && Request.QueryString["AM"] != null && Request.QueryString["GHN"] != null &&
                    Request.QueryString["GHA"] != null
                    )
                {
                    transectionId = Request.QueryString["TN"].TrimString();
                    userID = Convert.ToInt32(Request.QueryString["UI"].TrimString());
                    gstNumber = Request.QueryString["GN"].TrimString();
                    isGstInvoice = Convert.ToBoolean(Request.QueryString["GI"].TrimString() == "1");
                    amount = Convert.ToDecimal(Request.QueryString["AM"].TrimString());
                    gstHolderName = Request.QueryString["GHN"].TrimString();
                    gstHolderAddress = Request.QueryString["GHA"].TrimString();
                    InsertPaymentDetails(transectionId, userID, amount, isGstInvoice, gstNumber, gstHolderName, gstHolderAddress);
                }
            }

        }

        private void InsertPaymentDetails(string TransationID, int UserID, decimal PaidAmount, bool IsGstInvoice, string GstNumber, string GstHolderName, string GstHolderAddress)
        {
            try
            {
                IUserPaymentService objUserPayment = new UserPayment();
                PaymentDetails objPayment = new PaymentDetails();
                objPayment.TransitionID = TransationID;
                objPayment.UserID = UserID;
                objPayment.PaidAmount = PaidAmount;
                objPayment.IsGstInvoice = IsGstInvoice;
                objPayment.GstNumber = GstNumber;
                objPayment.GstHolderName = GstHolderName;
                objPayment.GstHolderAddress = GstHolderAddress;
                objPayment.PaymentDateTime = DateTime.Now;
                int istrue = objUserPayment.SavePaymentDetail(objPayment);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
           
            
        }
    }
}