using Effigy.Entity.DBContext;
using System;
using Effigy.DataObject.UnitOfWork;
using Effigy.Utility;
using Effigy.Entity;
using System.Collections.Generic;
using Effigy.Entity.Entity;
using System.Linq.Expressions;
using System.Data;

namespace Effigy.Service
{
    public class UserService : IUserService
    {
        private readonly clsDALUser objDal;
        private readonly ClsDALMaster objDalMaster;

        public UserService()
        {
            objDal = new clsDALUser();
            objDalMaster = new ClsDALMaster();
        }

        public bool CheckLogin(tblMstUserMaster objVal)
        {
            try
            {
                objVal.Type = "CHECKLOGIN";
                objDal.FnCheckLogin(objVal);
                if (objVal.OutRes == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertUserLoginDetail(tblMstUserLoginDetail objVALLoginDetail)
        {
            try
            {
                objDal.InsertUpdateUserLoginDetail(objVALLoginDetail);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void CreateNewUser(Entity.UserData objUserData, tblMstUserBankDetail objBankDetail = null)
        {
            try
            {
                tblMstUserMaster objMaster = null;
                tblMstUserDetail objDetail = null;

                tblMstUserCategoryMapping objCategory = null;
                tblMstUserTreeStructure objUserGenology = null;

                if (objUserData.UserId > 0)
                {
                    objMaster = objDal.GetSingleRecord<tblMstUserMaster>(P => P.UserId == objUserData.UserId);
                    objDetail = objDal.GetSingleRecord<tblMstUserDetail>(P => P.UserId == objUserData.UserId);
                    //objDetail.UserType = (int)EnumLibrary.UserType.InernalUser;
                }
                else
                {
                    objMaster = new tblMstUserMaster();
                    objDetail = new tblMstUserDetail();


                    objMaster.UserId = objUserData.UserId ?? 0;
                    objMaster.UserName = objMaster.UserCode = objDal.GetNextUserCode();
                    objMaster.AcceptTermCondition = objUserData.AcceptTermCondition;
                    objMaster.Language = 1;
                    objMaster.Password = UtilityMethods.CreatePassword(8);//for generate random password
                    objMaster.IsActive = true;
                    objMaster.UserEntryId = 0;
                    objMaster.UserEffectedDate = objMaster.UserEntryDate = DateTime.Now;

                    objDetail.UserId = objUserData.UserId;
                    objDetail.UserType = (int)EnumLibrary.UserType.ExternalUser;

                    objDetail.RegisterRefrelCode = objUserData.RefrelCode;
                    objDetail.SelfRefrelCode = UtilityMethods.CoupneCodeGenerator(AppKeyCollection.CoupneCodeLength);
                    objDetail.IsMemberShipTaken = false;//this will true after payment.
                    objDetail.IsWelcomeMailSend = false;
                }

                objDetail.FirstName = objUserData.FirstName;
                objDetail.LastName = objUserData.LastName;
                objDetail.ContactNo = objUserData.ContactNo;
                objDetail.EmailId = objUserData.EmailId;
                objDetail.CurrentAddress = objUserData.CurrentAddress;
                objDetail.CityId = objUserData.CityId;
                if (!string.IsNullOrEmpty(objUserData.UserPhoto))
                {
                    objDetail.UserImage = objUserData.UserPhoto;
                }

                if (objUserData.UserCategory > 0)
                {
                    objCategory = new tblMstUserCategoryMapping();
                    objUserGenology = new tblMstUserTreeStructure();
                    objCategory.CategoryId = objUserData.UserCategory;
                    objUserGenology.ParentId = objDal.GetUserIdByRefrrelCode(objUserData.RefrelCode);
                }

                objDal.SaveUpdateUserDetail(objMaster, objDetail, objBankDetail, objCategory, objUserGenology);

                UtilityMethods.SendSingleSMS(GetSMSBody(objMaster.UserName, objMaster.Password), objDetail.ContactNo);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UserData GetUserDataById(int userId)
        {
            try
            {
                DateTime? userEntryDateTime = objDal.GetUserMasterById(userId).UserEntryDate;
                var userCategoryMapping = objDal.GetUserWorkCategoryMapping(userId);
                MstUserWorkCategory productCategory = null;
                if (userCategoryMapping != null)
                {
                    productCategory = objDalMaster.GetUserCategoryMaster(userCategoryMapping.CategoryId.Value);
                }
                var user = objDal.GetUserDetailById(userId);
                return new UserData
                {
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    IsMemberShipTaken = user.IsMemberShipTaken ?? false,
                    UserType = user.UserType,
                    UserId = user.UserId,
                    UserEntryDate = userEntryDateTime,
                    CityId = user.CityId ?? 0,
                    CurrentAddress = user.CurrentAddress,
                    ContactNo = user.ContactNo,
                    EmailId = user.EmailId,
                    UserPhoto = user.UserImage,
                    CategoryAmount = productCategory != null ? productCategory.CategoryPrice.Value : 0,
                    ProductCategory = productCategory != null ? productCategory.CategoryCode : string.Empty
                };

            }
            catch (Exception)
            {
                throw;
            }
        }

        private string GetSMSBody(string userId, string password)
        {
            try
            {
                string smsbody = SMSBody.UserRegistrationMsg().Replace("@USERID", userId).Replace("@PASSWORD", password).Replace("@WEBSITELINK", AppKeyCollection.WebSiteName).Replace("@HELPDESKNO", AppKeyCollection.HelpDeskNo).TrimString();
                return smsbody;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public string ChangePassword(int userId, string password)
        {
            try
            {
                return objDal.ChangePassword(userId, password);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<UserListData> GetUserList()
        {
            try
            {
                return objDal.GetUserList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objDal.GetSingleRecord<T>(predicate);
        }

        public string DeleteFromUserMaster(int userId)
        {
            try
            {
                return objDal.DeleteFromUserMaster(userId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        #region DataEntry

        public IList<UrlEntriesVarifiedData> ProcessRawUrls(int userId, List<string> urls)
        {
            try
            {
                string commaSapratedURLs = string.Empty;
                foreach (var item in urls)
                {
                    commaSapratedURLs += item + ",";
                }
                commaSapratedURLs = commaSapratedURLs.Substring(0, commaSapratedURLs.Length - 1);
                return objDal.ProcessRawUrls(userId, commaSapratedURLs);
            }
            catch (Exception)
            {
                throw;
            }

        }

        #endregion
    }
}
