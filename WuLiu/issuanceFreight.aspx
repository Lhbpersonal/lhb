<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceFreight.aspx.cs" Inherits="issuanceFreight" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/fabuxinxi.gif" /></td>
            </tr>
            <tr>
                <td style="width: 100px">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 458px; height: 365px">
            <tr>
                <td style="width: 31px; height: 41px;">
                </td>
                <td style="width: 111px; height: 41px;">
                    出发地：</td>
                <td style="width: 311px; height: 41px;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 249px">
                        <tr>
                            <td style="width: 89px">
                    <asp:DropDownList ID="ddlcSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcSf_SelectedIndexChanged" Width="119px">
                    </asp:DropDownList></td>
                            <td style="width: 100px">
                                省</td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="ddlcCs" runat="server">
                                    <asp:ListItem>选择城市</asp:ListItem>
                    </asp:DropDownList></td>
                            <td style="width: 100px">
                                市</td>
                        </tr>
                    </table>
                </td>
                <td style="width: 100px; height: 41px;">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 21px;">
                </td>
                <td style="width: 111px; height: 21px;">
                    到达地：</td>
                <td style="width: 311px" >
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 249px">
                        <tr>
                            <td style="width: 89px">
                    <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged" Width="120px">
                    </asp:DropDownList></td>
                            <td style="width: 100px">
                                省</td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="ddldCs" runat="server">
                                    <asp:ListItem>选择城市</asp:ListItem>
                    </asp:DropDownList></td>
                            <td style="width: 100px">
                                市</td>
                        </tr>
                    </table>
                </td>
                <td style="width: 100px; height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    货物种类：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtFreightType" runat="server" Width="115px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 38px;">
                </td>
                <td style="width: 111px; height: 38px;">
                    货物重量：</td>
                <td style="width: 311px; height: 38px;">
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 257px">
                        <tr>
                            <td style="width: 100px">
                    <asp:TextBox ID="txtFreightWeight" runat="server" Width="115px"></asp:TextBox></td>
                            <td style="width: 42px">
                    <asp:RadioButton ID="rdibtnDun" runat="server" Text="吨" Width="40px" Checked="True" GroupName="weight" /></td>
                            <td style="width: 60px">
                    <asp:RadioButton ID="rdibtnFan" runat="server" Text="方" GroupName="weight" /></td>
                            <td style="width: 100px">
                    <asp:RadioButton ID="rdibtnJian" runat="server" Text="件" GroupName="weight" /></td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;
                </td>
                <td style="width: 100px; height: 38px;">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    联系人：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLinkman" runat="server" Width="115px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    联系电话：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="114px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    有效日期：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtTerm" runat="server" Width="114px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    备注：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtContent" runat="server" Height="146px" TextMode="MultiLine" Width="241px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:Button ID="btnIssuance" runat="server" Text="发 布" Width="62px" OnClick="btnIssuance_Click" /></td>
            </tr>
        </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
