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
   public class UserBL
    {
        public DataTable GetUserList()
        {
             try
            {
               return UserDA.GetUserList();
            }
            catch(Exception ex)
             {
                throw ex;
            }

        }

       public DataTable AddUser(UserBO objUserBO)
        {
            try
            {
                UserDA objUserDA = new UserDA();
                return UserDA.AddUser(objUserBO);
            }
           catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
