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

public partial class depotList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDepot();
    }

    protected void bindDepot()
    {
        string sql = "select * from tb_Depot where Auditing = '1' order by ID DESC";
        gvDepot.DataSource = dataOperate.getDataset(sql, "tb_Depot");
        gvDepot.DataBind();
    }
    protected void gvDepot_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDepot.PageIndex = e.NewPageIndex;
        gvDepot.DataBind();
    }
}
