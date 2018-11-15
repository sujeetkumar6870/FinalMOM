using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
    public class BindBO
    {
        private int _Id;

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        private string _FacilitatorName;

        public string FacilitatorName
        {
            get { return _FacilitatorName; }
            set { _FacilitatorName = value; }
        }

        private string _RecorderName;

        public string RecorderName
        {
            get { return _RecorderName; }
            set { _RecorderName = value; }
        }
    }
}
