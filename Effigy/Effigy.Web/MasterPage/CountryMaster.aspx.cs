using System;
using System.Collections.Generic;
using Effigy.Service;
using Effigy.Utility;
using Effigy.Entity.DBContext;
using System.Net.Http;
using System.Web.Services;
using System.Net.Http.Formatting;

namespace Effigy.Web.MasterPage
{
    public partial class CountryMaster : BasePage
    {
        IMasterService objMstService = new MasterService();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //this is a test comment saswatt
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

        }

        [WebMethod]
        public static IList<CountryMapper> GetCountryList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                IList<CountryMapper> objMstCountry = objMstService.GetCountry();
                return objMstCountry;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }

        }

        [WebMethod]
        public static bool SaveCountry(CountryMapper objCountryMaster)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                MstCountry objMstCountry = new MstCountry();
                objMstCountry.CountryName = objCountryMaster.CountryName;
                objMstCountry.CreatedBy = SessionWrapper.UserId;
                objMstCountry.CreatedDate = DateTime.Now;
                objMstCountry.IsActive = true;
                objMstService.InsertCountryDetail(objMstCountry);
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