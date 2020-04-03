<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_Truck.aspx.cs" Inherits="Manage_manage_Truck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
</head>
<body bgcolor="D2CBC5">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="color: #330099">
        车源信息管理<br />
        </span></strong>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px; height: 20px; text-align: center">
                </td>
                <td style="width: 410px; height: 20px; text-align: center">
                    <asp:RadioButton ID="rdibtnS" runat="server" AutoPostBack="True" Checked="True" GroupName="info"
                        OnCheckedChanged="rdibtnS_CheckedChanged" Text="所有信息" Width="97px" />&nbsp;<asp:RadioButton
                            ID="rdibtnY" runat="server" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdibtnY_CheckedChanged"
                            Text="已审核信息" Width="104px" />&nbsp;
                    <asp:RadioButton ID="rdibtnW" runat="server" AutoPostBack="True" GroupName="info"
                        OnCheckedChanged="rdibtnW_CheckedChanged" Text="未审核信息" Width="101px" /></td>
                <td style="width: 100px; height: 20px; text-align: center">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 20px; text-align: center">
        <asp:GridView ID="gvTruck" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvTruck_RowDataBound"
            OnRowDeleting="gvTruck_RowDeleting" OnSelectedIndexChanging="gvTruck_SelectedIndexChanging" Font-Size="10pt" AllowPaging="True" OnPageIndexChanging="gvTruck_PageIndexChanging">
            <Columns>
              <asp:BoundField DataField="start" HeaderText="出发地" />
                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                <asp:BoundField DataField="TruckType" HeaderText="车型" />
                <asp:BoundField DataField="TruckLoad" HeaderText="载重" />
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("../truckInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
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
