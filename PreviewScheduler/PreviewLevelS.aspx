<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="PreviewLevelS.aspx.cs" Inherits="PreviewLevelS" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:Label runat="server" ID="lblGH" Text="LevelS"></asp:Label>--%>

    <script language="javascript" type="text/javascript">

        function TaskConfirmMsg() {

            var SStr = 'Move to ASSIGNED status?';
            var result = confirm(SStr);

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
            var result = confirm('Move to DONE status?');

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
        <asp:UpdatePanel ID="upQuestion" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div style="width: 100%; border-style: none; background-color: #ffffd9">

                    <table style="width: 100%; border-style: none; background-color: #ffffd9">
                        <tr>
                            <td>
                                <asp:HiddenField ID="CnfResult" runat="server" />
                            </td>
                            <td>
                                <%--<asp:Button runat="server" BackColor="DarkGreen" CssClass="btn" Font-Names=" Verdana" Font-Size="Small" ForeColor="White" ID="btnLevelD" Text="Level D" OnClick="btnLevelD_Click" />--%>
                            </td>

                        </tr>

                        <tr>
                            <td style="width: 95%;">

                                <table>
                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        <tr>
                                            <td style="width: 20px"></td>
                                            <td>
                                                <asp:Label ID="Label7" runat="Server" Text="Level S - READY" Font-Bold="true" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>

                                                <br />
                                                <telerik:RadGrid ID="rdgPreviewDet" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="100px"
                                                    CellSpacing="0" Width="98%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true">
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

                                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                HeaderText="CaseID" HeaderStyle-Font-Names="Calibri" UniqueName="CaseID" SortExpression="Customer" AllowFiltering="true">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnCaseID" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("CaseID")%>' CommandArgument='<%# Eval("RSN") %>' Font-Underline="false"
                                                                        ForeColor="#00008B" OnClick="Lnkbtnview_Click" ToolTip="Click here to view the case id details">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridTemplateColumn>

                                                            <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                                                HeaderText="Status" HeaderStyle-Font-Names="Calibri" UniqueName="Status" SortExpression="Status" AllowFiltering="true">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnStatus" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                        Text='<%# Eval("Status")%>' Font-Underline="false"
                                                                        ForeColor="#00008B" OnClick="LnkbtnCaseID_Click" CommandName='<%# Eval("ImageLink") %>' OnClientClick="javascript:return TaskConfirmMsg()" ToolTip="Click here to assign this image">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
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
                                                            <telerik:GridBoundColumn HeaderText="Region" DataField="Region" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                                ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                ItemStyle-CssClass="Row1">
                                                                <HeaderStyle Wrap="False"></HeaderStyle>
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                            </telerik:GridBoundColumn>

                                                             <telerik:GridBoundColumn HeaderText="ImageLink" DataField="ImageLink" ItemStyle-Width="100px" HeaderStyle-Width="100px" HeaderStyle-Wrap="false"
                                                                    ItemStyle-Wrap="false" AllowFiltering="true" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                    ItemStyle-CssClass="Row1" Display="false">
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
                                        <tr>
                                            <td style="width: 20px"></td>
                                            <td>
                                                <asp:Button ID="btnRefresh" runat="Server" BackColor="DarkGreen" CssClass="btn" Font-Names=" Verdana" Font-Size="Small" ForeColor="White" OnClick="btnRefresh_Click" Text="Refresh" ToolTip=" " Width="60px" />
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel2" runat="server" Visible="true">
                                        <tr>
                                            <td>
                                                <td>
                                                    <asp:Label ID="Label17" runat="Server" Text="Level S - ASSIGNED & DONE" ForeColor=" Black " Font-Bold="true" Font-Names="Verdana" Font-Size="Small"></asp:Label>

                                                    <br />
                                                    <br />

                                                    <telerik:RadGrid ID="rdgPreviewDet2" runat="server" AllowPaging="false" PageSize="20" AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="true" Height="350px"
                                                        CellSpacing="0" Width="98%" AllowFilteringByColumn="true" MasterTableView-HierarchyDefaultExpanded="true" OnItemCommand="grdAccountStatement_ItemCommand2"
                                                        OnPageIndexChanged="grdAccountStatement_PageIndexChanged2" OnItemDataBound="grdTest_ItemDataBound2">
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

                                                                <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                                    HeaderText="CaseID" HeaderStyle-Font-Names="Calibri" UniqueName="CaseID" SortExpression="Customer" AllowFiltering="true">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkbtnCaseID" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                            Text='<%# Eval("CaseID")%>' Font-Underline="false"
                                                                            ForeColor="#00008B" OnClick="Lnkbtnview_Click" ToolTip="Click here to view the case id details">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn ItemStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left"
                                                                    HeaderText="Status" HeaderStyle-Font-Names="Calibri" UniqueName="Status" SortExpression="Status" AllowFiltering="true">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkbtnStatus" runat="server" CausesValidation="false" Font-Names="Calibri" Font-Size="Small"
                                                                            Text='<%# Eval("Status")%>' Font-Underline="false"
                                                                            ForeColor="#00008B" OnClick="LnkbtnCaseID_Click2" OnClientClick="javascript:return TaskConfirmMsg2()" ToolTip="Click here once you have completed the sectioning">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                                    <ItemStyle Wrap="False"></ItemStyle>
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
                                                                <telerik:GridBoundColumn HeaderText="Region" DataField="Region" ItemStyle-Width="80px" HeaderStyle-Width="40px" HeaderStyle-Wrap="false"
                                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
                                                                    ItemStyle-CssClass="Row1">
                                                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" ItemStyle-Width="150px" HeaderStyle-Width="150px" HeaderStyle-Wrap="false"
                                                                    ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Left" AllowSorting="true"
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
                <asp:PostBackTrigger ControlID="rdgPreviewDet" />
                <asp:PostBackTrigger ControlID="btnRefresh" />
                <%-- <asp:PostBackTrigger ControlID="btnClear" />
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

