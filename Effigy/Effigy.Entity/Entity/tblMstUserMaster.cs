using Effigy.Entity.DBContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public partial class tblMstUserMaster : BaseEntity
    {
        
        public const string SP_Name = "chkLogin";
        public int RoleId { get; set; }
        public int OutRes { get; set; }
        public string UserCulture { get; set; }
    }
}
