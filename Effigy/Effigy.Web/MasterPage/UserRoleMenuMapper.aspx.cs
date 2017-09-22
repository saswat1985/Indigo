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
    public partial class UserRoleMenuMapper : BasePage
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
        public static int?[] GetSelectedMenus(int roleId)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetSelectedMenus(roleId);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static string SaveMenuRoleMapping(MenuRoleMapper objMenuRoleMapper)
        {
            IMasterService objService = new MasterService();
            objMenuRoleMapper.CreatedBy = SessionWrapper.UserId;
            objMenuRoleMapper.CreatedDate = DateTime.Now;
            objService.SaveMenuRoleMapping(objMenuRoleMapper);
            return "success";
        }

        [WebMethod]
        public static IList<MenuDetails> GetMenuList()
        {
            IMasterService objService = new MasterService();
            IList<MenuDetails> objMenuDetailsLst = objService.GetMenuList();
            return objMenuDetailsLst;
        }   
    }
}