using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using eSupport.Core;
using eSupport.DAL;

namespace eSupport.BL
{
   public class MomBL
    {
       public DataTable GetUsers()
       {
           try
           {
               return MomDA.GetUsers();
           }
           catch (Exception pEx)
           {
               throw pEx;
           }
       }
        public DataTable GetMomList()
        {
            try
            {
                DataTable dt = MomDA.GetMomList();
                return dt;
            }
            catch (Exception pEx)
            {
                throw pEx;
            }
        }

        public DataTable GetAgendaList(int Id)
        {
            try
            {
                DataTable dt = MomDA.GetAgendaList(Id);
                return dt;
            }
            catch (Exception pEx)
            {
                throw pEx;
            }
        }

        public DataTable GetActionList(int Id)
        {
            try
            {
                DataTable dt = MomDA.GetActionList(Id);
                return dt;
            }
            catch (Exception pEx)
            {
                throw pEx;
            }
        }

        public void AddMOMTransaction(MomBO pMomBO, ParticipantsBO[] pParticipantsBO, ActionItemsBO[] pActionItemsBO, AgendaBO[] pAgendaBO)
       {
            try
            {
                MomDA objMomDA = new MomDA();
                objMomDA.AddMOMTransaction(pMomBO, pParticipantsBO, pActionItemsBO, pAgendaBO);
            }
            catch (Exception pEx)
            {

                throw pEx;
            }
       }

        public DataTable GetParticipantsList(int Id)
        {
            try
            {
                DataTable dt = MomDA.GetParticipantsList(Id);
                return dt;
            }
            catch (Exception pEx)
            {
                throw pEx;
            }
        }
    }
}
