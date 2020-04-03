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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindNews();
        bindJob();
        bindCompany();
        if (!IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                pelEntry.Visible = false;
                pelWelcom.Visible = true;
                this.Label1.Text = Session["UserName"].ToString();

            }
            else
            {
                pelEntry.Visible = true;
                pelWelcom.Visible = false;
            }
        }
    }

    //绑定新闻
    protected void bindNews()
    {
        string sql = "select * from tb_News order by ID DESC";
        gvNews.DataSource = dataOperate.getDataset(sql, "tb_News");
        //gvNews.DataKeyNames=new string[] {"ID"};
        gvNews.DataBind();
    }
    //绑定招聘信息
    protected void bindJob()
    {
        string sql = "select top 10 * from tb_Job as a Join tb_User as b on a.UserName=b.UserName where a.Auditing= '1'";
        gvJob.DataSource = dataOperate.getDataset(sql, "tb_Job");
        gvJob.DataBind();
    }

    //绑定公司
    protected void bindCompany()
    {
        string sql = "select * from tb_User";
        gvCompany.DataSource = dataOperate.getDataset(sql, "tb_User");
        gvCompany.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("index.aspx");
    }
}
