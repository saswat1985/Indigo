﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Entity.DBContext
{
    public class MstStateData : BaseEntity
    {
        public int StateId { get; set; }
        public string StateName { get; set; }
    }
}
