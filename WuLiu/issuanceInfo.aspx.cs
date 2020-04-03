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

public partial class issuanceInfo : System.Web.UI.Page
{
    public string url;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if (Session["UserType"] == "gr")
            {
                url = "grLeft.aspx";
            }
            else if (Session["UserType"] == "qy")
            {
                url = "qyLeft.aspx";
            }
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('未登录！');location='index.aspx';</script>");
        }
    }
}
