using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Utility
{
    public class MailSMSHandler
    {
        private string FromMail { get; set; }
        private string ToMail { get; set; }
        private string Body { get; set; }
        private Boolean IsHTML { get; set; }
        private string Subject { get; set; }

        private string SmsUserName { get; set; }
        private string SmsPwd { get; set; }
        private string SmsSenderId { get; set; }
        private string SmsDomain { get; set; }


        public MailSMSHandler()
        {
            //this.SmsUserName = AppKeyCollection.SmsUserName;
            //this.SmsPwd = AppKeyCollection.SmsPwd;
            //this.SmsSenderId = AppKeyCollection.SmsSenderId;
            //this.SmsDomain = AppKeyCollection.SmsDomain;


        }

        public MailSMSHandler(string m_FromMail, string m_ToMail, string m_Body, bool m_IsHTML, string m_Subject)
        {
            this.FromMail = m_FromMail;
            this.ToMail = m_ToMail;
            this.Subject = m_Subject;
            this.IsHTML = m_IsHTML;
            this.Body = m_Body;
        }

        public bool SendMail()
        {
            SmtpClient smtpClient = new SmtpClient();
            MailMessage message = new MailMessage();
            bool status = false;

            try
            {

                MailAddress fromAddress = new MailAddress(FromMail, "", System.Text.Encoding.UTF8);
                message.From = fromAddress;//here you can set address
                message.To.Add(ToMail);//here you can add multiple to
                message.Subject = Subject;//subject of email
                message.SubjectEncoding = Encoding.UTF8;
                message.IsBodyHtml = IsHTML;//To determine email body is html or not
                message.Body = Body;
                message.BodyEncoding = Encoding.UTF8;
                smtpClient.EnableSsl = true;
                smtpClient.Send(message);
                status = true;
            }

            catch (Exception ex)
            {
                throw ex;
                //throw exception here you can write code to handle exception here
            }

            return status;
        }

        public bool SendMailFromYahoo()
        {
            bool status = false;
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(FromMail, "", Encoding.UTF8);
                    mail.To.Add(ToMail);
                    mail.Subject = Subject;
                    mail.Body = Body;
                    mail.IsBodyHtml = true;
                    // Can set to false, if you are sending pure text.


                    using (SmtpClient smtp = new SmtpClient(AppKeyCollection.EmailServer, AppKeyCollection.EmailPort))
                    {
                        smtp.Credentials = new NetworkCredential(FromMail, AppKeyCollection.EmailPassword);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }
                status = true;
            }
            catch (Exception)
            {
                throw;
            }

            return status;

        }

        private static string APICall(string url)
        {
            try
            {
                HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
                HttpWebResponse httpResponse = (HttpWebResponse)httpreq.GetResponse();
                StreamReader objStreamReader = new StreamReader(httpResponse.GetResponseStream());
                string result = objStreamReader.ReadToEnd();
                objStreamReader.Close();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static bool SendSingleSMS(string smsElement, string mobileNo)
        {
            string result = string.Empty;
            bool issmssent = false;
            try
            {
                result = APICall("http://" + AppKeyCollection.SmsDomain + "/sendsms.php?username=" + AppKeyCollection.SmsUserName + "&password=" + AppKeyCollection.SmsPwd + "&sender=" + AppKeyCollection.SmsSenderId + "&mobile=" + mobileNo + "&message=" + smsElement + "&route=T");
                //result = APICall("http://" + AppKeyCollection.SmsDomain + "/SendMsg.aspx?uname=" + AppKeyCollection.SmsUserName + "&pass=" + AppKeyCollection.SmsPwd + "&send=" + AppKeyCollection.SmsSenderId + "&dest=" + mobileNo + "&msg=" + smsElement + "");
                if (UtilityMethods.IsNumber(result))
                    issmssent = true;
            }
            catch (Exception)
            {
                throw;
            }
            return issmssent;
        }

    }
}
