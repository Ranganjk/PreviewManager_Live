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

public partial class Reports : System.Web.UI.Page
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

                dtpFromDate2.SelectedDate = sd;
                dtpTillDate2.SelectedDate = DateTime.Now;

                //LoadReport1();
                //LoadCount();
                //LoadTAT();               

            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnLevelS_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelSAdmin.aspx?@UserID=" + Session["UserId"].ToString());

    }

    protected void btnReport1_Click(object sender, EventArgs e)
    {
        pnlReport1.Visible = true;
        pnlReport2.Visible = false;
        
        LoadReport1();
    }

    protected void btnReport2_Click(object sender, EventArgs e)
    {
        pnlReport1.Visible = false;
        pnlReport2.Visible = true;

        LoadReport2();
    }


    // ------------------------- Report 1  ------------------------- 

    

    protected void LoadReport1()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();

        //lblCount.Text = string.Empty;

        dsGrid = proc.ExecuteSP("SP_SecReports",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate.SelectedDate.ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            int TypeCount = dsGrid.Tables[0].Rows.Count;
            //lblCount.Text = "Count:" + TypeCount.ToString();

            rdgReport1.DataSource = dsGrid.Tables[0];
            rdgReport1.DataBind();

            //lblTotal.Text= "Total : "+dsGrid.Tables[1].Rows[0]["Total"].ToString();
        }
        else
        {
            rdgReport1.DataSource = new String[] { };
            rdgReport1.DataBind();
        }
    }

    protected void rdgReport1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadReport1();
    }

    protected void rdgReport1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadReport1();
    }

   
    //protected void rdgReport1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    //{

    //    //if (e.Item is GridDataItem)
    //    //{
    //    //    GridDataItem dataItem = e.Item as GridDataItem;
    //    //    int fieldValue = int.Parse(dataItem["Count"].Text);
    //    //    total += fieldValue;
    //    //}
    //    //if (e.Item is GridFooterItem)
    //    //{
    //    //    GridFooterItem footerItem = e.Item as GridFooterItem;
    //    //    footerItem["Count"].Text = "total: " + total.ToString();
    //    //}

        

    //    if (e.Item is GridDataItem)
    //    {
    //        GridDataItem dataItem = e.Item as GridDataItem;
    //        counter += Convert.ToInt32(dataItem["Count"].Text);
    //    }
    //    else if (e.Item is GridFooterItem)
    //    {
    //        GridFooterItem footerItem = e.Item as GridFooterItem;
    //        footerItem["Count"].Text = counter.ToString();
    //    }   
    //}



    protected void BtnShow_Click(object sender, EventArgs e)
    {
        LoadReport1();
    }

    protected void BtnnExcelExport_Click(object sender, EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();

            DataSet dsStatement = proc.ExecuteSP("SP_SecReports",
                new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 },
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
                string sFileName = "SectioningCountRpt_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
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


                Response.Write("<table><tr><td><b>Sectioning Count</td><td> From:" + sdate.ToString("dd/MM/yyyy") + "</td><td> To:" + edate.ToString("dd/MM/yyyy") + "</td><td>" + " " + "</td></b></tr></table>");


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


    // ------------------------- Report 2  ------------------------- 

    

    protected void LoadReport2()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();

        //lblCount.Text = string.Empty;

        dsGrid = proc.ExecuteSP("SP_SecReports",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 2},
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate2.SelectedDate.ToString() },
            new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate2.SelectedDate.ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            int TypeCount = dsGrid.Tables[0].Rows.Count;
            //lblCount2.Text = "Count:" + TypeCount.ToString();

            rdgReport2.DataSource = dsGrid.Tables[0];
            rdgReport2.DataBind();

            //lblTotal2.Text = "Total : " + dsGrid.Tables[1].Rows[0]["Total"].ToString();
        }
        else
        {
            rdgReport2.DataSource = new String[] { };
            rdgReport2.DataBind();
        }
    }

    protected void rdgReport2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadReport2();
    }

    protected void rdgReport2_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadReport2();
    }

    protected void BtnShow2_Click(object sender, EventArgs e)
    {
        LoadReport2();
    }

    protected void BtnnExcelExport2_Click(object sender, EventArgs e)
    {
        try
        {

            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();

            DataSet dsStatement = proc.ExecuteSP("SP_SecReports",
                new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 2 },
                new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                new SqlParameter() { ParameterName = "@Fromdate", SqlDbType = SqlDbType.DateTime, Value = dtpFromDate2.SelectedDate.ToString() },
                new SqlParameter() { ParameterName = "@Todate", SqlDbType = SqlDbType.DateTime, Value = dtpTillDate2.SelectedDate.ToString() });

            if (dsStatement.Tables[0].Rows.Count > 0)
            {

                DataGrid dg = new DataGrid();

                dg.DataSource = dsStatement.Tables[0];
                dg.DataBind();

                DateTime sdate = dtpFromDate2.SelectedDate.Value;
                DateTime edate = dtpTillDate2.SelectedDate.Value;

                // THE EXCEL FILE.
                string sFileName = "TATReport_" + sdate.ToString("dd/MM/yyyy") + " To " + edate.ToString("dd/MM/yyyy") + ".xls";
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


                Response.Write("<table><tr><td><b>TAT Report</td><td> From:" + sdate.ToString("dd/MM/yyyy") + "</td><td> To:" + edate.ToString("dd/MM/yyyy") + "</td><td>" + " " + "</td></b></tr></table>");


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
}