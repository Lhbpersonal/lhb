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

public partial class issuanceTruck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindSf();
        }
    }
    //绑定省份
    public void bindSf()
    {
        string sql = "select distinct sf from tb_City";
        DataSet ds = dataOperate.getDataset(sql, "tb_City");
        this.ddlcSf.DataSource = ds.Tables["tb_City"].DefaultView;
        this.ddldSf.DataSource = ds.Tables["tb_City"].DefaultView;
        ddlcSf.DataTextField = "sf";
        ddlcSf.DataValueField = "sf";
        ddldSf.DataTextField = "sf";
        ddldSf.DataValueField = "sf";
        this.ddlcSf.DataBind();
        this.ddldSf.DataBind();
    }
    //联动出发点城市
    protected void ddlcSf_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sf = ddlcSf.SelectedValue.ToString();
        string sql = "select cs from tb_City where sf='" + sf + "'";
        DataSet ds = dataOperate.getDataset(sql, "tb_City");
        this.ddlcCs.DataSource = ds.Tables["tb_City"].DefaultView;

        ddlcCs.DataTextField = "cs";
        ddlcCs.DataValueField = "cs";

        this.ddlcCs.DataBind();

    }
  

    //联动终点城市
    protected void ddldSf_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sf = ddldSf.SelectedValue.ToString();
        string sql = "select cs from tb_City where sf='" + sf + "'";
        DataSet ds = dataOperate.getDataset(sql, "tb_City");
        this.ddldCs.DataSource = ds.Tables["tb_City"].DefaultView;

        ddldCs.DataTextField = "cs";
        ddldCs.DataValueField = "cs";

        this.ddldCs.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string UserName = Session["UserName"].ToString();
        string Start = ddlcSf.SelectedValue.ToString() + ddlcCs.SelectedValue.ToString();
        string Terminal = ddldSf.SelectedValue.ToString() + ddldCs.SelectedValue.ToString();
        string TruckType = this.ddlTruckType.SelectedValue.ToString();
        string Trucklong = this.txtTruckLong.Text+"米";
        string TruckLoad=this.txtLoad.Text+"吨";        
        string Linkman = this.txtLinkman.Text;
        string Phone = this.txtPhone.Text;
        string Term = this.txtTerm.Text;
        string Content = this.txtContent.Text;
        string FBDate = DateTime.Now.ToString();
        string UserType = Session["UserType"].ToString();
        string sql = "insert into tb_Truck values('" + UserName + "','" + Start + "','" + Terminal + "','" + TruckType + "','" +
            Trucklong + "','" + TruckLoad + "','" + Linkman + "','" + Phone + "','" + Term + "','" + Content + "','" + FBDate + "','" + UserType + "','')";

        if (dataOperate.execSQL(sql))
        {
            txtContent.Text = "";
            txtLinkman.Text = "";
            txtLoad.Text = "";
            txtPhone.Text = "";
            txtTerm.Text = "";
            txtTruckLong.Text = "";
           
            RegisterStartupScript("true", "<script>alert('发布成功！')</script>");
        }
        else
        {

            RegisterStartupScript("false", "<script>alert('发布失败！')</script>");
        }

    }

}
