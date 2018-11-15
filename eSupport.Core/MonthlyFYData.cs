using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Metric.Core
{
    public class MonthlyFYData
    {
        public string Month { get; set; }
        public double Target { get; set; }
        public double Stretch { get; set; }
        public double Actual { get; set; }
    }
}
