<%@ Page Language="C#" MasterPageFile="~/PreviewScheduler.master" AutoEventWireup="true" CodeFile="ImageUpload2.aspx.cs" Inherits="ImageUpload2" %>

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

    <style type="text/css">
        .CS {
            background-color: #abcdef;
            color: darkblue;
            border: 1px solid #AB00CC;
            font: Verdana 10px;
            padding: 1px 4px;
            font-family: Palatino Linotype, Arial, Helvetica, sans-serif;
            width: 650px;
        }

        .search_categories {
            font-size: 13px;
            padding: 10px 8px 10px 14px;
            background: yellow;
            border: 1px solid #ccc;
            border-radius: 6px;
            overflow: hidden;
            position: relative;
        }

            .search_categories .select {
                width: 120%;
                background: url('arrow.png') no-repeat;
                background-position: 80% center;
            }

                .search_categories .select select {
                    background: transparent;
                    line-height: 1;
                    border: 0;
                    padding: 0;
                    border-radius: 0;
                    width: 120%;
                    position: relative;
                    z-index: 10;
                    font-size: 1em;
                }


        .gridview-header {
            font-weight: bold;
            font-size: 10px;
            padding-bottom: 3px;
            color: #666666;
            padding-top: 3px;
            font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
            background-color: #EEEEEE;
        }

        .box {
            width: 620px;
            height: 330px;
            background: #EEEEEE;
            border: 2px solid #ccc;
        }

        .inner-border {
            border: 12px solid #0094ff;
            box-shadow: inset 0px 0px 0px 10px lightgray;
            box-sizing: border-box; /* Include padding and border in element's width and height */
        }
        /* CSS3 solution only for rectangular shape */
        .inner-outline {
            outline: 5px solid lightgray;
            outline-offset: -30px;
        }

        .HeaderFreez {
            position: relative;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }

        .inner-border2 {
            border: 3px solid #0094ff;
            box-shadow: inset 0px 0px 0px 5px white;
            box-sizing: border-box; /* Include padding and border in element's width and height */
        }

        .box2 {
            width: 560px;
            height: 160px;
            background: #EEEEEE;
            border: 2px solid #ccc;
        }
    </style>


    <style type="text/css">
        .Loadingdiv {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .centerdiv {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .centerdiv img {
                height: 128px;
                width: 128px;
            }
    </style>




    <div style="width: 100%; font-family: Verdana; background-color: beige">
        
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="uptab">
            <ProgressTemplate>
                <div class="Loadingdiv">
                    <div class="centerdiv">
                        <asp:Label ID="lblUpdateprogress" runat="server" Text="Please wait..."></asp:Label>
                        <img alt="Loading...." src="loading3.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>


        <asp:UpdatePanel ID="uptab" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div id="divNID1" runat="server">
                    <asp:Label ID="lbltest" runat="server" Text="Hare Rama Hare Krishna"></asp:Label>
                </div>

            </ContentTemplate>
            <Triggers>
                <%--<asp:PostBackTrigger ControlID="Button2" />
                 <asp:PostBackTrigger ControlID="GridView1" />--%>
            </Triggers>
        </asp:UpdatePanel>



    </div>




</asp:Content>
