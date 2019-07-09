<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="CSS/Master.css" rel="stylesheet" />

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

    <asp:Panel ID="Panel1" runat="server" Visible="true">

        <table style="width: 100%">
            <tr>

                <td>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 60%"></td>



                            <td style="width: 40%;">
                                <asp:Button runat="server" ID="btnReport1" CssClass="Button" Text="Sectioning Count" Width="150px" ToolTip="Click to view the individual sectioning count report (Date wise)." OnClick="btnReport1_Click" />
                                <asp:Button runat="server" ID="btnReport2" CssClass="Button" Text="TAT Report" Width="150px" ToolTip="Click to view the Turnaround Time report (CaseID wise)." OnClick="btnReport2_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Button runat="server" ID="btnLevelS" CssClass="Button" Text="Level S" Width="80px" ToolTip="Click to view the Level-S screen." OnClick="btnLevelS_Click" />
                            </td>

                        </tr>
                    </table>
                </td>
            </tr>
        </table>


        <asp:Panel ID="pnlReport1" runat="server" Visible="false">
            <table>
                <tr style="height: 20px"></tr>
                <tr>
                    <td>

                        <table style="width: 100%; border-style: none; background-color: #ffffd9">

                            <tr>
                                <td style="width: 20px"></td>
                                <td style="left: auto">
                                    <asp:Label ID="Label1" runat="Server" Text="Sectioning Count" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                </td>
                                <td style="width: 30px"></td>
                                <td style="right: auto">
                                    <asp:Label ID="lblfordate" runat="Server" Text="From Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                    <telerik:RadDatePicker ID="dtpFromDate" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                        Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip="  " AutoPostBack="true">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                            CssClass="TextBox" Font-Names="Calibri">
                                        </Calendar>
                                        <DatePopupButton></DatePopupButton>
                                        <DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                            ForeColor="Black" ReadOnly="true">
                                        </DateInput>
                                    </telerik:RadDatePicker>

                                    <asp:Label ID="lbluntildate" runat="Server" Text="To Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>

                                    <telerik:RadDatePicker ID="dtpTillDate" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                        Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip=" " AutoPostBack="true">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                            CssClass="TextBox" Font-Names="Calibri">
                                        </Calendar>
                                        <DatePopupButton></DatePopupButton>
                                        <DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                            ForeColor="Black" ReadOnly="true">
                                        </DateInput>
                                    </telerik:RadDatePicker>

                                    <asp:Button ID="BtnShow" runat="server" CssClass="Button" Font-Bold="false" ToolTip="Click to view the details" AutoPostBack="true" Text="Show" ForeColor="White" OnClick="BtnShow_Click"></asp:Button>
                                    <asp:Button ID="BtnnExcelExport" runat="server" CssClass="Button" Font-Bold="false" Text="Export to Excel" ForeColor="White" ToolTip="Click here to export grid details in excel." Width="180px" OnClick="BtnnExcelExport_Click" />

                                    <%--<asp:Label ID="lblCount" runat="server" CssClass="style2" Font-Bold="true" align="center" Font-Names="Verdana" ForeColor="DarkGreen" Font-Size="Small" Text=""></asp:Label>--%>
                                </td>
                            </tr>

                            <tr style="height: 5px;"></tr>

                        </table>


                        <table style="width: 100%; border-style: none; background-color: #ffffd9">



                            <tr>
                                <td style="width: 95%;">

                                    <table>
                                        <tr>
                                            <td style="width: 20px"></td>



                                            <td>
                                                <telerik:RadGrid ID="rdgReport1" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="350px"
                                                    CellSpacing="0" Width="50%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="rdgReport1_ItemCommand"
                                                    OnPageIndexChanged="rdgReport1_PageIndexChanged" >

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

                                                            <telerik:GridBoundColumn HeaderText="Date" DataField="Date" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy}">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Name" DataField="Name" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" Aggregate="Count" FooterText="Row Count : " FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Count" DataField="Count" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" Aggregate="Sum" FooterText="Total Images : " FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>


                                                           <%-- <telerik:GridBoundColumn DataField="Count" DataType="System.Int64"
                                                                HeaderText="Count2" SortExpression="Count" UniqueName="Count"   Aggregate="Sum" FooterText="Total Due : " ReadOnly="True">
                                                                <FooterStyle HorizontalAlign="Center" Font-Bold="True" CssClass="SoldFooter"></FooterStyle>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>--%>

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
                                        <%--<tr>
                                            <td style="width: 20px"></td>
                                            <td>
                                                <asp:Label ID="lblTotal" runat="server" CssClass="style2" Font-Bold="true" align="center" Font-Names="Verdana" ForeColor="DarkGreen" Font-Size="Small"></asp:Label>
                                            </td>
                                        </tr>--%>

                                    </table>
                                </td>

                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

        </asp:Panel>


        <asp:Panel ID="pnlReport2" runat="server" Visible="false">
            <table>
                <tr style="height: 20px"></tr>
                <tr>
                    <td>

                        <table style="width: 100%; border-style: none; background-color: #ffffd9">

                            <tr>
                                <td style="width: 20px"></td>
                                <td style="left: auto">
                                    <asp:Label ID="Label2" runat="Server" Text="TAT Report" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                </td>
                                <td style="width: 30px"></td>
                                <td style="right: auto">
                                    <asp:Label ID="Label3" runat="Server" Text="From Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                    <telerik:RadDatePicker ID="dtpFromDate2" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                        Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip="  " AutoPostBack="true">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                            CssClass="TextBox" Font-Names="Calibri">
                                        </Calendar>
                                        <DatePopupButton></DatePopupButton>
                                        <DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                            ForeColor="Black" ReadOnly="true">
                                        </DateInput>
                                    </telerik:RadDatePicker>

                                    <asp:Label ID="Label4" runat="Server" Text="To Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>

                                    <telerik:RadDatePicker ID="dtpTillDate2" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                        Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip=" " AutoPostBack="true">
                                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                            CssClass="TextBox" Font-Names="Calibri">
                                        </Calendar>
                                        <DatePopupButton></DatePopupButton>
                                        <DateInput DisplayDateFormat="dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                            ForeColor="Black" ReadOnly="true">
                                        </DateInput>
                                    </telerik:RadDatePicker>





                                    <asp:Button ID="BtnShow2" runat="server" CssClass="Button" Font-Bold="false" ToolTip="Click to view the details" AutoPostBack="true" Text="Show" ForeColor="White" OnClick="BtnShow2_Click"></asp:Button>
                                    <asp:Button ID="BtnnExcelExport2" runat="server" CssClass="Button" Font-Bold="false" Text="Export to Excel" ForeColor="White" ToolTip="Click here to export grid details in excel." Width="180px" OnClick="BtnnExcelExport2_Click" />

                                    <%--<asp:Label ID="lblCount2" runat="server" CssClass="style2" Font-Bold="true" align="center" Font-Names="Verdana" ForeColor="DarkGreen" Font-Size="Small" Text=""></asp:Label>--%>
                                </td>
                            </tr>

                            <tr style="height: 5px;"></tr>

                        </table>


                        <table style="width: 100%; border-style: none; background-color: #ffffd9">

                            <tr>
                                <td style="width: 95%;">

                                    <table>
                                        <tr>
                                            <td style="width: 20px"></td>



                                            <td>
                                                <telerik:RadGrid ID="rdgReport2" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="350px"
                                                    CellSpacing="0" Width="98%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="rdgReport2_ItemCommand"
                                                    OnPageIndexChanged="rdgReport2_PageIndexChanged">

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

                                                            <telerik:GridBoundColumn HeaderText="CaseID" DataField="CaseID" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Name" DataField="Name" ItemStyle-Width="110px" HeaderStyle-Width="110px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                             <telerik:GridBoundColumn HeaderText="Status" DataField="CStatus" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" >
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>



                                                            <telerik:GridBoundColumn HeaderText="Submitted On" DataField="SubDate" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy hh:mm tt}">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Updated On" DataField="UplDate" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy hh:mm tt}">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                           

                                                            <telerik:GridBoundColumn HeaderText="S To R" DataField="SToR" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" HeaderTooltip="Submitted to Ready status in minutes">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="R To A" DataField="RToA" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" HeaderTooltip=" Ready to Assigned status in minutes">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="A To D" DataField="AToD" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" HeaderTooltip=" Assigned to Done status in minutes">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="D To Q" DataField="DToQ" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" HeaderTooltip="Done to QCD status in minutes">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Q To U" DataField="QToU" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" HeaderTooltip="QCD to Uploaded status in minutes" Aggregate="Count" FooterText="Row Count : " FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
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
                                        <%--<tr>
                                            <td style="width: 20px"></td>
                                            <td>
                                                <asp:Label ID="lblTotal2" runat="server" CssClass="style2" Font-Bold="true" align="center" Font-Names="Verdana" ForeColor="DarkGreen" Font-Size="Small"></asp:Label>
                                            </td>
                                        </tr>--%>

                                    </table>
                                </td>

                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
