<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<%--<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
          
            <table border="0" cellpadding="0" cellspacing="0" style="width: 498px; height: 313px; background-image: url(images/tanchuang.gif);">
                <tr>
                    <td align="center" rowspan="1" style="width: 100px; height: 130px; text-align: center">
                    </td>
                    <td align="center" style="width: 417px; height: 130px; text-align: center">
                    </td>
                    <td align="center" rowspan="1" style="width: 100px; height: 130px; text-align: center">
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 100px; text-align: center" rowspan="3">
                    </td>
                    <td style="width: 417px; text-align: center;" align="center">
                        <span  id="spTitle" runat="server" >文章标题</span>
                    </td>
                    <td align="center" style="width: 100px; text-align: center" rowspan="3">
                    </td>
                </tr>
                <tr>
                    <td style="width: 417px; height: 142px;">
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical">
                      <%=Content%>  
                      </asp:Panel>
                       
                    </td>
                </tr>
                <tr>
                    <td style="width: 417px; text-align: right; height: 55px;" align="right">
                       <span  id="spDate" runat="server" >文章标题</span>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3" rowspan="1" style="text-align: center">
                        <input id="Button1" onclick="window.close();" type="button" value="关　闭" /></td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
