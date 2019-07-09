using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json;

using System.Windows.Forms;



public partial class ImageUpload : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!IsPostBack)
            {
                if (Session["UserLevel"].ToString() == "1")
                {
                    btnLevelS.Visible = true;
                }
                else
                {
                    btnLevelS.Visible = false;
                }

                LoadDet();



               
            }

            

        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    protected void LoadDet()

    {
        try
        {
            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();

            dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
           new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 10 },
           new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
           new SqlParameter() { ParameterName = "@CaseID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = txtCaseID.Text });

            if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[1].Rows.Count > 0)
            {
                lblLUCaseID.Text = dsGrid.Tables[1].Rows[0]["Recent"].ToString();
            }

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }
    }


    protected void btnClick_Click(object sender, EventArgs e)
    {

        try
        {
            ldgImage.Visible = true;

            SqlProcsNew proc = new SqlProcsNew();
            DataSet dsGrid = new DataSet();

            DataSet dsCount = new DataSet();

            dsGrid = new DataSet();
            //dsMigrateContractor = proc.ExecuteSP("SP_GetContractorForMigration",
            //    new SqlParameter() { ParameterName = "@CGCode", Value = cgCode.ToString(), SqlDbType = SqlDbType.NVarChar });



            dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 10 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
            new SqlParameter() { ParameterName = "@CaseID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = txtCaseID.Text });

            if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
            {
                lblOppNo.Text = dsGrid.Tables[0].Rows[0]["OppNO"].ToString();
                lblCROID.Text = dsGrid.Tables[0].Rows[0]["CRO_ID"].ToString();
                lblCROName.Text = dsGrid.Tables[0].Rows[0]["Name"].ToString();
                lblCROEmailID.Text = dsGrid.Tables[0].Rows[0]["EmailID"].ToString();
                lblCROMobile.Text = dsGrid.Tables[0].Rows[0]["MobileNo"].ToString();
                lblRegion.Text = dsGrid.Tables[0].Rows[0]["Region"].ToString();
                lblZone.Text = dsGrid.Tables[0].Rows[0]["Zone"].ToString();
                lblDepot.Text = dsGrid.Tables[0].Rows[0]["Depot"].ToString();
                lblWorkType.Text = dsGrid.Tables[0].Rows[0]["PreviewType"].ToString();
                hdnPreviewType.Value = dsGrid.Tables[0].Rows[0]["PrevTypeCode"].ToString();

                lblMsg.Text = "Upload .jpeg or .jpg file for Digital Preview and .pdf file for Soft Copy preview.";

                txtCaseID.Enabled = false;

                if (dsGrid.Tables[0].Rows[0]["PrevTypeCode"].ToString() == "03")
                {
                    btnUpload.Visible = true;
                    RegularExpressionValidator1.Visible = true;
                    lblUploadSz1.Visible = true;
                    btnUpload2.Visible = false;
                    RegularExpressionValidator2.Visible = false;
                    lblUploadSz2.Visible = true;
                }

                else if (dsGrid.Tables[0].Rows[0]["PrevTypeCode"].ToString() == "04")

                {
                    btnUpload.Visible = false;
                    RegularExpressionValidator1.Visible = false;
                    lblUploadSz1.Visible = false;
                    btnUpload2.Visible = true;
                    RegularExpressionValidator2.Visible = true;
                    lblUploadSz2.Visible = true;
                }

                dsCount = proc.ExecuteSP("SP_SecFetchPreviewDetails",
                new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 12 },
                new SqlParameter() { ParameterName = "@CaseID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = txtCaseID.Text });


                if (dsCount.Tables[0].Rows.Count == 0)
                {
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                }
                else
                {
                    WebMsgBox.Show("File has already been uploaded for the given Case ID");
                    Panel2.Visible = false;
                    Panel3.Visible = true;
                    lblUplFileName.Text = dsCount.Tables[0].Rows[0]["Image_link"].ToString();
                }
            }
            else
            {
                WebMsgBox.Show("Invalid Case ID");
                //Panel2.Visible = false;
                ClearDetails();
            }
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (lblOppNo.Text != string.Empty && (btnUpload.FileName.ToString() != string.Empty || btnUpload2.FileName.ToString() != string.Empty))
        {
            SaveDetails();
        }
        else
        {
            WebMsgBox.Show("Please select the file to upload");
        }

    }


    protected void SaveDetails()
    {
        SqlProcsNew ObjProcs = new SqlProcsNew();

        DataSet ds = new DataSet();
        string imgVal;

        //HttpPostedFile file = btnUpload.PostedFile;
        //int iFileSize = file.ContentLength;
        //lblUploadSz1.Text = iFileSize.ToString();

        //HttpPostedFile file2 = btnUpload2.PostedFile;
        //int iFileSize2 = file2.ContentLength;
        //lblUploadSz2.Text = iFileSize2.ToString();

        //decimal size = Math.Round(((decimal)btnUpload.PostedFile.ContentLength / (decimal)1024), 2);
        //double fileSize = btnUpload.PostedFile.ContentLength;

        ds = ObjProcs.ExecuteSP("SP_SecFetchPreviewDetails",
             new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 11 },
            new SqlParameter() { ParameterName = "@CaseID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = txtCaseID.Text });


        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {



            if (hdnPreviewType.Value.ToString() == "03")
            {
                string strpath = System.IO.Path.GetExtension(btnUpload.FileName);
                if (strpath.ToUpper() == ".JPEG" || strpath.ToUpper() == ".JPG")
                {
                    if (strpath.ToUpper() == ".JPG")
                    {
                        imgVal = Path.ChangeExtension(btnUpload.FileName.ToString(), ".JPEG");
                    }
                    else
                    {
                        imgVal = btnUpload.FileName.ToString();
                    }

                }
                else
                {
                    WebMsgBox.Show("Please upload a .jpeg or .jpg file.");
                    return;
                }
            }
            else if (hdnPreviewType.Value.ToString() == "04")
            {
                string strpath2 = System.IO.Path.GetExtension(btnUpload2.FileName);
                if (strpath2.ToUpper() == ".PDF")
                {
                    imgVal = btnUpload2.FileName.ToString();
                }
                else
                {
                    WebMsgBox.Show("Please upload a .pdf file.");
                    return;
                }
            }
            else
            {
                imgVal = string.Empty;
            }

            string sts = string.Empty;
            string imgPath = string.Empty;


            //string folderPath = @"D:\SmartLite_UAT\ANCRM_Lite_NewRQ\SectionedImage\" + imgVal;
            //string folderPath = @"D:\Web_App\ANCRM_Lite\SectionedImage\" + imgVal;
            string folderPath = @"D:\SectionedImage\" + imgVal;

            //string folderPath2 = Path.ChangeExtension(folderPath, ".jpeg");

            sts = "SD";


            if (hdnPreviewType.Value.ToString() == "03")
            {
                btnUpload.PostedFile.SaveAs(folderPath);
            }
            else if (hdnPreviewType.Value.ToString() == "04")
            {
                btnUpload2.PostedFile.SaveAs(folderPath);
            }

            ////////int InsertCount = ObjProcs.ExecuteNonQuery("SP_InsertSectioningDtls",
            ////////new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 2 },
            ////////new SqlParameter() { ParameterName = "@CRO_Id", SqlDbType = SqlDbType.NVarChar, Value = ds.Tables[0].Rows[0]["CRO_Id"].ToString() },
            ////////new SqlParameter() { ParameterName = "@Opp_No", SqlDbType = SqlDbType.NVarChar, Value = ds.Tables[0].Rows[0]["OPPORTUNITYNO"].ToString() },
            ////////new SqlParameter() { ParameterName = "@Case_Id", SqlDbType = SqlDbType.NVarChar, Value = ds.Tables[0].Rows[0]["Case_Id"].ToString() },
            ////////new SqlParameter() { ParameterName = "@Es_Sec", SqlDbType = SqlDbType.Int, Value = Convert.ToInt32(30) },
            ////////new SqlParameter() { ParameterName = "@Es_Time", SqlDbType = SqlDbType.NVarChar, Value = Convert.ToString("30") },
            //////// new SqlParameter() { ParameterName = "@ES_Time_Min", SqlDbType = SqlDbType.NVarChar, Value = Convert.ToString("30") },
            ////////new SqlParameter() { ParameterName = "@ES_Time_Max", SqlDbType = SqlDbType.NVarChar, Value = Convert.ToString("60") },
            ////////new SqlParameter() { ParameterName = "@Complexity", SqlDbType = SqlDbType.Char, Value = Convert.ToString("L") },
            ////////new SqlParameter() { ParameterName = "@Invoice_Ref", SqlDbType = SqlDbType.NVarChar, Value = ds.Tables[0].Rows[0]["INVOICE_REF"].ToString() },
            ////////new SqlParameter() { ParameterName = "@Txn_Type", SqlDbType = SqlDbType.Char, Value = sts },
            ////////new SqlParameter() { ParameterName = "@Status", SqlDbType = SqlDbType.Char, Value = "20" },
            ////////new SqlParameter() { ParameterName = "@ImgType", SqlDbType = SqlDbType.Char, Value = "E" },
            ////////new SqlParameter() { ParameterName = "@Image_Link", SqlDbType = SqlDbType.NVarChar, Value = imgVal },
            ////////new SqlParameter() { ParameterName = "@Uploaded_Time", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
            ////////new SqlParameter() { ParameterName = "@Color_Notes", SqlDbType = SqlDbType.NVarChar, Value = ds.Tables[0].Rows[0]["COLOUR_NOTES"].ToString() },
            ////////new SqlParameter() { ParameterName = "@C_On", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
            ////////new SqlParameter() { ParameterName = "@C_By", SqlDbType = SqlDbType.NVarChar, Value = Session["Userid"].ToString() });
            ////////if (sts.Equals("SD"))
            ////////    MailSend(ds.Tables[0].Rows[0]["CRO_Id"].ToString(), lblOppNo.Text.ToString(), txtCaseID.Text.ToString(), DateTime.Now.ToString("dd-MMM-yyyy hh:mm:tt"), Convert.ToString("60"), sts);

            WebMsgBox.Show("File uploaded successfully.");
            ClearDetails();
            //Clear();
            //Response.Redirect("~/Sec_View.aspx",false);
        }


    }


    public void MailSend(string croid, string OppId, string caseid, string uptime, string expTime, string status)
    {
        //String tomail, string Caseid, String sitename, String croid, string croname, string cromail, string cromobile
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
            //String[] bccId = ds.Tables[0].Rows[0]["BCCID"].ToString().Split(';');

            String Body = "", sub = "";
            if (status.Equals("10"))
            {
                sub = "Image taken up for Sectioning - Case Id : " + caseid;
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + "  has been taken up by Innovatus Team for Sectioning. ";
                Body = Body + "You can expect to receive the sectioned image within " + expTime + "  Minutes. (Working hours)";
            }
            else if (status.Equals("BI"))
            {
                sub = "Better Image Required for Sectioning - Case Id : " + caseid;
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + " is not clear. Please send the proper image for Sectioning.";
                //if(!string.IsNullOrEmpty(TxtRemarks.Text))
                //    Body = Body + "<br/><b>Note: " + TxtRemarks.Text+"</b>";
                //Body = Body + "You can expect to receive the sectioned image within " + expTime + "  Minutes. (Working hours)";
            }
            else if (status.Equals("DI"))
            {
                sub = "Duplicate Image Occurred - Case Id : " + caseid;
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + "  has been already sectioned by Innovatus Team. ";
                Body = Body + "Please check in SMARTLite system.";
            }
            else if (status.Equals("SD"))
            {
                sub = "Ready for Preview - Case Id : " + caseid;
                Body = "Dear " + ds.Tables[0].Rows[0]["NAME"].ToString() + ",<br/><br/>";
                Body = Body + "&nbsp;&nbsp;&nbsp;The image that you had submitted for Opportunity Number :" + OppId + "  and Case Id : " + caseid + " is now ready for preview. ";
                Body = Body + "Please check in SMARTLite system.";
            }
            //if (!string.IsNullOrEmpty(TxtRemarks.Text))
            //    Body = Body + "<br/><b>Note: " + TxtRemarks.Text + "</b>";
            Body = Body + "<br/><br/><b>This is an auto generated mail from AkzoNobel Support System.</b><br/>";
            ////Body = Body + "<table style=margin-left:10px><tr><td>Case Id</td><td>:</td><td>" + caseid + "</td></tr>";
            ////Body = Body + "<tr><td>Opp No </td><td>:</td><td>" + OppId + "</td></tr>";
            ////Body = Body + "<tr><td>CRO Id</td><td>:</td><td>" + croid + "</td></tr>";
            ////Body = Body + "<tr><td>CRO Name</td><td>:</td><td>" + ds.Tables[0].Rows[0]["NAME"].ToString() + "</td></tr>";
            ////Body = Body + "<tr><td>CRO Email Id</td><td>:</td><td>" + ds.Tables[0].Rows[0]["EMAILID"].ToString() + "</td></tr>";
            ////Body = Body + "<tr><td>CRO Mobile No</td><td>:</td><td>" + ds.Tables[0].Rows[0]["MOBILENO"].ToString() + "</td></tr>";
            ////Body = Body + "<tr><td>Status Time </td><td>:</td><td>" + uptime + "</td></tr></table>";
            mail.SendMail(toId, ccId, Body, sub, bccId);
        }
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearDetails();
    }

    protected void ClearDetails()
    {
        txtCaseID.Text = string.Empty;
        lblOppNo.Text = String.Empty;
        lblCROID.Text = string.Empty;
        lblCROName.Text = string.Empty;
        lblCROEmailID.Text = string.Empty;
        lblCROMobile.Text = string.Empty;
        lblRegion.Text = string.Empty;
        lblZone.Text = string.Empty;
        lblDepot.Text = string.Empty;
        lblWorkType.Text = string.Empty;
        lblMsg.Text = string.Empty;
        lblUplFileName.Text = string.Empty;
        lblFileSize.Text = string.Empty;

        Panel2.Visible = false;
        Panel3.Visible = false;

        txtCaseID.Enabled = true;
        txtCaseID.Focus();

    }

    protected void btnPSummary_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewSummary.aspx");
    }

    protected void btnLevelS_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelSAdmin.aspx");
    }


    protected void btnRemove_Click(object sender, EventArgs e)
    {
        try
        {
            SqlProcsNew ObjPros = new SqlProcsNew();

            ObjPros.ExecuteNonQuery("SP_SecUpdateCaseID",
            new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 13 },
            new SqlParameter() { ParameterName = "@CaseID", SqlDbType = SqlDbType.NVarChar, Value = txtCaseID.Text },
            new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["Userid"].ToString() });

            WebMsgBox.Show("File removed successfully.");

            ClearDetails();
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }


    }

    protected void lnkFileSize_Click(object sender,EventArgs e)
    {
        if(btnUpload.HasFile)
        {
            try
            {

                int sizeinbytes = btnUpload.FileBytes.Length;
                sizeinbytes = sizeinbytes / 1024;
                lblFileSize.Text = " : " + sizeinbytes.ToString() + "KB";

                string strpath = System.IO.Path.GetExtension(btnUpload.FileName);
                lblFileName.Text = strpath;

            }

            catch (Exception ex)
            {
                MessageBox.Show("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
            }
        }

    }
}