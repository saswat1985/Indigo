using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity.DBContext;

namespace Effigy.Entity.DBContext
{
    public class CityMapper : BaseEntity
    {
        public int Cityid { get; set; }
        public int StateId { get; set; }
        public string StateName { get; set; }
        public string CityName { get; set; }
        public string CountryName { get; set; }
        public bool IsActive { get; set; }
    }
}
