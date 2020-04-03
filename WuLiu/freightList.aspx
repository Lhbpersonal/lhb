<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="freightList.aspx.cs" Inherits="freightList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" style="width: 100px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/huoyuanxinxi.gif" /></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 100px">
    <asp:GridView ID="gvFreight" runat="server" AutoGenerateColumns="False" Width="585px" AllowPaging="True" OnPageIndexChanging="gvFreight_PageIndexChanging" CssClass="huise1">
        <Columns>
            <asp:BoundField DataField="Start" HeaderText="出发地" />
            <asp:BoundField DataField="Terminal" HeaderText="到达地" />
            <asp:BoundField DataField="FreightType" HeaderText="货物种类" />
            <asp:TemplateField HeaderText="重量">
                <ItemTemplate>
                    <%#Eval("FreightWeight") %>
                    <%#Eval("WeightUnit")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                HtmlEncode="False" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("freightInfo.aspx?ID=<%#Eval("ID")%>",507,500)'>详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                        </td>
                    </tr>
                </table>
  <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
</asp:Content>

