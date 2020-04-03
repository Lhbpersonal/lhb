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


public partial class Manage_lockCause : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.txtCause.Text = "您发布了非法信息，账号冻结2天";
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string table = Request.QueryString["table"].ToString();
        string id = Request.QueryString["ID"].ToString();
        string sql = "update " + table + " set LockCause='" + txtCause.Text + "' where ID=" + id;
        dataOperate.execSQL(sql);
        Response.Write("<script>window.close();</script>");
    }
}
