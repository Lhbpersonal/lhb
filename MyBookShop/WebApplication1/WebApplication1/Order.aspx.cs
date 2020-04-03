using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace WebApplication1
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                initData();
            }
        }

        private void initData()
        {
            int id = Convert.ToInt32(Request.Params["id"]);
            string searchSql = "Select [OrderModel].* , [Book].* From [OrderModel],[Book] Where [OrderModel].BookId = [Book].BookId and OrderId = '" + id + "'";
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            SqlDataAdapter myDa = new SqlDataAdapter(searchSql, myConn);
            DataSet myData = new DataSet();
            myConn.Open();
            myDa.Fill(myData);
            DataTable tempDataTable = myData.Tables[0];
            GV.DataSource = tempDataTable;
            GV.DataBind();
            myConn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("successful!");
            Response.Redirect("Main.aspx");
        }
    }
}