using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.Entity
{
    public class UserProfileData
    {
        public int UserId { get; set; }
        
        public string UserCode { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string EmailId { get; set; }
        public string ZipCode { get; set; }
        public int CountryId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
        public string Phone { get; set; }

        public int BankId { get; set; }
        public string BranchName { get; set; }
        public string IFSCCode { get; set; }
        public string BranchAddress { get; set; }
        public string ACHolderName { get; set; }
        public string ACNo { get; set; }
    }
}
