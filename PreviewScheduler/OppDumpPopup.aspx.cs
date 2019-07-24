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


public partial class OppDumpPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                dtpFromDate.SelectedDate = DateTime.Now;
                LoadOppDet();

            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadOppDet()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 19 },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            //lblCount.Text = dsGrid.Tables[0].Rows.Count.ToString();

            rdgOppDet.DataSource = dsGrid.Tables[0];
            rdgOppDet.DataBind();
        }
        else
        {
            //lblCount.Text = dsGrid.Tables[0].Rows.Count.ToString();
            rdgOppDet.DataSource = new String[] { };
            rdgOppDet.DataBind();
        }



    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        LoadOppDet();

    }

    protected void btnExportOpp_Click(object sender, EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            //DataSet dsGrid2 = new DataSet();

          

            DataSet dsTAT =  proc.ExecuteSP("SP_SecFetchPreviewDetails",
          new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 19 },
          new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() });

            if (dsTAT.Tables[0].Rows.Count > 0)
            {

                DataGrid dg = new DataGrid();

                dg.DataSource = dsTAT.Tables[0];
                dg.DataBind();

                DateTime sdate = dtpFromDate.SelectedDate.Value;
                

                // THE EXCEL FILE.
                string sFileName = "OpportunityDetail_" + sdate.ToString("dd/MM/yyyy") +  ".xls";
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


                Response.Write("<table><tr><td><b>Opportunity Detail Report - " + sdate.ToString("dd/MM/yyyy") + "</td></b></tr></table>");


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

    protected void rdgOppDet_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadOppDet();
    }
    protected void rdgOppDet_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadOppDet();
    }
}