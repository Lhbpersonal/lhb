<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_Depot.aspx.cs" Inherits="Manage_manage_Depot" %>

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
<body bgcolor="#d2cbc5">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <strong><span style="color: #ccccff"><span style="color: #660099">
        仓储信息管理</span><br />
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
        <asp:GridView ID="gvDepot" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvDepot_RowDataBound"
            OnRowDeleting="gvDepot_RowDeleting" OnSelectedIndexChanging="gvDepot_SelectedIndexChanging" Font-Size="10pt" AllowPaging="True" OnPageIndexChanging="gvDepot_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="DepotType" HeaderText="仓库类型" />
                   <asp:BoundField DataField="DepotCity" HeaderText="所在城市" />
                   <asp:BoundField DataField="DepotAcreage" HeaderText="仓库面积" />
                   <asp:BoundField DataField="DepotPrice" HeaderText="每间价格" />
                   <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"  HtmlEncode="False" />
                   
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("../depotInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
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
        <br />
        &nbsp;</div>
    </form>
</body>
</html>
