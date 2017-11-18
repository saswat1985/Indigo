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
        private IMasterService objMstService = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            objServive = new UserDataEntry();
            objMstService = new MasterService();
            if (!IsPostBack)
            {
                ResetControls(true);
            }
        }

        protected void WebSiteStatusChange(object sender, EventArgs e)
        {
            //MstWebSiteStatu obj = objMstService.GetSingleRecord<MstWebSiteStatu>(P => P.WebSiteStatus == ddlWebSiteStatus.SelectedItem.Text);
            //if (obj!=null)
            //{
            string skipValidationWebStus = "2,3,5";
            if (skipValidationWebStus.Contains(ddlWebSiteStatus.SelectedValue))
            {
                ddlBusinessType.SelectedValue = "0";
                ddlIsAddress.SelectedValue = "false";
                ddlIsCity.SelectedValue = "false";
                ddlIsCompanyProfile.SelectedValue = "false";
                ddlIsCountry.SelectedValue = "false";
                ddlIsState.SelectedValue = "false";
                ddlDescProduct.SelectedItem.Text = "0";
                ddlImageProduct.SelectedItem.Text = "0";
                ddlNameProduct.SelectedItem.Text = "0";
                txtEmail.Text = "";
                txtPhone.Text = "";
            }
            else
            {
                ResetControls(false);
            }
            //}
        }

        protected void SubmitClick(object sender, EventArgs e)
        {
            tblUniqueURLAudit obj = new tblUniqueURLAudit();
            obj.BusinessType = Convert.ToInt32(ddlBusinessType.SelectedValue);
            obj.Email = txtEmail.Text;
            obj.IsAddressExist = ddlIsAddress.SelectedValue == "0" ? false : Convert.ToBoolean(ddlIsAddress.SelectedValue);
            obj.IsCityExist = ddlIsCity.SelectedValue == "0" ? false : Convert.ToBoolean(ddlIsCity.SelectedValue);
            obj.IsCountryExist = ddlIsCountry.SelectedValue == "0" ? false : Convert.ToBoolean(ddlIsCountry.SelectedValue);
            obj.IsProfileExist = ddlIsCompanyProfile.SelectedValue == "0" ? false : Convert.ToBoolean(ddlIsCompanyProfile.SelectedValue);
            obj.IsStateExist = ddlIsState.SelectedValue == "0" ? false : Convert.ToBoolean(ddlIsState.SelectedValue);
            obj.PhoneNo = txtPhone.Text;
            obj.ProductCount = Convert.ToInt32(ddlNameProduct.SelectedValue);
            obj.ProductDescCount = Convert.ToInt32(ddlDescProduct.SelectedValue);
            obj.ProductImageCount = Convert.ToInt32(ddlImageProduct.SelectedValue);
            obj.UniqueURL = txtWebSiteName.Text;
            objServive.InsertUniqueURLAudit(obj);
            ResetControls(true);

        }
        protected void ResetClick(object sender, EventArgs e)
        {
            ResetControls(true);
        }

        private void ResetControls(bool changeUrl )
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

            if (changeUrl)
            {
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
