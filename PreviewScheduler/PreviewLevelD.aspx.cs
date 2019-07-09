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

public partial class PreviewLevelD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                DateTime sd = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dtpFromDate.SelectedDate = sd;
                dtpTillDate.SelectedDate = DateTime.Now;

                LoadLevelD();
                //LoadCount();
                //LoadTAT();

            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadLevelD()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();

        //lblCount.Text = string.Empty;

        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 6 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            int TypeCount = dsGrid.Tables[0].Rows.Count;
            //lblCount.Text = "Count:" + TypeCount.ToString();

            rdgLevelD.DataSource = dsGrid.Tables[0];
            rdgLevelD.DataBind();
        }
        else
        {
            rdgLevelD.DataSource = new String[] { };
            rdgLevelD.DataBind();
        }



    }

    protected void btnLevels_Click(object sender, EventArgs e)
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 7 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "1")
            {
                Response.Redirect("PreviewLevelSAdmin.aspx?@UserID=" + Session["UserId"].ToString());
            }
            else if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "2")
            {
                Response.Redirect("PreviewLevelS.aspx?@UserID=" + Session["UserId"].ToString());
            }
            else if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "3")
            {
                Response.Redirect("PreviewLevelSQC.aspx?@UserID=" + Session["UserId"].ToString());
            }
        }
    }


    protected void LnkbtnStatus_Click(object sender, EventArgs e)
    {
        string CaseID;

        LinkButton lnkBtnCaseID = (LinkButton)sender;
        GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

        CaseID = row.Cells[3].Text.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('PLogDetPopup.aspx?SScreen=1&CaseID=" + CaseID + "&UL=1','NewWin','status=no,height=300,width=700 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);
    }


    protected void rdgLevelD_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadLevelD();
    }
    protected void rdgLevelD_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadLevelD();
    }

    protected void rdgLevelD_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
       
        if (e.Item is GridDataItem)
        {
            GridDataItem griditem = e.Item as GridDataItem;
            if (griditem["ImgType"].Text.Equals("Soft Copy"))
            {
                griditem.BackColor = System.Drawing.Color.Yellow;
            }


            //if (!griditem["StatusCode"].Text.Equals("00") || !griditem["StatusCode"].Text.Equals("02") || !griditem["StatusCode"].Text.Equals("05"))
            //{
            if (!griditem["StatusCode"].Text.Equals("00"))
            {

                LinkButton lnk = (LinkButton)griditem.FindControl("lnkbtnBIR");
                lnk.Enabled = false;
                lnk.ForeColor = System.Drawing.Color.Gray;
            }

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

            ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
            "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('PLogDetPopup.aspx?SScreen=2&CaseID=" + CaseID + "&UL=1','NewWin','status=no,height=450,width=700 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void BtnShow_Click(object sender, EventArgs e)
    {
        LoadLevelD();
        LoadTAT();
        //LoadCount();
    }

    protected void BtnnExcelExport_Click(object sender, EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();

            DataSet dsStatement = proc.ExecuteSP("SP_SecFetchPreviewDetails",
                new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 6 },
                new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
                new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

            if (dsStatement.Tables[0].Rows.Count > 0)
            {

                DataGrid dg = new DataGrid();

                dg.DataSource = dsStatement.Tables[0];
                dg.DataBind();

                DateTime sdate = dtpFromDate.SelectedDate.Value;
                DateTime edate = dtpTillDate.SelectedDate.Value;

                // THE EXCEL FILE.
                string sFileName = "LevelD_SummaryRpt_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
                sFileName = sFileName.Replace("/", "");

                // SEND OUTPUT TO THE CLIENT MACHINE USING "RESPONSE OBJECT".
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=" + sFileName);
                Response.ContentType = "application/vnd.ms-excel";
                EnableViewState = false;

                System.IO.StringWriter objSW = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter objHTW = new System.Web.UI.HtmlTextWriter(objSW);

                dg.HeaderStyle.Font.Bold = true;     // SET EXCEL HEADERS AS BOLD.
                dg.RenderControl(objHTW);


                Response.Write("<table><tr><td><b>Level D - Summary Report</td><td> From:" + sdate.ToString("dd/MM/yyyy") + "</td><td> To:" + edate.ToString("dd/MM/yyyy") + "</td><td>" + " " + "</td></b></tr></table>");


                // STYLE THE SHEET AND WRITE DATA TO IT.
                Response.Write("<style> TABLE { border:dotted 1px #999; } " +
                    "TD { border:dotted 1px #D5D5D5; text-align:center } </style>");
                Response.Write(objSW.ToString());


                Response.End();
                dg = null;


            }
            else
            {
                //WebMsgBox.Show(" From" + dtpFromDate.SelectedDate.Value + " To " + dtpTillDate.SelectedDate.Value + " Preview Summary does not exist");
                WebMsgBox.Show("There are no records to Export");
            }
        }
        catch (Exception ex)
        {
            //WebMsgBox.Show(ex.Message);
        }
    }

    protected void btnStatShow_Click(object sender, EventArgs e)
    {
        pnlShow.Visible = false;
        pnlStatTat.Visible = true;

        LoadCount();
        LoadTAT();

    }

    protected void LoadCount()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsCNT = new DataSet();



        dsCNT = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 16 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        if (dsCNT != null && dsCNT.Tables.Count > 0 && dsCNT.Tables[0].Rows.Count > 0)
        {
            rdgCount.DataSource = dsCNT.Tables[0];
            rdgCount.DataBind();
        }
        else
        {
            rdgCount.DataSource = new String[] { };
            rdgCount.DataBind();
        }
    }

    protected void LoadTAT()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsTAT = new DataSet();

        dsTAT = proc.ExecuteSP("SP_SecFetchTATDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

        if (dsTAT != null && dsTAT.Tables.Count > 0 && dsTAT.Tables[0].Rows.Count > 0)
        {

            rdgTAT.DataSource = dsTAT.Tables[0];
            rdgTAT.DataBind();
        }
        else
        {
            rdgTAT.DataSource = new String[] { };
            rdgTAT.DataBind();
        }
    }


    protected void btnExportTat_Click(object sender,EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            //DataSet dsGrid2 = new DataSet();

            DataSet dsTAT = proc.ExecuteSP("SP_SecFetchTATDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

            if (dsTAT.Tables[0].Rows.Count > 0)
            {

                DataGrid dg = new DataGrid();

                dg.DataSource = dsTAT.Tables[0];
                dg.DataBind();

                DateTime sdate = dtpFromDate.SelectedDate.Value;
                DateTime edate = dtpTillDate.SelectedDate.Value;

                // THE EXCEL FILE.
                string sFileName = "TAT_SummaryRpt_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
                sFileName = sFileName.Replace("/", "");

                // SEND OUTPUT TO THE CLIENT MACHINE USING "RESPONSE OBJECT".
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=" + sFileName);
                Response.ContentType = "application/vnd.ms-excel";
                EnableViewState = false;

                System.IO.StringWriter objSW = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter objHTW = new System.Web.UI.HtmlTextWriter(objSW);

                dg.HeaderStyle.Font.Bold = true;     // SET EXCEL HEADERS AS BOLD.
                dg.RenderControl(objHTW);


                Response.Write("<table><tr><td><b>Turnaround Time(TAT) Report</td><td> From:" + sdate.ToString("dd/MM/yyyy") + "</td><td> To:" + edate.ToString("dd/MM/yyyy") + "</td><td>" + " " + "</td></b></tr></table>");


                // STYLE THE SHEET AND WRITE DATA TO IT.
                Response.Write("<style> TABLE { border:dotted 1px #999; } " +
                    "TD { border:dotted 1px #D5D5D5; text-align:center } </style>");
                Response.Write(objSW.ToString());


                Response.End();
                dg = null;


            }
            else
            {
                //WebMsgBox.Show(" From" + dtpFromDate.SelectedDate.Value + " To " + dtpTillDate.SelectedDate.Value + " Preview Summary does not exist");
                WebMsgBox.Show("There are no records to Export");
            }
        }
        catch (Exception ex)
        {
            //WebMsgBox.Show(ex.Message);
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