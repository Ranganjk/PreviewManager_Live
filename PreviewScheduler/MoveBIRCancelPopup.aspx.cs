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

public partial class MoveBIRCancelPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {

                pnlQCD.Visible = true;
                lblHeading.Text = "CaseID : " + Request.QueryString["CaseID"].ToString();

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
            if (CnfResult.Value == "true")
            {
                string CaseID;
                //LinkButton lnkBtnCaseID = (LinkButton)sender;
                //GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

                CaseID = Request.QueryString["CaseID"].ToString();

                if (rbtnBIR.Checked)
                {
                    if (txtRemarks.Text != string.Empty || txtRemarks.Text != "")
                    {
                        UpdateBIR(CaseID);
                        ClearScr();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);

                    }

                    else
                    {
                        WebMsgBox.Show("Remarks column should not be empty, please enter.");
                        txtRemarks.Focus();
                    }

                }
                else if (rbtnCancel.Checked == true)
                {
                    if (txtRemarks.Text != string.Empty || txtRemarks.Text != "")
                    {
                        UpdateCancel(CaseID);
                        ClearScr();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);

                    }

                    else
                    {
                        WebMsgBox.Show("Remarks column should not be empty, please enter.");
                        txtRemarks.Focus();
                    }

                }
                else
                {
                    ClearScr();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "ClosePopup", "window.close();window.opener.location.href=window.opener.location.href;", true);

                }

            }
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }
    }

    protected void ClearScr()
    {
        rbtnBIR.Checked = true;
        rbtnCancel.Checked = false;
        txtRemarks.Text = string.Empty;

    }


    protected void UpdateBIR(string CaseID)
    {
        DataSet ds = new DataSet();
        SqlProcsNew obj = new SqlProcsNew();

        ds = obj.ExecuteSP("SP_SecFetchPreviewDetails",
             new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 18 },
             new SqlParameter() { ParameterName = "@CaseID", SqlDbType = SqlDbType.NVarChar, Value = CaseID });

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
           int save = obj.ExecuteNonQuery("SP_UpdateSecDtls",
           new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 1 },
           new SqlParameter() { ParameterName = "@RSN", SqlDbType = SqlDbType.Int, Value = Convert.ToInt32(ds.Tables[0].Rows[0]["RSN"].ToString()) },
           //new SqlParameter() { ParameterName = "@Es_Sec", SqlDbType = SqlDbType.Int, Value = 0 },
           new SqlParameter() { ParameterName = "@ES_Time", SqlDbType = SqlDbType.NVarChar, Value = "0" },
           new SqlParameter() { ParameterName = "@ES_Time_Min", SqlDbType = SqlDbType.NVarChar, Value = "0" },
           new SqlParameter() { ParameterName = "@ES_Time_Max", SqlDbType = SqlDbType.NVarChar, Value = "0" },
           new SqlParameter() { ParameterName = "@Complexity", SqlDbType = SqlDbType.Char, Value = "L" },
           new SqlParameter() { ParameterName = "@Invoice_Ref", SqlDbType = SqlDbType.NVarChar, Value = "In_" + ds.Tables[0].Rows[0]["Case_ID"].ToString() },
           new SqlParameter() { ParameterName = "@Status", SqlDbType = SqlDbType.Char, Value = "BI" },
           new SqlParameter() { ParameterName = "@ImgType", SqlDbType = SqlDbType.Char, Value = "E" },
           new SqlParameter() { ParameterName = "@Remarks", SqlDbType = SqlDbType.VarChar, Value = txtRemarks.Text },
           new SqlParameter() { ParameterName = "@M_On", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
           new SqlParameter() { ParameterName = "@M_By", SqlDbType = SqlDbType.NVarChar, Value = Session["Userid"].ToString() });

            MailSend(ds.Tables[0].Rows[0]["CRO_ID"].ToString(), ds.Tables[0].Rows[0]["OpportunityNo"].ToString(), ds.Tables[0].Rows[0]["Case_ID"].ToString(), DateTime.Now.ToString("dd-MMM-yyyy hh:mm:tt"), "0", "BI");
            WebMsgBox.Show("Details saved successfully.");
        }

        ClearScr();
    }


    protected void UpdateCancel(string CaseID)
    {
        DataSet ds = new DataSet();
        SqlProcsNew obj = new SqlProcsNew();

        ds = obj.ExecuteSP("SP_SecFetchPreviewDetails",
             new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 18 },
             new SqlParameter() { ParameterName = "@CaseID", SqlDbType = SqlDbType.NVarChar, Value = CaseID });

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
              int save = obj.ExecuteNonQuery("SP_UpdateSecDtls",
              new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 1 },
              new SqlParameter() { ParameterName = "@RSN", SqlDbType = SqlDbType.Int, Value = Convert.ToInt32(ds.Tables[0].Rows[0]["RSN"].ToString()) },
              //new SqlParameter() { ParameterName = "@Es_Sec", SqlDbType = SqlDbType.Int, Value = 0 },
              new SqlParameter() { ParameterName = "@ES_Time", SqlDbType = SqlDbType.NVarChar, Value = "0" },
              new SqlParameter() { ParameterName = "@ES_Time_Min", SqlDbType = SqlDbType.NVarChar, Value = "0" },
              new SqlParameter() { ParameterName = "@ES_Time_Max", SqlDbType = SqlDbType.NVarChar, Value = "0" },
              new SqlParameter() { ParameterName = "@Complexity", SqlDbType = SqlDbType.Char, Value = "L" },
              new SqlParameter() { ParameterName = "@Invoice_Ref", SqlDbType = SqlDbType.NVarChar, Value = "In_" + ds.Tables[0].Rows[0]["Case_ID"].ToString() },
              new SqlParameter() { ParameterName = "@Status", SqlDbType = SqlDbType.Char, Value = "RJ" },
              new SqlParameter() { ParameterName = "@ImgType", SqlDbType = SqlDbType.Char, Value = "E" },
              new SqlParameter() { ParameterName = "@Remarks", SqlDbType = SqlDbType.VarChar, Value = txtRemarks.Text },
              new SqlParameter() { ParameterName = "@M_On", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
              new SqlParameter() { ParameterName = "@M_By", SqlDbType = SqlDbType.NVarChar, Value = Session["Userid"].ToString() });


            MailSend(ds.Tables[0].Rows[0]["CRO_ID"].ToString(), ds.Tables[0].Rows[0]["OpportunityNo"].ToString(), ds.Tables[0].Rows[0]["Case_ID"].ToString(), DateTime.Now.ToString("dd-MMM-yyyy hh:mm:tt"), "0", "RJ");
            WebMsgBox.Show("Details saved successfully.");
        }

        ClearScr();
    }


    public void MailSend(string croid, string OppId, string caseid, string uptime, string expTime, string status)
    {
        SqlProcsNew obj = new SqlProcsNew();
        DataSet ds = new DataSet();

        ds = obj.ExecuteSP("SP_LoadDetails",
            new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 9 },
            new SqlParameter() { ParameterName = "@CRO_Id", SqlDbType = SqlDbType.NVarChar, Value = croid },
            new SqlParameter() { ParameterName = "@MAILGRP", SqlDbType = SqlDbType.Char, Value = "SC" });

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            ANCRMMail mail = new ANCRMMail();
            String[] toId = new String[] { ds.Tables[0].Rows[0]["EMAILID"].ToString() };
            String[] ccId = new String[] { ds.Tables[0].Rows[0]["GRPMAILID"].ToString() };
            String[] bccId = ds.Tables[0].Rows[0]["BCCID"].ToString().Split(';');

            //String[] toId = new String[] { "rangan@innovatussystems.com" };
            //String[] ccId = new String[] { "roger@innovatussystems.com" };
            //String[] bccId = new String[] { "rangan.mca@gmail.com" };


            String Body = "", sub = "";
            if (status.Equals("BI"))
            {
                sub = "Better Image Required for Sectioning - Case Id : " + caseid;
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + " is not clear. Please send the proper image for Sectioning.";
            }
            else if (status.Equals("RJ"))
            {
                sub = "Case Id : " + caseid + " has been rejected";
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + " has been rejected. Only residential buildings containing upto 1+4 floors can be sectioned. ";
                Body = Body + "Please check in SMARTLite system.";
            }

            Body = Body + "<br/><br/><b>This is an auto generated mail from AkzoNobel Support System.</b><br/>";

            mail.SendMail(toId, ccId, Body, sub, bccId);
        }
    }






}