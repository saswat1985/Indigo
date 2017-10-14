using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Utility
{
    public class EmailBody
    {
        public static string UserRegistrationEmail()
        {
            string emailContent = string.Empty;            
            try
            {

                StringBuilder SbMail = new StringBuilder();
                SbMail.AppendLine("<br>Dear User,</br>");
                SbMail.AppendLine("<br>Please find your Login detail below</br></P>");
                SbMail.AppendLine("<P><br>User Name :@userName</br>");
                SbMail.AppendLine("<br>Login Password :@password</br></br></P>");
                SbMail.AppendLine("<br>ReferralCode:@RCode</br></br></P>");
                SbMail.AppendLine("<P><br>Please login to " + AppKeyCollection.WebSiteName + " for access portal.</P>");
                SbMail.AppendLine("<br>Thanks & Regards</br>");
                SbMail.AppendLine("<br>Effigy Team</br>");
                SbMail.AppendLine("<br><br>***************************************************</br></br>");
                SbMail.AppendLine("<br>This is an auto generated email. Please do not reply to this email.</br>");
                SbMail.AppendLine("<br>***************************************************</br>");
                emailContent = SbMail.TrimString();
            }
            catch (Exception)
            {
                throw;
            }
            return emailContent;
        }
    }
}
