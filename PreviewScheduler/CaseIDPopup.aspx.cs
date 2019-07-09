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

public partial class CaseIDPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                string CaseID = Request.QueryString["CaseID"].ToString();
                LoadCaseIDDet(CaseID);
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }


    protected void LoadCaseIDDet(string CaseID)
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet ds = null;
        ds = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 5 },
            new SqlParameter() { ParameterName = "@CaseID", SqlDbType = SqlDbType.Decimal, Value = Convert.ToDecimal(CaseID) }
            );
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblCaseID.Text = ds.Tables[0].Rows[0]["CaseID"].ToString();
            lblOppNo.Text = ds.Tables[0].Rows[0]["OpportunityNo"].ToString();
            lblCROID.Text = ds.Tables[0].Rows[0]["CRO"].ToString();
            lblCROMobile.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
            lblImgType.Text = ds.Tables[0].Rows[0]["ImgType"].ToString();


        }
    }
}