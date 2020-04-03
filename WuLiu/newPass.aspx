<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPass.aspx.cs" Inherits="newPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="4" style="width: 539px; height: 18px; text-align: center">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">修改详细信息</asp:LinkButton>
                    &nbsp; &nbsp; &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">修改密码</asp:LinkButton></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 541px; height: 68px">
            <tr>
                <td style="width: 70px">
                </td>
                <td style="width: 100px">
                    密码：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtOldPass" runat="server" Width="127px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="*" ControlToValidate="txtOldPass"></asp:RequiredFieldValidator></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 70px">
                </td>
                <td style="width: 100px">
                    新密码：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtNewPass" runat="server" Width="123px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass"
                        Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 70px">
                </td>
                <td style="width: 100px">
                    确认密码：</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtQNewPass" runat="server" Width="123px" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                        ControlToValidate="txtQNewPass" Display="Dynamic" ErrorMessage="两次密码不一致"></asp:CompareValidator></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="1" style="width: 70px; text-align: center">
                </td>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修　改" Width="60px" /></td>
            </tr>
        </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Height="50px" Width="125px">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 542px; height: 488px">
                <tr>
                    <td colspan="4" style="height: 22px; text-align: center">
                        <span style="font-size: 14pt; color: #6600ff"></span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        联系人：</td>
                    <td style="width: 61px; text-align: left">
                        <asp:TextBox ID="txtLinkman" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        企业名称：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        公司性质：</td>
                    <td style="width: 61px; text-align: left">
                        <asp:DropDownList ID="ddlKind" runat="server" Width="59px">
                            <asp:ListItem>私企</asp:ListItem>
                            <asp:ListItem>国企</asp:ListItem>
                            <asp:ListItem>外资</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        所属行业：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtCalling" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px; height: 24px">
                    </td>
                    <td style="width: 178px; height: 24px">
                        营业执照号：</td>
                    <td style="width: 61px; height: 24px">
                        <asp:TextBox ID="txtLicenceNumber" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 24px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        公司地址：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        联系电话：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        传真：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtFax" runat="server"></asp:TextBox></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        E-mail：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="E-mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px">
                    </td>
                    <td style="width: 178px">
                        公司网址：</td>
                    <td style="width: 61px">
                        <asp:TextBox ID="txtNetworkIP" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNetworkIP"
                            Display="Dynamic" ErrorMessage="网址格式不正确" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            Width="127px"></asp:RegularExpressionValidator></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 146px; height: 42px">
                    </td>
                    <td style="width: 178px; height: 42px">
                        公司介绍：</td>
                    <td style="width: 61px; height: 42px">
                        <asp:TextBox ID="txtContent" runat="server" Height="124px" TextMode="MultiLine" Width="247px"></asp:TextBox></td>
                    <td style="width: 100px; height: 42px">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 28px; text-align: center">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="注　册" Width="55px" /></td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    
    </div>
    </form>
</body>
</html>
