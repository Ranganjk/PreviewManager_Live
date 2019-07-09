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

public partial class FailedMailPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
               

                     
                LoadLogDet();
               
               
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadLogDet()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 17 });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            lblCount.Text = dsGrid.Tables[0].Rows.Count.ToString();

            rdgFMail.DataSource = dsGrid.Tables[0];
            rdgFMail.DataBind();
        }
        else
        {
            lblCount.Text = dsGrid.Tables[0].Rows.Count.ToString();
            rdgFMail.DataSource = new String[] { };
            rdgFMail.DataBind();
        }



    }
}