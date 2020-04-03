<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_Job.aspx.cs" Inherits="Manage_manage_Job" %>

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
        招聘信息管理<br />
        </span></strong>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 499px">
            <tr>
                <td style="width: 100px; text-align: center; height: 20px;">
                </td>
                <td style="width: 410px; text-align: center; height: 20px;">
                    <asp:RadioButton ID="rdibtnS" runat="server" Text="所有信息" Width="97px" AutoPostBack="True" Checked="True" GroupName="info" OnCheckedChanged="rdibtnS_CheckedChanged" />
                    <asp:RadioButton ID="rdibtnY" runat="server" Text="已审核信息" Width="104px" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdibtnY_CheckedChanged" />&nbsp;
                    <asp:RadioButton ID="rdibtnW" runat="server" Text="未审核信息" Width="101px" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdibtnW_CheckedChanged" /></td>
                <td style="width: 100px; text-align: center; height: 20px;">
                </td>
            </tr>
        </table>
        <asp:GridView ID="gvJob" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            Font-Size="10pt" OnRowDataBound="gvJob_RowDataBound" OnRowDeleting="gvJob_RowDeleting" OnPageIndexChanging="gvJob_PageIndexChanging" OnSelectedIndexChanging="gvJob_SelectedIndexChanging">
            <Columns>
               <asp:BoundField DataField="Job" HeaderText="招聘职位" />
            <asp:BoundField DataField="Number" HeaderText="招聘人数" />
            <asp:BoundField DataField="Specialty" HeaderText="要求专业" />
            <asp:BoundField DataField="Knowledge" HeaderText="要求学历" />
            <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
            <asp:TemplateField HeaderText="详细信息">
                <ItemTemplate>
                     <a  href="#" onclick='openPWD("../jobInfo.aspx?ID=<%#Eval("JobID")%>",500,620)' >详细信息</a>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField AccessibleHeaderText="sh" DataField="Auditing" HeaderText="状态" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                    <ControlStyle Font-Underline="False" />
                </asp:CommandField>
                <asp:CommandField HeaderText="审核" SelectText="通过/取消" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
        <br />
    </form>
</body>
</html>
