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

namespace Effigy.Web.MasterPage
{
    public partial class ProductMaster : BasePage
    {
        IMasterService objMstService = new MasterService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtProductCode.Value = "TP-2";                
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static IList<ProductMapper> GetProductList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                IList<ProductMapper> objProductList = objMstService.GetUserCategory();
                return objProductList;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
          

        }

        [WebMethod]
        public static bool SaveUpdateCategory(ProductMapper objProduct)
        {
            try
            {
                IMasterService objMasterService = new MasterService();
                objProduct.ModifiedBy = SessionWrapper.UserId;
                objMasterService.InsertProductDetail(objProduct);
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