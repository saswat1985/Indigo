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
    
    public partial class tblRawUniqueURL
    {
        public int Id { get; set; }
        public Nullable<int> MasterId { get; set; }
        public string UniqueURL { get; set; }
        public string DomainName { get; set; }
        public Nullable<bool> IsValidate { get; set; }
    }
}
