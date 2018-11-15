using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eSupport.Core
{
   public class UserBO
    {
        private Int64 _EmpID;

        public Int64 EmpID
        {
            get { return _EmpID; }
            set { _EmpID = value; }
        }
        private string _UserName;

        public string UserName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }
        private string _EmailID;

        public string EmailID
        {
            get { return _EmailID; }
            set { _EmailID = value; }
        }
        private Int64 _Contact;

        public Int64 Contact
        {
            get { return _Contact; }
            set { _Contact = value; }
        }
        private string _Location;

        public string Location
        {
            get { return _Location; }
            set { _Location = value; }
        }
        private Int64 _HPUserID;

        public Int64 HP_UserID
        {
            get { return _HPUserID; }
            set { _HPUserID = value; }
        }
        private string _HP_EmailID;

        public string HP_EmailID
        {
            get { return _HP_EmailID; }
            set { _HP_EmailID = value; }
        }
        private string _HPDomain;

        public string HP_Domain
        {
            get { return _HPDomain; }
            set { _HPDomain = value; }
        }
        private string _HPUserName;

        public string HP_UserName
        {
            get { return _HPUserName; }
            set { _HPUserName = value; }
        }
        private string _LaptopMfgSr;

        public string LaptopMfgSr
        {
            get { return _LaptopMfgSr; }
            set { _LaptopMfgSr = value; }
        }
    }
}
