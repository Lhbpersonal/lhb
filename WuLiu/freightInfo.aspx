<%@ Page Language="C#" AutoEventWireup="true" CodeFile="freightInfo.aspx.cs" Inherits="freightInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>货源详细信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 508px; height: 192px; background-image: url(images/tanchuang.gif);">
            <tr>
                <td style="width: 111px; height: 132px">
                </td>
                <td style="width: 111px; height: 132px">
                </td>
                <td style="width: 311px; height: 132px">
                </td>
                <td style="width: 100px; height: 132px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 111px">
                    出发地：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtStart" runat="server" BorderWidth="0px" ReadOnly="True" 
                        Width="215px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                    到达地：</td>
                <td style="width: 311px; height: 18px">
                    <asp:TextBox ID="txtTerminal" runat="server" BorderWidth="0px" ReadOnly="True" 
                        Width="215px"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 111px">
                    货物种类：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtFreightType" runat="server" BorderWidth="0px" ReadOnly="True"
                        Width="215px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="height: 24px" valign="top">
                </td>
                <td style="height: 24px" valign="top">
                    货物重量：</td>
                <td style="height: 24px" valign="top">
                    <asp:TextBox ID="txtFreightWeight" runat="server" BorderWidth="0px" ReadOnly="True"
                        Width="115px"></asp:TextBox></td>
                <td style="height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 111px">
                    联系人：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLinkman" runat="server" BorderWidth="0px" ReadOnly="True" Width="115px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 111px">
                    联系电话：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtPhone" runat="server" BorderWidth="0px" ReadOnly="True" 
                        Width="215px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px">
                </td>
                <td style="width: 111px">
                    有效时间：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtTerm" runat="server" BorderWidth="0px" ReadOnly="True" Width="215px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px; height: 24px">
                </td>
                <td style="width: 111px; height: 24px">
                    发布日期</td>
                <td style="width: 311px; height: 24px">
                    <asp:TextBox ID="txtFBDate" runat="server" BorderWidth="0px" ReadOnly="True" Width="215px"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 111px" valign="top">
                </td>
                <td style="width: 111px" valign="top">
                    备注：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtContent" runat="server" BorderWidth="1px" Height="78px" ReadOnly="True"
                        TextMode="MultiLine" Width="219px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <input id="btnClose" type="button" onclick="window.close();" value="关　闭" />&nbsp;</td>
            </tr>
            <tr>
                <td colspan="1" style="text-align: center">
                </td>
                <td colspan="3" style="text-align: center">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
