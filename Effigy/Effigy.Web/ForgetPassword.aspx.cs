using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("myusername@gmail.com", "mypwd"),
                EnableSsl = true
            };
            client.Send("myusername@gmail.com", "myusername@gmail.com", "test", "testbody");
            return true;
        }

    }
}