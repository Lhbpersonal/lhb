<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication1.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 504px; z-index: 101; position: absolute; top: 8px; height: 136px; left: 8px;">
                <tr>
                    <td>&lt;&lt;确认订单<br /><hr /></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GV" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" Width="90%">
                            <Columns>
                                <asp:BoundField DataField="OrderId" HeaderText="订单号" />
                                <asp:BoundField DataField="BookName" HeaderText="图书名" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认订单" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
