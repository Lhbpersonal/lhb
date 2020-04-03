<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="WebApplication1.BookDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="Table1" style="width: 504px; position: absolute; z-index: 101; height: 193px; top: 8px; left: 8px;">
                <tr>
                    <td colspan="2">&lt;&lt;详细信息<br />
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="width: 254px; height: 48px">
                        <asp:Label ID="LabelBookInfo" runat="server" Height="206px" Text="Label" Width="272px"></asp:Label>
                    </td>
                    <td class="auto-style1" style="height: 48px">
                        <asp:Image ID="ImageBook" runat="server" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="ButtonBack" runat="server" Text="返回" OnClick="ButtonBack_Click" Width="62px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
