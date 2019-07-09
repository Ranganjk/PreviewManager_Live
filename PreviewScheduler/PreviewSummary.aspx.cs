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


 

public partial class PreviewSummary : System.Web.UI.Page
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
                LoadCount();

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

        lblCount.Text = string.Empty;

        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 13 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {

            int TypeCount = dsGrid.Tables[0].Rows.Count;
            lblCount.Text = "Count:" + TypeCount.ToString();

            rdgLevelD.DataSource = dsGrid.Tables[0];
            rdgLevelD.DataBind();
        }
        else
        {
            rdgLevelD.DataSource = new String[] { };
            rdgLevelD.DataBind();
        }



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

    //protected void LoadCount()
    //{
    //    SqlProcsNew proc = new SqlProcsNew();
    //    DataSet dsCnt = new DataSet();

    //    lblCount.Text = string.Empty;

    //    dsCnt = proc.ExecuteSP("SP_SecFetchPreviewDetails",
    //        new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 16 },
    //        new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });




    //    if (dsCnt != null && dsCnt.Tables.Count > 0 && dsCnt.Tables[0].Rows.Count > 0)
    //    {
    //        lblOpen1.Text = dsCnt.Tables[0].Rows[0]["Open1"].ToString();
    //        lblOpen2.Text = dsCnt.Tables[0].Rows[0]["Open2"].ToString();
    //        lblToday1.Text = dsCnt.Tables[0].Rows[0]["Today1"].ToString();
    //        lblToday2.Text = dsCnt.Tables[0].Rows[0]["Today2"].ToString();
    //        lblYesDay1.Text = dsCnt.Tables[0].Rows[0]["YstDay1"].ToString();
    //        lblYesDay2.Text = dsCnt.Tables[0].Rows[0]["YstDay2"].ToString();
    //        //lblDayBfr1.Text = dsCnt.Tables[0].Rows[0]["DBfr1"].ToString();
    //        //lblDayBfr2.Text = dsCnt.Tables[0].Rows[0]["DBfr2"].ToString();
    //        lblThisMnth1.Text = dsCnt.Tables[0].Rows[0]["CMnth1"].ToString();
    //        lblThisMnth2.Text = dsCnt.Tables[0].Rows[0]["CMnth2"].ToString();
    //        lblLastMnth1.Text = dsCnt.Tables[0].Rows[0]["LMnth1"].ToString();
    //        lblLastMnth2.Text = dsCnt.Tables[0].Rows[0]["LMnth2"].ToString();
    //    }
    //    else
    //    {

    //    }
    //}

    protected void btnPrevUpload_Click(object sender, EventArgs e)
    {

        Response.Redirect("ImageUpload.aspx?@UserID=" + Session["UserId"].ToString());

        //SqlProcsNew proc = new SqlProcsNew();
        //DataSet dsGrid = new DataSet();


        //dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
        //    new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 7 },
        //    new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        //if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        //{
        //    if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "1")
        //    {
        //        Response.Redirect("PreviewLevelSAdmin.aspx?@UserID=" + Session["UserId"].ToString());
        //    }
        //    else if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "2")
        //    {
        //        Response.Redirect("PreviewLevelS.aspx?@UserID=" + Session["UserId"].ToString());
        //    }
        //    else if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "3")
        //    {
        //        Response.Redirect("PreviewLevelSQC.aspx?@UserID=" + Session["UserId"].ToString());
        //    }
        //    else if (dsGrid.Tables[0].Rows[0]["UserLevel"].ToString() == "5")
        //    {
        //        Response.Redirect("ImageUpload.aspx?@UserID=" + Session["UserId"].ToString());
        //    }
        //}
    }


    protected void LnkbtnStatus_Click(object sender, EventArgs e)
    {
        string CaseID;

        LinkButton lnkBtnCaseID = (LinkButton)sender;
        GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

        CaseID = row.Cells[3].Text.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('PLogDetPopup.aspx?SScreen=1&CaseID=" + CaseID + "&UL=2','NewWin','status=no,height=300,width=700 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);
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
        //if (e.Item is GridDataItem)
        //{
        //    GridDataItem griditem = e.Item as GridDataItem;

        //    Int16 HrsCal = Convert.ToInt16(griditem["CalHrs"].Text);

        //    if (HrsCal >= 0.2 && HrsCal < 24)
        //    {
        //        griditem["StatusDt"].ForeColor = System.Drawing.Color.Red;
        //    }
        //    else if (HrsCal >= 24)
        //    {
        //        griditem.ForeColor = System.Drawing.Color.Red;
        //    }
        //}


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
            "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('PLogDetPopup.aspx?SScreen=2&CaseID=" + CaseID + "&UL=2','NewWin','status=no,height=300,width=700 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void BtnShow_Click(object sender, EventArgs e)
    {
        LoadLevelD();
    }

    protected void BtnnExcelExport_Click(object sender, EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();



            DataSet dsStatement = proc.ExecuteSP("SP_SecFetchPreviewDetails",
                new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 13 },
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
                string sFileName = "PreviewSummary_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
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


                Response.Write("<table><tr><td>Preview Summary</td><td> From:" + sdate.ToString("dd/MM/yyyy") + "</td><td> To:" + edate.ToString("dd/MM/yyyy") + "</td><td>" + " " + "</td></tr></table>");


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


    protected void btnLevelR_Click(object sender, EventArgs e)
    {
        if ((rdgLevelD.Visible == true) && (rdgLevelD.Items.Count > 0))
        {
            rdgLevelD.ExportSettings.ExportOnlyData = true;
            //GridView1.ExportSettings.FileName = "LevelR_ProjectDetails" + DateTime.Now;
            //string FName = lblFileName.Text.Remove(lblFileName.Text.Length - 4);
            //string FName = hdnFileName.Value.ToString().Remove(hdnFileName.Value.ToString().Length - 4);
            DateTime sdate = dtpFromDate.SelectedDate.Value;
            DateTime edate = dtpTillDate.SelectedDate.Value;
            string FName = "Preview Summary_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
            rdgLevelD.ExportSettings.FileName = FName + "_" + DateTime.Now;
            rdgLevelD.ExportSettings.IgnorePaging = true;
            rdgLevelD.ExportSettings.OpenInNewWindow = true;
            rdgLevelD.GridLines = GridLines.Both;
            rdgLevelD.HeaderStyle.Font.Bold = true;
            rdgLevelD.MasterTableView.ExportToExcel();
        }
        else
        {
            WebMsgBox.Show("There are no records to Export");
        }
    }

}