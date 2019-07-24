<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="PreviewLevelSAdmin.aspx.cs" Inherits="PreviewLevelSAdmin" %>

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

        function TaskConfirmMsg2() {
            var result = confirm('Move to BIR status?');

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

    <style type="text/css">
        .RadGrid .rgSelectedRow {
            background-color: yellow !important;
        }
    </style>

    <script type="text/javascript">
        function onClicking(sender, eventArgs) {
            var item = eventArgs.get_item();
            var navigateUrl = item.get_navigateUrl();
            //alert(navigateUrl);
            if (navigateUrl == "#") {
                NavigateNewComplaints();
            }
            //if (navigateUrl && navigateUrl != "#") {
            //    var proceed = confirm("Click yes to proceed to" + navigateUrl);
            //}
            //if (!proceed) {
            //    eventArgs.set_cancel(true);
            //}
            //else {
            //    eventArgs.set_cancel(false);
            //}
        }
        function NavigateNewComplaints() {
            var iMyWidth;
            var iMyHeight;
            iMyWidth = (window.screen.width / 2) - (500 + 10);
            iMyHeight = (window.screen.height / 2) - (300 + 25);
            //alert('test');
            var Y = 'AddNewComplaints.aspx';
            var win = window.open(Y, "Window2", "status=no,height=620,width=1000,left=" + iMyWidth + ",top=" + iMyHeight + ",screenX=" + iMyWidth + ",screenY=" + iMyHeight + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,closed=no");
            win.focus();
        }
        function ConfirmClick() {

        }
    </script>

    <asp:Panel runat="server">
        <asp:UpdatePanel ID="upQuestion" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div style="width: 100%; border-style: none; background-color: #ffffd9">



                    <table style="width: 100%; border-style: none; background-color: #ffffd9">

                        <tr>
                            <td style="width: 95%;">

                                <table>
                                    <tr>
                                        <td style="width: 20px">
                                            <asp:HiddenField ID="CnfResult" runat="server" />
                                        </td>

                                        <asp:Panel ID="Panel1" runat="server" Visible="true">

                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 45%">
                                                            <asp:Label ID="Label7" runat="Server" Text="Level S - SUBMITTED" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                                        </td>

                                                        <td style="width: 55%;">                                                            
                                                            <asp:Button runat="server" ID="btnFailedMail" CssClass="Button" Text="Failed EMail(s)" ToolTip="Click to view the email(s) that have failed" OnClick="btnFailedMail_Click" Width="160px" />
                                                            <asp:Button runat="server" ID="btnOppDump" CssClass="Button" Text="Opp. Details" ToolTip="Click to view the opportunity details." OnClick="btnOppDump_Click" Width="110px" />
                                                            <asp:Button runat="server" ID="btnCROMapping" CssClass="Button" Text="CRO Search" ToolTip="Click to view the CRO Search screen" OnClick="btnCROMapping_Click" Width="120px" Visible="false"/>
                                                            <asp:Button runat="server" ID="btnQCD" CssClass="Button" Text="Quality Control" ToolTip="Click to view the Level S - Quality Control screen" OnClick="btnQCD_Click" Width="160px" Visible="false"/>
                                                            <asp:Button runat="server" ID="btnLevelD" CssClass="Button" Text="Level D" OnClick="btnLevelD_Click" ToolTip="Click to view the Level-D screen" />
                                                            <asp:Button runat="server" ID="btnPrevUpload" CssClass="Button" Text="Preview Upload" OnClick="btnPrevUpload_Click" Width="150px" ToolTip="Click to view the Preview Upload screen" />
                                                            <asp:Button runat="server" ID="btnReports" CssClass="Button" Text="Reports" OnClick="btnReports_Click" Width="80px" ToolTip="Click to view the Report screen" />
                                                        </td>

                                                        <asp:HiddenField ID="hdnQC" runat="server" />

                                                        <%--<td>
                                                            <telerik:RadMenu Font-Names="verdana" Width="110px" OnClientItemClicking="onClicking" ForeColor="Blue" ID="rmenuQuick" runat="server" ShowToggleHandle="false" Skin="Outlook" EnableRoundedCorners="true" EnableShadows="true" ClickToOpen="false" ExpandAnimation-Type="OutBounce" Flow="Horizontal" DefaultGroupSettings-Flow="Horizontal">
                                                                <Items>
                                                                    <telerik:RadMenuItem Font-Names="Verdana" PostBack="false" Text="Quick Links" ExpandMode="ClientSide" ToolTip="Click here to view quick links" Width="110px">
                                                                        <Items>
                                                                            
                                                                            <telerik:RadMenuItem Width="85px" Font-Bold="false" ForeColor="Black" BackColor="Transparent" Text="CRO Search" NavigateUrl="http://49.50.68.207/CROSearch" ToolTip="Click to view the CRO Search screen."></telerik:RadMenuItem>
                                                                            <telerik:RadMenuItem Width="105px" Font-Bold="false" ForeColor="Black" BackColor="Transparent" Text="Quality Control" NavigateUrl="PreviewLevelSQC.aspx?@UserID=" + Session["UserId"].ToString(); ToolTip="Click to view the Level S - Quality Control screen."></telerik:RadMenuItem>
                                                                            <telerik:RadMenuItem Width="60px" Font-Bold="false" ForeColor="Black" BackColor="Transparent" Text="Level D" NavigateUrl="BusinessDashboard.aspx" ToolTip="Click to view the Level-D screen."></telerik:RadMenuItem>
                                                                            <telerik:RadMenuItem Width="105px" Font-Bold="false" ForeColor="Black" BackColor="Transparent" Text="Preview Upload" NavigateUrl="SMReports.aspx" ToolTip="Click to view the Preview Upload screen."></telerik:RadMenuItem>
                                                                            <telerik:RadMenuItem Width="75px" Font-Bold="false" ForeColor="Black" BackColor="Transparent" Text="Reports" NavigateUrl="Admin.aspx" ToolTip="Click to view the Report screen."></telerik:RadMenuItem>
                                                                            
                                                                        </Items>
                                                                    </telerik:RadMenuItem>
                                                                </Items>
                                                            </telerik:RadMenu>
                                                        </td>--%>

                                                    </tr>
                                                    <tr>
                                                        <td style="width: 30%"></td>
                                                        <td style="width: 70%;">
                                                            <asp:Label ID="lblLatest" runat="Server" Font-Bold="true" ForeColor="Maroon" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <br />



                                                <telerik:RadGrid ID="rdgPreviewDet" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="250px"
                                                    CellSpacing="0" Width="98%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="grdAccountStatement_ItemCommand"
                                                    OnPageIndexChanged="grdAccountStatement_PageIndexChanged" OnItemDataBound="grdTest_ItemDataBound" SelectedItemStyle-CssClass="rgSelectedRow">
                                                    <%--OnItemDataBound="grdAccountStatement_ItemDataBound"--%>
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


                                                            <%--<telerik:GridTemplateColumn DataField="CaseID" HeaderText="Ref#" UniqueName="CaseID"
                                                                        Visible="true" FilterControlWidth="50px" SortExpression="TaskID" AllowFiltering="true" HeaderTooltip="Unique no. for the requirement/activity/task/. Click on the Ref#  of an activity in progress to update the progress of work.">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkbtnCaseID" ToolTip="" runat="server" Text='<%# Eval("CaseID") %>' CommandName="CaseID" CommandArgument='<%# Eval("CaseID") %>'></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </telerik:GridTemplateColumn>--%>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="90px" HeaderStyle-Width="90px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                HeaderText="CaseID" HeaderStyle-Font-Names="Calibri" UniqueName="CaseID" DataField="CaseID">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnCaseID" runat="server" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("CaseID")%>' CommandName="CaseID" CommandArgument='<%# Eval("CaseID") %>' Font-Underline="false"
                                                                        ForeColor="#00008B" OnClick="Lnkbtnview_Click" ToolTip="Click here to view the details">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>

                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                                                HeaderText="Status" HeaderStyle-Font-Names="Calibri" UniqueName="Status" DataField="Status">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnStatus" runat="server" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("Status")%>' Font-Underline="false" CommandName="Status" CommandArgument='<%# Eval("Status") %>'
                                                                        ForeColor="#00008B" OnClick="LnkbtnCaseID_Click" ToolTip="Click here to change the status">
                                                                         <%--OnClientClick="javascript:return TaskConfirmMsg()"--%>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>

                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridBoundColumn HeaderText="Type" DataField="ImgType" ItemStyle-Width="80px" HeaderStyle-Width="80px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Status Date" DataField="StatusDt" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1" DataFormatString="{0:dd MMM yyyy hh:mm tt}">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="UserID" DataField="UserID" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
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
                                                            <telerik:GridBoundColumn HeaderText="Region" DataField="Region" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" ItemStyle-Width="110px" HeaderStyle-Width="110px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="70px" HeaderStyle-Width="70px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                HeaderText="BIR / Cancel " HeaderStyle-Font-Names=" " UniqueName="" SortExpression="Customer" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnBIR" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small" Enabled="true"
                                                                        Text='Mark BIR/Cancel' Font-Underline="false"
                                                                        ForeColor="Blue" OnClick="lnkbtnBIR_Click" ToolTip="Click to mark an image as BIR (Better Image Required / Blank Image Received) or Cancel">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>

                                                            <%--<telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="5px"
                                                                    HeaderText="" HeaderStyle-Font-Names="Calibri" AllowFiltering="false" UniqueName="Editresident" SortExpression="View">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkbtnBIR" runat="server" ToolTip="Click here to Edit appointment details" Text="Edit" Font-Bold="false" Font-Size="Small" ForeColor="Blue" OnClick="lnkbtnBIR_Click">Edit</asp:LinkButton>
                                                                    </ItemTemplate>
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
                                                <asp:Label ID="Label5" runat="Server" Text="Statistics  :" Font-Bold="true" ForeColor="Black" Font-Underline="false" Font-Names="Verdana" Font-Size="Small"></asp:Label>

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
                                                </telerik:RadGrid><br />
                                                <asp:Label ID="Label1" runat="Server" Text="Total number of case id's (Current month) = Open + Upl.Current Month + BIR-Current Month + Cancelled-Current Month" Font-Bold="false" ForeColor="Black" Font-Underline="false" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
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


                            </td>

                        </tr>
                    </table>
                </div>

            </ContentTemplate>
            <Triggers>
                <%-- <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="btnUpdate" />
                <asp:PostBackTrigger ControlID="btnClear" />
                <asp:PostBackTrigger ControlID="btnReturn" />
                <asp:PostBackTrigger ControlID="btnSchedule" />
                <asp:PostBackTrigger ControlID="rbtnToday" />
                <asp:PostBackTrigger ControlID="btnAddDate" />
                <asp:PostBackTrigger ControlID="rbtnLater" />
                <asp:PostBackTrigger ControlID="ddlDoctor" />
                <asp:PostBackTrigger ControlID="lnkQuickReg" />
                <asp:PostBackTrigger ControlID="BtnSearch" />--%>
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>

