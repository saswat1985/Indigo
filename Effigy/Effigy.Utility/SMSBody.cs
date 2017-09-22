using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.Utility
{
    public class SMSBody
    {
        public static string UserRegistrationMsg()
        {
            StringBuilder objSMSText = new StringBuilder();
            try
            {
                objSMSText.Append("Welcome to Data Registration-Traderzplanet,Thanks for registration.");
                objSMSText.Append(" Your User ID is:- @USERID and Password is:-@PASSWORD ");
                objSMSText.Append("Log on to @WEBSITELINK or call now on @HELPDESKNO");
            }
            catch (Exception)
            {
                throw;
            }
            return objSMSText.ToString();
        }
    }
}
