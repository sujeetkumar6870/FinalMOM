using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
    public class AgendaBO
    {
        public int ID { get; set; }

        public string DiscussionTopic { get; set; }

        public int? Responsible { get; set; }

        public int? MomID { get; set; }

        public Nullable<int> Time { get; set; }

        public string Purpose { get; set; }

        public string Discussion { get; set; }



        public string tempResponsible { get; set; }

    }
}
