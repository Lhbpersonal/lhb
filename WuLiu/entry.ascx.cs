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
using System.Collections;
using System.Security.Cryptography;

public partial class entry : System.Web.UI.UserControl
{
    //dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    //单击登陆判断用户名和密码；
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = this.txtName.Text;
        string pass = this.txtPass.Text;
        string sql;
        string locksql;
        if (this.rdibtnGr.Checked)
        {
           sql = "select count(*) from tb_GrUser where Name='" + name + "' and Pass ='" + pass + "'";
           Session["UserType"] = "gr";
           locksql="select * from tb_GrUser where Name='"+name+"' and lock=1";
        }
        else
        {
             sql = "select count(*) from tb_User where UserName='" + name + "' and UserPass ='" + pass + "'";
             Session["UserType"] = "qy";
             locksql = "select * from tb_User where UserName='" + name + "' and lock=1";
        }
        if (dataOperate.seleSQL(sql))
        {
            SqlDataReader sdr = dataOperate.getRow(locksql);

            if (sdr.Read())
            {
                Page.RegisterStartupScript("", "<script>alert('" + sdr["LockCause"] + "')</script>");
            }
            else
            { 
                Session["UserName"] = name;
                Response.Redirect("index.aspx");
               
            }
        }
        else
        {
          Page.RegisterStartupScript("","<script>alert('登录名或密码错误！')</script>");
        }
      
        
      
    }

   
}
