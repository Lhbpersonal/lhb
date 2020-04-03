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
    public partial class CartView : System.Web.UI.Page
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
            string user = Session["user_id"].ToString();
            int userId = Convert.ToInt32(user);
            string searchSql = "Select * From [Cart],[Book] Where [Cart].UserId = " + userId
                + " And [Cart].BookId=[Book].BookId";
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

        protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            string needcart = GV.Rows[e.RowIndex].Cells[1].Text.ToString();
            int cartId = Convert.ToInt32(needcart);
            string delSql = "Delete From [Cart] Where CardId = " + cartId;
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            myConn.Open();
            SqlCommand myCmd = new SqlCommand(delSql, myConn);
            int result = myCmd.ExecuteNonQuery();
            if (result != 0)
            {

                GV.EditIndex = -1;

                GV.DataBind();
            }

            initData();
            myConn.Close();
        }

        private ArrayList GetSelected()
        {
            ArrayList selectedItems = new ArrayList();
            foreach (GridViewRow row in GV.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkBox = (CheckBox)row.FindControl("orderSelect");
                    if (chkBox.Checked)
                    {
                        selectedItems.Add(Convert.ToInt32(row.Cells[2].Text));
                    }
                }


            }
            return selectedItems;
        }

        protected void OrederBotton_Click(object sender, EventArgs e)
        {
            GetSelected();
            ArrayList selectedBooks = this.GetSelected();
            if (selectedBooks.Count == 0)
            {
                Response.Write("<Script Language=JavaScript>alert('请首先选择图书!');</Script>");
                return;
            }
            string user = Session["user_id"].ToString();
            string date = DateTime.Now.ToString();
            string insertSqlOrder = "insert into [Order](UserId,Ordertime) values ('" + Convert.ToInt32(user) + "','" + date + "')";
            SqlConnection insertConn = new SqlConnection(Dbhelp.strConn);
            insertConn.Open();
            SqlCommand insertcmd = new SqlCommand(insertSqlOrder, insertConn);
            int insertDr = insertcmd.ExecuteNonQuery();
            insertConn.Close();

            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            myConn.Open();
            string selectSqlOrder = "select * from [Order] where UserId = '" + Convert.ToInt16(user) + "' and Ordertime = '" + date + "'";
            SqlCommand selectcmd = new SqlCommand(selectSqlOrder, myConn);
            SqlDataReader selectDr = selectcmd.ExecuteReader();
            int temp = 0;
            if (selectDr.Read())
            {
                
                int id = Convert.ToInt16(selectDr["OrderID"].ToString());
                temp = id;
                selectDr.Close();
                myConn.Close();
                foreach (int bookId in selectedBooks)
                {
                    SqlConnection Conn = new SqlConnection(Dbhelp.strConn);
                    Conn.Open();
                    string insertSqlOrderModel = "insert into OrderModel(OrderId,BookId) values ('" + id + "','" + bookId + "')";
                    SqlCommand myCmd = new SqlCommand(insertSqlOrderModel, Conn);
                   
                    int result = myCmd.ExecuteNonQuery();
                    if(result != 0)
                    {
                        continue;
                    }
                    Conn.Close();
                }
            }

            Response.Redirect("~/Order.aspx?id=" + temp);
        }

        protected void GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GV.PageIndex = e.NewPageIndex;
            initData();
            
        }

        
    }
}