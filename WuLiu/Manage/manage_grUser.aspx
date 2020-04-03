<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_grUser.aspx.cs" Inherits="Manage_manage_grUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    
</head>
<body bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="color: #330099">
        普通用户管理</span></strong><br />
        <asp:GridView ID="gvGrUser" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvGrUser_RowDataBound" OnRowDeleting="gvGrUser_RowDeleting" OnSelectedIndexChanging="gvGrUser_SelectedIndexChanging">
            <Columns>
                <asp:BoundField HeaderText="用户名" DataField="Name" />
                <asp:BoundField DataField="Linkman" HeaderText="联系人" />
                <asp:BoundField HeaderText="状态" DataField="Lock" />
                <asp:BoundField DataField="Phone" HeaderText="联系电话" />
                <asp:BoundField DataField="Address" HeaderText="所在地址" />
                <asp:CommandField HeaderText="操作" SelectText="锁定/解锁" ShowSelectButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
