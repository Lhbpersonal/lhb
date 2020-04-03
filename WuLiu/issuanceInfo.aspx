<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceInfo.aspx.cs" Inherits="issuanceInfo" %>

<%@ Register Src="search.ascx" TagName="search" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        &nbsp;
        <table border="0" cellpadding="0" cellspacing="0" style="width: 750px" >
            <tr>
                <td colspan="1">
                </td>
                <td colspan="2">
                            <table width="100%" height="103" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" height="118" style="background:url(images/index1.JPG) no-repeat;background-size:cover">
                        <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top" style="height: 75px">
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                                        width="1002" height="75">
                                        <param name="movie" value="swf/top.swf" />
                                        <param name="quality" value="high" />
                                        <param name="wmode" value="transparent" />
                                        <embed src="swf/top.swf" width="1002" height="75" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                                            type="application/x-shockwave-flash" wmode="transparent"></embed>
                                    </object>
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="center" valign="top" class="daohangh">
                                    &nbsp;<uc1:header ID="Header1" runat="server" />
                                    <a href="#" class="hong"></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
                
                   <table cellpadding="0" cellspacing="0" height="103" width="100%">
                        <tr>
                            <td style="background:url(images/guanggao.JPG) no-repeat;background-size:cover;height: 162px" width="1002">
                                <table cellpadding="0" cellspacing="0" height="100%" width="100%">
                                    <tr>
                                        <td height="112">
                                            <table align="right" cellpadding="0" cellspacing="0" height="36" width="610">
                                                <tr>
                                                    <td style="height: 34px" valign="bottom">
                                                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                                                            height="52" width="452">
                                                            <param name="movie" value="swf/font.swf">
                                                            <param name="quality" value="high">
                                                            <param name="wmode" value="transparent">
                                                            <embed height="52" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high"
                                                                src="swf/font.swf" type="application/x-shockwave-flash" width="452" wmode="transparent"></embed>
                                                        </object>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 50px" valign="middle">
                                        
                                            <table align="right" cellpadding="0" cellspacing="0" height="36" style="width: 553px">
                                                <tr>
                                                    <td valign="bottom" style="width: 530px; text-align: left; height: 36px;">
                                                        <span class="huise1" style="width: 100px; height: 22px">
                                                            <uc2:search ID="Search1" runat="server" />
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                   
                   </td>
                <td style="width: 393px; text-align: right;">
                    &nbsp;<iframe frameborder="no" name="leftFrame" scrolling="no" src="<%=url%>" style="width: 179px;
            height: 595px" width="200"></iframe>
                </td>
                <td style="width: 99px; text-align: left;">
                    <iframe frameborder="no" height="500" name="rightFrame" 
            style="width: 608px; height: 596px" width="400"></iframe>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 393px">
                </td>
                <td style="width: 99px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
