<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function Validate() {
            var uname = document.getElementById('txtUname').value;
            var opwd = document.getElementById('txtoldpwd').value;
            var npwd = document.getElementById('txtnewpwd').value;
            var cpwd = document.getElementById('txtcnfpwd').value;
            var count = 0;
            if (uname == "" || uname == null) {
                count = count + 1
            }
            if (opwd == "" || opwd == null) {
                count = count + 1;
            }
            if (npwd == "" || npwd == null) {
                count = count + 1;
            }
            if (cpwd == "" || cpwd == null) {
                count = count + 1;
            }
            return count;
        }
        function confirmmsg() {
            var cnt = Validate();
            var npwd = document.getElementById('txtnewpwd').value;
            var cpwd = document.getElementById('txtcnfpwd').value;

            if (cnt == 0) {
                if (npwd == cpwd) {
                    var result = confirm('Are you sure, want to change your password?');
                    if (result) {
                        document.getElementById('<%=cnfresult.ClientID%>').value = 'true';
                        return true;
                    }
                    else {
                        document.getElementById('<%=cnfresult.ClientID%>').value = 'false';
                        return false;
                    }
                }
                else {

                    alert('The New and Confirmation password does not match.');
                    document.getElementById('txtnewpwd').value = '';
                    document.getElementById('txtcnfpwd').value = '';
                    return false;

                }


            }
            else {
                alert('Enter the mandatory field(s).');
            }


        }
    </script>
    <style type="text/css">
        .maindiv {
            width: 90%;
            height: 50%;
            margin: 10% 5% 5% 5%;
            border-radius: 4px;
            border-style: solid;
            border-color: lightgray;
            background-color: beige;
        }

        .divup {
            width: 100%;
            height: 20px;
            text-align: center;
            color: white;
            vertical-align: top;
            margin-top: 0;
            background-color: greenyellow;
            font-family: Verdana;
            font-size: large;
        }

        .divbody {
            width: 100%;
            height: auto;
        }

        .btn {
            background: #078a07;
            background-image: -webkit-linear-gradient(top, #078a07, #078a07);
            background-image: -moz-linear-gradient(top, #078a07, #078a07);
            background-image: -ms-linear-gradient(top, #078a07, #078a07);
            background-image: -o-linear-gradient(top, #078a07, #078a07);
            background-image: linear-gradient(to bottom, #078a07, #078a07);
            -webkit-border-radius: 3;
            -moz-border-radius: 3;
            border-radius: 3px;
            font-family: Arial;
            color: #ffffff;
            font-size: 20px;
            padding: 2px 15px 2px 15px;
            border: solid #078a07 2px;
            text-decoration: none;
        }

            .btn:hover {
                background: #3cb0fd;
                background-image: -webkit-linear-gradient(top, #078a07, #078a07);
                background-image: -moz-linear-gradient(top, #078a07, #078a07);
                background-image: -ms-linear-gradient(top, #078a07, #078a07);
                background-image: -o-linear-gradient(top, #078a07, #078a07);
                background-image: linear-gradient(to bottom, #078a07, #078a07);
                text-decoration: none;
            }

        .btnblue {
            background: #078a07;
            background-image: -webkit-linear-gradient(top, #36b0e3, #36b0e3);
            background-image: -moz-linear-gradient(top, #36b0e3, #36b0e3);
            background-image: -ms-linear-gradient(top, #36b0e3, #36b0e3);
            background-image: -o-linear-gradient(top, #36b0e3, #36b0e3);
            background-image: linear-gradient(to bottom, #36b0e3, #36b0e3);
            -webkit-border-radius: 3;
            -moz-border-radius: 3;
            border-radius: 3px;
            font-family: Arial;
            color: #ffffff;
            font-size: 20px;
            padding: 2px 15px 2px 15px;
            border: solid #36b0e3 2px;
            text-decoration: none;
        }

            .btnblue:hover {
                background: #3cb0fd;
                background-image: -webkit-linear-gradient(top, #36b0e3, #36b0e3);
                background-image: -moz-linear-gradient(top, #36b0e3, #36b0e3);
                background-image: -ms-linear-gradient(top, #36b0e3, #36b0e3);
                background-image: -o-linear-gradient(top, #36b0e3, #36b0e3);
                background-image: linear-gradient(to bottom, #36b0e3, #36b0e3);
                text-decoration: none;
            }
    </style>
</head>
<body>

    <form id="form1" runat="server" defaultfocus="txtoldpwd">
        <asp:ScriptManager ID="scriprmngr" runat="server"></asp:ScriptManager>
        <div class="maindiv">
            <div class="divbody">
                <asp:HiddenField ID="cnfresult" runat="server" />
                <table style="background-color: lightblue; text-align: center; color: white; font-size: large; font-weight: bolder; font-family: Verdana; width: 100%; font-size: medium; vertical-align: top; height: 20px;">
                    <tr>
                        <td>Change Password
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border-spacing: 10px; margin-left: 10%;">
                    <tr>
                        <td>
                            <asp:Label ID="lbluname" runat="server" Font-Names="Verdana" Font-Size="Small" Text="User Id "></asp:Label>
                            <asp:Label ID="lbl" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUname" runat="server" MaxLength="8" Font-Names="Verdana" ToolTip="Enter User Id." Font-Size="Small"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblprepwd" runat="server" Font-Names="Verdana" Font-Size="Small" Text="Current Password "></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtoldpwd" TextMode="Password" MaxLength="12" runat="server" Font-Names="Verdana" ToolTip="Enter current password." Font-Size="Small"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblnewpwd" runat="server" Text="New Password " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtnewpwd" runat="server" MaxLength="12" TextMode="Password" Font-Names="Verdana" ToolTip="Enter new password." Font-Size="Small"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblcnfmpwd" runat="server" Text="Confirm New Password " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtcnfpwd" TextMode="Password" MaxLength="12" runat="server" ToolTip="Re-enter new password." Font-Names="Verdana" Font-Size="Small"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnchange" runat="server" OnClick="btnchange_Click" Text="Change" OnClientClick="return confirmmsg();" CssClass="btn" Font-Names="Verdana" Font-Size="Small" />
                            <asp:Button ID="btnclear" runat="server" Text="Close" OnClientClick="window.close();" CssClass="btnblue" Font-Names="Verdana" Font-Size="Small" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </form>
</body>
</html>
