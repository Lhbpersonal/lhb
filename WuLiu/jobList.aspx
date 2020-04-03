<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="jobList.aspx.cs" Inherits="jobList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>

    <table align="left" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" style="width: 100px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/zhaopinxinxi.gif" /></td>
        </tr>
        <tr>
            <td valign="top" align="center" style="width: 100px; ">
    <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvJob_PageIndexChanging" CssClass="huise1" Width="527px">
        <Columns>
            <asp:BoundField DataField="Job" HeaderText="招聘职位" />
            <asp:BoundField DataField="Number" HeaderText="招聘人数" />
            <asp:BoundField DataField="Specialty" HeaderText="要求专业" />
            <asp:BoundField DataField="Knowledge" HeaderText="要求学历" />
            <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                     <a  href="#" onclick='openPWD("jobInfo.aspx?ID=<%#Eval("JobID")%>",500,610)' >详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

