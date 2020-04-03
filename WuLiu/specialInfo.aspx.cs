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

public partial class specialInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindSpecialInfo();
    }

    protected void bindSpecialInfo()
    {
        string sql = "select * from tb_Special where ID=" + Request.QueryString["ID"].ToString();
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtStart.Text = sdr["start"].ToString();
        txtTerminal.Text = sdr["start"].ToString();
        txtBewrite.Text = sdr["Bewrite"].ToString();
        txtTruckType.Text = sdr["TruckType"].ToString();
        txtTruckLong.Text = sdr["TruckLong"].ToString();
        txtLoad.Text = sdr["TruckLoad"].ToString();
        txtSpecialPrice.Text = sdr["SpecialPrice"].ToString();
        txtLinkman.Text = sdr["Linkman"].ToString();
        txtPhone.Text = sdr["Phone"].ToString();
        txtTerm.Text =Convert.ToDateTime(sdr["Term"]).ToLongDateString();
        txtContent.Text = sdr["Content"].ToString();
        txtFBDate.Text = Convert.ToDateTime(sdr["FBDate"]).ToLongDateString();

    }
}
