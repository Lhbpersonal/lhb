<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartView.aspx.cs" Inherits="WebApplication1.CartView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 498px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="Table1" style="width: 504px; z-index: 101; position: absolute; top: 8px; height: 136px; left: 8px;">
                <tr>
                    <td class="auto-style1"><<购买图书<<我的购物车<br />
                        <hr />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" Width="90%" OnRowDeleting="GV_RowDeleting"  AllowPaging="True" PageSize="5" OnPageIndexChanging="GV_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="orderSelect" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CardId" HeaderText="购物篮编号" />
                                <asp:BoundField DataField="BookId" HeaderText="图书编号" />
                                <asp:BoundField DataField="BookName" HeaderText="图书名" />
                                <asp:BoundField DataField="Amount" HeaderText="数量" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="OrederBotton" runat="server" OnClick="OrederBotton_Click" Text="提交订单" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
