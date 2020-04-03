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
using System.Data.SqlClient;


public partial class freightInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindFreightInfo();
    }

    protected void bindFreightInfo()
    {
        string ID = Request.QueryString["ID"].ToString();
        string sql = "select * from tb_Freight where ID=" + ID;
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtStart.Text = sdr["start"].ToString();
        txtTerminal.Text = sdr["Terminal"].ToString();
        txtFreightType.Text = sdr["FreightType"].ToString();
        txtFreightWeight.Text = sdr["FreightWeight"].ToString() + sdr["WeightUnit"].ToString();
        txtLinkman.Text = sdr["Linkman"].ToString();
        txtPhone.Text = sdr["Phone"].ToString();
        txtTerm.Text = Convert.ToDateTime(sdr["Term"]).ToLongDateString();
        txtContent.Text = sdr["Content"].ToString();
        txtFBDate.Text = Convert.ToDateTime(sdr["FBDate"]).ToLongDateString();

    }
   
}
