<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_Special.aspx.cs" Inherits="Manage_manage_Special" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <script language='javascript'>
    function openPWD(i,width,height)
   {
      window.open(i,"","dialogHeight: "+height+"px; dialogWidth: "+width+"px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
</head>
<body style="text-align: center" bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div>
        <strong><span style="color: #330099">
        专线信息管理</span></strong><br />
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px; text-align: center; height: 20px;">
                </td>
                <td style="width: 410px; text-align: center; height: 20px;">
                    <asp:RadioButton ID="rdibtnS" runat="server" Text="所有信息" Width="97px" Checked="True" GroupName="info" OnCheckedChanged="rdibtnS_CheckedChanged" AutoPostBack="True" />&nbsp;
                    <asp:RadioButton ID="rdibtnY" runat="server" Text="已审核信息" Width="104px" GroupName="info" OnCheckedChanged="rdibtnY_CheckedChanged" AutoPostBack="True" />
                    <asp:RadioButton ID="rdibtnW" runat="server" Text="未审核信息" Width="101px" GroupName="info" OnCheckedChanged="rdibtnW_CheckedChanged" AutoPostBack="True" /></td>
                <td style="width: 100px; text-align: center; height: 20px;">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
        <asp:GridView ID="gvSpecial" runat="server" AutoGenerateColumns="False" Font-Size="10pt"
            OnRowDataBound="gvSpecial_RowDataBound" OnRowDeleting="gvSpecial_RowDeleting" AllowPaging="True" OnPageIndexChanging="gvSpecial_PageIndexChanging" OnSelectedIndexChanging="gvSpecial_SelectedIndexChanging">
            <Columns>
                <asp:BoundField DataField="start" HeaderText="出发地" />
            <asp:BoundField DataField="Terminal" HeaderText="到达地" />
            <asp:BoundField DataField="TruckType" HeaderText="车型" />
            <asp:BoundField DataField="specialPrice" HeaderText="专线报价" />
            <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                HtmlEncode="False" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                    <a href="#" onclick='openPWD("../specialInfo.aspx?ID=<%#Eval("ID")%>",500,610)'>详细信息</a>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField AccessibleHeaderText="sh" DataField="Auditing" HeaderText="状态" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                    <ControlStyle Font-Underline="False" />
                </asp:CommandField>
                <asp:CommandField HeaderText="审核" SelectText="通过/取消" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
