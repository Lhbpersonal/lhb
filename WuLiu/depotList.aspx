<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="depotList.aspx.cs" Inherits="depotList" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
<script language='javascript'>
    function openPWD(i,width,height)
   {
      window.open(i,"","dialogHeight: "+height+"px; dialogWidth: "+width+"px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>

    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" style="width: 100px; height: 18px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/cangchuxinxi.gif" /></td>
        </tr>
        <tr>
            <td align="center" style="width: 100px; height: 18px">
    <asp:GridView ID="gvDepot" runat="server" AutoGenerateColumns="False" Width="591px" AllowPaging="True" OnPageIndexChanging="gvDepot_PageIndexChanging" CssClass="huise1">
        <Columns>
            <asp:BoundField DataField="DepotType" HeaderText="仓库类型" />
            <asp:BoundField DataField="DepotCity" HeaderText="所在城市" />
            <asp:BoundField DataField="DepotAcreage" HeaderText="仓库面积" />
            <asp:BoundField DataField="DepotPrice" HeaderText="每间价格" />
            <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                HtmlEncode="False" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("depotInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

