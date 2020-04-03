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

public partial class issuanceJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Job = this.txtJob.Text;
        string Number = this.txtNumber.Text;
        string Sex = this.ddlSex.SelectedValue.ToString();
        string Age = this.txtAge.Text;
        string Knowledge = this.ddlKnowledge.SelectedValue.ToString();
        string Specialty = this.txtSpecialty.Text;
        string Experience = this.txtExperience.Text;
        string City = this.txtCity.Text;
        string Pay = this.txtPay.Text;
        string ParticularInfo = this.txtParticularInfo.Text;
        string FBDate = DateTime.Now.ToString();
        string UserName = Session["UserName"].ToString();
        string sql = "insert into tb_Job values('" + Job + "','" + Number + "','" + Sex + "','" + Age + "','" + Knowledge + "','" + Specialty + "','" +
            Experience + "','" + City + "','" + Pay + "','" + ParticularInfo + "','"+FBDate+"','" + UserName + "','')";
        if (dataOperate.execSQL(sql))
        {
            txtAge.Text = "";
            txtCity.Text = "";
            txtExperience.Text = "";
            txtJob.Text = "";
            txtNumber.Text = "";
            txtParticularInfo.Text = "";
            txtPay.Text = "";
            txtSpecialty.Text = "";
            RegisterStartupScript("true","<script>alert('发布成功！')</script>");
        }
        else
        {
            RegisterStartupScript("false","<script>alert('发布失败！')</script>");
        }
        
    }
}
