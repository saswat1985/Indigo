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
    
    public partial class MstMenuRoleMaster
    {
        public int MR_SNo { get; set; }
        public Nullable<int> MM_MenuId { get; set; }
        public Nullable<int> AR_RoleId { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> Active_Flag { get; set; }
    
        public virtual aspnet_Roles aspnet_Roles { get; set; }
        public virtual MstMenuMaster MstMenuMaster { get; set; }
    }
}
