using Effigy.Service;
using System;
using Effigy.Entity.DBContext;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Effigy.Web.DataEntry
{
    public partial class URLAudit : BasePage
    {
        private IDataEntry objServive = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            objServive = new UserDataEntry();
            if (!IsPostBack)
            {
                Common.FillDDL(ddlIsAddress, Utility.UtilityMethods.GetBooleanList(), "Key", "Value", "Address", true);
                Common.FillDDL(ddlIsCity, Utility.UtilityMethods.GetBooleanList(), "Key", "Value", "City", true);
                Common.FillDDL(ddlIsCountry, Utility.UtilityMethods.GetBooleanList(), "Key", "Value", "Country", true);
                Common.FillDDL(ddlIsState, Utility.UtilityMethods.GetBooleanList(), "Key", "Value", "State", true);
                Common.FillDDL(ddlIsCompanyProfile, Utility.UtilityMethods.GetBooleanList(), "Key", "Value", "Company Profile", true);
                Common.FillDDL(ddlNameProduct, Utility.UtilityMethods.GetProductCount(), "Key", "Value", "Name of Product", true);
                Common.FillDDL(ddlImageProduct, Utility.UtilityMethods.GetProductCount(), "Key", "Value", "Image of Product", true);
                Common.FillDDL(ddlDescProduct, Utility.UtilityMethods.GetProductCount(), "Key", "Value", "Desc of Product", true);
                Common.FillDDL(ddlWebSiteStatus, objServive.GetWebSiteStatus(), "Id", "WebSiteStatus", "WebSite status", true);
                Common.FillDDL(ddlBusinessType, objServive.GetMstBusinessType(), "Id", "BusinessType", "Kind of Business", true);

                UniqueURLMapper url = objServive.GetUniqueURLRandom(4, 1).FirstOrDefault();
                if (url != null)
                {
                    txtWebSiteName.Text = url.UniqueURL;
                    ctrIframe.Attributes.Add("src", url.UniqueURL);
                }
            }
        }
    }
}