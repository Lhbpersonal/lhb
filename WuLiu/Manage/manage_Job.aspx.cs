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

public partial class Manage_manage_Job : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindJob();
        }
    }

    protected void bindJob()
    {
        string sql="";
        if(rdibtnW.Checked)
        {
            sql = "select * from tb_Job where Auditing=0";
        }else
            if (rdibtnY.Checked)
            {
                sql = "select * from tb_Job where Auditing=1";
            }
            else
                if (rdibtnS.Checked)
                {
                    sql = "select * from tb_Job";
                }
       
        gvJob.DataSource = dataOperate.getDataset(sql, "tb_Freight");
        gvJob.DataKeyNames = new string[] { "JobID" };
        gvJob.DataBind();
    }
    protected void gvJob_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gvJob_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_Job where JobID=" + gvJob.DataKeys[e.RowIndex].Value.ToString();
        if (dataOperate.execSQL(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        bindJob();
    }

    protected void gvJob_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string ID = this.gvJob.DataKeys[e.NewSelectedIndex].Value.ToString();
        string selSql = "select Auditing from tb_Job where JobID= " + ID;
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
        string updSql = "update tb_Job set Auditing='" + Auditing + "' where JobID=" + ID;
        dataOperate.execSQL(updSql);
        bindJob();
    }
    protected void rdibtnW_CheckedChanged(object sender, EventArgs e)
    {
        bindJob();
    }
    protected void rdibtnY_CheckedChanged(object sender, EventArgs e)
    {
        bindJob();
    }
    protected void rdibtnS_CheckedChanged(object sender, EventArgs e)
    {
        bindJob();
    }
    protected void gvJob_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvJob.PageIndex = e.NewPageIndex;
        gvJob.DataBind();
    }
}
