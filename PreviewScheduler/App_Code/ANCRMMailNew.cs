using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.Net.Security;

/// <summary>
/// Class to send mail
/// </summary>
public class ANCRMMail
{

    public bool SendMail(string[] tomailID, string[] ccMail, string body, string subject)
    {
        try
        {
            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();

            foreach (string toMail in tomailID)
            {
                if(!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }

            foreach (string ccMailID in ccMail)
            {
                if (!string.IsNullOrEmpty(ccMailID))
                    msg.CC.Add(ccMailID);   
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            SmtpClient smtp=new SmtpClient(smtpServer);
            smtp.Port=port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID,mailPassword);
            smtp.EnableSsl=true;
            smtp.Send(msg);
            return true;
            
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool SendMail(string[] tomailID, string[] ccMail,  string body, string subject, string[] bccMail)
    {
        try
        {
            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();
           
            foreach (string toMail in tomailID)
            {
                if (!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }

            foreach (string ccMailID in ccMail)
            {
                if (!string.IsNullOrEmpty(ccMailID))
                    msg.CC.Add(ccMailID);
            }
            foreach (string bccMailID in bccMail)
            {
                if (!string.IsNullOrEmpty(bccMailID))
                    msg.Bcc.Add(bccMailID);
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            SmtpClient smtp = new SmtpClient(smtpServer);
            smtp.Port = port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID, mailPassword);
            smtp.EnableSsl = true;
            smtp.Send(msg);
            return true;

        }
        catch (Exception ex)
        {
            return false;
        }
    }
    //added from, to , cc, body sub - parameters-  menaga - 27-dec-2012 - for request -frommail RO, CCMail RO, tomail Admin
    public bool SendMail(string mailFromID, string[] tomailID, string[] ccMail, string body, string subject)
    {
        try
        {

            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();
            
           foreach (string toMail in tomailID)
            {
                if (!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }

            foreach (string ccMailID in ccMail)
            {
                if (!string.IsNullOrEmpty(ccMailID))
                    msg.CC.Add(ccMailID);
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            SmtpClient smtp = new SmtpClient(smtpServer);
            smtp.Port = port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID, mailPassword);
            smtp.EnableSsl = true;
            smtp.Send(msg);
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }


    public bool SendMail(string[] tomailID, string[] ccMailID, string[] attachment, string body, string subject)
    {
        try
        {

            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();
            
            foreach (string toMail in tomailID)
            {
                if(!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }

            foreach (string ccMail in ccMailID)
            {
                if (!string.IsNullOrEmpty(ccMail))
                    msg.CC.Add(ccMail);
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            System.Net.Mail.Attachment attachMail;
            foreach (string attach in attachment)
            {
                if (!string.IsNullOrEmpty(attach))
                {
                    attachMail = new Attachment(attach);
                    msg.Attachments.Add(attachMail);
                }
            }

            SmtpClient smtp = new SmtpClient(smtpServer);
            smtp.Port = port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID, mailPassword);
            smtp.EnableSsl = true;
            smtp.Send(msg);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool SendMail(string[] tomailID, string[] ccMailID, string[] bccMailID, string[] attachment, string body, string subject)
    {
        try
        {

            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();
            
            foreach (string toMail in tomailID)
            {
                if (!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }

            foreach (string ccMail in ccMailID)
            {
                if (!string.IsNullOrEmpty(ccMail))
                    msg.CC.Add(ccMail);
            }
            foreach (string bccMail in bccMailID)
            {
                if (!string.IsNullOrEmpty(bccMail))
                    msg.Bcc.Add(bccMail);
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            System.Net.Mail.Attachment attachMail;
            foreach (string attach in attachment)
            {
                if (!string.IsNullOrEmpty(attach))
                {
                    attachMail = new Attachment(attach);
                    msg.Attachments.Add(attachMail);
                }
            }

            SmtpClient smtp = new SmtpClient(smtpServer);
            smtp.Port = port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID, mailPassword);
            smtp.EnableSsl = true;
            smtp.Send(msg);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public bool SendMail(string mailFromID, string[] tomailID, string body, string subject)
    {
        try
        {
            string fromID = ConfigurationManager.AppSettings["AkzoMailID"].ToString();
            string mailPassword = ConfigurationManager.AppSettings["AkzoPassword"].ToString();
            string smtpServer = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int port = Convert.ToInt16(ConfigurationManager.AppSettings["Port"].ToString());
            NetworkCredential loginInfo = new NetworkCredential(fromID, mailPassword);
            MailMessage msg = new MailMessage();
           
            foreach (string toMail in tomailID)
            {
                if (!string.IsNullOrEmpty(toMail))
                    msg.To.Add(toMail);
            }
            msg.From = new MailAddress(fromID);
            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            SmtpClient smtp = new SmtpClient(smtpServer);
            smtp.Port = port;
            smtp.Credentials = new System.Net.NetworkCredential(fromID, mailPassword);
            smtp.EnableSsl = true;
            smtp.Send(msg);
            return true;
        }
        catch (Exception ex)
        {
            //WebMsgBox.Show(ex.Message.ToString());
            return false;
        }
    }


    public static bool ValidateServerCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }

    public bool SendMail(string[] toMail, string p, string msgcontent, string strSubject)
    {
        throw new NotImplementedException();
    }
}
