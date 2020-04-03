<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceSpecial.aspx.cs" Inherits="issuanceSpecial" %>

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
        <table border="0" cellpadding="0" cellspacing="0" style="width: 458px; height: 270px">
            <tr>
                <td style="width: 31px; height: 10px">
                </td>
                <td style="width: 111px; height: 10px">
                    出发地：</td>
                <td style="width: 311px; height: 10px">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 249px">
                        <tr>
                            <td style="width: 89px">
                                <asp:DropDownList ID="ddlcSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcSf_SelectedIndexChanged"
                                    Width="119px">
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
                <td style="width: 100px; height: 10px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                    到达地：</td>
                <td style="width: 311px; height: 18px">
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 249px">
                        <tr>
                            <td style="width: 89px">
                                <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged"
                                    Width="120px">
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
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 18px">
                </td>
                <td style="width: 111px; height: 18px">
                    线路描述：</td>
                <td style="width: 311px; height: 18px">
                    <asp:TextBox ID="txtBewrite" runat="server" Height="76px" TextMode="MultiLine" Width="202px"></asp:TextBox></td>
                <td style="width: 100px; height: 18px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    车型：</td>
                <td style="width: 311px">
                    <asp:DropDownList ID="ddlTruckType" runat="server" Height="22px" Width="82px">
                        <asp:ListItem>普通</asp:ListItem>
                        <asp:ListItem>高栏</asp:ListItem>
                        <asp:ListItem>箱式</asp:ListItem>
                        <asp:ListItem>拖挂</asp:ListItem>
                        <asp:ListItem>平板</asp:ListItem>
                        <asp:ListItem>冷藏</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 19px">
                </td>
                <td style="width: 111px; height: 19px">
                    车长：</td>
                <td style="width: 311px; height: 19px">
                    <asp:TextBox ID="txtTruckLong" runat="server" Width="115px"></asp:TextBox></td>
                <td style="width: 100px; height: 19px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    载重：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLoad" runat="server" Width="114px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    专线报价：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtSpecialPrice" runat="server" Width="112px"></asp:TextBox></td>
                <td style="width: 100px">
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
                <td style="width: 31px; height: 24px">
                </td>
                <td style="width: 111px; height: 24px">
                    联系电话：</td>
                <td style="width: 311px; height: 24px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="114px"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    有效时间：</td>
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
                <td colspan="4" style="text-align: center; height: 24px;">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发 布" Width="62px" /></td>
            </tr>
        </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
