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

public partial class newPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserType"] == "gr")
        {
            Panel2.Visible = false;
            LinkButton1.Visible = false;
        }
        else
            if (Session["UserType"] == "qy")
            {
                Panel1.Visible = false;
            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name=Session["UserName"].ToString();
        string userType=Session["UserType"].ToString();
        string sql="";
        if (userType == "gr")
        {
            sql = "update tb_grUser set Pass='" + txtNewPass.Text + "'where Name='" + name + "'";
        }
        else
            if (userType == "qy")
            { 
                sql="update tb_User set UserPass='"+txtNewPass.Text+"' where UserName='"+name+"'";
            }
        if (dataOperate.execSQL(sql))
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            RegisterStartupScript("true","<script>alert('修改成功！')</script>");
        }
        else {
            Panel2.Visible = false;
            Panel1.Visible = true;
            RegisterStartupScript("false","<script>alert('修改失败！')</script>");
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = Session["UserName"].ToString();      
        string linkman = this.txtLinkman.Text;
        string companyName = this.txtCompanyName.Text;
        string ddlKind = this.ddlKind.SelectedValue;
        string calling = this.txtCalling.Text;
        string licenceNumber = this.txtLicenceNumber.Text;
        string address = this.txtAddress.Text;
        string phone = this.txtPhone.Text;
        string fax = this.txtFax.Text;
        string email = this.txtEmail.Text;
        string networkIP = this.txtNetworkIP.Text;
        string content = this.txtContent.Text;
        string sql = "update tb_User set Linkman='" + linkman + "',CompanyName='"+companyName+"',Kind='"+ddlKind+"',Calling='"+calling+"',LicenceNumber='"+
            licenceNumber+"',Address='"+address+"',Phone='"+phone+"',Fax='"+fax+"',Email='"+email+"',NetworkIP='"+networkIP+"',Content='"+
            content+"' where UserName='"+name+"'";
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("true", "<script>alert('修改成功！')</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('修改失败！')</script>");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}
