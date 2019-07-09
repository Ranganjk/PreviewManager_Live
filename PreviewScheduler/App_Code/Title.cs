using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for Title
/// </summary>
public class Title : System.Web.UI.Page
{
    public Title()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void GetTitle(Page p, int menuid)
    {
        SqlProcsNew proc = new SqlProcsNew();
        DataSet ds = null;
        ds = proc.ExecuteSP("SP_FetchMenuTitle",
        new SqlParameter() { ParameterName = "@MenuID", SqlDbType = SqlDbType.Int, Value = menuid });
        if (ds.Tables[0].Rows.Count > 0)
        {

            Label MenuTitle = (Label)p.Master.FindControl("lblMenuTitle");
            MenuTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
            MenuTitle.ToolTip = "Users in these department(s) have access to this screen -" + ds.Tables[0].Rows[0]["DeptCode"].ToString();
        }
    }


}