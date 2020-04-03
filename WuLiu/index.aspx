<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language='javascript'>
    function openPWD(i,width,height)
    {
        window.open(i, "", "dialogHeight: " + height + "px; dialogWidth: " + width + "px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    </script>
    <table bgcolor="#746350" cellpadding="1" cellspacing="1" width="100%">
        <tr>
            <td bgcolor="#ffffff" style="height: 158px; text-align: left;" valign="top">
                <table cellpadding="0" cellspacing="2" height="21" width="475">
                    <tr>
                        <td width="223" style="height: 31px">
                            <img height="31" src="images/huoyuan.GIF" width="205" /></td>
                        <td class="daohangh" width="238" style="height: 31px">
                            <a class="daohangh" href="freightList.aspx">更多..</a></td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="4" height="21" width="567">
                    <tr>
                        <td style="height: 4px; text-align: left;">
                                        <asp:GridView ID="gvFreight" runat="server" Width="585px" AutoGenerateColumns="False" BorderWidth="0px" CssClass="huise1">
                                            <Columns>
                                                <asp:BoundField DataField="Start" HeaderText="出发地" />
                                                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                                                <asp:BoundField DataField="FreightType" HeaderText="货物种类" />
                                                <asp:TemplateField HeaderText="重量">
                                                    <ItemTemplate>
                                                        <%#Eval("ID")%>
                                                        <%#Eval("ID")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                                                    HtmlEncode="False" />
                                                <asp:TemplateField HeaderText="详细信息">
                                                    <ItemTemplate>
                                                        <a href="#" onclick='openPWD("freightInfo.aspx?ID=<%#Eval("ID")%>",500,530)'>详细信息</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" height="10" width="136">
                    <tr>
                        <td height="4">
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="2" height="21" width="475">
                    <tr>
                        <td height="4" width="223">
                            <img height="31" src="images/cheyuan.GIF" width="205" /></td>
                        <td class="chengse" width="238">
                            <a class="daohangh" href="truckList.aspx">更多..</a></td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="4" height="21" width="567">
                    <tr>
                        <td height="4" style="text-align: left">
                                        <asp:GridView ID="gvTruck" runat="server" Width="587px" AutoGenerateColumns="False" BorderWidth="0px" CssClass="huise1">
                                            <Columns>
                                                <asp:BoundField DataField="start" HeaderText="出发地" />
                                                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                                                <asp:BoundField DataField="TruckType" HeaderText="车型" />
                                                <asp:BoundField DataField="TruckLoad" HeaderText="载重" />
                                                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                                                    HtmlEncode="False" />
                                                <asp:TemplateField HeaderText="详细信息">
                                                    <ItemTemplate>
                                                        <a href="#" onclick='openPWD("truckInfo.aspx?ID=<%#Eval("ID")%>",500,530)'>详细信息</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" height="10" width="136">
                    <tr>
                        <td height="4">
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="2" height="21" width="475">
                    <tr>
                        <td height="4" width="223">
                            <img height="31" src="images/zhuanxian.GIF" width="205" /></td>
                        <td class="chengse" width="238">
                            <a class="daohangh" href="specialList.aspx">更多..</a></td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="4" height="21" width="567">
                    <tr>
                        <td height="4">
                                        <asp:GridView ID="gvSpecial" runat="server" Width="591px" Height="104px" AutoGenerateColumns="False" BorderWidth="0px" CssClass="huise1">
                                            <Columns>
                                                <asp:BoundField DataField="start" HeaderText="出发地" />
                                                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                                                <asp:BoundField DataField="TruckType" HeaderText="车型" />
                                                <asp:BoundField DataField="specialPrice" HeaderText="专线报价" />
                                                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                                                    HtmlEncode="False" />
                                                <asp:TemplateField HeaderText="详细信息">
                                                    <ItemTemplate>
                                                        <a href="#" onclick='openPWD("specialInfo.aspx?ID=<%#Eval("ID")%>",500,620)'>详细信息</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" height="10" width="136">
                    <tr>
                        <td height="4">
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="2" height="21" width="475">
                    <tr>
                        <td height="4" width="223">
                            <img height="31" src="images/cangchu.GIF" width="205" /></td>
                        <td class="chengse" width="238">
                            <a class="daohangh" href="depotList.aspx">更多..</a></td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="4" height="21" width="567">
                    <tr>
                        <td height="4" style="text-align: left">
                                        <asp:GridView ID="gvDepot" runat="server" AutoGenerateColumns="False" Width="591px" BorderWidth="0px" CssClass="huise1">
                                            <Columns>
                                            
                                                <asp:BoundField DataField="DepotType" HeaderText="仓库类型" />
                                                <asp:BoundField DataField="DepotCity" HeaderText="所在城市" />
                                                <asp:BoundField DataField="DepotAcreage" HeaderText="仓库面积" />
                                                <asp:BoundField DataField="DepotPrice" HeaderText="每间价格" />
                                                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                                                    HtmlEncode="False" />
                                                <asp:TemplateField HeaderText="详细信息">
                                                    <ItemTemplate>
                                                   
                                                        <a href="#" onclick='openPWD("depotInfo.aspx?ID=<%#Eval("ID")%>",500,600)'>详细信息</a>
                                                       
                                                       </ItemTemplate>
                                                </asp:TemplateField>
                                             
                                            </Columns>
                                        </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

