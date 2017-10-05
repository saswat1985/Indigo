using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity;
using Effigy.Entity.DBContext;
using Effigy.Entity.Entity;
using Effigy.Service;
using Effigy.Utility;

namespace Effigy.Web.UserProfile
{
    public partial class UsersListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static IList<CountryMapper> GetCountires()
        {
            try
            {
                IMasterService objService = new MasterService();
                return objService.GetCountry();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static IList<MstBankMaster> GetBanks()
        {
            try
            {
                IMasterService objService = new MasterService();
                return objService.GetAllBanks();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static IList<MstStateData> GetStates(int countryId)
        {
            try
            {
                IMasterService objService = new MasterService();
                return objService.GetList<MstState>(P => P.CountryID == countryId).Select(P => new MstStateData { StateId = P.StateID, StateName = P.StateName }).ToList();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static IList<MstCityData> GetCities(int stateId)
        {
            try
            {
                IMasterService objService = new MasterService();
                return objService.GetList<MstCity>(P => P.StateId == stateId).Select(P => new MstCityData { CityId = P.CityId, CityName = P.CityName }).ToList(); ;

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static IList<UserListData> GetUserList()
        {
            try
            {
                IUserService objService = new UserService();
                return objService.GetUserList();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }

        [WebMethod]
        public static UserProfileData GetEditRecord(int userId, bool isLoggedInUser)
        {
            if (isLoggedInUser)
            {
                userId = SessionWrapper.UserId;
            }
            IUserService objService = new UserService();
            UserData objUserData = objService.GetUserDataById(userId);
            UserProfileData objData = new UserProfileData();
            objData.UserId = objUserData.UserId ?? 0;
            objData.FirstName = objUserData.FirstName;
            objData.LastName = objUserData.LastName;
            if (!string.IsNullOrEmpty(objUserData.CurrentAddress))
            {
                objData.AddressLine1 = objUserData.CurrentAddress.Split('|')[0];
                objData.AddressLine2 = objUserData.CurrentAddress.Split('|')[1];
            }

            objData.CityId = objUserData.CityId;
            objData.StateId = objUserData.StateId;
            objData.CountryId = objUserData.CountryId;
            

            tblMstUserBankDetail objBankDetail = objService.GetSingleRecord<tblMstUserBankDetail>(P => P.UserId == userId);
            if (objBankDetail != null)
            {
                objData.BankId = objBankDetail.BankId ?? 0;
                objData.ACHolderName = objBankDetail.ACHolderName;
                objData.ACNo = objBankDetail.ACNo;
                objData.BranchAddress = objBankDetail.BranchAddress;
                objData.BranchName = objBankDetail.BranchName;
            }
            return objData;
        }

        [WebMethod]
        public static string SaveProfile(UserProfileData objData)
        {
            try
            {
                IUserService objService = new UserService();
                UserData objUserData = new UserData();
                objUserData.FirstName = objData.FirstName;
                objUserData.LastName = objData.LastName;
                objUserData.ContactNo = objData.Phone;
                objUserData.CurrentAddress = objData.AddressLine1 + "|" + objData.AddressLine2;
                objUserData.EmailId = objData.EmailId;
                objUserData.CityId = objData.CityId;
                objUserData.StateId = objData.StateId;
                objUserData.CountryId = objData.CountryId;
                objUserData.UserId = objData.UserId;

                if (objData.UserId > 0 && objData.BankId > 0)
                {
                    tblMstUserBankDetail objBankDetail = objService.GetSingleRecord<tblMstUserBankDetail>(P => P.UserId == objData.UserId);
                    if (objBankDetail == null)
                    {
                        objBankDetail = new tblMstUserBankDetail();
                    }

                    objBankDetail.BankId = objData.BankId;
                    objBankDetail.BranchAddress = objData.BranchAddress;
                    objBankDetail.BranchName = objData.BranchName;
                    objBankDetail.ACNo = objData.ACNo;
                    objBankDetail.ACHolderName = objData.ACHolderName;
                    objBankDetail.IFSCCode = objData.IFSCCode;
                    objService.CreateNewUser(objUserData, objBankDetail);
                }
                else
                {
                    objService.CreateNewUser(objUserData);
                }

                return "";//objService.GetUserList();

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                return null;
            }
        }
    }
}