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

public partial class issuanceDepot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindSf();
        }
    }

    public void bindSf()
    {
        string sql = "select distinct sf from tb_City";
        DataSet ds = dataOperate.getDataset(sql, "tb_City");        
        this.ddldSf.DataSource = ds.Tables["tb_City"].DefaultView;        
        ddldSf.DataTextField = "sf";
        ddldSf.DataValueField = "sf";        
        this.ddldSf.DataBind();
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
        string DepotType = ddlDepotType.SelectedValue;
        string DepotCity = ddldSf.SelectedValue.ToString() + ddldCs.SelectedValue.ToString();
        string DepotSite = this.txtDepotSite.Text;
        string DepotAcreage = this.txtDepotAcreage.Text;
        string DepotSum = this.txtDepotSum.Text;        
        string DepotPrice=this.txtDepotPrice.Text;
        int Loading;
        int Packing;
        int Send;
        if (ckbLoading.Checked)
        {
            Loading = 1;
        }
        else
        {
            Loading = 0;
        }
        if (ckbPacking.Checked)
        {
            Packing = 1;
        }
        else
        {
            Packing = 0;
        }
        if (ckbSend.Checked)
        {
            sender = 1;
        }
        else
        {
            sender = 0;
        }

        string Linkman = this.txtLinkman.Text;
        string Phone = this.txtPhone.Text;
        string Term = this.txtTerm.Text;
        string Content = this.txtContent.Text;
        string FBDate = DateTime.Now.ToString();
        string UserType = Session["UserType"].ToString();
        string sql = "insert into tb_Depot values('" + UserName + "','" + DepotType + "','" + DepotCity + "','" + DepotSite + "','" +
            DepotAcreage + "','" + DepotSum + "','" + DepotPrice + "','" + Loading + "','" + Packing + "','" + sender + "','" + Linkman + "','" + Phone + "','" + Term + "','" + Content + "','" + FBDate + "','" + UserType + "','')";

        if (dataOperate.execSQL(sql))
        {
            txtContent.Text = "";
            txtDepotAcreage.Text = "";
            txtDepotPrice.Text = "";
            txtDepotSite.Text = "";
            txtDepotSum.Text = "";
            txtLinkman.Text = "";
            txtPhone.Text = "";
            txtTerm.Text = "";
            
            RegisterStartupScript("true", "<script>alert('发布成功！')</script>");
        }
        else
        {

            RegisterStartupScript("false", "<script>alert('发布失败！')</script>");
        }

    }
   
}
