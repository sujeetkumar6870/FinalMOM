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
using Newtonsoft.Json;



namespace eSupport.UI
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(!IsPostBack)
            {
                BindDatatable();
            }
           
        }

           [WebMethod]
            //public static UserBO[] BindDatatable()
           public static string BindDatatable()
            {

                DataTable dt = new DataTable();

                List<UserBO> details = new List<UserBO>();

                JavaScriptSerializer js = new JavaScriptSerializer();
                HttpContext Context = HttpContext.Current;

               UserBL objBL=new UserBL();
                dt= objBL.GetUserList();

                foreach (DataRow dtrow in dt.Rows)
                {
                    var users = new UserBO
                    {
                        EmpID = Convert.ToInt32(dtrow["EmpID"]),

                        UserName = dtrow["UserName"].ToString(),

                        EmailID = dtrow["EmailID"].ToString(),

                        Contact = Convert.ToInt64(dtrow["Contact"]),

                        Location = dtrow["Location"].ToString(),

                        HP_UserID = Convert.ToInt64(dtrow["HP_UserID"]),

                        HP_EmailID = dtrow["HP_EmailID"].ToString(),

                        HP_UserName = dtrow["HP_Username"].ToString(),

                        LaptopMfgSr = dtrow["LaptopMfgSr"].ToString()
                    };

                    details.Add(users);
                }
               
                  string JsonData = js.Serialize(details);                 
                  return JsonData;
             

            }

       

    }

   

}

                

          