<%@ Control Language="C#" CodeBehind="HeadMeau.ascx.cs" Inherits="WebApplication1.DynamicData.FieldTemplates.HeadMeau" %>

<style type="text/css">
    .auto-style2 {
        width: 99px;
        height: 43px;
    }
    .auto-style3 {
        height: 43px;
    }
    .auto-style9 {
        height: 28px;
    }
    </style>

<table style="width: 100%;">
    <tr>
        <td class="auto-style2"></td>
        <td class="auto-style3">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <table style="width:100%;">
                <tr>
                    <td id="Table2">
                        <asp:LinkButton ID="LinkButtonLogin" runat="server">LinkButtonLogin</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server">§主页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server">§添加图书</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server">§图书统计</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server">§我的购物车</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton5" runat="server">§个人中心</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="auto-style9" colspan="2"></td>
    </tr>
    </table>
