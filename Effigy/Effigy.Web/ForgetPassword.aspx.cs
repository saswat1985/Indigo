using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity;
using Effigy.Entity.DBContext;
using Effigy.Service;
using Effigy.Utility;

namespace Effigy.Web
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        [WebMethod]
        public static bool ForgotPassword(string email)
        {
            bool isMailSend = false;
            try
            {
                IUserService objService = new UserService();
                UserData objUser = objService.GetUserByEmail(email);
                if (objUser != null)
                {
                    string fullName = objUser.FirstName + " " + objUser.LastName;
                    string emailBody = objService.GetForgetPasswordEmailBody(fullName, objUser.UserName, objUser.Password);
                    isMailSend = new MailSMSHandler(AppKeyCollection.FromMail, objUser.EmailId, emailBody, true, AppKeyCollection.ForgatPassword).sendMail();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

            return isMailSend;
        }

    }
}

