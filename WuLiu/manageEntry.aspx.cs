﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class manageEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtName.Text== "Tsoft" && txtPass.Text == "111")
        {
            Response.Redirect("~/Manage/manageIndex.aspx");
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}