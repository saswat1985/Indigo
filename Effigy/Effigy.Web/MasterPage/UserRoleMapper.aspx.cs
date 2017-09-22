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
using System.Text;

namespace Effigy.Web.MasterPage
{
    public partial class UserRoleMapper : BasePage
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
        public static int[] GetSelectedRoles(int userId)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetSelectedRoles(userId);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
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
        public static IList<MstUserMaster> GetUsersBasicDetailList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetUsersBasicDetailList();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static string SaveUserRoleMapping(int userId, string selectedItems)
        {
            IMasterService objService = new MasterService();
            objService.SaveUserRoleMapping(userId, selectedItems,SessionWrapper.UserId);
            return "success";
        }
    }
}