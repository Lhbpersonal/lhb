<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAdd.aspx.cs" Inherits="WebApplication1.personalCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 130px;
        }
        .auto-style2 {
            width: 381px;
        }
        .auto-style3 {
            width: 130px;
            height: 30px;
        }
        .auto-style4 {
            width: 381px;
            height: 30px;
        }
        .auto-style5 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td colspan="3">&gt;&gt;添加图书<br />
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">图书名*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxBookName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxBookName" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">图书类别*</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownListCategoryName" runat="server">
                            <asp:ListItem>中外文学</asp:ListItem>
                            <asp:ListItem>政治经济</asp:ListItem>
                            <asp:ListItem>学术名著</asp:ListItem>
                            <asp:ListItem>IT技术</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style1">价格*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxPrice" runat="server" Width="145px"></asp:TextBox>
                        元</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">出版社*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxPublisher" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPublisher" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">出版日期*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxPublishDate" runat="server" Width="145px"></asp:TextBox>
                        (例如：2001-01-01)</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">作者*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxAuthor" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxAuthor" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">页数*</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxPageNum" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxPageNum" ErrorMessage="不能为空！" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">简介</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">上传图片</td>
                    <td class="auto-style2">
                        <input id="inputPictureFiles" type="file" runat ="server"/></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
