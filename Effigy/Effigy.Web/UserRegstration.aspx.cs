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
                return true;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }

        }

        [WebMethod]
        public static bool CheckRefrealCode(string refrealCode)
        {
            try
            {
                IUserService objUserService = new UserService();
                return objUserService.IsRefferalCodeExist(refrealCode) ? true : false;

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }

        }

        [WebMethod]
        public static bool IsDuplicateMobile(string mobileNo)
        {
            try
            {
                IUserService objUserService = new UserService();
                return objUserService.IsDuplicateMobileNo(mobileNo) ? true : false;

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }

        }
        [WebMethod]
        public static bool IsDuplicateEmail(string emailId)
        {
            try
            {
                IUserService objUserService = new UserService();
                return objUserService.IsDuplicateEmailId(emailId) ? true : false;

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }

        }
    }
}