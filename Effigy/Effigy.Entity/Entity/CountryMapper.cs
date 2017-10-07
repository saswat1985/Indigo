using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class CountryMapper : BaseEntity
    {
        public int CountryId { get; set; }
        public string CountryPhoneCode { get; set; }
        public string CountryName { get; set; }
        public bool IsActive { get; set; }
    }
}
