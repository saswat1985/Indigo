using Effigy.Service;
using Effigy.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity.DBContext;
using System.Web.Services;
using Effigy.Entity.Entity;

namespace Effigy.Web.MasterPage
{
    public partial class UserRoleMaster : BasePage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }
      
        
       
        [WebMethod]
        public static IList<Entity.Entity.UserRoleMaster> GetUserRoleList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetUserRoleList();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }


        [WebMethod]
        public static bool SaveUserRole(aspnet_Roles objUserRoleMaster)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                objUserRoleMaster.UserEntryID = SessionWrapper.UserId;
                objUserRoleMaster.UserEntryDate = DateTime.Now;
                objMstService.InsertUserRoleMaster(objUserRoleMaster);
                return true;
            }
            catch (Exception ex)
            {

                Logger.Error(ex);
                return false;
            }
        }
    }
}