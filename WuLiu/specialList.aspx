<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="specialList.aspx.cs" Inherits="specialList" Title="Untitled Page" %>
 
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
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/zhuanxianxinxi.gif" /></td>
        </tr>
        <tr>
            <td align="center" style="width: 100px">
    <asp:GridView ID="gvSpecial" runat="server" AutoGenerateColumns="False" Height="104px"
        Width="591px" AllowPaging="True" OnPageIndexChanging="gvSpecial_PageIndexChanging" CssClass="huise1">
        <Columns>
            <asp:BoundField DataField="start" HeaderText="出发地" />
            <asp:BoundField DataField="Terminal" HeaderText="到达地" />
            <asp:BoundField DataField="TruckType" HeaderText="车型" />
            <asp:BoundField DataField="specialPrice" HeaderText="专线报价" />
            <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                HtmlEncode="False" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("specialInfo.aspx?ID=<%#Eval("ID")%>",500,620)'>详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

