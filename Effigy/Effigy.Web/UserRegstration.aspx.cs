using Effigy.Entity;
using Effigy.Entity.DBContext;
using Effigy.Service;
using Effigy.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Effigy.Web
{
    public partial class UserRegstration : System.Web.UI.Page
    {
        private Common objCom = new Common();
        IMasterService objService = new MasterService();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    IList<ProductMapper> objListCategory = objService.GetUserCategory();
                    Common.FillDDL<IList<ProductMapper>>(ddlCategory, objListCategory, "Id", "CategoryName", true);

                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

        }

        [WebMethod]
        public static bool UserRegistration(UserData objUserData)
        {
            try
            {
                IUserService objUserService = new UserService();
                objUserService.CreateNewUser(objUserData);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
            return false;
        }
    }
}