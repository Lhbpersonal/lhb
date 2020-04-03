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
using System.Drawing;

public partial class Manage_manage_Freight : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindFreight();
    }

    protected void bindFreight()
    {
        string sql = "";
        if (rdibtnW.Checked)                    //判断是否选择未审核显示方式
        {
            sql = "select * from tb_Freight where Auditing=0";
        }
        else
            if (rdibtnY.Checked)                //判断是否选择已审核显示方式
            {
                sql = "select * from tb_Freight where Auditing=1";
            }
            else
                if (rdibtnS.Checked)            //判断是否选择所有信息显示方式
                {
                    sql = "select * from tb_Freight";
                }
        //调用数据库操作类中getDataset方法将数据源绑定到GridView控件上
        gvFreight.DataSource = dataOperate.getDataset(sql, "tb_Freight");
        gvFreight.DataKeyNames = new string[] { "ID" };
        gvFreight.DataBind();
    }


     
        protected void  gvFreight_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {            
            string sql = "delete from tb_Freight where ID=" + gvFreight.DataKeys[e.RowIndex].Value.ToString();
            if (dataOperate.execSQL(sql))
            {
                Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
            } 
            else
            {
                Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
            }
            bindFreight();
        }

    protected void gvFreight_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //获取货源信息的有效日期
            DateTime term = Convert.ToDateTime(e.Row.Cells[6].Text);
            //获取当前日期
            DateTime nowDate =DateTime.Now.Date;
            if (term < nowDate)　                               //判断此条显示是否过期
            {
                e.Row.ForeColor = Color.Green;                  //如果过期改变此行的颜色
            }
            if (e.Row.Cells[5].Text == "False")                 //判断当前信息的审核状态
            {   
                e.Row.Cells[5].Text = "未审核";                 //改变文本值
                e.Row.Cells[5].ForeColor =Color.Red;            //改变显示颜色
            }
            else
            {
                e.Row.Cells[5].Text = "已审核";
                e.Row.Cells[5].ForeColor = Color.Blue; 
            }
        }
    }
    protected void gvFreight_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取当前货源信息的编号
        string  ID = this.gvFreight.DataKeys[e.NewSelectedIndex].Value.ToString();        
        string selSql="select Auditing from tb_Freight where ID= "+ID;
        //使用数据库操作类中getRow方法来并接受此方法返回的SqlDataReader对象
        SqlDataReader sdr = dataOperate.getRow(selSql);
        sdr.Read();                                     //读取下条记录
        int Auditing =Convert.ToInt32(sdr["Auditing"]); //获取当前信息的审核状态
        if (Auditing == 0)                              //判断货源信息的审核状态
        {
            Auditing = 1;                               //改变当前信息的审核状态
        }
        else {
            Auditing = 0;
        }
        string updSql = "update tb_Freight set Auditing='" + Auditing + "' where ID=" + ID;
        dataOperate.execSQL(updSql);                    //将改变后的审核状态存储到数据中
        bindFreight();                                  //调用自定义方法重新绑定货源信息
    }
    protected void rdibtnS_CheckedChanged(object sender, EventArgs e)
    {
        bindFreight();
    }
    protected void rdibtnY_CheckedChanged(object sender, EventArgs e)
    {
        bindFreight();
    }
    protected void rdibtnW_CheckedChanged(object sender, EventArgs e)
    {
        bindFreight();
    }
    protected void gvFreight_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvFreight.PageIndex = e.NewPageIndex;
        gvFreight.DataBind();
    }
}
