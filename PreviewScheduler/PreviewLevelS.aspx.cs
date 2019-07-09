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
using System.Collections;
using System.Web.Services;
using Newtonsoft.Json;
using System.Windows.Forms;




public partial class PreviewLevelS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            
            if (!IsPostBack)
            {
                SqlProcsNew sqlobj = new SqlProcsNew();

                try
                {
                    DataSet ds = new DataSet();
                    ds = sqlobj.ExecuteSP("SP_SecCheckUser",
                        new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 5 },
                        new SqlParameter() { ParameterName = "@UserId", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                    }
                    else
                    {
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                    }

                    LoadSubmitted();
                    LoadAssigned();
                }
                catch (Exception ex)
                {

                }



            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LoadSubmitted()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 2 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        rdgPreviewDet.DataSource = dsGrid.Tables[0];
        rdgPreviewDet.DataBind();

        //if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        //{
        //    rdgPreviewDet.DataSource = dsGrid.Tables[0];
        //    rdgPreviewDet.DataBind();
        //}
        //else
        //{
        //    rdgPreviewDet.DataSource = new String[] { };
        //    rdgPreviewDet.DataBind();
        //}



    }

    protected void LoadAssigned()
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsGrid = new DataSet();


        dsGrid = proc.ExecuteSP("SP_SecFetchPreviewDetails",
            new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 3 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });

        //lblDrInQueue.Text = "In Queue: " + dsGrid.Tables[0].Rows.Count.ToString();

        if (dsGrid != null && dsGrid.Tables.Count > 0 && dsGrid.Tables[0].Rows.Count > 0)
        {
            rdgPreviewDet2.DataSource = dsGrid.Tables[0];
            rdgPreviewDet2.DataBind();
        }
        else
        {
            rdgPreviewDet2.DataSource = new String[] { };
            rdgPreviewDet2.DataBind();
        }



    }

    protected void LnkbtnCaseID_Click(object sender, EventArgs e)
    {
        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();
            if (CnfResult.Value == "true")
            {
                string CaseID, FileName;
                LinkButton lnkBtnCaseID = (LinkButton)sender;
                GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

                CaseID = row.Cells[3].Text.ToString();
                FileName = row.Cells[12].Text.ToString();

                DataSet ds = new DataSet();
                ds = sqlobj.ExecuteSP("SP_SecCheckUser",
                    new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 6 },
                    new SqlParameter() { ParameterName = "@CaseID", SqlDbType = SqlDbType.NVarChar, Value = CaseID });

                if (ds.Tables[0].Rows.Count > 0)
                {
                    sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                         new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 1 },
                         new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                         new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });

                    DownloadFile(FileName);

                    //LoadAssigned();

                    //Panel1.Visible = false;
                    //Panel2.Visible = true;                     



                    //Response.Redirect("PreviewLevelS.aspx");

                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "javascript:location.reload(true);", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Already Selected');", true);
                    //Response.Redirect(Request.RawUrl, false);
                }






            }
        }
        catch (Exception ex)
        {
            //WebMsgBox.Show(ex.Message.ToString());
        }
        finally
        {
            ////Sends the response buffer
            //HttpContext.Current.Response.Flush();
            //// Prevents any other content from being sent to the browser
            //HttpContext.Current.Response.SuppressContent = true;
            ////Directs the thread to finish, bypassing additional processing
            //HttpContext.Current.ApplicationInstance.CompleteRequest();
            ////Suspends the current thread
            ////Thread.Sleep(1);            
        }


    }



    protected void LnkbtnCaseID_Click2(object sender, EventArgs e)
    {



        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();
            if (CnfResult.Value == "true")
            {
                string CaseID;
                LinkButton lnkBtnCaseID = (LinkButton)sender;
                GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

                CaseID = row.Cells[3].Text.ToString();
                //CaseID = row.Cells[4].Text.ToString();
                //CaseID = row.Cells[5].Text.ToString();
                //CaseID = row.Cells[6].Text.ToString();

                //CustomerRSN = Session["CustomerRSN"].ToString();


                sqlobj.ExecuteSQLNonQuery("SP_SecUpdateCaseID",
                          new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 2 },
                          new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() },
                          new SqlParameter() { ParameterName = "@CaseId", SqlDbType = SqlDbType.NVarChar, Value = CaseID });


                LoadSubmitted();

                Panel1.Visible = true;
                Panel2.Visible = false;
            }

        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }

    }

    protected void Lnkbtnview_Click(object sender, EventArgs e)
    {
        string CaseID;
        LinkButton lnkBtnCaseID = (LinkButton)sender;
        GridDataItem row = (GridDataItem)lnkBtnCaseID.NamingContainer;

        CaseID = row.Cells[3].Text.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "win",
        "<script language='javascript'> var iMyWidth;var iMyHeight;  window.open('CaseIDPopup.aspx?CaseID=" + CaseID + "','NewWin','status=no,height=350,width=400 ,resizable=No,left=1500,top=250,screenX=100,screenY=150,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no,   NewWin.focus()')</script>", false);
    }

    protected void btnLevelD_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelD.aspx?@UserID=" + Session["UserId"].ToString());

    }

    protected void grdAccountStatement_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadSubmitted();
    }
    protected void grdAccountStatement_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadSubmitted();
    }

    protected void grdTest_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridFilteringItem)
        {
            GridFilteringItem filterItem = (GridFilteringItem)e.Item;

            filterItem["CaseID"].HorizontalAlign = HorizontalAlign.Right;

            LoadSubmitted();


        }
    }

    protected void grdAccountStatement_ItemCommand2(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        LoadAssigned();
    }
    protected void grdAccountStatement_PageIndexChanged2(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        LoadAssigned();
    }

    protected void grdTest_ItemDataBound2(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem griditem = e.Item as GridDataItem;

            if (!griditem["StatusCode"].Text.Equals("10"))
            {

                LinkButton lnk = (LinkButton)griditem.FindControl("lnkbtnStatus");
                lnk.Enabled = false;
                lnk.ForeColor = System.Drawing.Color.Gray;
            }
            else
            {
                griditem.BackColor = System.Drawing.Color.Aqua;
            }


            if (griditem["ImgType"].Text.Equals("Soft Copy"))
            {                
                griditem.BackColor = System.Drawing.Color.Yellow; 
            }

        }
    }

    protected void DownloadFile(String FileName)
    {
        string flagstatus = string.Empty;
        string ftp = "ftp://49.50.68.207:2125/SourceImage/";
        //string FileName = CaseID + "_Source.jpg";
        try
        {

            if (FileName.Contains(FileName))
            {
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp + FileName);
                request.Method = WebRequestMethods.Ftp.DownloadFile;

                //Enter FTP Server credentials.
                request.Credentials = new NetworkCredential("ftpadmin", "@kz0$&D0c12");
                request.UsePassive = true;
                request.UseBinary = true;
                request.EnableSsl = false;

                //Fetch the Response and read it into a MemoryStream object.
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                using (MemoryStream stream = new MemoryStream())
                {
                    response.GetResponseStream().CopyTo(stream);
                    Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(stream.ToArray());
                    //Response.Flush();
                    //Response.End();


                }
            }
            else
            {
                flagstatus = "False";
            }
        }
        catch (WebException ex)
        {
            throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
        }


    }



    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        Response.Redirect("PreviewLevelS.aspx");
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "onload", "javascript:location.reload(true);", true);

        //LoadAssigned();

        //Panel1.Visible = false;
        //Panel2.Visible = true;        

    }
}