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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        DownloadFile("1234");

    }


    protected void DownloadFile(String CaseID2)
    {
        string flagstatus = string.Empty;
        string FileName = "56649_Source.jpg";
        string ftp = "ftp://49.50.68.207:2125/SourceImage/";
        //string fullPath = ftp + ClientID + "/";


        if (FileName.Contains("56649_Source.jpg"))
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
                //Download the File.
                response.GetResponseStream().CopyTo(stream);
                Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(stream.ToArray());
                Response.End();
            }
        }
        else
        {
            flagstatus = "False";
        }


    }
}