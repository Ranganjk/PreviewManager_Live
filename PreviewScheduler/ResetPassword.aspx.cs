using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ResetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
        
            if(!string.IsNullOrEmpty(Request.QueryString[0]))
            {
                string uname = Request.QueryString[0].ToString();
                txtUname.Text = uname;
            }
        }

    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        if(cnfresult.Value == "true")
        {
            SqlProcsNew obj = new SqlProcsNew();
            try
            {
                DataSet ds = new DataSet();

                ds = obj.ExecuteSP("SP_SecChangePassword",
                    new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 2 },
                    new SqlParameter() { ParameterName = "@Uname", SqlDbType = SqlDbType.NVarChar, Value = txtUname.Text.ToString() },
                    new SqlParameter() { ParameterName = "@pwd",SqlDbType = SqlDbType.NVarChar,Value = txtoldpwd.Text.ToString()});

                if(ds !=null && ds.Tables[0].Rows.Count > 0)
                {
                    obj.ExecuteSQLNonQuery("SP_SecChangePassword",
                     new SqlParameter() { ParameterName = "@Imode", SqlDbType = SqlDbType.Int, Value = 1 },
                     new SqlParameter() { ParameterName = "@Uname", SqlDbType = SqlDbType.NVarChar, Value = txtUname.Text.ToString() },
                     new SqlParameter() { ParameterName = "@pwd", SqlDbType = SqlDbType.NVarChar, Value = txtoldpwd.Text.ToString() },
                     new SqlParameter() { ParameterName = "@npwd", SqlDbType = SqlDbType.NVarChar, Value = txtnewpwd.Text.ToString() });
                    WebMsgBox.Show("Your password has been successfully changed.");
                }
                else
                {
                    WebMsgBox.Show("Incorrect User Id / Password.");
                }


                
               
            }
            catch(Exception ex)
            {
                WebMsgBox.Show(ex.ToString());
            }
        }
    }
    //protected void btnclear_Click(object sender, EventArgs e)
    //{
       
    //    txtUname.Text = string.Empty;
    //    txtoldpwd.Text = string.Empty;
    //    txtnewpwd.Text = string.Empty;
    //    txtcnfpwd.Text = string.Empty;
    //    this.Page.SetFocus(txtUname);
    //}
}