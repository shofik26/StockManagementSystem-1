﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockManagementSystem.Models
{
    public class Stockin
    {
        public int Id { get; set; }
        public string Category { get; set; }
        public string Company { get; set; }
        public string Item { get; set; }
        //public int SIQuantity { get; set; }
        public string SIQuantity { get; set; }
        public int CategoryId { get; set; }
        public int CompanyId { get; set; }
        public string ErrorText { get; set; }
    }
}
