<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jobInfo.aspx.cs" Inherits="jobInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 507px; height: 276px;
            text-align: center; background-image: url(images/tanchuang.gif);">
            <tr>
                <td style="width: 54px; height: 129px; text-align: left">
                </td>
                <td style="width: 90px; height: 129px; text-align: left">
                </td>
                <td style="width: 58px; height: 129px; text-align: left">
                </td>
                <td style="width: 100px; height: 129px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 18px; text-align: left">
                </td>
                <td style="width: 90px; height: 18px; text-align: left">
                    公司名称：</td>
                <td style="width: 58px; height: 18px; text-align: left">
                    <asp:TextBox ID="txtCompanyName" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 18px; text-align: left">
                </td>
                <td style="width: 90px; height: 18px; text-align: left">
                    招聘职位：</td>
                <td style="width: 58px; height: 18px; text-align: left">
                    <asp:TextBox ID="txtJob" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 24px; text-align: left">
                </td>
                <td style="width: 90px; height: 24px; text-align: left">
                    招聘人数：</td>
                <td style="width: 58px; height: 24px; text-align: left">
                    <asp:TextBox ID="txtNumber" runat="server" Width="149px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left">
                </td>
                <td style="width: 90px; text-align: left">
                    要求性别：</td>
                <td style="width: 58px; text-align: left">
                    <asp:TextBox ID="txtSex" runat="server" Width="101px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 24px; text-align: left">
                </td>
                <td style="width: 90px; height: 24px; text-align: left">
                    要求年龄：</td>
                <td style="width: 58px; height: 24px">
                    <asp:TextBox ID="txtAge" runat="server" Width="142px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left">
                </td>
                <td style="width: 90px; text-align: left">
                    要求学历：</td>
                <td style="width: 58px; text-align: left">
                    <asp:TextBox ID="txtKnowledge" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox>
                    </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 23px; text-align: left">
                </td>
                <td style="width: 90px; height: 23px; text-align: left">
                    要求专业：</td>
                <td style="width: 58px; height: 23px">
                    <asp:TextBox ID="txtSpecialty" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 23px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left">
                </td>
                <td style="width: 90px; text-align: left">
                    工作经验：</td>
                <td style="width: 58px">
                    <asp:TextBox ID="txtExperience" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left">
                </td>
                <td style="width: 90px; text-align: left">
                    工作城市：</td>
                <td style="width: 58px">
                    <asp:TextBox ID="txtCity" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left">
                </td>
                <td style="width: 90px; text-align: left">
                    月薪：</td>
                <td style="width: 58px">
                    <asp:TextBox ID="txtPay" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left; height: 50px;" valign="top">
                </td>
                <td style="width: 90px; text-align: left; height: 50px;" valign="top">
                    详细信息：</td>
                <td style="width: 58px; height: 50px;">
                    <asp:TextBox ID="txtParticularInfo" runat="server" Height="40px" TextMode="MultiLine"
                        Width="173px" BorderWidth="1px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 50px;">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left" valign="top">
                </td>
                <td style="width: 90px; text-align: left" valign="top">
                    发布日期：</td>
                <td style="width: 58px; text-align: left">
                    <asp:TextBox ID="txtFBDate" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left" valign="top">
                </td>
                <td style="width: 90px; text-align: left" valign="top">
                    联系人：</td>
                <td style="width: 58px">
                    <asp:TextBox ID="txtLinkman" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; text-align: left" valign="top">
                </td>
                <td style="width: 90px; text-align: left" valign="top">
                    联系电话：</td>
                <td style="width: 58px">
                    <asp:TextBox ID="txtCompanyPhone" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 54px; height: 32px; text-align: left" valign="top">
                </td>
                <td style="width: 90px; text-align: left; height: 32px;" valign="top">
                    公司简介：</td>
                <td style="width: 58px; text-align: left; height: 32px;">
                    <asp:TextBox ID="txtCompanyContent" runat="server" Height="44px" TextMode="MultiLine" Width="171px" BorderWidth="1px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 32px;">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <input id="Button1" onclick="window.close();" type="button" value="关　闭" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
