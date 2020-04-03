
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table id="Table1" style="z-index: 101; left: 8px; width: 504px; position: absolute;
            top: 8px; height: 208px">
                <tr>
                    <td  colspan ="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="4">&gt;&gt;浏览图书<br />
                        <hr />
                    </td>
                </tr>
                <tr style="background-color: aqua" class="auto-style1">
                    <td class="auto-style1">
                        ※书名：<asp:TextBox ID="TextBoxBookName" runat="server" Width="66px"></asp:TextBox>
                        &nbsp;</td>
                    <td style="height: 4px">
                        ※类别：<asp:DropDownList ID="DropDownListCategory" runat="server"  >
                        </asp:DropDownList>
                        
                        &nbsp;</td>
                    <td style="height: 4px">
                        ※作者:<asp:TextBox ID="TextBoxAuthor" runat="server" Width="66px"></asp:TextBox>

                        &nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr />
                        <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" Height="231px" Width="499px" OnRowDeleting="GV_RowDeleting"  >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chSelected" runat="server"></asp:CheckBox>
                                        <br />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BookId" HeaderText="编号" />
                                <asp:BoundField DataField="BookName" HeaderText="图书名" />
                                <asp:BoundField DataField="Author" HeaderText="作者" />
                                <asp:BoundField DataField="Publisher" HeaderText="出版社" />
                                <asp:BoundField DataField="PublishDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="出版日期" />
                                <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="价格" />
                                <asp:TemplateField HeaderText="TF1">
                                      
                                    <ItemTemplate>
                                        <a href='BookDetail.aspx?Book_id=<%# DataBinder.Eval(Container.DataItem,"BookId") %>'>详细信息</a>
                                    </ItemTemplate>
                                      
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                        &nbsp;

                    </td>

                </tr>
                <tr style="background-color: aqua">
                    <td  style="background-color: aqua" colspan="2">
                    &nbsp;
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="我的购物车" />
                    </td>
                    <td style="background-color: aqua" colspan="2">
                        &nbsp;<asp:Button ID="ButtonAddCart" runat="server" Text="放入购物篮" OnClick="ButtonAddCart_Click" />
                    </td>
                </tr>
                
            </table>
            </div>
    </form>
</body>
</html>
