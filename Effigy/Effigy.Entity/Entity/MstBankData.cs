using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class MstBankData : BaseEntity
    {
        public int Id { get; set; }
        public string BankName { get; set; }
    }
}
