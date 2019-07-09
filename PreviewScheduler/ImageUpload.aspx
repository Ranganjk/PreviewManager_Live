<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

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
            var result = confirm('Process cannot be reversed. Are you sure?');

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
            var result = confirm('Process cannot be reversed. Are you sure you want to remove the file?');

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


                    <div id="ldgImage" runat="server" visible="false">

                        <%-- <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="uptab">
                            <ProgressTemplate>
                                <div class="Loadingdiv">
                                    <div class="centerdiv">
                                        <asp:Label ID="lblUpdateprogress" runat="server" Text="Please wait..."></asp:Label>
                                        <img alt="Loading...." src="loading3.gif" />
                                    </div>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>--%>

                        <%--<asp:ImageButton ID="btnUpdateLoad" runat="server" ImageUrl="~/Images/loading.gif" />--%>
                    </div>




                    <table>
                        <tr>
                            <td style="width: 20px;">
                                <asp:HiddenField ID="CnfResult" runat="server" />
                            </td>
                            <td>


                                <table>
                                    <tr>
                                        <td>
                                            <table style="border-style: none; background-color: #ffffd9;">

                                                <tr>
                                                    <td style="width: 250px">
                                                        <asp:Label ID="Label11" Text="New Preview Upload" Font-Names="verdana" Font-Size="Medium" runat="server" Visible="true" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                    </td>
                                                </tr>

                                                <asp:Panel runat="server" ID="Panel1" Visible="true">
                                                    <tr style="height: 10px"></tr>
                                                    <tr>
                                                        <td style="width: 200px">
                                                            <asp:Label ID="Label5" Text="Enter Case ID" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="true" ForeColor="Gray"></asp:Label>
                                                        </td>
                                                        <td style="width: 500px">
                                                            <asp:TextBox ID="txtCaseID" runat="Server" BackColor="LightYellow" ToolTip=" " Width="200px" Height="25px" Font-Bold="true" ForeColor="DarkBlue" Font-Names="Verdana" Font-Size="Small"></asp:TextBox>
                                                            <asp:Button ID="btnClick" runat="Server" Text="Select" CssClass="Button"   Width="80px" ToolTip="Enter case id to view the details and to upload the preview file if not done already" OnClick="btnClick_Click" />
                                                            
                                                        </td>

                                                    </tr>


                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label15" Text="Opp No" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblOppNo" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label1" Text="CRO Id" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblCROID" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label3" Text="CRO Name" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblCROName" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label6" Text="CRO Email Id" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblCROEmailID" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label8" Text="CRO Mobile No" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblCROMobile" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label10" Text="Region" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblRegion" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label12" Text="Zone" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblZone" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label14" Text="Depot" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblDepot" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr style="height: 5px"></tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="Label4" Text="Work Type" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                        </td>

                                                        <td style="width: 100px">
                                                            <asp:Label ID="lblWorkType" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                                            <asp:HiddenField ID="hdnPreviewType" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>

                                                        <td style="width: 400px">
                                                            <asp:Label ID="lblMsg" Font-Names="verdana" Font-Size="XX-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Red"></asp:Label></br>
                                                
                                                        </td>
                                                    </tr>

                                                </asp:Panel>
                                            </table>
                                        </td>
                                        <td style="vertical-align: top;">
                                            <table>
                                                <tr style="height: 30px">
                                                    <td>
                                                        <asp:Label ID="lblLUCaseID" Font-Names="verdana" Font-Size="Medium" runat="server" Visible="true" Font-Bold="false" ForeColor="Black"></asp:Label></br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnPSummary" runat="Server" Text="Preview Summary"  CssClass="Button" ToolTip="Click to view the Preview Summary screen" OnClick="btnPSummary_Click" Width="150px" />
                                                        <asp:Button ID="btnLevelS" runat="Server" Text="Level S"  CssClass="Button" ToolTip="Click to view the Level-S screen"  OnClick="btnLevelS_Click"   />
                                                    </td>
                                                </tr>
                                                <tr style="height: 20px"></tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" Text="Avoid files with long names and special characters." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label7" Text="Should be of extension .JPEG or .JPG   for DV Link and .PDF for Soft Copy." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label13" Text="Files with any other extensions will be rejected." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label16" Text="File upload may take a few to several seconds depending on the file size and network speed." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label17" Text="Be patient. Wait for the confirmation message." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label18" Text="A Case ID cannot be repeated." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                            <asp:Label ID="Label19" Text="Contact previews.service@akzonobel.com in case of any issues faced during the operations." Font-Names="verdana" Font-Size="X-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Purple"></asp:Label></br>
                                                    </td>
                                                </tr>
                                            </table>

                                        </td>

                                    </tr>
                                </table>







                                <asp:Panel runat="server" ID="Panel2" Visible="false">

                                    <table>

                                        <tr style="height: 5px"></tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="btnUpload"  runat="server" Width="650px"  ToolTip="For digital preview a .jpeg or .jpg file is required. For Soft Copy preview a .pdf file in the prescribed format is required." />
                                                <%--ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.psd|.PSD|.jpg|.JPG|.jpeg|.JPEG)$"--%>

                                                <asp:FileUpload ID="btnUpload2" CssClass="btn_css" runat="server" Width="650px" ClientIDMode="Static" placeholder="Browse images" ToolTip="For digital preview a .jpeg or .jpg file is required. For Soft Copy preview a .pdf file in the prescribed format is required." />
                                                                                  
                                                <asp:Label runat="server" ID="lblFileName"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkFileSize" Text="File Size" ToolTip="Click here to view the file size" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Blue" OnClick="lnkFileSize_Click"></asp:LinkButton>
                                                <asp:Label ID="lblFileSize"   Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="true" ForeColor="Blue" ></asp:Label>

                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg|.JPG|.jpeg|.JPEG)$"
                                                    ControlToValidate="btnUpload" runat="server" ForeColor="Red" ErrorMessage="Upload a .jpeg or .jpg file." Display="Dynamic" />
                                                <asp:Label ID="lblUploadSz1" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="true" ForeColor="Black"></asp:Label>

                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.pdf|.PDF)$"
                                                    ControlToValidate="btnUpload2" runat="server" ForeColor="Red" ErrorMessage="Upload a .pdf file." Display="Dynamic" />
                                                <asp:Label ID="lblUploadSz2" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="true" ForeColor="Black"></asp:Label>

                                            </td>
                                        </tr>


                                        <tr style="height: 20px"></tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnSave" runat="Server" Text="Upload" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="" OnClick="btnSave_Click" OnClientClick="javascript:return TaskConfirmMsg()" />
                                                <asp:Button ID="btnClear" runat="Server" Text="Clear" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="Click to clear the details" OnClick="btnClear_Click" />
                                            </td>
                                        </tr>

                                    </table>

                                </asp:Panel>

                                <asp:Panel runat="server" ID="Panel3" Visible="false">
                                    <table>
                                        <tr style="height: 20px"></tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label20" Text="Uploaded File : " Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                                <asp:Label ID="lblUplFileName" Font-Bold="true" Font-Names="verdana" Font-Size="Small" runat="server" Visible="true" ForeColor="DarkBlue"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>                                                
                                                <asp:Button ID="btnRemove" runat="Server" Text="Remove" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="Click to remove the uploaded file" OnClick="btnRemove_Click"  OnClientClick="javascript:return TaskConfirmMsg2()" />
                                                <asp:Button ID="btnClear2" runat="Server" Text="Clear" ForeColor="White" BackColor="#1693CD" Font-Names=" Verdana" Font-Size="Small" Width="80px" ToolTip="Click to clear the details" OnClick="btnClear_Click" />                                                
                                            </td>
                                        </tr>
                                    </table>

                                </asp:Panel>

                                <table>

                                    <tr style="height: 30px">
                                        <td></td>
                                        <td>
                                            <asp:Label ID="Label9" Text="If you do not see any upload button above, means the preview file is already uploaded." Font-Names="verdana" Font-Size="XX-Small" runat="server" Visible="true" Font-Bold="false" ForeColor="Gray"></asp:Label>
                                        </td>
                                    </tr>



                                </table>


                            </td>
                        </tr>
                    </table>





                </div>
            </ContentTemplate>

            <Triggers>
                <asp:PostBackTrigger ControlID="btnClick" />
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="btnClear" />
                <asp:PostBackTrigger ControlID="btnRemove" />
                <asp:PostBackTrigger ControlID="btnClear2" />
                <asp:PostBackTrigger ControlID="lnkFileSize" />
                 

                <%-- <asp:PostBackTrigger ControlID="btnUpload" />
                <asp:PostBackTrigger ControlID="btnUpload2" />--%>
            </Triggers>

        </asp:UpdatePanel>

    </asp:Panel>

</asp:Content>
