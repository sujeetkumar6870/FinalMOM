using eSupport.BL;
using eSupport.Core;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eSupport.UI
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMOMTable();
            }
        }



        [WebMethod]
        public static string BindMOMTable()
        {

            DataTable dt = new DataTable();

            List<MomBO> MomDetails = new List<MomBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objMomBL = new MomBL();
            dt = objMomBL.GetMomList();

            foreach (DataRow dtrow in dt.Rows)
            {
                DateTime temp = Convert.ToDateTime(dtrow["Date"]);

                var MomList = new MomBO
                {
                    Id = Convert.ToInt32(dtrow["ID"]),
                    //DateTime temp= dtrow["Date"].Date.ToS

                    tempDate = temp.ToString("MM/dd/yyyy"),

                    Title = dtrow["Title"].ToString(),

                    //Facilitator = Convert.ToInt32(dtrow["Facilitator"]),

                    tempFacilitator = dtrow["tempFacilitator"].ToString(),

                    //Recorder = Convert.ToInt32(dtrow["Recorder"]),

                    tempRecorder = dtrow["tempRecorder"].ToString(),

                    LocationDetails = dtrow["LocationDetails"].ToString()
                };

                MomDetails.Add(MomList);
            }

            string JsonData = js.Serialize(MomDetails);
            return JsonData;


        }

        [WebMethod]
        public static string GetParticipantsList(string Id)
        {
            int mid = Convert.ToInt32(Id);
            
            DataTable dt = new DataTable();

            List<ParticipantsBO> AttendeeStatus = new List<ParticipantsBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objParticipantsBO = new MomBL();
            dt = objParticipantsBO.GetParticipantsList(mid);

            foreach (DataRow dtrow in dt.Rows)
            {
                var ParticipantsList = new ParticipantsBO
                {
                    tempName = dtrow["tempName"].ToString(),
                    tempStatus = (Convert.ToBoolean(dtrow["Availability"])? "Present":"Absent"),
                };

                AttendeeStatus.Add(ParticipantsList);
            }

            string JsonData = js.Serialize(AttendeeStatus);
            return JsonData;
        }




        [WebMethod]
        public static string GetAgendaList(string Id)
        {
            int mid = Convert.ToInt32(Id);

            DataTable dt = new DataTable();

            List<AgendaBO> AgendaDetails = new List<AgendaBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objAgendaBO = new MomBL();
            dt = objAgendaBO.GetAgendaList(mid);

            foreach (DataRow dtrow in dt.Rows)
            {
                var AgendaList = new AgendaBO
                {
                    DiscussionTopic = dtrow["DiscussionTopic"].ToString(),
                    tempResponsible = dtrow["tempResponsible"].ToString(),
                    Time = Convert.ToInt32(dtrow["Time"]),
                    Purpose = dtrow["Purpose"].ToString(),
                    Discussion = dtrow["Discussion"].ToString()
                };

                AgendaDetails.Add(AgendaList);
            }

            string JsonData = js.Serialize(AgendaDetails);
            return JsonData;
        }



        [WebMethod]
        public static string GetActionList(string Id)
        {
            int mid = Convert.ToInt32(Id);

            DataTable dt = new DataTable();

            List<ActionItemsBO> ActionDetails = new List<ActionItemsBO>();

            JavaScriptSerializer js = new JavaScriptSerializer();
            HttpContext Context = HttpContext.Current;

            MomBL objActionBO = new MomBL();
            dt = objActionBO.GetActionList(mid);

            foreach (DataRow dtrow in dt.Rows)
            {
                DateTime temp1 = Convert.ToDateTime(dtrow["DueDate"]);
                DateTime temp2 = Convert.ToDateTime(dtrow["CloseDate"]);

                var ActionList = new ActionItemsBO
                {
                    ActionItem = dtrow["ActionItem"].ToString(),
                    tempResponsible = dtrow["tempResponsible"].ToString(),
                    Status = dtrow["Status"].ToString(),
                    tempDueDate = temp1.ToString("MM/dd/yyyy"),
                    tempCloseDate = temp2.ToString("MM/dd/yyyy"),
                    Discussion = dtrow["Discussion"].ToString()
                };

                ActionDetails.Add(ActionList);
            }

            string JsonData = js.Serialize(ActionDetails);
            return JsonData;
        }

    }
}