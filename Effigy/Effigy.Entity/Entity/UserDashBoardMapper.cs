using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class UserDashBoardMapper : BaseEntity
    {
        public int? TotalMember { get; set; }

        public int? TotalDataEntry { get; set; }

        public int? TotalCorrectData { get; set; }
    }
}
