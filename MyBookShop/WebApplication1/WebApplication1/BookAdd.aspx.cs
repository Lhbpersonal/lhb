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
    public partial class personalCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string txtBookName = TextBoxBookName.Text;
            int txtBookCategory = DropDownListCategoryName.SelectedIndex + 1;
            double txtPrice = Convert.ToDouble(TextBoxPrice.Text);
            string txtPublisher = TextBoxPublisher.Text;
            string txtPublishData = TextBoxPublishDate.Text;
            string txtAuthor = TextBoxAuthor.Text;
            int txtPage = Convert.ToInt32(TextBoxPageNum.Text);
            string discription = TextBoxDescription.Text;
            string uploadname = inputPictureFiles.Value;
            string picturename = "";
            if(uploadname != "")
            {
                int idx = uploadname.LastIndexOf(".");
                string suffix = uploadname.Substring(idx);
                picturename = System.DateTime.Now.Ticks.ToString() + suffix;
            }
            string insertSql = "insert into Book(BookName,CategoryID,Price,Publisher,PublishDate,Author,PageNum,PictureUrl,Description) values ('" + txtBookName + "','" + txtBookCategory + "','" + txtPrice + "','" + txtPublisher + "','" + txtPublishData + "','" + txtAuthor + "','" + txtPage + "','" + picturename + "','" + discription + "')";
            SqlConnection myConn = new SqlConnection(Dbhelp.strConn);
            myConn.Open();
            SqlCommand myCmd = new SqlCommand(insertSql, myConn);
            int result = myCmd.ExecuteNonQuery();
            if(result != 0)
            {
                Response.Redirect("Main.aspx");
            }
            myConn.Close();
        }
    }
}