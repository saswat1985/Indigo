using Effigy.Entity.DBContext;
using Effigy.Service.Factory;
using System;

namespace Effigy.Web.Payment
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        string TransationID = string.Empty;
        int UserID;
        string GstNumber = string.Empty;
        bool IsGstInvoice;
        decimal AMOUNT;
        string GstHolderName = string.Empty;
        string GstHolderAddress = string.Empty;


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
                    TransationID = Request.QueryString["TN"].ToString();
                    UserID = Convert.ToInt32(Request.QueryString["UI"].ToString());
                    GstNumber = Request.QueryString["GN"].ToString();
                    IsGstInvoice = Convert.ToBoolean(Request.QueryString["GI"].ToString());
                    AMOUNT = Convert.ToDecimal(Request.QueryString["AM"].ToString());
                    GstHolderName = Request.QueryString["GHN"].ToString();
                    GstHolderAddress = Request.QueryString["GHA"].ToString();
                }
            }

        }

        private void insertPaymentDetails(string TransationID, int UserID, decimal PaidAmount, bool IsGstInvoice, int GstNumber, string GstHolderName, string GstHolderAddress)
        {
            UserPayment objUserPayment = new UserPayment();
            PaymentDetails objPayment = new PaymentDetails();
            objPayment.TransitionID = TransationID;
            objPayment.UserID = UserID;
            objPayment.PaidAmount = PaidAmount;
            objPayment.IsGstInvoice = IsGstInvoice;
            objPayment.GstNumber = GstNumber;
            objPayment.GstHolderName = GstHolderName;
            objPayment.GstHolderAddress = GstHolderAddress;
            int istrue = objUserPayment.SavePaymentDetail(objPayment);
            if (istrue == 1)
            {

            }
        }
    }
}