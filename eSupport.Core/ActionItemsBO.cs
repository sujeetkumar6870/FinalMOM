using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
    public class ActionItemsBO
    {
        public int ID { get; set; }

        public string ActionItem { get; set; }

        public Nullable<int> Responsible { get; set; }

        public string Status { get; set; }

        public Nullable<System.DateTime> DueDate { get; set; }

        public Nullable<System.DateTime> CloseDate { get; set; }

        public Nullable<int> MomID { get; set; }

        public string Discussion { get; set; }




        public string tempResponsible { get; set; }

        public string tempDueDate { get; set; }

        public string tempCloseDate { get; set; }
    }
}
