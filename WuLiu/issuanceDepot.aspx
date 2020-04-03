<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceDepot.aspx.cs" Inherits="issuanceDepot" %>
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
                <td style="width: 31px; height: 21px;">
                </td>
                <td style="width: 111px; height: 21px;">
                    仓储类别：</td>
                <td style="width: 286px; height: 21px;">
                    <asp:DropDownList ID="ddlDepotType" runat="server" Height="31px" Width="81px">
                        <asp:ListItem>普通</asp:ListItem>
                        <asp:ListItem>冷藏</asp:ListItem>
                        <asp:ListItem>液体</asp:ListItem>
                        <asp:ListItem>暖库</asp:ListItem>
                        <asp:ListItem>危险品</asp:ListItem>
                        <asp:ListItem>其它</asp:ListItem>
                    </asp:DropDownList></td>
                <td style="width: 100px; height: 21px;">
                </td>
            </tr>
            <tr>
                <td  valign="top">
                </td>
                <td  valign="top">
                    所在城市：</td>
                <td valign="top" style="width: 286px" ><table style="width: 249px" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 89px; height: 22px;">
                            <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged"
                                Width="120px">
                            </asp:DropDownList></td>
                        <td style="width: 100px; height: 22px;">
                            省</td>
                        <td style="width: 100px; height: 22px;">
                    <asp:DropDownList ID="ddldCs" runat="server"  >
                        <asp:ListItem>选择城市</asp:ListItem>
                    </asp:DropDownList></td>
                        <td style="width: 100px; height: 22px">
                            市</td>
                    </tr>
                </table>
                </td>
                <td  valign="top">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    仓库地点：</td>
                <td style="width: 286px">
                    <asp:TextBox ID="txtDepotSite" runat="server" Width="115px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDepotSite"></asp:RequiredFieldValidator></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 38px">
                </td>
                <td style="width: 111px; height: 38px">
                    面积：</td>
                <td style="width: 286px; height: 38px">
                    <asp:TextBox ID="txtDepotAcreage" runat="server" Width="112px"></asp:TextBox>平方米</td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 38px">
                </td>
                <td style="width: 111px; height: 38px">
                    数量：</td>
                <td style="width: 286px; height: 38px">
                    <asp:TextBox ID="txtDepotSum" runat="server" Width="113px"></asp:TextBox>
                    间<asp:CompareValidator ID="CompareValidatorDepotSum" runat="server" ControlToValidate="txtDepotSum"
                        ErrorMessage="只能输入数字" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 38px">
                </td>
                <td style="width: 111px; height: 38px">
                    价格：</td>
                <td style="width: 286px; height: 38px">
                    <asp:TextBox ID="txtDepotPrice" runat="server" Width="111px"></asp:TextBox>元/间</td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 38px">
                </td>
                <td style="width: 111px; height: 38px">
                    配套服务</td>
                <td style="width: 286px; height: 38px">
                    <asp:CheckBox ID="ckbLoading" runat="server" Text="装卸" />
                    <asp:CheckBox ID="ckbPacking" runat="server" Text="包装" />
                    <asp:CheckBox ID="ckbSend" runat="server" Text="配送" /></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    联系人：</td>
                <td style="width: 286px">
                    <asp:TextBox ID="txtLinkman" runat="server" Width="115px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 24px;">
                </td>
                <td style="width: 111px; height: 24px;">
                    联系电话：</td>
                <td style="width: 286px; height: 24px;">
                    <asp:TextBox ID="txtPhone" runat="server" Width="114px"></asp:TextBox></td>
                <td style="width: 100px; height: 24px;">
                </td>
            </tr>
            <tr>
                <td style="width: 31px; height: 12px;">
                </td>
                <td style="width: 111px; height: 12px;">
                    有效日期：</td>
                <td style="width: 286px; height: 12px;">
                    <asp:TextBox ID="txtTerm" runat="server" Width="114px"></asp:TextBox>&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidatorTerm" runat="server" ErrorMessage="日期格式不正确"
                        Operator="DataTypeCheck" Type="Date" ControlToValidate="txtTerm"></asp:CompareValidator></td>
                <td style="width: 100px; height: 12px;">
                </td>
            </tr>
            <tr>
                <td style="width: 31px">
                </td>
                <td style="width: 111px">
                    备注：</td>
                <td style="width: 286px">
                    <asp:TextBox ID="txtContent" runat="server" Height="146px" TextMode="MultiLine" Width="241px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发 布" Width="62px" /></td>
            </tr>
        </table>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
