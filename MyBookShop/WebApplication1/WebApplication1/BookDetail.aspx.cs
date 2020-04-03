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
    public partial class BookDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["Book_id"].ToString();
                string searchSql = "select Book.* ,Category.* from Book , Category where Book.CategoryID = Category.CategoryID and BookId = " + id;
                SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
                SqlCommand myCmd = new SqlCommand(searchSql, myConn);
                myConn.Open();
                SqlDataReader myDr = myCmd.ExecuteReader();
                if (myDr.Read())
                {

                    LabelBookInfo.Text = "【编号】" + myDr["BookId"].ToString()
                        + "<hr>【图书名字】" + myDr["BookName"].ToString()
                        + "<hr>【类别】" + myDr["CategoryName"].ToString()
                        + "<hr>【价格】" + myDr["Price"].ToString()
                        + "<hr>【出版社】" + myDr["publisher"].ToString()
                        + "<hr>【出版日期】" + myDr["PublishDate"].ToString()
                        + "<hr>【作者】" + myDr["Author"].ToString()
                        + "<hr>【页数】" + myDr["PageNum"].ToString()
                        + "<hr>【简介】" + myDr["Description"].ToString()
                        + "<hr>【销量】" + myDr["SaleCount"].ToString();

                    ImageBook.ImageUrl = "BookPics\\" + myDr["PictureUrl"].ToString();
                }
                myDr.Close();
                myConn.Close();
            }
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Write("<Script Language=JavaScript>history.go(-2);</Script>");
        }
    }
}