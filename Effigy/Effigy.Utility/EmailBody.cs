using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Utility
{
    public static class EmailBody
    {
        public static string UserRegistrationEmail()
        {
            string emailContent = string.Empty;
            try
            {
                StringBuilder SbMail = new StringBuilder();

                SbMail.AppendLine("<br>Dear User,</br>");
                SbMail.AppendLine("<br>Welcome to SNPL counted as a reputed service provider, With years of experience and our expertise we are engaged to outsource various genuine and long term projects, </br>");
                SbMail.AppendLine("<br>we have plenty of satisfied vendors and delivery associates in pan India.Below are the your login credentials, please use the same while login</br>");
                SbMail.AppendLine("<br>Please find your Login detail below</br>");
                SbMail.AppendLine("<br>User Name :<b>@userName</b></br>");
                SbMail.AppendLine("<br>Login Password :<b>@password</b></br>");
                SbMail.AppendLine("<br>ReferralCode:<b>@RCode</b>(Please use or share the same while engaging the some one else with our system)</br>");
                SbMail.AppendLine("<br>Please login to " + AppKeyCollection.WebSiteName + " for access portal.");
                SbMail.AppendLine("<br>To read terms & conditions and privacy policy <a href='#'>click here</a></br>");
                SbMail.AppendLine("<br>For any query feel free to call our customer care no i.e " + AppKeyCollection.HelpDeskNo + " (10am-7pm)</br>");
                SbMail.AppendLine("<br>Thanks & Regards</br>");
                SbMail.AppendLine("<br>SNPL Team</br>");
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

        public static string ForgetPassword()
        {
            string emailContent = string.Empty;
            try
            {
                StringBuilder sbMail = new StringBuilder();
                sbMail.AppendLine("<br>Dear @fullName,</br>");
                sbMail.AppendLine("<br>As requested, please check your user id and password detail below</br>");
                sbMail.AppendLine("<br>User Name :<b>@userName</b></br>");
                sbMail.AppendLine("<br>Login Password :<b>@password</b></br>");
                sbMail.AppendLine("<br>As always, thank you for using TraderzPlanet!!</br>");
                sbMail.AppendLine("<br>Thanks & Regards</br>");
                sbMail.AppendLine("<br>TraderzPlanet Team</br>");
                sbMail.AppendLine("<br><br>***************************************************</br></br>");
                sbMail.AppendLine("<br>This is an auto generated email. Please do not reply to this email.</br>");
                sbMail.AppendLine("<br>***************************************************</br>");
                emailContent = sbMail.TrimString();

            }
            catch (Exception)
            {
                throw;
            }
            return emailContent;
        }
    }
}
