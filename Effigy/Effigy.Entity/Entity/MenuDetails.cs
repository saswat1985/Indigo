using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.Entity
{
    public class MenuDetails
    {
        public int MenuId { get; set; }
        public string MenuText { get; set; }
        public string MenuDesc { get; set; }
        public string NavigateURL { get; set; }
        public Nullable<int> ParentID { get; set; }
        public string ParentMenu { get; set; }
        public Nullable<int> OrderNo { get; set; }
        public Nullable<int> ApplicationID { get; set; }
        public Nullable<bool> IsActive { get; set; }
    }
}
