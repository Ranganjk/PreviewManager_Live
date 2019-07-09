<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Css/Master.css" rel="stylesheet" />
    <link href="Css/Home.css" rel="stylesheet" />
    <script type="text/javascript">
        function checkLogin() {
            var uname = document.getElementById('<%= txtUserId.ClientID%>').value;
            var pass = document.getElementById('<%= txtPassword.ClientID%>').value;
            if (uname == "") {
                alert("Please enter the user id");
                return false;
            }
            else if (pass == "") {
                alert("Please enter the password");
                return false;
            }
            else {
                return true;
            }
            //else if(uname=="thavasi" && pass=="th@mbir@n")
            //{
            //    window.open("Home.aspx");
            //}
            //else
            //{
            //    alert("Invalid username and password!");
            //    return false;
            //}
        }
        function PopupChngpwd() {
            var iMyWidth;
            var iMyHeight;
            iMyWidth = (window.screen.width / 2) - (240 + 50);
            iMyHeight = (window.screen.height / 2) - (250 + 50);
            var Y = 'ResetPassword.aspx?rVal=' + '<%=Convert.ToString(Session["rUname"])%>';
            var win = window.open(Y, "Receipt", "status=no,height=350,width=600,resizable=yes,left=" + iMyWidth + ",top=" + iMyHeight + ",screenX=" + iMyWidth + ",screenY=" + iMyHeight + ",toolbar=no,menubar=no,scrollbars=no,'Fullscreen=yes',location=no,directories=no");
            win.focus();


        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="color: ; font-family: Verdana; font-size: 12px;">
            <div style="background-color: #4D94DB; align-items: center">
                <asp:Panel ID="Panel4" runat="server" Width="100%" BackColor="#3090C7">
                    <table style="width: 98%; font-family: Verdana; font-size: small;">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblProjectName" runat="server" Font-Bold="false" Font-Names="Calibri" Font-Size="Large" ForeColor="White" Text="Preview Scheduler"></asp:Label>
                            </td>

                            <td align="right" style="width: 250px">
                                <asp:Label ID="GetserverDateTime" Height="10px" Font-Bold="false" Font-Names="Verdana" Font-Size="Small" ForeColor="White" runat="server" />
                            </td>

                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server" Width="100%" BackColor="#659EC7">
                    <table style="width: 98%; font-family: Verdana; font-size: small;">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblSoftName" runat="server" Font-Bold="false" Font-Names="Calibri" Font-Size="Large" ForeColor="DarkBlue"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblVersionNo" Height="10px" Font-Bold="false" Font-Names="Verdana" Font-Size="Small" ForeColor="DarkBlue" runat="server" />
                            </td>

                        </tr>
                    </table>
                </asp:Panel>

            </div>

            <div class="cover">

                <table style="width: 100%;" cellpadding="10">
                    <caption style="background-color: #006BB2; text-align: center; padding: 5px; color: #FFFFFF; font-size: 14px; font-weight: 700; height: 25px">PREVIEW MANAGER</caption>

                    <tr>
                        <td>
                            <%--<asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/ISLOGO.png" Height="150px" Width="150px" />--%>
                        </td>
                        <td>
                            <table style="width: 98%;" cellpadding="10">

                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right">User Id
                                    </td>

                                    <td>
                                        <asp:TextBox ID="txtUserId" CssClass="inputBox" runat="server" PlaceHolder="Enter User Id" ToolTip="Enter the user id to sign in" MaxLength="8"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPassword" CssClass="inputBox" type="password" Style="height: 20px;" runat="server" PlaceHolder="Enter Password" ToolTip="Enter the password to sign in" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button CssClass="btn1" ID="BtnSubmit" runat="server" Text="Sign In" OnClientClick="return checkLogin();" OnClick="BtnSubmit_Click" ToolTip="Click here to sign in" />
                                        &nbsp;
                                        <asp:LinkButton ID="lnlchangepwd" runat="server" Font-Names="Verdana" Font-Size="Small" Font-Underline="false" ToolTip="Click here to change the password." ForeColor="Blue" Text="Change Password?" OnClick="lnlchangepwd_Click"></asp:LinkButton>
                                    </td>
                                </tr>

                            </table>
                        </td>


                    </tr>
                </table>


            </div>
            <div class="Footer">
                <div class="FtrTxt">Innovatus Systems. All rights reserved.</div>
            </div>

        </div>
    </form>
</body>
</html>
