using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class WebSiteStatusMapper : BaseEntity
    {
        public int Id { get; set; }

        public string WebSiteStatus { get; set; }

        public bool IsValidationRequired { get; set; }
    }
}
