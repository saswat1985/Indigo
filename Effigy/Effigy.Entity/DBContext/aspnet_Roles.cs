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
    
    public partial class aspnet_Roles
    {
        public aspnet_Roles()
        {
            this.aspnet_UsersInRoles = new HashSet<aspnet_UsersInRoles>();
            this.MstMenuRoleMasters = new HashSet<MstMenuRoleMaster>();
        }
    
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> UserEntryID { get; set; }
        public Nullable<System.DateTime> UserEntryDate { get; set; }
        public Nullable<System.DateTime> UserAffectedDate { get; set; }
    
        public virtual ICollection<aspnet_UsersInRoles> aspnet_UsersInRoles { get; set; }
        public virtual ICollection<MstMenuRoleMaster> MstMenuRoleMasters { get; set; }
    }
}
