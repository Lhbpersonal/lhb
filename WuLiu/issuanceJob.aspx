<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceJob.aspx.cs" Inherits="issuanceJob" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/fabuxinxi.gif" /></td>
            </tr>
            <tr>
                <td style="width: 100px">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 445px; height: 270px;
            text-align: center">
            <tr>
                <td style="width: 29px; height: 18px">
                </td>
                <td style="width: 85px; height: 18px; text-align: left;">
                    招聘职位：</td>
                <td style="width: 87px; height: 18px; text-align: left">
                    <asp:TextBox ID="txtJob" runat="server"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px; height: 24px">
                </td>
                <td style="width: 85px; height: 24px; text-align: left;">
                    招聘人数：</td>
                <td style="width: 87px; height: 24px; text-align: left">
                    <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    要求性别：</td>
                <td style="width: 87px; text-align: left">
                    <asp:DropDownList ID="ddlSex" runat="server">
                        <asp:ListItem>不限</asp:ListItem>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    要求年龄：</td>
                <td style="width: 87px">
                    <asp:TextBox ID="txtAge" runat="server" Width="151px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    要求学历：</td>
                <td style="width: 87px; text-align: left">
                    <asp:DropDownList ID="ddlKnowledge" runat="server">
                        <asp:ListItem>不限</asp:ListItem>
                        <asp:ListItem>高中</asp:ListItem>
                        <asp:ListItem>中专</asp:ListItem>
                        <asp:ListItem>大专</asp:ListItem>
                        <asp:ListItem>本科</asp:ListItem>
                        <asp:ListItem>研究生</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px; height: 23px">
                </td>
                <td style="width: 85px; height: 23px; text-align: left;">
                    要求专业：</td>
                <td style="width: 87px; height: 23px">
                    <asp:TextBox ID="txtSpecialty" runat="server"></asp:TextBox></td>
                <td style="width: 100px; height: 23px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    工作经验：</td>
                <td style="width: 87px">
                    <asp:TextBox ID="txtExperience" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    工作城市：</td>
                <td style="width: 87px">
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    月薪：</td>
                <td style="width: 87px">
                    <asp:TextBox ID="txtPay" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 29px">
                </td>
                <td style="width: 85px; text-align: left;">
                    详细信息：</td>
                <td style="width: 87px">
                    <asp:TextBox ID="txtParticularInfo" runat="server" Height="123px" TextMode="MultiLine"
                        Width="203px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="1" style="width: 29px; text-align: center">
                </td>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发　布" /></td>
            </tr>
        </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
