<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lockCause.aspx.cs" Inherits="Manage_lockCause" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        输入锁定原因&nbsp;<br />
        <asp:TextBox ID="txtCause" runat="server" Width="209px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="确　定" OnClick="Button1_Click" /></div>
    </form>
</body>
</html>
