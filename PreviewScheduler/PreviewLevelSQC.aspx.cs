using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Drawing;
using Telerik.Web.UI;
using System.IO;
using System.Net;

public partial class PreviewLevelSQC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Refresh", "30");
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                LoadSubmitted();
                LoadUpload();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadSubmitted()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 4 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            rdgPreviewDet.DataSource = dsGrid.Tables[0];
            rdgPreviewDet.DataBind();
        }
        else
        {
            rdgPreviewDet.DataSource = new String[] { };
            rdgPreviewDet.DataBind();
        }



    }

    protected void LoadUpload()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 9 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            rdgPreviewUpload.DataSource = dsGrid.Tables[0];
            rdgPreviewUpload.DataBind();
        }
        else
        {
            rdgPreviewUpload.DataSource = new String[] { };
            rdgPreviewUpload.DataBind();
        }



    }



    protected void LnkbtnCaseID_Click(object sender, EventArgs e)
    {

        try
        {

            string CaseID;

            LinkButton lnkBtnCaseID = (LinkButton)sender;
            GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

            CaseID = row.Cells[3].Text.ToString();

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
            //"<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('MoveQCDPopup.aspx?CaseID=" + CaseID + "','NewWin','status=no,height=300,width=450 ,resizable=No,left=1500,top=250,screenX=400,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);


            ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('MoveQCDPopup.aspx?SScreen=1&CaseID=" + CaseID + "','NewWin','status=no,height=300,width=400 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);






        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }


    protected void LnkbtnCaseID_Click2(object sender, EventArgs e)
    {

        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();
            if (CnfResult.Value == "true")
            {
                string CaseID;
                LinkButton lnkBtnCaseID = (LinkButton)sender;
                GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

                CaseID = row.Cells[3].Text.ToString();


                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                          new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 7 },
                          new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                          new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });



                LoadUpload();




            }
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void Lnkbtnview_Click(object sender, EventArgs e)
    {
        string CaseID;
        //LinkButton lnkOpenProjBtn = (LinkButton)sender;
        //GridDataItem row = (GridDataItem)lnkOpenProjBtn.NamingContainer;
        //Session["CustRSN"] = row.Cells[2].Text;
        //PRSN = Session["CustRSN"].ToString();
        //   ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        //"<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('CaseIDPopup.aspx?RSN=" + PRSN + "','NewWin','status=no,height=570,width=850 ,resizable=No,left=200,top=65,screenX=100,screenY=200,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);

        LinkButton lnkBtnCaseID = (LinkButton)sender;
        GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

        CaseID = row.Cells[3].Text.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('CaseIDPopup.aspx?CaseID=" + CaseID + "','NewWin','status=no,height=350,width=400 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);
    }

    protected void grdAccountStatement_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadSubmitted();
    }
    protected void grdAccountStatement_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadSubmitted();
    }

    protected void grdTest_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridFilteringItem)
        {
            GridFilteringItem filterItem = (GridFilteringItem)e.Item;

            filterItem["CaseID"].HorizontalAlign = HorizontalAlign.Right;

            //LoadSubmitted();
        }


        if (e.Item is GridDataItem)
        {
            GridDataItem griditem = e.Item as GridDataItem;
            if (griditem["ImgType"].Text.Equals("Soft Copy"))
            {
                griditem.BackColor = System.Drawing.Color.Yellow;
            }
        }
    }

    protected void rdgPreviewUpload_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridFilteringItem)
        {
            GridFilteringItem filterItem = (GridFilteringItem)e.Item;

            filterItem["CaseID"].HorizontalAlign = HorizontalAlign.Right;

            //LoadSubmitted();




        }
    }

    protected void btnLevelD_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelD.aspx?@UserID=" + Session["UserId"].ToString());

    }

    protected void lnkbtnReAssign_Click(object sender, EventArgs e)
    {
        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();

            if (CnfResult.Value == "true")
            {
                string CaseID, UserCode;
                LinkButton lnkBtnCaseID = (LinkButton)sender;
                GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

                CaseID = row.Cells[3].Text.ToString();
                UserCode = row.Cells[4].Text.ToString();


                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                          new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 6 },
                          new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                          new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID },
                          new SqlParameter() { ParameterName = "@UserCode", SqlDbType = SqlDbType.NVarChar, Value = UserCode });

                LoadSubmitted();

                Panel1.Visible = true;
                //Panel2.Visible = true;
            }

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }





}