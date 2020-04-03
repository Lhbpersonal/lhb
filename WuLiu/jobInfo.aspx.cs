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

public partial class jobInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindJobInfo();
    }

    protected void bindJobInfo()
    {
        string sql = "select * from tb_Job as a Join tb_User as b on a.UserName=b.UserName where jobID=" + Request.QueryString["ID"].ToString();
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtJob.Text = sdr["Job"].ToString(); 
        txtNumber.Text=sdr["Number"].ToString();
        txtSex.Text = sdr["Sex"].ToString();
        txtAge.Text = sdr["Age"].ToString();
        txtKnowledge.Text = sdr["Knowledge"].ToString();

        txtSpecialty.Text = sdr["Specialty"].ToString();
        txtExperience.Text = sdr["Experience"].ToString();
        txtCity.Text = sdr["City"].ToString();
        txtPay.Text = sdr["Pay"].ToString();
        txtParticularInfo.Text = sdr["ParticularInfo"].ToString();
        txtFBDate.Text = sdr["FBDate"].ToString();
        txtCompanyName.Text = sdr["CompanyName"].ToString();
        txtLinkman.Text = sdr["Linkman"].ToString();
        txtCompanyPhone.Text = sdr["Phone"].ToString();
        txtCompanyContent.Text = sdr["Content"].ToString();


    }
}
