using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity;
using Effigy.Service;
using Effigy.Utility;

namespace Effigy.Web.DataEntry
{
    public partial class UrlEntry : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static IList<UrlEntriesVarifiedData> ProcessRawUrls(string[] rawUrls)
        {
            try
            {
                var validUrls = new List<string>();
                IDataEntry objService = new Service.DataEntry();
                var objUrlEntriesVarifiedDataList = new List<UrlEntriesVarifiedData>();
                foreach (var url in rawUrls)
                {
                    if (UtilityMethods.UrlIsValid(url))
                        validUrls.Add(url);
                    else
                        objUrlEntriesVarifiedDataList.Add(new UrlEntriesVarifiedData { Url = url, MasterId = 0, urlStatus = "R" });

                }
                if (validUrls.Count > 0)
                {
                    IList<UrlEntriesVarifiedData> objVarifiedUrlsList = objService.ProcessRawUrls(SessionWrapper.UserId, validUrls);
                    if (objVarifiedUrlsList != null)
                    {
                        objUrlEntriesVarifiedDataList.AddRange(objVarifiedUrlsList);
                    }
                }

                return objUrlEntriesVarifiedDataList;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        //public static bool CheckURLValid(string url)
        //{
        //    string pattern = @"^(http|https|ftp|)\://|[a-zA-Z0-9\-\.]+\.[a-zA-Z](:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$";
        //    Regex reg = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
        //    return reg.IsMatch(url);
        //}
    }

}