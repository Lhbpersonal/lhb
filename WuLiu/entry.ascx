<%@ Control Language="C#" AutoEventWireup="true" CodeFile="entry.ascx.cs" Inherits="entry" %>
<table border="0" cellpadding="0" cellspacing="0" style="background-image: url(Image/logink.jpg);
    width: 214px; background-repeat: no-repeat; height: 11px; text-align: center;" id="TABLE1" class="huise1">
    <tr>
        <td align="right" style="height: 9px">
        </td>
        <td align="right" style="width: 87px; height: 9px">
        </td>
        <td style="width: 84px; height: 9px">
        </td>
        <td style="width: 55px; height: 9px">
        </td>
    </tr>
    <tr>
        <td align="right" style="height: 24px">
        </td>
        <td align="right" style="width: 87px; height: 24px">
            <span style="font-size: 10pt"><class><STRONG>用户名</STRONG>
                ：</span></td>
        <td style="width: 84px; height: 24px">
            <asp:TextBox ID="txtName" runat="server" Width="80px"></asp:TextBox><span style="color: #ff0033"></span></td>
        <td style="width: 55px; height: 24px; color: #000000;">
            <asp:RadioButton ID="rdibtnGr" runat="server" Text="个人" Checked="True" GroupName="type" CssClass="huise1" /></td>
    </tr>
    <tr style="font-weight: bold; color: #000000">
        <td align="right" style="height: 28px">
        </td>
        <td align="right" style="width: 87px; height: 28px">
            <span style="font-size: 10pt" class="huise1">
            密 码 ：&nbsp;</span></td>
        <td style="width: 84px; height: 28px">
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="80px"></asp:TextBox><span
                style="color: #ff0033"></span></td>
        <td style="width: 55px; height: 28px">
            <asp:RadioButton ID="rdibtnQy" runat="server" Text="企业" Width="59px" Font-Bold="False" GroupName="type" CssClass="huise1" /></td>
    </tr>
    <tr>
        <td align="left" colspan="1" style="height: 31px">
        </td>
        <td align="left" colspan="2" style="height: 31px">
            <asp:LinkButton ID="lnkbtnNew" runat="server" CausesValidation="False" Font-Bold="True"
                Font-Size="10pt" Font-Underline="false" ForeColor="#FF0000" PostBackUrl="~/login.aspx" CssClass="huise1" >［新会员注册］</asp:LinkButton>&nbsp;
        </td>
        <td align="center" colspan="1" style="width: 55px; height: 31px;">
            </td>
    </tr>
    <tr>
        <td align="center" colspan="1" style="height: 25px">
        </td>
        <td align="center" colspan="3" style="height: 25px">
            <asp:Button ID="btnLanding" runat="server" OnClick="Button1_Click" Text="登录" Width="64px" CssClass="huise1" />
            <input id="Reset1" style="width: 60px" type="reset" value="重置" class="huise1" /></td>
    </tr>
</table>
