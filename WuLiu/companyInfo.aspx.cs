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

public partial class companyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindCompanyInfo();
    }

    protected void bindCompanyInfo()
    {
        string sql = "select * from tb_User where ID=" + Request.QueryString["ID"].ToString();
        SqlDataReader sdr=dataOperate.getRow(sql);
        sdr.Read();
        txtLinkman.Text=sdr["Linkman"].ToString();
        txtCompanyName.Text=sdr["CompanyName"].ToString();
        txtKind.Text = sdr["Kind"].ToString();
        txtCalling.Text = sdr["Calling"].ToString();
        txtLicenceNumber.Text = sdr["LicenceNumber"].ToString();
        txtAddress.Text = sdr["Address"].ToString();
        txtPhone.Text = sdr["Phone"].ToString();
        txtFax.Text = sdr["Fax"].ToString();
        txtEmail.Text = sdr["Email"].ToString();
        txtNetworkIP.Text = sdr["NetworkIP"].ToString();
        txtContent.Text=sdr["Content"].ToString();

    }
}
