<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grLeft.aspx.cs" Inherits="grLeft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    
    <link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 220px; height: 364px; background-color: #d3cec2;">
            <tr>
                <td align="left" style="width: 100px; height: 26px" valign="top">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/fabuxuanxiang.gif" /></td>
            </tr>
            <tr>
                <td style="width: 100px">
                  <a target="rightFrame" class="huise1" href="issuanceTruck.aspx">发布车源信息</a>
                    </td>
            </tr>
            <tr>
                <td style="width: 100px">
                   <a target="rightFrame" class="huise1"  href="issuanceFreight.aspx" >发布货源信息</a> </td>
            </tr>
            <tr>
                <td style="width: 100px">
                     <a target="rightFrame" class="huise1" href="issuanceDepot.aspx">发布仓储信息</a>
                    </td>
            </tr>
            <tr>
                <td style="width: 100px" align="center">
                   <a target="rightFrame" class="huise1" href="newPass.aspx">修改密码</a> 
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 46px;" align="center">
                <a target="_parent" class="huise1" href="index.aspx">返回</a> 
                    </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 36px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
