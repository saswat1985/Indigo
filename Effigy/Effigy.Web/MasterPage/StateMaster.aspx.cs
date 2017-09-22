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
    public partial class StateMaster : BasePage
    {
        MasterService objMstService = new MasterService();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillCountry();
                    //BindState();
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

        [WebMethod]
        public static IList<ClsStateMaster> GetStateList()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                IList<ClsStateMaster> objMstState = objMstService.GetState();
                return objMstState;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static bool SaveState(Entity.DBContext.ClsStateMaster objStateMaster)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                MstState objMstState = new MstState();
                objMstState.CountryID = objStateMaster.CountryID;
                objMstState.StateName = objStateMaster.StateName;
                objMstState.CreatedBy = SessionWrapper.UserId;
                objMstState.CreatedDate = DateTime.Now;
                objMstService.InsertStateDetail(objMstState);
                return true;
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return false;
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            try
            {
                MstState objMstState = new MstState();
                objMstState.StateName = txtStateName.Text.TrimString();
                objMstState.CountryID = Convert.ToInt32(ddlCountry.SelectedValue) != 0 ? Convert.ToInt32(ddlCountry.SelectedValue) : 1;
                objMstState.IsActive = true;
                objMstState.CreatedBy = SessionWrapper.UserId;
                objMstState.CreatedDate = System.DateTime.Now;
                objMstService.InsertStateDetail(objMstState);

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
            finally
            {
                Dispose();
            }
        }
    }
}