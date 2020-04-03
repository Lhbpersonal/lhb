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

public partial class Manage_manage_qyUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindQyUser();
    }

    protected void bindQyUser()
    {
        string sql = "select * from tb_User";
        gvQyUser.DataSource = dataOperate.getDataset(sql, "tb_User");
        gvQyUser.DataKeyNames = new string[] { "ID" };
        gvQyUser.DataBind();
    }

    protected void gvQyUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.Cells[3].Text == "False")
            {
               
                
                e.Row.Cells[3].Text = "未锁定";
            }
            else
            {
                e.Row.Cells[3].Text = "已锁定";
                e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
            }

        }
    }

    protected void gvQyUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ID = gvQyUser.DataKeys[e.RowIndex].Value.ToString();
        string sql = "delete from tb_User where ID=" + ID;
        if (dataOperate.execSQL(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        bindQyUser();
    }
    protected void gvQyUser_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string ID = gvQyUser.DataKeys[e.NewSelectedIndex].Value.ToString();
        string selSql = "select Lock from tb_User where ID=" + ID;
        SqlDataReader sdr = dataOperate.getRow(selSql);
        sdr.Read();
        int Lk = Convert.ToInt32(sdr["Lock"]);
        if (Lk == 0)
        {
            RegisterStartupScript("false", "<script>window.open('lockCause.aspx?table=tb_User&ID=" + ID + "','','width=310,height=190')</script>");
            Lk = 1;          
        }
        else
        {
            Lk = 0;
        }
        string updSql = "update tb_User set Lock='" + Lk + "' where ID=" + ID;
        dataOperate.execSQL(updSql);
        bindQyUser();
    }
}
