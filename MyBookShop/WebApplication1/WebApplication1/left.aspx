<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="left.aspx.cs" Inherits="WebApplication1.left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &amp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx" Target="mainFrame">主页</asp:HyperLink>
            <br />
            &amp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CartView.aspx" Target="mainFrame">购物车</asp:HyperLink>
            <br />
            &amp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/BookAdd.aspx" Target="mainFrame">添加图书</asp:HyperLink>
            <br />
            &amp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Register.aspx" Target="mainFrame">注册新用户</asp:HyperLink>
        </div>
    </form>
</body>
</html>
