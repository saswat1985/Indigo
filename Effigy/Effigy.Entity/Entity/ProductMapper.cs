using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class ProductMapper : BaseEntity
    {
        public int Id { get; set; }
        public string CategoryCode { get; set; }
        public string CategoryName { get; set; }
        public string CategoryDesc { get; set; }
        public decimal? CategoryPrice { get; set; }
        public Nullable<int> CatIntroPercentage { get; set; }
        public Nullable<int> CatWorkPercentage { get; set; }
        public Nullable<int> WorkPaymentRate { get; set; }
        public int Tax { get; set; }
        public decimal? TotalAmount { get; set; }

    }
}
