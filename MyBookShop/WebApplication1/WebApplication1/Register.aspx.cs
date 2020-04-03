using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string txtLoginName = TextBoxLoginName.Text;
            string txtUserName = TextBoxUserName.Text;
            string txtPassWord = TextBoxPassword.Text;
            string txtAdress = TextBoxAddress.Text;
            string txtZip = TextBoxZip.Text;
            string insertSql = "insert into [User](LoginName,UserName,Password,Address,Zip) values('" + txtLoginName + "','" + txtUserName + "','" + txtPassWord + "','" + txtAdress + "','" + txtZip + "')";
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            myConn.Open();
            SqlCommand myCmd = new SqlCommand(insertSql, myConn);
            int result = myCmd.ExecuteNonQuery();
            if(result != 0)
            {
                Response.Write("Successful!");
                Response.Redirect("Login.aspx");
            }
            myConn.Close();
        }
    }
}