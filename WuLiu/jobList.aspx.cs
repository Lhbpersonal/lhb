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

public partial class jobList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindJob();
    }

    protected void bindJob()
    {
        string sql = "select * from tb_Job where Auditing = '1' order by JobID DESC";
        gvJob.DataSource = dataOperate.getDataset(sql, "tb_Job");
        gvJob.DataBind();
    }
    protected void gvJob_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJob.PageIndex = e.NewPageIndex;
        gvJob.DataBind();
    }
}
