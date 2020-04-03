<%@ Page Language="C#" AutoEventWireup="true" CodeFile="specialInfo.aspx.cs" Inherits="specialInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 499px; height: 270px; background-image: url(images/tanchuang.gif);">
            <tr>
                <td style="width: 31px; height: 137px">
                </td>
                <td style="width: 111px; height: 137px">
                </td>
                <td style="width: 311px; height: 137px">
                </td>
                <td style="width: 100px; height: 137px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 10px">
                </td>
                <td style="width: 111px; height: 10px">
                    出发地：</td>
                <td style="width: 311px; height: 10px">
                    <asp:TextBox ID="txtStart" runat="server" BorderWidth="0px" ReadOnly="True" 
                        Width="200px"></asp:TextBox></td>
                <td style="width: 100px; height: 10px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                    到达地：</td>
                <td style="width: 311px; height: 18px">
                    <asp:TextBox ID="txtTerminal" runat="server" BorderWidth="0px" ReadOnly="True" 
                        Width="199px"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                    线路描述：</td>
                <td style="width: 311px; height: 18px">
                    <asp:TextBox ID="txtBewrite" runat="server" Height="76px" TextMode="MultiLine" Width="202px" BorderWidth="1px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    车型：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtTruckType" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 19px">
                </td>
                <td style="width: 111px; height: 19px">
                    车长：</td>
                <td style="width: 311px; height: 19px">
                    <asp:TextBox ID="txtTruckLong" runat="server" Width="115px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 19px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    载重：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLoad" runat="server" Width="114px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    专线报价：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtSpecialPrice" runat="server" Width="112px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    联系人：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLinkman" runat="server" Width="115px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 24px">
                </td>
                <td style="width: 111px; height: 24px">
                    联系电话：</td>
                <td style="width: 311px; height: 24px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="114px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    有效日期：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtTerm" runat="server" Width="190px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    发布日期</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtFBDate" runat="server" Width="190px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 109px;">
                </td>
                <td style="width: 111px; height: 109px;">
                    备注：</td>
                <td style="width: 311px; height: 109px;">
                    <asp:TextBox ID="txtContent" runat="server" Height="103px" TextMode="MultiLine" Width="241px" BorderWidth="1px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 109px;">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 24px; text-align: center">
                    <input id="Button1" type="button" onclick="window.close();" value="关　闭" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
