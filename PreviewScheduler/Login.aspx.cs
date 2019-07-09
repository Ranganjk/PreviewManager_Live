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
using System.Text;
using System.Web.Services;

public partial class Login : System.Web.UI.Page
{  
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet dsDT = null;
        if (!IsPostBack)
        {
            txtUserId.Focus();
            LoadGenDetails();
            dsDT = proc.ExecuteSP("GetServerDateTime");
            GetserverDateTime.Text = Convert.ToDateTime(dsDT.Tables[0].Rows[0][0].ToString()).ToString("ddd") + "   " + Convert.ToDateTime(dsDT.Tables[0].Rows[0][0].ToString()).ToString("dd-MMM-yyyy HH:mm 'Hrs'"); ;
        }
    }

    protected void LoadGenDetails()
    {
        try
        {
            //SqlProcsNew sqlobj = new SqlProcsNew();
            //DataSet dsGroup = null;
            //dsGroup = sqlobj.ExecuteSP("SP_FetchGenDetails",
            //    new SqlParameter() { ParameterName = "@IMODE", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 });

            //lblProjName.Text = dsGroup.Tables[0].Rows[0]["HospitalName"].ToString();
            //lblSoftName.Text = dsGroup.Tables[0].Rows[0]["NameOfSoft"].ToString();
            //lblVersionNo.Text = dsGroup.Tables[0].Rows[0]["VersionNo"].ToString();



            lblProjectName.Text = "PREVIEW MANAGER";
            //lblSoftName.Text = "Jaishree";
            //lblVersionNo.Text ="Sharvesh";



        }
        catch (Exception ex)
        {

        }


    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlProcsNew sqlobj = new SqlProcsNew();

            if (txtUserId.Text != String.Empty && txtPassword.Text != String.Empty)
            {
                DataSet ds = new DataSet();
                ds = sqlobj.ExecuteSP("SP_SecCheckUser",
                    new SqlParameter() { ParameterName = "@iMode", SqlDbType = SqlDbType.Int, Value = 1 },
                    new SqlParameter() { ParameterName = "@UserId", SqlDbType = SqlDbType.NVarChar, Value = txtUserId.Text },
                    new SqlParameter() { ParameterName = "@Password", SqlDbType = SqlDbType.NVarChar, Value = txtPassword.Text });

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["UserId"] = ds.Tables[0].Rows[0]["UserId"];
                    Session["UserLevel"] = ds.Tables[0].Rows[0]["UserLevel"];

                    if (ds.Tables[0].Rows[0]["UserLevel"].ToString() == "1" || ds.Tables[0].Rows[0]["UserLevel"].ToString() == "2" || ds.Tables[0].Rows[0]["UserLevel"].ToString() == "5")
                    {
                        sqlobj.ExecuteSQLNonQuery("SP_SecCheckUser",
                        new SqlParameter() { ParameterName = "@iMode ", SqlDbType = SqlDbType.Int, Value = 2 },
                        new SqlParameter() { ParameterName = "@UserId   ", SqlDbType = SqlDbType.NVarChar, Value = txtUserId.Text });
                    }


                    //Response.Redirect("DoctorAppointment.aspx?SFR=2&PRSN=0", false);
                    if (Session["UserLevel"].ToString() == "1" || Session["UserLevel"].ToString() == "10")
                    {
                        Response.Redirect("PreviewLevelSAdmin.aspx");
                        //return;
                    }

                    else if (Session["UserLevel"].ToString() == "2" || Session["UserLevel"].ToString() == "20")
                    {
                        Response.Redirect("PreviewLevelS.aspx");
                    }
                    else if (Session["UserLevel"].ToString() == "3" || Session["UserLevel"].ToString() == "30")
                    {
                        Response.Redirect("PreviewLevelSQC.aspx");

                    }

                    else if (Session["UserLevel"].ToString() == "5" || Session["UserLevel"].ToString() == "50")
                    {
                        //Response.Redirect("ImageUpload.aspx",false);

                        //Server.Transfer("ImageUpload2.aspx",false);

                        Response.Redirect("ImageUpload.aspx", false);

                    }

                }
                else
                {
                    WebMsgBox.Show("Incorrect User Id / Password.");
                }
            } 
            else
            {
                WebMsgBox.Show("Please enter User Id / Password.");
            }
        }
        catch (Exception ex)
        {
            WebMsgBox.Show(ex.Message.ToString());
        }
    }
    protected void lnlchangepwd_Click(object sender, EventArgs e)
    {
        if(txtUserId.Text != "")
        {
            Session["rUname"] = txtUserId.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Function", "PopupChngpwd()", true);
        }
        else
        {
            WebMsgBox.Show("Please enter the User Id.");
        }
    }
}