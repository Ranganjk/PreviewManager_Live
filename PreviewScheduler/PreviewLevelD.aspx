<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="PreviewLevelD.aspx.cs" Inherits="PreviewLevelD" %>

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

    <script language="javascript" type="text/javascript">

        function TaskConfirmMsg() {
            var result = confirm('Move to READY status?');

            if (result) {

                document.getElementById('<%=CnfResult.ClientID%>').value = "true";
                return true;
            }
            else {
                document.getElementById('<%=CnfResult.ClientID%>').value = "false";
                return false;
            }
        }
    </script>

    <asp:Panel runat="server">
        <%--<asp:UpdatePanel ID="upQuestion" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>

                <div style="width: 100%; border-style: none; background-color: #ffffd9">



                    <table style="width: 100%; border-style: none; background-color: #ffffd9">

                        <tr>
                            <td style="width: 20px"></td>
                            <td style="left: auto">
                                <asp:Label ID="Label1" runat="Server" Text="Level D - View All" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            </td>

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
                                <asp:Button ID="btnLevels" runat="server" CssClass="Button" Text="Level S" OnClick="btnLevels_Click" ToolTip="Click to view the Level-S screen" />
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
                                        <td style="width: 20px">
                                            <asp:HiddenField ID="CnfResult" runat="server" />
                                        </td>

                                        <asp:Panel ID="Panel2" runat="server" Visible="true">

                                            <td>
                                                <telerik:RadGrid ID="rdgLevelD" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="350px"
                                                    CellSpacing="0" Width="98%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="rdgLevelD_ItemCommand"
                                                    OnPageIndexChanged="rdgLevelD_PageIndexChanged" OnItemDataBound="rdgLevelD_ItemDataBound">

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

                                                            <telerik:GridBoundColumn HeaderText="" DataField="RSN" HeaderStyle-Wrap="true"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" ItemStyle-HorizontalAlign="Left" AllowSorting="false" ItemStyle-ForeColor="Gray" ItemStyle-Width="10px"
                                                                ItemStyle-CssClass="Row1" Display="false">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="" DataField="CaseID" HeaderStyle-Wrap="true"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" ItemStyle-HorizontalAlign="Left" AllowSorting="false" ItemStyle-ForeColor="Gray" ItemStyle-Width="10px"
                                                                ItemStyle-CssClass="Row1" Display="false">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                             <telerik:GridBoundColumn HeaderText="" DataField="StatusCode" HeaderStyle-Wrap="true"
                                                                    ItemStyle-Wrap="false" AllowFiltering="false" ItemStyle-HorizontalAlign="Left" AllowSorting="false" ItemStyle-ForeColor="Gray" ItemStyle-Width="10px"
                                                                    ItemStyle-CssClass="Row1" Display="false">
                                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="" DataField="CalHrs" HeaderStyle-Wrap="true"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" ItemStyle-HorizontalAlign="Left" AllowSorting="false" ItemStyle-ForeColor="Gray" ItemStyle-Width="10px"
                                                                ItemStyle-CssClass="Row1" Display="false">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                                                HeaderText="CaseID" HeaderStyle-Font-Names="Calibri" UniqueName="CaseID" SortExpression="Customer" AllowFiltering="true" DataField="CaseID">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnCaseID" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("CaseID")%>' CommandName="CaseID" CommandArgument='<%# Eval("CaseID") %>' Font-Underline="false"
                                                                        ForeColor="#00008B" OnClick="LnkbtnCaseID_Click" ToolTip="Click here to view the case id details">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="120px" HeaderStyle-Width="120px" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                                                HeaderText="Status" HeaderStyle-Font-Names="Calibri" UniqueName="Status" SortExpression="Status" AllowFiltering="true" DataField="Status">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnStatus" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("Status")%>' CommandName="Status" CommandArgument='<%# Eval("Status") %>' Font-Underline="false"
                                                                        ForeColor="#00008B" OnClick="LnkbtnStatus_Click" ToolTip="Click here to view the status log details">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>

                                                            <%--<telerik:GridBoundColumn HeaderText="Status" DataField="Status" ItemStyle-Width="120px" HeaderStyle-Width="120px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>--%>
                                                            <telerik:GridBoundColumn HeaderText="Status Date" DataField="StatusDt" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy hh:mm tt}">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Type" DataField="ImgType" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="User" DataField="UserID" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="CRO" DataField="CRO" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Region" DataField="Region" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" Aggregate="Count" FooterText="Row Count : " FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                             <telerik:GridTemplateColumn ItemStyle-Width="70px" HeaderStyle-Width="70px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                HeaderText=" " HeaderStyle-Font-Names=" " UniqueName="" SortExpression="Customer" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnBIR" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small" Enabled="true"
                                                                        Text='Mark BIR/Cancel' Font-Underline="false"
                                                                        ForeColor="Blue" OnClick="lnkbtnBIR_Click" ToolTip="Click to mark an image as BIR (Better Image Required / Blank Image Received) or Cancel">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>

                                                            <%-- <telerik:GridTemplateColumn ItemStyle-Width="35px" HeaderStyle-Width="35px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                HeaderText=" " HeaderStyle-Font-Names=" " UniqueName="" SortExpression="Customer" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnBIR" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='BIR' Font-Underline="false"
                                                                        ForeColor="Blue" ToolTip="">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>--%>
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

                                        </asp:Panel>




                                    </tr>

                                </table>
                            </td>

                        </tr>
                    </table>


                    <table>

                        <asp:Panel ID="pnlShow" runat="server" Visible="true">
                            <tr>
                                <td style="width: 20px"></td>
                                <td>
                                    <asp:Button ID="btnStatShow" runat="server" CssClass="Button" Font-Bold="false" ToolTip="Click to view the Statistics and Turnaround Time (TAT) details." AutoPostBack="true" Text="Show 'Statistics' & 'TAT' Report" ForeColor="White" Width="270px" OnClick="btnStatShow_Click"></asp:Button>
                                </td>
                            </tr>
                        </asp:Panel>



                        <asp:Panel ID="pnlStatTat" runat="server" Visible="false">
                            <tr>
                                <td style="width: 20px"></td>
                                <td style="left: auto">
                                    <asp:Label ID="Label5" runat="Server" Text="Statistics" Font-Bold="true" ForeColor="Black" Font-Underline="false" Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                </td>
                                <td></td>
                                <td style="left: auto">
                                    <asp:Label ID="Label2" runat="Server" Text="Turnaround Time (TAT)" Font-Bold="true" ForeColor="Black" Font-Underline="false" Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                    <asp:Button ID="btnExportTat" runat="server" CssClass="Button" Font-Bold="false" Text="Export to Excel" ForeColor="White" ToolTip="Click here to export grid details in excel." Width="180px" OnClick="btnExportTat_Click" />
                                </td>

                            </tr>

                            <tr style="vertical-align: top;">
                                <td style="width: 20px"></td>
                                <td>
                                    <telerik:RadGrid ID="rdgCount" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="false" Skin="WebBlue" AllowSorting="false"
                                        CellSpacing="0" Width="70%" AllowFilteringByColumn="false" MasterTableView-HierarchyDefaultExpanded="true">

                                        <ClientSettings>
                                            <Scrolling AllowScroll="false" UseStaticHeaders="true" />
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
                                                <telerik:GridBoundColumn HeaderText="" DataField="Heading" ItemStyle-Width="100px" HeaderStyle-Width="200px" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="true"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn HeaderText="Open" DataField="Open1" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's yet to be uploaded">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="Upl.Today" DataField="Today1" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="Uploaded today">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="Upl.Yesterday" DataField="YstDay1" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="Uploaded yesterday">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="Upl.CurMonth" DataField="CMnth1" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's uploaded for this month">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="Upl.Last Month" DataField="LMnth1" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's uploaded for the previous month">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn HeaderText="BIR-CurMonth" DataField="BIR1" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's returned as BIR (Better Image Required) in this month">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn HeaderText="Cancelled-CurMonth" DataField="CAN1" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's rejected in this month">
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
                                <td style="width: 20px"></td>
                                <td>
                                    <telerik:RadGrid ID="rdgTAT" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="false" Skin="WebBlue" AllowSorting="false"
                                        CellSpacing="0" Width="70%" AllowFilteringByColumn="false" MasterTableView-HierarchyDefaultExpanded="true">

                                        <ClientSettings>
                                            <Scrolling AllowScroll="false" UseStaticHeaders="true" />
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
                                                <telerik:GridBoundColumn HeaderText="" DataField="SRDet" ItemStyle-Width="100px" HeaderStyle-Width="200px" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="true"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn HeaderText="<= 30 Min." DataField="SR30Tot" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's yet to be uploaded">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="<= 3 Hrs." DataField="SR3Tot" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="Uploaded today">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="<= 8 Hrs." DataField="SR8Tot" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="Uploaded yesterday">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="> 8 Hrs." DataField="SR9Tot" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's uploaded for this month">
                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn HeaderText="Total" DataField="Total" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" AllowSorting="false"
                                                    ItemStyle-CssClass="Row1" HeaderTooltip="No. of case id's uploaded for this month">
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
                        </asp:Panel>





                    </table>

                </div>

            <%--</ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BtnShow" />
                <asp:PostBackTrigger ControlID="BtnnExcelExport" />
                <asp:PostBackTrigger ControlID="btnLevels" />
                <asp:PostBackTrigger ControlID="btnStatShow" />
                <asp:PostBackTrigger ControlID="btnExportTat" />
            </Triggers>
        </asp:UpdatePanel>--%>
    </asp:Panel>

</asp:Content>
