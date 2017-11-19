using Effigy.Service;
using System;
using Effigy.Entity.DBContext;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Effigy.Utility;

namespace Effigy.Web.DataEntry
{
    public partial class URLAudit : BasePage
    {

        [WebMethod]
        public static string GetRandomUrl()
        {
            try
            {
                UserDataEntry objService = new UserDataEntry();
                UniqueURLMapper url = objService.GetUniqueURLRandom(4, 1).FirstOrDefault();
                if (url != null)
                {
                    return url.UniqueURL;
                }
                return null;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }

        }


        [WebMethod]
        public static string Save(tblUniqueURLAudit obj)
        {
            try
            {
                UserDataEntry objService = new UserDataEntry();
                obj.UserEffectedDate = DateTime.Now;
                obj.UserEntryDate = DateTime.Now;
                obj.UserEntryId = SessionWrapper.UserId;
                objService.InsertUniqueURLAudit(obj);
                return "success";
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }

        }

        [WebMethod]
        public static UrlAuditMasterData GetMastersData()
        {
            try
            {
                UserDataEntry objService = new UserDataEntry();
                UrlAuditMasterData obj = new UrlAuditMasterData();
                obj.BooleanDropDownData = Utility.UtilityMethods.GetBooleanList().ToList();
                obj.ProductCountList = Utility.UtilityMethods.GetProductCount().ToList();
                obj.BusinessTypeList = objService.GetMstBusinessType();
                obj.WebSiteStatusList = objService.GetWebSiteStatus();
                UniqueURLMapper url = objService.GetUniqueURLRandom(4, 1).FirstOrDefault();
                if (url != null)
                {
                    obj.UniqueURLRandom = url.UniqueURL;
                }

                return obj;

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }
    }
    public class UrlAuditMasterData
    {
        public List<KeyValuePair<string, string>> BooleanDropDownData { get; set; }
        public List<KeyValuePair<string, string>> ProductCountList { get; set; }
        public IList<WebSiteStatusMapper> WebSiteStatusList { get; set; }
        public IList<BusinessTypeMapper> BusinessTypeList { get; set; }
        public string UniqueURLRandom { get; set; }

    }
}
