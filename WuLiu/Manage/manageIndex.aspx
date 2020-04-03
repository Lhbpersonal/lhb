<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageIndex.aspx.cs" Inherits="Manage_manageIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
<script language="javascript" type="text/javascript">



</script>
<style type="text/css">
<!--
body {
	margin-top: 0px;
}
-->
</style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 800px; height: 420px;
            text-align: center" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
                <td>
                    <iframe frameborder="no" name="leftFrame" scrolling="no" src="leftMenu.aspx" style="width: 200px;
                        height: 595px" width="200"></iframe>
                </td>
                <td style="width: 101px; height: 590px">
                    <iframe frameborder="no" height="500" name="rightFrame" src="rightMenu.aspx" style="width: 608px;
                        height: 596px" width="600"></iframe>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
