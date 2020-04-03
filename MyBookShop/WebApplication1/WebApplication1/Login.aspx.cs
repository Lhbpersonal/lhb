using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void my_Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            string searchSql = "select * from [User] where LoginName = '" + my_Login.UserName + "' and Password = '" + my_Login.Password + "'";
            SqlCommand myCmd = new SqlCommand(searchSql, myConn);
            myConn.Open();
            SqlDataReader myDr = myCmd.ExecuteReader();
            if(myDr.Read())
            {
                int user_id = Convert.ToInt16(myDr["UserId"].ToString());
                Session.Add("user_id",user_id);
                Response.Write("Successful!");
                Response.Redirect("Main.aspx");
            }
            else
            {
                Response.Write("Default!");
            }
            myDr.Close();
            myConn.Close();
        }
    }
}