<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoveQCDPopup.aspx.cs" Inherits="MoveQCDPopup" %>

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

    function TaskConfirmMsg() {
        var result = confirm('Move to QCD / UPLOADED status?');

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

<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlQCD" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>
                            <asp:HiddenField ID="CnfResult" runat="server" />
                            <asp:Label ID="lblHeading" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                        </td>

                    </tr>
                    <tr style="height: 50px">
                        <td>                             
                            <asp:Label ID="Label1" Text="Move to" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <table>


                                <tr>
                                    <%--<td></td>--%>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label2" Text="QC Done" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnQCDone" Text="" GroupName="rbAppointment" Checked="true" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr style="height: 20px">
                                    <%-- <td></td>--%>
                                    <td>
                                        <asp:Label ID="Label3" Text="ReAssigned" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnReassign" Text="" GroupName="rbAppointment" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr style="height: 120px">
                                    <%-- <td></td>--%>
                                    <td>
                                        <asp:Label ID="Label4" Text="Remarks" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRemarks" runat="server" Width="250px" Height="90px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>


                                <tr style="height: 10px">
                                    <%-- <td></td>--%>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnOk" runat="Server" Text="Ok" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnOk_Click" />
                                        <asp:Button ID="btnCancel" runat="Server" Text="Cancel" ToolTip="" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" OnClientClick="refreshParentPage()" />
                                        <%--OnClientClick="javascript:return TaskConfirmMsg()"--%>
                                    </td>
                                </tr>


                            </table>
                        </td>

                    </tr>
                </table>

            </asp:Panel>

            <asp:Panel ID="pnlReady" runat="server" Visible="false">
                <table>
                    <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:Label ID="lblHeading2"  Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                     <tr style="height: 50px">
                        <td>                             
                            <asp:Label ID="Label5" Text="High Priority?" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue" Font-Bold="true"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <table>


                                <tr>
                                    <%--<td></td>--%>
                                    <td style="width: 110px">
                                        <asp:Label ID="Label6" Text="Yes" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnYes" Text="" GroupName="rbHP" Checked="false" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr style="height: 20px">
                                    <%-- <td></td>--%>
                                    <td>
                                        <asp:Label ID="Label7" Text="No" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnNo" Text="" GroupName="rbHP" Checked="true" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr style="height: 120px">
                                    <%-- <td></td>--%>
                                    <td>
                                        <asp:Label ID="Label8" Text="Remarks" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHPRemarks" runat="server" Width="250px" Height="90px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>


                                <tr style="height: 10px">
                                    <%-- <td></td>--%>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnHPOk" runat="Server" Text="Ok" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnHPOk_Click"   />
                                        <asp:Button ID="btnHPCancel" runat="Server" Text="Cancel" ToolTip="" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" OnClientClick="refreshParentPage()" />
                                        <%--OnClientClick="javascript:return TaskConfirmMsg()"--%>
                                    </td>
                                </tr>


                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
