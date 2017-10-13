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
            string from = "tridev1983@outlook.com";
            string pwd = "Tridev@1983";
            IUserService objService = new UserService();
            UserData  obj=objService.GetUserByEmail(email);
            var client = new SmtpClient("smtp-mail.outlook.com", 587)
            {
                Credentials = new NetworkCredential(from, pwd),
                EnableSsl = true
            };
            client.Send(from, email, "Reset password for Effigy", "Your password is :"+obj.CurrentAddress);
            return true;
        }

    }
}

