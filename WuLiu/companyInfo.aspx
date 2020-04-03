<%@ Page Language="C#" AutoEventWireup="true" CodeFile="companyInfo.aspx.cs" Inherits="companyInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>企业详细信息</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #faf9f8;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <table background="images/tanchuang.gif" cellpadding="0" cellspacing="0" height="567"
            width="500">
            <tr>
                <td valign="top" style="width: 500px">
                    <table cellpadding="0" cellspacing="0" height="550" width="494">
                        <tr>
                            <td colspan="3" height="136">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td height="412" width="17">
                                &nbsp;</td>
                            <td class="huise1" valign="top" width="462" style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 301px; height: 376px">
            <tr>
                <td style="width: 100px">
                    联系人：</td>
                <td style="width: 32px; text-align: left">
                    <asp:TextBox ID="txtLinkman" runat="server" Width="128px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    企业名称：</td>
                <td style="width: 32px">
                    <asp:TextBox ID="txtCompanyName" runat="server" Width="127px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    企业性质：</td>
                <td style="width: 32px; text-align: left">
                    <asp:TextBox ID="txtKind" runat="server" Width="130px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    所属行业：</td>
                <td style="width: 32px; height: 21px;">
                    <asp:TextBox ID="txtCalling" runat="server" Width="131px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 24px">
                    营业执照号：</td>
                <td style="width: 32px; height: 24px">
                    <asp:TextBox ID="txtLicenceNumber" runat="server" Width="128px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 9px">
                    公司地址：</td>
                <td style="width: 32px; height: 9px">
                    <asp:TextBox ID="txtAddress" runat="server" Width="129px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    联系电话：</td>
                <td style="width: 32px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="129px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    传真：</td>
                <td style="width: 32px">
                    <asp:TextBox ID="txtFax" runat="server" Width="131px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    E-mail：</td>
                <td style="width: 32px">
                    <asp:TextBox ID="txtEmail" runat="server" Width="131px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    公司网址：</td>
                <td style="width: 32px">
                    <asp:TextBox ID="txtNetworkIP" runat="server" Width="133px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 33px" valign="top">
                    公司介绍：</td>
                <td style="width: 32px; height: 33px" valign="top">
                    <asp:TextBox ID="txtContent" runat="server" Height="116px" TextMode="MultiLine" Width="193px" BorderWidth="1px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 31px; text-align: center;">
                    <input id="Button1" type="button" onclick="window.close();" value="关　闭" /></td>
            </tr>
        </table>
                            </td>
                            <td width="13">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
