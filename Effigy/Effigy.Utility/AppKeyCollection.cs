using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Effigy.Utility
{
    public static class AppKeyCollection
    {
        public static string WebSiteName { get; set; }

        public static string SmsUserName { get; set; }

        public static string SmsPwd { get; set; }

        public static string SmsSenderId { get; set; }

        public static string SmsDomain { get; set; }

        public static string FromMail { get; set; }

        public static string Subject { get; set; }

        public static string MobNoCheck { get; set; }

        public static string WelcomeNote { get; set; }

        public static string LocationAPI { get; set; }

        public static string NotificationSubject { get; set; }

        public static int CoupneCodeLength { get; set; }

        public static string HelpDeskNo { get; set; }

        public static string PaymentHours { get; set; }

        public static string EncryptionValue { get; set; }

        public static string XMLFilePath { get; set; }

        public static string ForgatPassword { get; set; }

        public static string EmailServer { get; set; }

        public static string EmailPassword { get; set; }

        public static int EmailPort { get; set; }

        static AppKeyCollection()
        {
            WebSiteName = ConfigurationManager.AppSettings["WEBSITENAME"].TrimString();
            SmsUserName = ConfigurationManager.AppSettings["SMSUSERNAME"].TrimString();
            SmsPwd = ConfigurationManager.AppSettings["SMSPWD"].TrimString();
            SmsSenderId = ConfigurationManager.AppSettings["SMSSENDERID"].TrimString();
            SmsDomain = ConfigurationManager.AppSettings["SMSDOMAIN"].TrimString();
            FromMail = ConfigurationManager.AppSettings["FromMailID"].TrimString();
            Subject = ConfigurationManager.AppSettings["ForgatPassword"].TrimString();
            MobNoCheck = ConfigurationManager.AppSettings["MOBNOCHECK"].TrimString();
            WelcomeNote = ConfigurationManager.AppSettings["WelcomeNote"].TrimString();
            LocationAPI = ConfigurationManager.AppSettings["LOCATIONAPI"].TrimString();
            NotificationSubject = ConfigurationManager.AppSettings["NOTIFICATION"].TrimString();
            CoupneCodeLength = Convert.ToInt32(ConfigurationManager.AppSettings["CoupneCodeLength"].TrimString());
            HelpDeskNo = ConfigurationManager.AppSettings["HELPDESKNO"].TrimString();
            PaymentHours = ConfigurationManager.AppSettings["PaymentHours"].TrimString();
            EncryptionValue=ConfigurationManager.AppSettings["EncryptionValue"].TrimString();
            XMLFilePath = ConfigurationManager.AppSettings["XMLPath"].TrimString();
            ForgatPassword = ConfigurationManager.AppSettings["ForgatPassword"].TrimString();
            EmailPort = Convert.ToInt32(ConfigurationManager.AppSettings["EmailPort"].TrimString());
            EmailServer = ConfigurationManager.AppSettings["EmailServer"].TrimString();
            EmailPassword = ConfigurationManager.AppSettings["EmailPassword"].TrimString();

        }




    }
}
