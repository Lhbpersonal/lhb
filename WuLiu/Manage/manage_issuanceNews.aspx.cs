using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Manage_manage_issuanceNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string title = txtNewsTitle.Text;
        string Content = txtNewsContent.Text;
        DateTime dt = DateTime.Now.Date;
        string sql = "insert into tb_News values('" + title + "','" + Content + "','"+dt+"')";
        if (dataOperate.execSQL(sql))
        {
            txtNewsContent.Text = "";
            txtNewsTitle.Text = "";
            RegisterStartupScript("", "<script>alert('发布成功！')</script>");
        }
        else
            RegisterStartupScript("", "<script>alert('发布失败！')</script>");
    }
}
