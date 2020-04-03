<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qyLeft.aspx.cs" Inherits="qyLeft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table  border="0" cellpadding="0" cellspacing="0" style="width: 130px; height: 264px; background-color: #d3cec2;">
            <tr>
                <td style="width: 227px; height: 47px" valign="top">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/fabuxuanxiang.gif" /></td>
            </tr>
            <tr>
                <td style="width: 227px; text-align: left;">
                    <a target="rightFrame" class="huise1" href="issuanceTruck.aspx">发布车源信息</a>
                    </td>
            </tr>
            <tr>
                <td style="width: 227px; text-align: left;">
                    <a target="rightFrame" class="huise1" href="issuanceFreight.aspx">发布货源信息</a>
                    </td>
            </tr>
            <tr>
                <td style="width: 227px; height: 26px; text-align: left;">
                     <a target="rightFrame" class="huise1" href="issuanceDepot.aspx">发布仓储信息</a>
                    </td>
            </tr>
            <tr>
                <td style="width: 227px; text-align: left;">
                   <a target="rightFrame" class="huise1" href="issuanceSpecial.aspx">发布专线信息</a> 
                    </td>
            </tr>
            <tr>
                <td style="width: 227px; text-align: left;">
                    <a target="rightFrame" class="huise1" href="issuanceJob.aspx">发布招聘信息</a></td>
            </tr>
            <tr>
                <td style="width: 227px; height: 27px; text-align: left;">
                <a target="rightFrame" class="huise1" href="newPass.aspx">修改信息</a> 
                </td>
            </tr>
            <tr>
                <td style="width: 227px; text-align: left;">
                    <a target="_parent" class="huise1" href="index.aspx">返回</a> 
                    </td>
            </tr>
            <tr>
                <td style="width: 227px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
