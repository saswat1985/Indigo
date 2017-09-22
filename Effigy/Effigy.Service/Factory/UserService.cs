using Effigy.Entity.DBContext;
using System;
using Effigy.DataObject.UnitOfWork;
using Effigy.Utility;
using Effigy.Entity;
using System.Collections.Generic;

namespace Effigy.Service
{
    public class UserService : IUserService
    {
        private readonly clsDALUser objDal;

        public UserService()
        {
            objDal = new clsDALUser();
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


        public void CreateNewUser(Entity.UserData objUserData)
        {
            try
            {
                tblMstUserMaster objMaster = new tblMstUserMaster();
                tblMstUserDetail objDetail = new tblMstUserDetail();
                tblMstUserCategoryMapping objCategory = new tblMstUserCategoryMapping();
                tblMstUserTreeStructure objUserGenology = new tblMstUserTreeStructure();


                objMaster.UserName = objMaster.UserCode = objDal.GetNextUserCode();
                objMaster.AcceptTermCondition = objUserData.AcceptTermCondition;
                objMaster.Language = 1;
                objMaster.Password = UtilityMethods.CreatePassword(8);//for generate random password
                objMaster.IsActive = true;
                objMaster.UserEntryId = 0;
                objMaster.UserEffectedDate = objMaster.UserEntryDate = DateTime.Now;

                objDetail.FirstName = objUserData.FirstName;
                objDetail.LastName = objUserData.LastName;
                objDetail.ContactNo = objUserData.ContactNo;
                objDetail.EmailId = objUserData.EmailId;
                objDetail.RegisterRefrelCode = objUserData.RefrelCode;
                objDetail.SelfRefrelCode = UtilityMethods.CoupneCodeGenerator(AppKeyCollection.CoupneCodeLength);
                objDetail.IsMemberShipTaken = false;//this will true after payment.
                objDetail.IsWelcomeMailSend = false;
                objDetail.UserType = (int)EnumLibrary.UserType.ExternalUser;

                objCategory.CategoryId = objUserData.UserCategory;
                objUserGenology.ParentId = objDal.GetUserIdByRefrrelCode(objUserData.RefrelCode);

                objDal.SaveUpdateUserDetail(objMaster, objDetail, null, objCategory, objUserGenology);

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
                var user = objDal.GetUserDetailById(userId);
                return new UserData
                {
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    IsMemberShipTaken = user.IsMemberShipTaken ?? false,
                    UserType = user.UserType,
                    UserId = user.UserId,
                    UserEntryDate = userEntryDateTime
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
    }
}
