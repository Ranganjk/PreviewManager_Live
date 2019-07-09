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
using System.Text;
using System.Web.Services;
using System.Net;

public partial class PreviewScheduler : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            try
            {
                SqlProcsNew proc = new SqlProcsNew();
                DataSet dsDT = null;
                RadMenu menu = new RadMenu();
                if (!IsPostBack)
                {
                    dsDT = proc.ExecuteSP("GetServerDateTime");
                    GetserverDateTime.Text = Convert.ToDateTime(dsDT.Tables[0].Rows[0][0].ToString()).ToString("ddd") + "   " + Convert.ToDateTime(dsDT.Tables[0].Rows[0][0].ToString()).ToString("dd-MMM-yyyy HH:mm 'Hrs.'"); ;


                    LoadGenDetails();
                    ////loadBCDetails();
                    GetDepartment();

                    //DataTable dt = this.GetData(0);
                    //PopulateMenu(dt, 0, null);

                }
            }
            catch (Exception ex)
            {

            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void lblSignOut_Click(object sender, EventArgs e)
    {


        //if (CnfResult.Value == "Yes")
        //{
        //    SqlProcsNew sqlobj = new SqlProcsNew();
        //    if (Session["UserLevel"].ToString() == "2")
        //    {
        //        sqlobj.ExecuteSQLNonQuery("SP_SecCheckUser",
        //        new SqlParameter() { ParameterName = "@iMode ", SqlDbType = SqlDbType.Int, Value = 3 },
        //        new SqlParameter() { ParameterName = "@UserId   ", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });
        //    }
        //    Response.Redirect("Login.aspx");
        //}
        //else
        //{
        //    return;
        //}

        if (CnfResult2.Value == "true")
        {

            SqlProcsNew sqlobj = new SqlProcsNew();
            
            if (Session["UserLevel"].ToString() == "1" || Session["UserLevel"].ToString() == "2" || Session["UserLevel"].ToString() == "5")
                {
                sqlobj.ExecuteSQLNonQuery("SP_SecCheckUser",
                new SqlParameter() { ParameterName = "@iMode ", SqlDbType = SqlDbType.Int, Value = 3 },
                new SqlParameter() { ParameterName = "@UserId   ", SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });
            }
            Response.Redirect("Login.aspx");
        }

    }

    protected void GetDepartment()
    {
        SqlProcsNew sqlobj = new SqlProcsNew();
        DataSet dsDept = null;


        dsDept = sqlobj.ExecuteSP("SP_SecCheckUser",
           new SqlParameter() { ParameterName = "@iMode", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 4 },
            new SqlParameter() { ParameterName = "@UserID", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.NVarChar, Value = Session["UserId"].ToString() });


        //Session["DeptCode"] = dsDept.Tables[0].Rows[0]["DeptCode"].ToString();

        lblUserId.Text = dsDept.Tables[0].Rows[0]["UserDet"].ToString();
        lblPreviewCentre.Text = dsDept.Tables[1].Rows[0]["PreviewCentre"].ToString();

        //lblDepartName.Text = dsDept.Tables[1].Rows[0]["DeptName"].ToString();
        //lblDeptAccess.Text = "(Has access to " ;
        //has access to

    }

    protected void LoadGenDetails()
    {
        try
        {
            //SqlProcsNew sqlobj = new SqlProcsNew();
            //DataSet dsGroup = null;
            //dsGroup = sqlobj.ExecuteSP("SP_FetchGenDetails",
            //    new SqlParameter() { ParameterName = "@IMODE", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 });

            //lblHospitalName.Text = dsGroup.Tables[0].Rows[0]["HospitalName"].ToString();
            //lblSoftName.Text = dsGroup.Tables[0].Rows[0]["NameOfSoft"].ToString();
            //lblVersionNo.Text = dsGroup.Tables[0].Rows[0]["VersionNo"].ToString();


            lblProjName.Text = "PREVIEW MANAGER";


        }
        catch (Exception ex)
        {

        }


    }

    protected void loadBCDetails()
    {
        try
        {
            DataSet dsSection = new DataSet();
            SqlProcsNew proc = new SqlProcsNew();

            dsSection = proc.ExecuteSP("SP_GetBCMessage",
                new SqlParameter() { ParameterName = "@BCRSN", Direction = ParameterDirection.Input, SqlDbType = SqlDbType.Int, Value = 1 });
            if (dsSection.Tables[1].Rows.Count > 0)
            {
                tblBCMessage.Visible = true;
                lblBCMessage1.Text = dsSection.Tables[0].Rows[0]["BCMsg1"].ToString();
                lblBCMessage2.Text = dsSection.Tables[0].Rows[0]["BCMsg2"].ToString();
            }
            else
            {
                tblBCMessage.Visible = false;
            }

        }
        catch (Exception ex)
        {

        }

    }



    private DataTable GetData(int parentMenuId)
    {
        string DCode = Session["DeptCode"].ToString();
        string query = "SELECT [MenuId], [Title], [Description], [Url] FROM [tblmenumaster] WHERE ParentMenuId = @ParentMenuId and charindex('" + DCode + "',Department)>0";
        //string query = "SELECT [MenuId], [Title], [Description], [Url] FROM [tblmenumaster2] WHERE ParentMenuId = @ParentMenuId";
        string constr = ConfigurationManager.ConnectionStrings["CovaiSoft"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Parameters.AddWithValue("@ParentMenuId", parentMenuId);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    private void PopulateMenu(DataTable dt, int parentMenuId, MenuItem parentMenuItem)
    {
        string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
        foreach (DataRow row in dt.Rows)
        {
            MenuItem menuItem = new MenuItem
            {
                Value = row["MenuId"].ToString(),
                Text = row["Title"].ToString(),
                NavigateUrl = row["Url"].ToString(),
                Selected = row["Url"].ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase)
            };
            if (parentMenuId == 0)
            {
                Menu1.Items.Add(menuItem);
                DataTable dtChild = this.GetData(int.Parse(menuItem.Value));
                PopulateMenu(dtChild, int.Parse(menuItem.Value), menuItem);
            }
            else
            {
                parentMenuItem.ChildItems.Add(menuItem);

            }

        }
    }


    //protected void RadMenu1_ItemDataBound(object sender, Telerik.Web.UI.RadMenuEventArgs e)
    //{
    //    SiteMapNode node = TryCast(e.Item.DataItem, SiteMapNode);
    //    if (!string.IsNullOrEmpty(node["target"]))
    //    {
    //        e.Item.Target = node["target"];
    //    }

    //    if (((e.Item.Text == "User Management")
    //                && (msUserType == "Standard")))
    //    {
    //        RadMenu1.Items.Remove(e.Item);
    //    }

    //}


    // protected void Page_Load(object sender, EventArgs e) {
    //        RadMenu menu;
    //        this.Page.Master.FindControl("rmenuDemoItems");
    //        RadMenu;
    //        menu.FindItemByText("Item1").Visible = true;
    //    }


    //protected void RadMenu1_PreRender(object sender, EventArgs e)
    //{
    //    foreach (RadMenuItem item in (sender as RadMenu).Items)
    //    {
    //        if (item.Items.Count > 0)
    //        {
    //            //foreach (RadMenuItem citem in item.Items)
    //            //{
    //            //    if (citem.Text != "MasterEntries")
    //            //    {
    //            //        citem.Visible = false;
    //            //    }
    //            //}
    //            if (item.Text == "MasterEntries")
    //            {
    //                foreach (RadMenuItem citem in  item.Items)
    //                {
    //                    if (citem.Text != "Department")
    //                    {
    //                        citem.Visible = false;
    //                    }
    //                }
    //            }
    //        }
    //    }
    //}



}
