﻿using Effigy.Entity.DBContext;
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
        public string UserPhoto { get; set; }
        public string RefrelCode { get; set; }
        public int UserCategory { get; set; }
        public bool? IsMemberShipTaken { get; set; }
        public Nullable<bool> AcceptTermCondition { get; set; }
        public Nullable<DateTime> UserEntryDate { get; set; }
        public double TimeRemaining { get; set; }
        public decimal CategoryAmount { get; set; }
        public string ProductCategory { get; set; }
        public string CurrentAddress { get; set; }
        public int CityId { get; set; }
        public int StateId { get; set; }
        public int CountryId { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }
        public decimal? TotalPrice { get; set; }
    }
}
