using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
    public class MomBO
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public DateTime? Date { get; set; }

        public int? Facilitator { get; set; }

        public int? Recorder { get; set; }

        public string LocationDetails { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }


        public string tempDate { get; set; }

        public string tempFacilitator { get; set; }

        public string tempRecorder { get; set; }



    }
}
