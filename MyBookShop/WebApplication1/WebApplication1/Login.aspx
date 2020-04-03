<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户登录</title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="my_Login" runat="server" FailureAction="RedirectToLoginPage" Height="231px" OnAuthenticate="my_Login_Authenticate" BackColor="#00CCFF">
            </asp:Login>

            <asp:HyperLink ID="HyperLinkRegister" runat="server" ForeColor="#6600FF" NavigateUrl="~/Register.aspx" BackColor="White">注册新用户</asp:HyperLink>
            <br />

        </div>
    </form>
</body>
</html>
