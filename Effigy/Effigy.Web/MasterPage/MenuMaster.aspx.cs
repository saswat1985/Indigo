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
    public partial class MenuMaster : BasePage
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
        public static IList<MenuDetails> GetMenuList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetMenuList();
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
            // return response;

        }


        [WebMethod]
        public static bool SaveMenu(MstMenuMaster objMstMenuMaster)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                objMstMenuMaster.UserEntryID = SessionWrapper.UserId;
                objMstMenuMaster.UserEntryDate = DateTime.Now;
                objMstService.InsertMenuMaster(objMstMenuMaster);
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