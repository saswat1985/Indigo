using Effigy.Entity.DBContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity
{
    public class UserData : BaseEntity
    {
        public int? UserId { get; set; }
        public int? UserType { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string ContactNo { get; set; }
        public string RefrelCode { get; set; }
        public int UserCategory { get; set; }
        public bool? IsMemberShipTaken { get; set; }
        public Nullable<bool> AcceptTermCondition { get; set; }
        public Nullable<DateTime> UserEntryDate { get; set; }
        public double TimeRemaining { get; set; }

    }
}
