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

public partial class Manage_manage_grUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrUser();
    }

    protected void bindgrUser()
    {
        string sql = "select * from tb_grUser";
        gvGrUser.DataSource = dataOperate.getDataset(sql, "tb_grUser");
        gvGrUser.DataKeyNames = new string[] { "ID" };
        gvGrUser.DataBind();
    }



    protected void gvGrUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[2].Text == "False")
            {
                e.Row.Cells[2].Text = "未锁定";               

            }
            else
            {
                e.Row.Cells[2].Text = "已锁定";
                e.Row.Cells[2].ForeColor =System.Drawing.Color.Red ;

            }
        }
    }
    protected void gvGrUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_grUser where ID=" + gvGrUser.DataKeys[e.RowIndex].Value.ToString();

        if (dataOperate.execSQL(sql))
        { 
             Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        bindgrUser();
    }
    protected void gvGrUser_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string ID = gvGrUser.DataKeys[e.NewSelectedIndex].Value.ToString();
        string selSql = "select Lock from tb_grUser where ID=" + ID;
        SqlDataReader sdr = dataOperate.getRow(selSql);
        sdr.Read();
        int Lk = Convert.ToInt32(sdr["Lock"]);
        if (Lk == 0)
        {
            RegisterStartupScript("false", "<script>window.open('lockCause.aspx?table=tb_grUser&ID=" + ID + "','','width=310,height=190')</script>");
            Lk = 1;
        }
        else
        {
            Lk = 0;
        }
        string updSql = "update tb_grUser set Lock='" + Lk + "' where ID=" + ID;
        dataOperate.execSQL(updSql);
        bindgrUser(); 
    }
}
