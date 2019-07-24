<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PLogDetPopup.aspx.cs" Inherits="LogDetPopup" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<script type="text/javascript">

    function refreshParentPage() {
        window.opener.location.href = window.opener.location.href;
        if (window.opener.progressWindow) {
            window.opener.progressWindow.close();

        }
        window.close();
    }
</script>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <div>
           

            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <table>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label5" Text="Case ID" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label8" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCaseID" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label1" Text="Opportunity No." Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblOppNo" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label2" Text="CRO ID/Name" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label10" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCROID" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label21" Text="CRO Email ID." Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label22" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCROEMail" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label6" Text="CRO Mobile No." Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label11" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCROMobile" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <%--<tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label29" Text="Manager Email ID" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label30" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMgrEmail" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label23" Text="Region" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label24" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRegion" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label25" Text="Zone" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label26" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblZone" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label27" Text="Depot" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label28" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDepot" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label4" Text="Preview Type" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label12" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblImgType" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px">
                            <asp:Label ID="Label3" Text="Current Status" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label13" Text=":" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblStatus" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                        </td>
                    </tr>
                </table>

                <asp:Panel ID="Panel3" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:HiddenField ID="CnfResult" runat="server" />
                                <asp:Label ID="lblHeading" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                            </td>

                        </tr>
                        <tr style="height: 50px">
                            <td>
                                <asp:Label ID="Label14" Text="Move to" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="width: 150px">
                                            <asp:Label ID="Label15" Text="BIR" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbtnBIR" Text="" GroupName="rbAppointment" Checked="true" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                    <tr style="height: 20px">

                                        <td>
                                            <asp:Label ID="Label16" Text="Ready - High Priority" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbtnReady" Text="" GroupName="rbAppointment" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                    <tr style="height: 5px">
                                    </tr>
                                    <tr style="height: 10px">
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnOk" runat="Server" Text="Ok" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnOk_Click" />
                                            <asp:Button ID="btnCancel" runat="Server" Text="Cancel" ToolTip="" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" OnClientClick="refreshParentPage()" />

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="Panel4" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:Label ID="Label17" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height: 50px">
                            <td>
                                <asp:Label ID="Label18" Text="Move to" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="width: 150px">
                                            <asp:Label ID="Label19" Text="Ready" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbtnMPriority" Text="" GroupName="rbAppointment2" Checked="true" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                    <tr style="height: 20px">
                                        <td>
                                            <asp:Label ID="Label20" Text="Ready - High Priority" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:RadioButton runat="server" ID="rbtnHPriority" Text="" GroupName="rbAppointment2" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                    <tr style="height: 5px">
                                    </tr>
                                    <tr style="height: 10px">
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnOk2" runat="Server" Text="Ok" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnOk_Click2" />
                                            <asp:Button ID="btnCancel2" runat="Server" Text="Cancel" ToolTip="" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" OnClientClick="refreshParentPage()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>

             <asp:Panel ID="Panel1" runat="server" Visible="false">

                <table>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="Server" Text="Level L :" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            <br />
                            <br />
                            <telerik:RadGrid ID="rdgLevelD" runat="server" AllowPaging="false" PageSize="10" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="false" Height="200px"
                                CellSpacing="0" Width="98%" AllowFilteringByColumn="false" MasterTableView-HierarchyDefaultExpanded="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                                </ClientSettings>
                                <GroupingSettings CaseSensitive="false" />
                                <HeaderContextMenu CssClass="table table-bordered table-hover">
                                </HeaderContextMenu>
                                <PagerStyle AlwaysVisible="true" Mode="NextPrevAndNumeric" />
                                <MasterTableView AllowCustomPaging="false">
                                    <NoRecordsTemplate>
                                        No Records Found.
                                    </NoRecordsTemplate>
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="10px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="10px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn HeaderText="CaseID" DataField="CaseID" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Status" DataField="Status" ItemStyle-Width="120px" HeaderStyle-Width="120px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Status Date" DataField="StatusDt" ItemStyle-Width="120px" HeaderStyle-Width="120px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="By" DataField="AssignedTo" ItemStyle-Width="120px" HeaderStyle-Width="120px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <PagerStyle AlwaysVisible="True"></PagerStyle>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <FilterMenu Skin="WebBlue" EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </FilterMenu>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
