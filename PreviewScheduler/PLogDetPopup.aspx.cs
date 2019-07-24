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

public partial class LogDetPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                string CaseID = Request.QueryString["CaseID"].ToString();
                string SScreen = Request.QueryString["SScreen"].ToString();
                string UL = Request.QueryString["UL"].ToString();

                if (SScreen == "1")
                {
                    Panel1.Visible = true;
                    Panel2.Visible = true;
                    LoadLogDet(CaseID);
                    LoadCaseIDDet(CaseID, UL);
                }
                else if (SScreen == "2")
                {
                    Panel1.Visible = true;
                    Panel2.Visible = true;
                    LoadLogDet(CaseID);
                    LoadCaseIDDet(CaseID,UL);
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadLogDet(string CaseID)
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 8 },
            new SqlParameter() { ParameterName = "@CaseID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = CaseID });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            rdgLevelD.DataSource = dsGrid.Tables[0];
            rdgLevelD.DataBind();
        }
        else
        {
            rdgLevelD.DataSource = new String[] { };
            rdgLevelD.DataBind();
        }



    }

    protected void LoadCaseIDDet(string CaseID,string UL)
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
            lblStatus.Text = ds.Tables[0].Rows[0]["Status"].ToString();

            lblCROEMail.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
            lblRegion.Text = ds.Tables[0].Rows[0]["Region"].ToString();
            lblZone.Text = ds.Tables[0].Rows[0]["Zone"].ToString();
            lblDepot.Text = ds.Tables[0].Rows[0]["Depot"].ToString();

            if (ds.Tables[0].Rows[0]["StatusCode"].ToString() == "05" && UL == "1")
            {
                Panel3.Visible = true;
                Panel4.Visible = false;
            }
            else if (ds.Tables[0].Rows[0]["StatusCode"].ToString() == "90" && UL == "1")
            {
                Panel3.Visible = false;
                Panel4.Visible = true;
            }
            else
            {
                Panel3.Visible = false;
                Panel4.Visible = false;
            }



        }
    }


    protected void btnOk_Click(object sender, EventArgs e)
    {
        SqlProcsNew sqlobj = new SqlProcsNew();
        try
        {
            
            string CaseID;            
            CaseID = Request.QueryString["CaseID"].ToString();

            if (rbtnBIR.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 9 },
                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


            }
            else if (rbtnReady.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                    new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 10 },
                    new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                    new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


            }            

            ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);



            //}
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }


    protected void btnOk_Click2(object sender, EventArgs e)
    {
        SqlProcsNew sqlobj = new SqlProcsNew();
        try
        {

            string CaseID;
            CaseID = Request.QueryString["CaseID"].ToString();

            if (rbtnMPriority.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 11 },
                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


            }
            else if (rbtnHPriority.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                    new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 12 },
                    new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                    new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


            }

            ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);



            //}
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

}