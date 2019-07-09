<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoveBIRCancelPopup.aspx.cs" Inherits="MoveBIRCancelPopup" %>

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
        var result = confirm('Move to BIR / Cancel  status?');

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
                                    
                                    <td style="width: 100px">
                                        <asp:Label ID="Label9" Text="None" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnNone" Text="" GroupName="rbBIR" Checked="true" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>

                                <tr style="height: 20px">
                                   
                                    <td style="width: 100px">
                                        <asp:Label ID="Label2" Text="BIR" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnBIR" Text="" GroupName="rbBIR"   Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>

                                <tr style="height: 20px">
                                    
                                    <td>
                                        <asp:Label ID="Label3" Text=" Cancel/Reject" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton runat="server" ID="rbtnCancel" Text="" GroupName="rbBIR" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <tr style="height: 130px">
                                      
                                    <td>
                                        <asp:Label ID="Label4" Text="Remarks" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                        <span style="color: red;">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRemarks" runat="server" Width="250px" Height="90px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>


                                <tr style="height: 10px">
                                    
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnOk" runat="Server" Text="Ok" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnOk_Click" OnClientClick="javascript:return TaskConfirmMsg()"/>
                                        <asp:Button ID="btnCancel" runat="Server" Text="Cancel" ToolTip="" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" OnClientClick="refreshParentPage()" />
                                        <%----%>
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
