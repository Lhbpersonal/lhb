<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageEntry.aspx.cs" Inherits="manageEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        </div>
        <table height="780" width="100%">
            <tr>
                <td bgcolor="#d3cec7">
                    <table align="center" cellpadding="0" cellspacing="0" height="226" width="397">
                        <tr>
                            <td background="images/dengl.jpg" valign="bottom">
                                <table align="center" height="103" width="241">
                                    <tr>
                                        <td class="huise1" width="233">
                                            用户名：<asp:TextBox ID="txtName" runat="server" Width="80px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="huise1">
                                            密&nbsp; 码：
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="80px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="huise1">
                                            <a href="#"></a>&nbsp;&nbsp;
                    <asp:Button ID="btnLanding" runat="server" OnClick="Button1_Click" Text="登录" Width="64px" />
                                            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="返　回" />
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
