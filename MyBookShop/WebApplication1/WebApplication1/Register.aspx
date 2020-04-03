<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 132px;
        }
        .auto-style2 {
            margin-left: 149px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="Table1" style="width: 520px; background-color: lightblue; left: 8px; position: absolute; top: 8px; height: 168px;">
                <tr>
                    <td colspan="2">&gt;&gt;用户注册<hr /></td>
                </tr>
                <tr>
                    <td class="auto-style1">登录名*：</td>
                    <td>
                        <asp:TextBox ID="TextBoxLoginName" runat="server" Width="90px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" ForeColor="#CC0000" ControlToValidate="TextBoxLoginName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">姓名*：</td>
                    <td>
                        <asp:TextBox ID="TextBoxUserName" runat="server" Width="90px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="姓名不能为空" ForeColor="#CC0000" ControlToValidate="TextBoxUserName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">密码*：</td>
                    <td>
                        <asp:TextBox ID="TextBoxPassword" runat="server" Width="90px" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码不能为空" ForeColor="#CC0000" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">重复密码*：</td>
                    <td>
                        <asp:TextBox ID="TextBoxPassword2" runat="server" Width="90px" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword2" ControlToValidate="TextBoxPassword" ErrorMessage="密码不相等" ForeColor="#CC0000"></asp:CompareValidator>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="不能为空" ControlToValidate="TextBoxPassword2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">联系地址：</td>
                    <td>
                        <asp:TextBox ID="TextBoxAddress" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">邮编：</td>
                    <td>
                        <asp:TextBox ID="TextBoxZip" runat="server" Width="90px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="注册" Width="94px" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
