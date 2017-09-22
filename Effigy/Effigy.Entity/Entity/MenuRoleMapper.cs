using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class MenuRoleMapper : BaseEntity
    {
        public int RoleId { get; set; }
        public string SelectedMenus { get; set; }
    }
}
