using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity.DBContext;
using Effigy.Service;

namespace Effigy.Web.UserProfile
{
    public partial class ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtUserName.Text = SessionWrapper.UserName;
            }

        }

        [WebMethod]
        public static string SavePassword(string password)
        {
            IUserService objService = new UserService();
            
            objService.ChangePassword(SessionWrapper.UserId, password);
            return "success";
        }
    }
}