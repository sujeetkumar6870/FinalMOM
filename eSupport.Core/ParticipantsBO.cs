using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
    public class ParticipantsBO
    {
        public int ID { get; set; }

        public int? UserID { get; set; }

        public int? MomID { get; set; }

        public bool? Availability { get; set; }



        public string tempName { get; set; }
        public string tempStatus { get; set; }
    }
}
