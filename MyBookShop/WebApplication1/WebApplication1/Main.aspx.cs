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
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CategoryInit();
                InitData();
            }
        }

        private void CategoryInit()
        {
            string searchSql = "select * from Category";// order by createdate desc";
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            SqlDataAdapter myDa = new SqlDataAdapter(searchSql, myConn);
            DataSet myData = new DataSet();
            myConn.Open();
            myDa.Fill(myData);
            DataTable tempDataTable = myData.Tables[0];
            DropDownListCategory.DataSource = tempDataTable;
            DropDownListCategory.DataTextField = DropDownListCategory.DataValueField = "CategoryName";
            DropDownListCategory.DataBind();
            myConn.Close();
        }
        private void InitData()
        {
            string searchSql = "select * from Book";// order by createdate desc";
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

        private ArrayList GetSelected()
        {
            ArrayList selectedItems = new ArrayList();
            foreach (GridViewRow row in GV.Rows)
            {
                if(row.RowType== DataControlRowType.DataRow)
                {
                    CheckBox chkBox = (CheckBox)row.FindControl("chSelected");
                    if (chkBox.Checked)
                    {
                        selectedItems.Add(Convert.ToInt32(row.Cells[1].Text));
                    }
                }
                
            }
            return selectedItems;
        }

        protected void ButtonAddCart_Click(object sender, EventArgs e)
        {
            GetSelected();
            ArrayList selectedBooks = this.GetSelected();
            if (selectedBooks.Count == 0)
            {
                Response.Write("<Script Language=JavaScript>alert('请首先选择图书!');</Script>");
                return;
            }
            
            foreach (int bookId in selectedBooks)
            {
                string user = Session["user_id"].ToString();
                string insertSql = "insert into Cart(UserId,BookId) values ('" + Convert.ToInt16(user) + "','" + bookId + "')";
                SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
                myConn.Open();
                SqlCommand myCmd = new SqlCommand(insertSql, myConn);
                int result = myCmd.ExecuteNonQuery();
                if (result != 0)
                {
                    continue;
                }
                myConn.Close();
            }
            Response.Redirect("CartView.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int txtBookCategory = DropDownListCategory.SelectedIndex + 1;
            string searchSql = "select * from Book where BookName like '%" + TextBoxBookName.Text + "%' and CategoryID = '" + txtBookCategory + "' and Author = '" + TextBoxAuthor.Text +"'";// order by createdate desc";
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            SqlDataAdapter myDa = new SqlDataAdapter(searchSql, myConn);
            DataSet myData = new DataSet();
            myConn.Open();
            myDa.Fill(myData);
            DataTable tempDataTable = myData.Tables[0];
            GV.DataSource = tempDataTable;
            //stuGridview.PageIndex = DbHelp.currentPageindex;
            GV.DataBind();
            myConn.Close();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            GetSelected(); 
            ArrayList selectedBooks = this.GetSelected();
            if (selectedBooks.Count == 0)
            {
                Response.Write("<Script Language=JavaScript>alert('请首先选择图书!');</Script>");
                return;
            }
            foreach (int bookId in selectedBooks)
            {
                string delSql = "delete from Book where BookId=" + bookId;
                SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
                SqlCommand myCmd = new SqlCommand(delSql, myConn);
                myConn.Open();
                int result = myCmd.ExecuteNonQuery();
                myConn.Close();
                if (result != 0)
                {

                    GV.EditIndex = -1;
                    GV.DataBind();
                    //stuGridview.DataBind();
                }
            }
            InitData();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartView.aspx");
        }

        protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string needBook = GV.Rows[e.RowIndex].Cells[1].Text.ToString();
            int Id = Convert.ToInt32(needBook);
            string delSql = "Delete From [Book] Where BookId = " + Id;
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            myConn.Open();
            SqlCommand myCmd = new SqlCommand(delSql, myConn);
            int result = myCmd.ExecuteNonQuery();
            if (result != 0)
            {

                GV.EditIndex = -1;

                GV.DataBind();
            }

            InitData();
            myConn.Close();
        }
    }
}