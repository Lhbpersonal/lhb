<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="log" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <div style="text-align: center">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 564px">
                <tr>
                    <td style="width: 100px; text-align: left">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/huiyuanzhuce.gif" /></td>
                </tr>
            </table>
            <asp:Panel ID="pelDaohan" runat="server">
                          <table border="0" cellpadding="0" cellspacing="0" style="width: 268px; height: 144px">
                                <tr>
                                    <td style="width: 100px; height: 13px" valign="top">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Height="30px" OnClick="LinkButton1_Click"
                                            Width="111px">个人会员注册</asp:LinkButton></td>
                                    <td style="width: 100px; height: 13px" valign="top">
                                        <asp:LinkButton ID="LinkButton2" runat="server" Height="28px" OnClick="LinkButton2_Click"
                                            Width="109px">企业会员注册</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>  &nbsp;</asp:Panel>
                            <asp:Panel
                                ID="pelBase" runat="server">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 542px; height: 177px">
                                    <tr>
                                        <td colspan="4" style="height: 29px; text-align: center">
                                            <strong><span style="font-size: 14pt; color: #6600ff">会员注册</span></strong></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40px; text-align: center; height: 29px;">
                                        </td>
                                        <td style="width: 155px; text-align: center; height: 29px;">
                                            用户名：</td>
                                        <td style="width: 15px; text-align: left; height: 29px;">
                                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                                        <td style="width: 100px; height: 29px; text-align: left;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtName"
                                                ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40px; text-align: center">
                                        </td>
                                        <td style="width: 155px; text-align: center">
                                            密 &nbsp; &nbsp; 码：</td>
                                        <td style="width: 15px; text-align: left">
                                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></td>
                                        <td style="width: 100px; text-align: left;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ControlToValidate="txtPass"
                                                ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40px; height: 24px;">
                                        </td>
                                        <td style="width: 155px; height: 24px;">
                                            确认密码：</td>
                                        <td style="width: 15px; text-align: left; height: 24px;">
                                            <asp:TextBox ID="txtQpass" runat="server" TextMode="Password"></asp:TextBox></td>
                                        <td style="width: 100px; text-align: left; height: 24px;">
                                            <asp:CompareValidator ID="CompareValidatorQpass" runat="server" ControlToCompare="txtPass"
                                                ControlToValidate="txtQpass" ErrorMessage="两次密码不一致"></asp:CompareValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40px; height: 18px">
                                        </td>
                                        <td style="width: 155px; height: 18px">
                                            &nbsp;密码提示问题：</td>
                                        <td style="width: 15px; height: 18px; text-align: left">
                                            <asp:TextBox ID="txtPassQuestion" runat="server"></asp:TextBox></td>
                                        <td style="width: 100px; height: 18px; text-align: left;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 40px; height: 2px">
                                        </td>
                                        <td style="width: 155px; height: 2px">
                                            密码提示答案：</td>
                                        <td style="width: 15px; height: 2px; text-align: left">
                                            <asp:TextBox ID="txtPassSolution" runat="server"></asp:TextBox></td>
                                        <td style="width: 100px; height: 2px; text-align: left;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" style="width: 40px; height: 2px">
                                        </td>
                                        <td colspan="3" style="height: 2px">
                                            <asp:Button ID="btnNext" runat="server" Text="下一步" OnClick="btnNext_Click" /></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            
                            <asp:Panel ID="pelQyInfo" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 542px; height: 488px">
                                <tr>
                                    <td colspan="1" style="width: 146px; height: 22px">
                                    </td>
                                    <td colspan="3" style="height: 22px">
                                        <span style="font-size: 14pt; color: #6600ff"><strong>详细信息</strong></span></td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        联系人：</td>
                                    <td style="width: 56px; text-align: left">
                                        <asp:TextBox ID="txtLinkman" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        企业名称：</td>
                                    <td style="width: 56px">
                                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        企业性质：</td>
                                    <td style="width: 56px; text-align: left;">
                                        <asp:DropDownList ID="ddlKind" runat="server" Width="59px">
                                            <asp:ListItem>私企</asp:ListItem>
                                            <asp:ListItem>国企</asp:ListItem>
                                            <asp:ListItem>外资</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        所属行业：</td>
                                    <td style="width: 56px">
                                        <asp:TextBox ID="txtCalling" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px; height: 24px">
                                    </td>
                                    <td style="width: 178px; height: 24px">
                                        营业执照号：</td>
                                    <td style="width: 56px; height: 24px">
                                        <asp:TextBox ID="txtLicenceNumber" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px; height: 24px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        公司地址：</td>
                                    <td style="width: 56px">
                                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        联系电话：</td>
                                    <td style="width: 56px">
                                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px; height: 28px;">
                                    </td>
                                    <td style="width: 178px; height: 28px;">
                                        传真：</td>
                                    <td style="width: 56px; height: 28px;">
                                        <asp:TextBox ID="txtFax" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px; height: 28px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px; height: 47px;">
                                    </td>
                                    <td style="width: 178px; height: 47px;">
                                        E-mail：</td>
                                    <td style="width: 56px; text-align: left; height: 47px;">
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidatorEamil" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="E-mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="134px" Display="Dynamic"></asp:RegularExpressionValidator></td>
                                    <td style="width: 100px; height: 47px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px">
                                    </td>
                                    <td style="width: 178px">
                                        公司网址：</td>
                                    <td style="width: 56px">
                                        <asp:TextBox ID="txtNetworkIP" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 146px; height: 42px">
                                    </td>
                                    <td style="width: 178px; height: 42px">
                                        公司介绍：</td>
                                    <td style="width: 56px; height: 42px">
                                        <asp:TextBox ID="txtContent" runat="server" Height="124px" TextMode="MultiLine" Width="247px"></asp:TextBox></td>
                                    <td style="width: 100px; height: 42px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" style="width: 146px; height: 28px;">
                                    </td>
                                    <td colspan="3" style="height: 28px">
                                        <asp:Button ID="btnQyLogin" runat="server" Text="注　册" Width="55px" OnClick="btnQyLogin_Click" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                            
                            <asp:Panel ID="pelGrInfo" runat="server">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 534px; height: 160px">
                                <tr>
                                    <td colspan="4" style="height: 19px">
                                        <strong><span style="font-size: 14pt; color: #6600ff">详细信息</span></strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 64px; height: 18px">
                                    </td>
                                    <td style="width: 100px; height: 18px">
                                        联系人：</td>
                                    <td style="width: 100px; height: 18px; text-align: left">
                                        <asp:TextBox ID="txtGrLinkman" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px; height: 18px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 64px; height: 19px">
                                    </td>
                                    <td style="width: 100px; height: 19px">
                                        联系电话：</td>
                                    <td style="width: 100px; height: 19px">
                                        <asp:TextBox ID="txtGrPhone" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px; height: 19px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 64px">
                                    </td>
                                    <td style="width: 100px">
                                        所在地：</td>
                                    <td style="width: 100px; text-align: left">
                                        <asp:TextBox ID="txtGrAddress" runat="server"></asp:TextBox></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Button ID="btnGrLogin" runat="server" OnClick="btnGrLogin_Click" Text="注　册" Width="51px" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                            
                            
                            
                        
        </div>
    
    </div>

</asp:Content>

