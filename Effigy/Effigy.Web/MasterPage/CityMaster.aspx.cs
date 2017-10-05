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

namespace Effigy.Web.MasterPage
{
    public partial class CityMaster : BasePage
    {
        IMasterService objMstService = new MasterService();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillCountry();
                    FillState();
                    //BindCity();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }
        private void FillCountry()
        {
            try
            {
                IList<CountryMapper> objMstCountry = objMstService.GetCountry();
                Common.FillDDL<IList<CountryMapper>>(ddlCountry, objMstCountry, "CountryId", "CountryName", true);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);

            }
            finally { Dispose(); }
        }

        private void FillState()
        {
            try
            {
                IList<Entity.DBContext.ClsStateMaster> objMstState = objMstService.GetState();
                Common.FillDDL<IList<Entity.DBContext.ClsStateMaster>>(ddlState, null, "StateId", "StateName", true);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);

            }
            finally { Dispose(); }
        }



        [WebMethod]
        public static IList<CityMapper> GetCityList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                IList<CityMapper> objMstCity = objMstService.GetCities();
                return objMstCity;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
            // return response;

        }


        [WebMethod]
        public static bool SaveCity(Entity.DBContext.CityMapper objCityMaster)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                MstCity objMstCity = new MstCity();
                objMstCity.StateId = objCityMaster.StateId;
                objMstCity.IsActive = true;
                objMstCity.CityName = objCityMaster.CityName;
                objMstCity.CreatedBy = SessionWrapper.UserId;
                objMstCity.CreatedDate = DateTime.Now;
                objMstService.InsertCityDetail(objMstCity);
                return true;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }
        }

        [WebMethod]
        public static IList<MstStateData> GetStateByCountryId(int countryId)
        {
            IMasterService objMstService = new MasterService();
            try
            {
                IList<Entity.DBContext.ClsStateMaster> objMstState = objMstService.GetState(countryId);
                if (objMstState != null)
                {
                    var stateList = objMstState.Select(item => new MstStateData
                    {
                        StateId = item.StateID,
                        StateName = item.StateName
                    });
                    return stateList.ToList();
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

    }
}