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
    public class UserDA
    {
        public static DataTable GetUserList()
        {
            return DBHelper.ExecuteQuery("Select EmpID,UserName,EmailID,Contact,Location,HP_UserID,HP_EmailID,HP_UserName,LaptopMfgSr from TeamDetails");

        }
        public static DataTable AddUser(UserBO objUserBO)
        {
            return DBHelper.ExecuteProcedure("AddUser", "@EmpID", objUserBO.EmpID,"@UserName",objUserBO.UserName,"@EmailID",objUserBO.EmailID,"@Contact",objUserBO.Contact,"@Location",objUserBO.Location,"@HP_UserID",objUserBO.HP_UserID,"@HP_EmailID",objUserBO.HP_EmailID,"@HP_Domain",objUserBO.HP_Domain,"@HP_UserName",objUserBO.HP_UserName,"@LaptopMfgSr",objUserBO.LaptopMfgSr);
        }
    }
}
