//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Effigy.Entity.DBContext
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblMstUserBankDetail
    {
        public int Id { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> BankId { get; set; }
        public string BranchName { get; set; }
        public string IFSCCode { get; set; }
        public string BranchAddress { get; set; }
        public string ACHolderName { get; set; }
        public string ACNo { get; set; }
        public Nullable<int> ACTypeId { get; set; }
        public Nullable<System.DateTime> UserEntryDate { get; set; }
        public Nullable<System.DateTime> UserEffectedDate { get; set; }
        public Nullable<int> UserEntryId { get; set; }
    
        public virtual MstBankMaster MstBankMaster { get; set; }
    }
}
