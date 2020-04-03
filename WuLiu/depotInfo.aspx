<%@ Page Language="C#" AutoEventWireup="true" CodeFile="depotInfo.aspx.cs" Inherits="depotInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 498px; height: 461px; background-image: url(images/tanchuang.gif); background-repeat: no-repeat;">
            <tr>
                <td style="width: 175px; height: 133px">
                </td>
                <td style="width: 152px; height: 133px">
                </td>
                <td style="width: 311px; height: 133px">
                </td>
                <td style="width: 100px; height: 133px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px">
                </td>
                <td style="width: 152px">
                    仓储类别：</td>
                <td style="width: 311px">
                    &nbsp;<asp:TextBox ID="txtDepotType" runat="server" BorderWidth="0px" 
                        ReadOnly="True" Width="189px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 21px">
                </td>
                <td style="width: 152px; height: 21px">
                    所在城市：</td>
                <td style="width: 311px">
                    &nbsp;<asp:TextBox ID="txtDepotCity" runat="server" BorderWidth="0px" 
                        ReadOnly="True" Width="191px"></asp:TextBox></td>
                <td style="width: 100px; height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 24px">
                </td>
                <td style="width: 152px; height: 24px">
                    仓库地点：</td>
                <td style="width: 311px; height: 24px">
                    <asp:TextBox ID="txtDepotSite" runat="server" Width="190px" BorderWidth="0px" 
                        ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 38px">
                </td>
                <td style="width: 152px; height: 38px">
                    面积：</td>
                <td style="width: 311px; height: 38px">
                    <asp:TextBox ID="txtDepotAcreage" runat="server" Width="112px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 38px">
                </td>
                <td style="width: 152px; height: 38px">
                    数量：</td>
                <td style="width: 311px; height: 38px">
                    <asp:TextBox ID="txtDepotSum" runat="server" Width="113px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 38px">
                </td>
                <td style="width: 152px; height: 38px">
                    价格：</td>
                <td style="width: 311px; height: 38px">
                    <asp:TextBox ID="txtDepotPrice" runat="server" Width="111px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 38px">
                </td>
                <td style="width: 152px; height: 38px">
                    配套服务</td>
                <td style="width: 311px; height: 38px">
                    <asp:TextBox ID="txtAppendServer" runat="server" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 38px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px">
                </td>
                <td style="width: 152px">
                    联系人：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtLinkman" runat="server" Width="115px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 24px">
                </td>
                <td style="width: 152px; height: 24px">
                    联系电话：</td>
                <td style="width: 311px; height: 24px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="114px" BorderWidth="0px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 24px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px">
                </td>
                <td style="width: 152px">
                    有效日期：</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtTerm" runat="server" Width="191px" BorderWidth="0px" 
                        ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px">
                </td>
                <td style="width: 152px">
                    发布日期</td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtFBDate" runat="server" Width="191px" BorderWidth="0px" 
                        ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 175px; height: 7px;">
                </td>
                <td style="width: 152px; height: 7px;">
                    备注：</td>
                <td style="width: 311px; height: 7px;">
                    <asp:TextBox ID="txtContent" runat="server" Height="75px" TextMode="MultiLine" Width="241px" BorderWidth="1px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 100px; height: 7px;">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; height: 5px;">
                    <input id="Button1" onclick="window.close();" type="button" value="关　闭" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
