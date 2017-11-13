using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class UniqueURLMapper : BaseEntity
    {
        public int Id { get; set; }

        public int MasterId { get; set; }

        public string UniqueURL { get; set; }
    }
}
