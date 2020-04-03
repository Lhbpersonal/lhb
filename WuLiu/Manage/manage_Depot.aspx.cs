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
using System.Drawing;
using System.Data.SqlClient;

public partial class Manage_manage_Depot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDepot();
    }

    protected void bindDepot()
    {
        string sql = "";
        if (rdibtnW.Checked)
        {
            sql = "select * from tb_Depot where Auditing=0";
        }
        else
            if (rdibtnY.Checked)
            {
                sql = "select * from tb_Depot where Auditing=1";
            }
            else
                if (rdibtnS.Checked)
                {
                    sql = "select * from tb_Depot";
                }
        gvDepot.DataSource = dataOperate.getDataset(sql, "tb_Freight");
        gvDepot.DataKeyNames = new string[] { "ID" };
        gvDepot.DataBind();
    }


    protected void gvDepot_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[6].Text == "False")
            {
                e.Row.Cells[6].Text = "未审核";
                e.Row.Cells[6].ForeColor = Color.Red;
            }
            else
            {
                e.Row.Cells[6].Text = "已审核";
                e.Row.Cells[6].ForeColor = Color.Blue;
            }
        }
    }

    protected void gvDepot_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_Depot where ID=" + gvDepot.DataKeys[e.RowIndex].Value.ToString();
        if (dataOperate.execSQL(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        bindDepot();
    }
    protected void gvDepot_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string ID = this.gvDepot.DataKeys[e.NewSelectedIndex].Value.ToString();
        string selSql = "select Auditing from tb_Depot where ID= " + ID;
        SqlDataReader sdr = dataOperate.getRow(selSql);
        sdr.Read();
        int Auditing = Convert.ToInt32(sdr["Auditing"]);
        if (Auditing == 0)
        {
            Auditing = 1;
        }
        else
        {
            Auditing = 0;
        }
        string updSql = "update tb_Depot set Auditing='" + Auditing + "' where ID=" + ID;
        dataOperate.execSQL(updSql);
        bindDepot();
    }
    protected void rdibtnS_CheckedChanged(object sender, EventArgs e)
    {
        bindDepot();
    }
    protected void rdibtnY_CheckedChanged(object sender, EventArgs e)
    {
        bindDepot();
    }
    protected void rdibtnW_CheckedChanged(object sender, EventArgs e)
    {
        bindDepot();
    }
    protected void gvDepot_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDepot.PageIndex = e.NewPageIndex;
        gvDepot.DataBind();
    }
}
