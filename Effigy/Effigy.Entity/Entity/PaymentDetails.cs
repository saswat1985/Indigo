namespace Effigy.Entity.DBContext
{
    public class PaymentDetails : BaseEntity
    {
        public int PaymentID { get; set; }
        public string TransitionID { get; set; }
        public int UserID { get; set; }
        public decimal PaidAmount { get; set; }

        public bool IsGstInvoice { get; set; }
        public string GstNumber { get; set; }
        public string GstHolderName { get; set; }
        public string GstHolderAddress { get; set; }


    }
}
