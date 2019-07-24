<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OppDumpPopup.aspx.cs" Inherits="OppDumpPopup" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<style type="text/css">
    .Button {
        background-color: #008dde;
        border: none;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        color: #f4f4f4;
        cursor: pointer;
        font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
        height: 20px;
        text-transform: uppercase;
        width: 100px;
        -webkit-appearance: none;
    }
</style>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
            <asp:Panel ID="Panel1" runat="server" Visible="true">

                <table>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="Server" Text="Opportunity Details :" Font-Bold="true" ForeColor="Black" Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            <asp:Label ID="lblfordate" runat="Server" Text="Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            <telerik:RadDatePicker ID="dtpFromDate" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip="  " AutoPostBack="true" OnSelectedDateChanged="btnShow_Click">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                    CssClass="TextBox" Font-Names="Calibri">
                                </Calendar>
                                <DatePopupButton></DatePopupButton>
                                <DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                    ForeColor="Black" ReadOnly="true">
                                </DateInput>
                            </telerik:RadDatePicker>
                            <%--<asp:Button ID="btnShow" runat="server" CssClass="Button" Font-Bold="false" Text="Show" ForeColor="White" ToolTip="Click to view the details." Width="100px" OnClick="btnShow_Click" />--%>
                           <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <asp:Button ID="btnExportOpp" runat="server" CssClass="Button" Font-Bold="false" Text="Export to Excel" ForeColor="White" ToolTip="Click here to export grid details in excel." Width="180px" OnClick="btnExportOpp_Click" />

                            <br />
                            <br />
                            <telerik:RadGrid ID="rdgOppDet" runat="server" AllowPaging="false" PageSize="10" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="500px"
                                CellSpacing="0" Width="68%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="rdgOppDet_ItemCommand"
                                            OnPageIndexChanged="rdgOppDet_PageIndexChanged" >
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                                </ClientSettings>
                                <GroupingSettings CaseSensitive="false" />
                                <HeaderContextMenu CssClass="table table-bordered table-hover">
                                </HeaderContextMenu>
                                <PagerStyle AlwaysVisible="true" Mode="NextPrevAndNumeric" />
                                <MasterTableView AllowCustomPaging="false" ShowFooter="true">
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
                                        <telerik:GridBoundColumn HeaderText="Opp No." DataField="OppNo" ItemStyle-Width="120px" HeaderStyle-Width="120px" FilterControlWidth="80px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1" Aggregate="Count" FooterText="Row Count : " FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Opp Dt." DataField="OppDt" ItemStyle-Width="100px" HeaderStyle-Width="100px" FilterControlWidth="60px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="true"
                                            ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy}">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Region" DataField="Region" ItemStyle-Width="100px" HeaderStyle-Width="100px" FilterControlWidth="60px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Zone" DataField="Zone" ItemStyle-Width="120px" HeaderStyle-Width="120px" FilterControlWidth="80px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Depot" DataField="Depot" ItemStyle-Width="150px" HeaderStyle-Width="150px" FilterControlWidth="100px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="CRO ID/Name" DataField="CRO" ItemStyle-Width="200px" HeaderStyle-Width="200px" FilterControlWidth="160px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="CRO EmailID" DataField="CROEmailID" ItemStyle-Width="200px" HeaderStyle-Width="200px" FilterControlWidth="160px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="MobileNo" DataField="MobileNo" ItemStyle-Width="110px" HeaderStyle-Width="110px" FilterControlWidth="70px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Preview Dt." DataField="PreviewDate" ItemStyle-Width="100px" HeaderStyle-Width="100px" FilterControlWidth="60px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="true"
                                            ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy}">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Case ID" DataField="CaseID" ItemStyle-Width="100px" HeaderStyle-Width="100px" FilterControlWidth="60px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1"  >
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="IMG1" DataField="IMG_STG" ItemStyle-Width="120px" HeaderStyle-Width="120px" FilterControlWidth="80px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="IMG2" DataField="IMG_Sec" ItemStyle-Width="120px" HeaderStyle-Width="120px" FilterControlWidth="80px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Preview Centre" DataField="PrevCentre" ItemStyle-Width="120px" HeaderStyle-Width="120px" FilterControlWidth="80px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left"  AllowSorting="true"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Preview Centre EmailID" DataField="EmailID" ItemStyle-Width="200px" HeaderStyle-Width="200px" FilterControlWidth="160px" HeaderStyle-Wrap="false"
                                            ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left"   HeaderStyle-HorizontalAlign="Left"  AllowSorting="true"
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
