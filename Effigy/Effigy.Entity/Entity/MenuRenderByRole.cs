using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class MenuRenderByRole :BaseEntity
    {
        public const string SP_Name = "uspMenuMaster";
        public int MenuId { get; set; }
        public string MenuText { get; set; }
        public string MenuDesc { get; set; }
        public string NavigateURL { get; set; }
        public Nullable<int> ParentID { get; set; }
        public Nullable<int> OrderNo { get; set; }
    }
}
