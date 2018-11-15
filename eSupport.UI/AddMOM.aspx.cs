using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using eSupport.Core;
using eSupport.BL;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace eSupport.UI
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string BindUsers()
        {
            DataTable dt = new DataTable();

            List<BindBO> details = new List<BindBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objBL = new MomBL();
            dt = objBL.GetUsers();

            foreach (DataRow dtrow in dt.Rows)
            {
                //var users = new MomBO();
                var users = new BindBO();
                users.Id = Convert.ToInt32(dtrow["ID"]);
                users.FacilitatorName = dtrow["UserName"].ToString();
                users.RecorderName = dtrow["UserName"].ToString();

                details.Add(users);
            }

            string JsonData = js.Serialize(details);
            return JsonData;
        }

        [WebMethod]
        public static void AddMOMTransaction(MomBO MomBO, ParticipantsBO[] ParticipantsBO, ActionItemsBO[] ActionItemsBO, AgendaBO[] AgendaBO)
        {
            MomBL objUserBL = new MomBL();
            objUserBL.AddMOMTransaction(MomBO, ParticipantsBO, ActionItemsBO, AgendaBO);
        }
    }
}