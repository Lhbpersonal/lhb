<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_news.aspx.cs" Inherits="Manage_manage_news" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
</head>
<body bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="color: #330099">新闻信息管理</span></strong><asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvNews_RowDeleting">
            <Columns>
                <asp:BoundField DataField="NewsTitle" HeaderText="新闻标题" />
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("../news.aspx?NewsID=<%#Eval("ID")%>",500,310)'>详细信息</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
