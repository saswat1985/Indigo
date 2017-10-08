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
                
                List<string> validUrls = new List<string>();
                
                IUserService objService = new UserService();

                IList<UrlEntriesVarifiedData> objUrlEntriesVarifiedDataList = new List<UrlEntriesVarifiedData>();


                for (int count = 0; count < rawUrls.Length; count++)
                {
                    if (CheckURLValid(rawUrls[count]))
                    {
                        validUrls.Add(rawUrls[count]);
                    }
                    else {
                        objUrlEntriesVarifiedDataList.Add(new UrlEntriesVarifiedData { Url = rawUrls[count], MasterId = 0, urlStatus = "R" });
                    }
                }
                IList< UrlEntriesVarifiedData> objVarifiedUrlsList =objService.ProcessRawUrls(SessionWrapper.UserId,validUrls);

                if (objVarifiedUrlsList!=null)
                {
                    foreach (var objVarifiedUrl in objVarifiedUrlsList)
                    {
                        objUrlEntriesVarifiedDataList.Add(objVarifiedUrl);
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

        public static bool CheckURLValid(string url)
        {
            string pattern = @"^(http|https|ftp|)\://|[a-zA-Z0-9\-\.]+\.[a-zA-Z](:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$";
            Regex reg = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            return reg.IsMatch(url);
        }
    }
    
}