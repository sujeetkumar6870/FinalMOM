using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
   public class MomBO_OLD
    {
        private int _Id;

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        private string _Title;

        public string Title
        {
            get { return _Title; }
            set { _Title = value; }
        }
        private DateTime _Date;

        public DateTime Date
        {
            get { return _Date; }
            set { _Date = value; }
        }
        private string _Facilitator;

        public string Facilitator
        {
            get { return _Facilitator; }
            set { _Facilitator = value; }
        }
        private string _Recorder;

        public string Recorder
        {
            get { return _Recorder; }
            set { _Recorder = value; }
        }
        private string _LocationDetails;

        public string LocationDetails
        {
            get { return _LocationDetails; }
            set { _LocationDetails = value; }
        }

        private string _AttendeeName;

        public string AttendeeName
        {
            get { return _AttendeeName; }
            set { _AttendeeName = value; }
        }

        private string _AttendeeStatus;

        public string AttendeeStatus
        {
            get { return _AttendeeStatus; }
            set { _AttendeeStatus = value; }
        }
    }
}
