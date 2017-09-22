﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity.DBContext;
using Effigy.Service;
using Effigy.Utility;

namespace Effigy.Web.MasterPage
{
    public partial class BankMaster : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static MstBankMaster GetEditRecord(int id)
        {
            IMasterService objMstService = new MasterService();
            return objMstService.GetSingleRecord<MstBankMaster>(P => P.Id == id);
        }

        [WebMethod]
        public static IList<MstBankMaster> GetBanks()
        {
            try
            {
                IMasterService objMstService = new MasterService();
                return objMstService.GetAllBanks();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static bool SaveBank(int id, string bankName)
        {
            try
            {
                IMasterService objMstService = new MasterService();
                MstBankMaster objMstBankMaster = new MstBankMaster();
                objMstBankMaster.BankName = bankName;
                if (id > 0)
                {
                    objMstBankMaster.Id = id;
                }
                objMstBankMaster.UserEntryId = SessionWrapper.UserId;
                objMstBankMaster.UserEntryDate = DateTime.Now;
                objMstService.InsertBankMaster(objMstBankMaster);
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