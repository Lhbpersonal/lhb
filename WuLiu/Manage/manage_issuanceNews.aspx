<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_issuanceNews.aspx.cs" Inherits="Manage_manage_issuanceNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body style="text-align: center" bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div>
        <strong><span style="color: #330099">发布新闻信息</span></strong><table border="0" cellpadding="0" cellspacing="0" style="width: 411px; height: 214px">
            <tr>
                <td style="width: 100px">
                    新闻标题：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNewsTitle" runat="server"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    新闻内容：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNewsContent" runat="server" Height="91px" TextMode="MultiLine"
                        Width="193px"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发　布" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
