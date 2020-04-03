<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search.ascx.cs" Inherits="search" %>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<table border="0" cellpadding="0" cellspacing="0" height="31" style="width: 463px">
    <tr>
        <td style="width: 95px">
            <div align="right" style="text-align: left">
                类型：</div>
        </td>
        <td style="width: 15px; text-align: left">
                        <asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged">
                        </asp:DropDownList></td>
        <td style="width: 165px">
            <div align="right" style="text-align: left">
            关键字：</div>
        </td>
        <td style="width: 18px; text-align: left">
                        <asp:DropDownList ID="ddlKeyType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlKeyType_SelectedIndexChanged">
                        </asp:DropDownList></td>
        <td style="width: 27px; text-align: left">
                        <asp:TextBox ID="txtKey" runat="server" Width="55px"></asp:TextBox></td>
        <td style="text-align: left; width: 179px;">
                        <asp:Label ID="labTerminal" runat="server" Text="到达地" Visible="False" Width="57px"></asp:Label><asp:TextBox ID="txtTerminal" runat="server" Visible="False" Width="59px"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Height="25px" Text="搜" Width="28px" OnClick="Button1_Click" /></td>
    </tr>
</table>
