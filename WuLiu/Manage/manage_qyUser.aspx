<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_qyUser.aspx.cs" Inherits="Manage_manage_qyUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <script language='javascript'>
    function openPWD(i,width,height)
   {
      window.open(i,"","dialogHeight: "+height+"px; dialogWidth: "+width+"px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
</head>
<body bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="color: #330099">企业用户管理</span></strong><asp:GridView ID="gvQyUser" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvQyUser_RowDataBound"
            OnRowDeleting="gvQyUser_RowDeleting" OnSelectedIndexChanging="gvQyUser_SelectedIndexChanging">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="用户名" />
                <asp:BoundField DataField="CompanyName" HeaderText="企业名称" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("../companyInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Lock" HeaderText="状态" />
                <asp:CommandField HeaderText="操作" SelectText="锁定/解锁" ShowSelectButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
