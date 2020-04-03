<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="truckList.aspx.cs" Inherits="truckList" Title="Untitled Page" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>

    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" style="width: 100px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/cheyuanxinxi.gif" /></td>
        </tr>
        <tr>
            <td align="center" style="width: 100px; text-align: center">
    <asp:GridView ID="gvTruck" runat="server" AutoGenerateColumns="False" Width="587px" AllowPaging="True" OnPageIndexChanging="gvTruck_PageIndexChanging" CssClass="huise1">
        <Columns>
            <asp:BoundField DataField="start" HeaderText="出发地" />
            <asp:BoundField DataField="Terminal" HeaderText="到达地" />
            <asp:BoundField DataField="TruckType" HeaderText="车型" />
            <asp:BoundField DataField="TruckLoad" HeaderText="载重" />
            <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                HtmlEncode="False" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("truckInfo.aspx?ID=<%#Eval("ID")%>",500,550)'>详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

