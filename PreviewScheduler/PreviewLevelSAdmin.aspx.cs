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

public partial class PreviewLevelSAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                LoadSubmitted();
                ChkFailedMails();

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
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 },
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


        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[1].Rows.Count > 0)
        {
            lblLatest.Text = dsGrid.Tables[1].Rows[0]["Latest"].ToString();
        }
        else
        {
            lblLatest.Text = string.Empty;
        }





    }






    //protected void LnkbtnCaseID_Click(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        SqlProcsNew sqlobj = new SqlProcsNew();

    //        if (CnfResult.Value == "true")
    //        {

    //            string CaseID, StatusCode;
    //            LinkButton lnkBtnCaseID = (LinkButton)sender;
    //            GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

    //            CaseID = row.Cells[3].Text.ToString();
    //            StatusCode = row.Cells[4].Text.ToString();


    //            if (StatusCode == "00")
    //            {
    //                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
    //                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 3 },
    //                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
    //                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


    //            }
    //            //else if (StatusCode == "30")
    //            //{
    //            //    sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
    //            //         new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 7 },
    //            //         new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
    //            //         new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


    //            //}



    //            LoadSubmitted();

    //            Panel1.Visible = true;
    //            //Panel2.Visible = true;
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        WebMsgBox.Show(ex.Message.ToString());
    //    }


    //}

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
            "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('MoveQCDPopup.aspx?SScreen=2&CaseID=" + CaseID + "','NewWin','status=no,height=300,width=400 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);





        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void Lnkbtnview_Click(object sender, EventArgs e)
    {
        string CaseID;

        LinkButton lnkBtnCaseID = (LinkButton)sender;
        GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

        CaseID = row.Cells[3].Text.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('CaseIDPopup.aspx?CaseID=" + CaseID + "','NewWin','status=no,height=350,width=400 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);
    }

    protected void grdAccountStatement_ItemCommand(object sender, GridCommandEventArgs e)
    {

        try
        {
            LoadSubmitted();
        }
        catch (Exception ex)
        {

        }

    }
    protected void grdAccountStatement_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadSubmitted();
    }

    protected void grdTest_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {


        if (e.Item is GridDataItem)
        {
            GridDataItem griditem = e.Item as GridDataItem;

            if (!griditem["StatusCode"].Text.Equals("00"))
            {

                LinkButton lnk = (LinkButton)griditem.FindControl("lnkbtnBIR");
                lnk.Enabled = false;
                lnk.ForeColor = System.Drawing.Color.LightGray;
            }

            if (griditem["ImgType"].Text.Equals("Soft Copy"))
            {
                griditem.BackColor = System.Drawing.Color.Yellow;
            }

        }

    }

    protected void btnLevelD_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelD.aspx?@UserID=" + Session["UserId"].ToString());

    }

    protected void btnPrevUpload_Click(object sender, EventArgs e)
    {
        Response.Redirect("ImageUpload.aspx?@UserID=" + Session["UserId"].ToString());

    }

    protected void btnReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx?@UserID=" + Session["UserId"].ToString());

    }

    //protected void lnkbtnBIR_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        SqlProcsNew sqlobj = new SqlProcsNew();

    //        if (CnfResult.Value == "true")
    //        {
    //            string CaseID, StatusCode;
    //            LinkButton lnkBtnCaseID = (LinkButton)sender;
    //            GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

    //            CaseID = row.Cells[3].Text.ToString();
    //            StatusCode = row.Cells[4].Text.ToString();

    //            sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
    //                      new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 5 },
    //                      new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
    //                      new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });

    //            LoadSubmitted();

    //            Panel1.Visible = true;
    //            //Panel2.Visible = true;
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        WebMsgBox.Show(ex.Message.ToString());
    //    }


    //}

    protected void btnFailedMail_Click(object sender, EventArgs e)
    {
        try
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
            "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('FailedMailPopup.aspx?UserID=1','NewWin','status=no,height=300,width=600 ,resizable=No,left=1500,top=250,screenX=300,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }
    }

    protected void ChkFailedMails()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 17 });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            btnFailedMail.Text = "Failed EMail(s) - " + dsGrid.Tables[0].Rows.Count.ToString();
            btnFailedMail.ForeColor = Color.Red;
        }
        else
        {
            btnFailedMail.Text = "Failed EMail(s) - " + dsGrid.Tables[0].Rows.Count.ToString();
            btnFailedMail.ForeColor = Color.White;
        }



    }


    protected void lnkbtnBIR_Click(object sender, EventArgs e)
    {

        try
        {

            string CaseID;

            LinkButton lnkBtnCaseID = (LinkButton)sender;
            GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

            CaseID = row.Cells[3].Text.ToString();

           
            ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
            "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('MoveBIRCancelPopup.aspx?SScreen=1&CaseID=" + CaseID + "','NewWin','status=no,height=330,width=460 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);

            
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

}