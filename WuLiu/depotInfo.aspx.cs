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

public partial class depotInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDepot();
    }
    //绑定仓储详细信息
    protected void bindDepot()
    {       
        string sql="select * from tb_Depot where ID="+Request.QueryString["ID"].ToString();
        SqlDataReader sdr=dataOperate.getRow(sql);
        sdr.Read();
        txtDepotType.Text=sdr["DepotType"].ToString();
        txtDepotCity.Text = sdr["DepotCity"].ToString();
        txtDepotSite.Text = sdr["DepotSite"].ToString();
        txtDepotAcreage.Text = sdr["DepotAcreage"].ToString()+"平方米";
        txtDepotSum.Text = sdr["DepotSum"].ToString() + "间";
        txtDepotPrice.Text = sdr["DepotPrice"] + "元/间";
        string appendServer = "";        
        if (Convert.ToBoolean(sdr["Loading"]))
        {
            appendServer = appendServer + "装卸";
        }

        if (Convert.ToBoolean(sdr["Packing"]))
        {
            appendServer = appendServer + "包装";
        }

        if (Convert.ToBoolean(sdr["Send"]))
        {
            appendServer = appendServer + "配送";
        }
        txtAppendServer.Text = appendServer;
        txtLinkman.Text=sdr["Linkman"].ToString();
        txtPhone.Text = sdr["Phone"].ToString();
        txtTerm.Text = Convert.ToDateTime(sdr["Term"]).ToLongDateString();
        txtContent.Text = sdr["Content"].ToString();
        txtFBDate.Text = Convert.ToDateTime(sdr["FBDate"]).ToLongDateString();
    }
}
