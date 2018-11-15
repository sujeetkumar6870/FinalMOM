using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using eSupport.Core;
using System.Data.SqlClient;
namespace eSupport.DAL
{
    public class MomDA
    {
        public static DataTable GetUsers()
        {
            DataTable dt = DBHelper.ExecuteProcedure("GetUsers");
            return dt;

        }
        
        public static DataTable GetMomList()
        {
            return DBHelper.ExecuteProcedure("GetMomList");
        }
        public static DataTable GetParticipantsList(int Id)
        {
            return DBHelper.ExecuteProcedure("GetParticipantsList", "@Id",Id);
        }
        public static DataTable GetAgendaList(int Id)
        {
            return DBHelper.ExecuteProcedure("GetAgendaList", "@Id", Id);
        }
        public static DataTable GetActionList(int Id)
        {
            return DBHelper.ExecuteProcedure("GetActionList", "@Id", Id);
        }
        //MomBO objMomBO, ParticipantsBO objPartBO, AgendaBO objAgendaBO, ActionItemsBO objActionBO
        public void AddMOMTransaction(MomBO pMomBO, ParticipantsBO[] pParticipantsBO, ActionItemsBO[] pActionItemsBO, AgendaBO[] pAgendaBO)
        {
            #region //without transaction and seperate procedure
            DBHelper.ExecuteProcedure("AddMOM", "@Title", pMomBO.Title, "@Date", pMomBO.Date, "@Facilitator", pMomBO.Facilitator, "@Recorder", pMomBO.Recorder, "@LocationDetails", pMomBO.LocationDetails, "@CreatedBy", "Sujeet Kumar", "@CreatedDate", DateTime.Now, "@ModifiedBy", "Sujeet Kumar", "@ModifiedDate", DateTime.Now);

            DataTable dt = DBHelper.ExecuteQuery("select mid from tempMomID where id=1");

            int pNewMomID = Convert.ToInt32(dt.Rows[0][0]);

            foreach (ActionItemsBO item in pActionItemsBO)
            {
                DBHelper.ExecuteProcedure("AddActionItems", "@ActionItem", item.ActionItem, "@Responsible", item.Responsible, "@Status", item.Status, "@DueDate", item.DueDate, "@CloseDate", item.CloseDate, "@MomId", pNewMomID, "@Discussion", item.Discussion);
            }

            foreach (AgendaBO item in pAgendaBO)
            {
                DBHelper.ExecuteProcedure("AddAgenda", "@DiscussionTopic", item.DiscussionTopic, "@Responsible", item.Responsible, "@MomId", pNewMomID, "@Time", item.Time, "@Purpose", item.Purpose, "@Discussion", item.Discussion);
            }

            foreach (ParticipantsBO item in pParticipantsBO) //MomId will be fetched from database and here the sequesce of query executed matters It should be executed just after AddMOM SP
            {
                DBHelper.ExecuteProcedure("AddParticipants", "@UserID", item.UserID, "@MomID", pNewMomID, "@Availability", item.Availability);
            }
            #endregion


            #region //old code with Transaction
            //string connectionString = "Integrated Security =sspi; database=ESupport; server=PACL5XS5AL\\SQLEXPRESS";
            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    connection.Open();
            //    SqlCommand command = connection.CreateCommand();
            //    SqlTransaction transaction;

            //    transaction = connection.BeginTransaction("MOMTransaction");
            //    command.Connection = connection;
            //    command.Transaction = transaction;

            //    try
            //    {

            //        //command.CommandText = "AddMOM";
            //        //command.CommandType = System.Data.CommandType.StoredProcedure;

            //        //int pNewMomID = Convert.ToInt32(DBHelper.ExecuteScalar(connection,"select SCOPE_IDENTITY()"));
            //        command.CommandText = "select SCOPE_IDENTITY()";
            //        //Int32 pNewMomID = (Int32) command.ExecuteScalar();
            //        //int pNewMomID = Convert.ToInt32(command.ExecuteNonQuery());

            //        foreach (ParticipantsBO item in pParticipantsBO)
            //        {
            //            DBHelper.ExecuteProcedure("AddParticipants",connection, "@UserID", item.UserID, "@MomID", pNewMomID, "@Availability", item.Availability);
            //        }




            //        foreach (ActionItemsBO item in pActionItemsBO)
            //        {
            //            DBHelper.ExecuteProcedure("AddActionItems", connection, "@ActionItem", item.ActionItem, "@Responsible", item.Responsible, "@Status", item.Status, "@DueDate", item.DueDate, "@CloseDate", item.CloseDate, "@MomId", pNewMomID, "@Discussion", item.Discussion);
            //        }
            //        foreach (AgendaBO item in pAgendaBO)
            //        {
            //            DBHelper.ExecuteProcedure("AddAgenda", connection, "@DiscussionTopic", item.DiscussionTopic, "@Responsible", item.Responsible, "@MomId", pNewMomID, "@Time", item.Time, "@Purpose", item.Purpose, "@Discussion", item.Discussion);
            //        }

            //        transaction.Commit();
            //        connection.Close();
            //        //DBHelper.ExecuteProcedure("AddActionItems", "@ActionItem", pParticipantsBO. "@Responsible", "@Status", "@DueDate", "@CloseDate", "@MomId")
            //    }
            //    catch (Exception pEx)
            //    {
            //        connection.Close();
            //        //try
            //        //{
            //        //    transaction.Rollback();
            //        //}
            //        //catch (Exception pEx2)
            //        //{

            //        //    throw pEx2;
            //        //}
            //        throw pEx;
            //    }
            //}
            #endregion
        }
    }
}
