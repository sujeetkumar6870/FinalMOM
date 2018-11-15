using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eSupport.Core;
using eSupport.BL;
using System.Web.Services;

namespace eSupport.UI
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void AddUserDetails(UserBO UserBO)
        {
            UserBL objUserBL = new UserBL();
            objUserBL.AddUser(UserBO);

            
        }
    }
}