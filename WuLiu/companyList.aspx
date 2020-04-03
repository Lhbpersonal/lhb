<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="companyList.aspx.cs" Inherits="companyList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
    <div style="text-align: left;">
    <table align="left" border="0" cellpadding="0" cellspacing="0" style="text-align: left">
        <tr>
            <td align="left" style="width: 100px;">

    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/qiyexinxi.gif" /></td>
        </tr>
        <tr>
            <td align="center" style="width: 100px; " valign="top">
    <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvCompany_PageIndexChanging" CssClass="huise1" Width="512px">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="企业名称" />
            <asp:BoundField DataField="Kind" HeaderText="企业性质" />
            <asp:BoundField DataField="Calling" HeaderText="所属行业" />
            <asp:BoundField DataField="Linkman" HeaderText="联系人" />
            <asp:BoundField DataField="Phone" HeaderText="联系电话" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("companyInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
   
</asp:Content>

