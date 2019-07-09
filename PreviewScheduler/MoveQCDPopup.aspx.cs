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

public partial class MoveQCDPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                string SScreen = Request.QueryString["SScreen"].ToString();
                if (SScreen == "1")
                {
                    pnlQCD.Visible = true;
                    pnlReady.Visible = false;
                    lblHeading.Text = "CaseID : " + Request.QueryString["CaseID"].ToString();
                }
                else if (SScreen == "2")
                {
                    pnlQCD.Visible = false;
                    pnlReady.Visible = true;
                    lblHeading2.Text = "CaseID : " + Request.QueryString["CaseID"].ToString();
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }


    protected void btnOk_Click(object sender, EventArgs e)
    {

        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();
            //if (CnfResult.Value == "true")
            //{
            string CaseID;
            //LinkButton lnkBtnCaseID = (LinkButton)sender;
            //GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

            CaseID = Request.QueryString["CaseID"].ToString();

            if (rbtnQCDone.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 4 },
                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


            }
            else if (rbtnReassign.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 8 },
                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID },
                     new SqlParameter() { ParameterName = "@Remarks", SqlDbType = SqlDbType.NVarChar, Value = txtRemarks.Text });


            }



            ClearScr();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);



            //}
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void ClearScr()
    {
        rbtnQCDone.Checked = true;
        rbtnReassign.Checked = false;
        txtRemarks.Text = string.Empty;

    }



    protected void btnHPOk_Click(object sender, EventArgs e)
    {

        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();

            string CaseID;
            CaseID = Request.QueryString["CaseID"].ToString();

            if (rbtnYes.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                    new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 3 },
                    new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                    new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID },
                    new SqlParameter() { ParameterName = "@Remarks", SqlDbType = SqlDbType.NVarChar, Value = "High" });


            }
            else if (rbtnNo.Checked == true)
            {
                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                     new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 3 },
                     new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                     new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID },
                     new SqlParameter() { ParameterName = "@Remarks", SqlDbType = SqlDbType.NVarChar, Value = "Normal" });


            }



            ClearScr2();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);




            //}
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void ClearScr2()
    {
        rbtnYes.Checked = false;
        rbtnNo.Checked = true;
        txtHPRemarks.Text = string.Empty;

    }
}