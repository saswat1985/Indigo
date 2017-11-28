using Effigy.Entity;
using Effigy.Entity.DBContext;
using Effigy.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Effigy.DataObject.UnitOfWork
{
    public class ClsDALUser : ClsBaseDAL
    {
        
        private GenericRepository<tblMstUserMaster> _userMaster = null;
        private GenericRepository<tblMstUserDetail> _userDetail = null;
        private GenericRepository<tblMstUserCategoryMapping> _userCategory = null;
        private GenericRepository<tblMstUserTreeStructure> _userGenology = null;
        private ClsDALMaster _masterDal = null;

        public ClsDALUser()
        {            
            _userMaster = new GenericRepository<tblMstUserMaster>(_context);
            _userDetail = new GenericRepository<tblMstUserDetail>(_context);
            _userCategory = new GenericRepository<tblMstUserCategoryMapping>(_context);
            _userGenology = new GenericRepository<tblMstUserTreeStructure>(_context);
            _masterDal = new ClsDALMaster();
        }

        public tblMstUserMaster FnCheckLogin(tblMstUserMaster _objVal)
        {
            int Result = 0;
            try
            {
                SqlParameter[] sqlParam =
                {
                    new SqlParameter("@Type",_objVal.Type),
                    new SqlParameter("@UserName",_objVal.UserName),
                    new SqlParameter("@Password",_objVal.Password),
                    new SqlParameter("@UserID",SqlDbType.Int),
                    new SqlParameter("@RoleID",SqlDbType.Int),
                    new SqlParameter("@OutRes",SqlDbType.Int),
                    new SqlParameter("@CultureID",SqlDbType.NVarChar,180),
                    new SqlParameter("@UserEntryDateTime",SqlDbType.DateTime),

                };
                sqlParam[3].Direction = ParameterDirection.Output;
                sqlParam[4].Direction = ParameterDirection.Output;
                sqlParam[5].Direction = ParameterDirection.Output;
                sqlParam[6].Direction = ParameterDirection.Output;
                sqlParam[7].Direction = ParameterDirection.Output;

                //sqlParam[1].Direction = ParameterDirection.ReturnValue;
                Result = _objSql.ExecuteNonQuery(CommandType.StoredProcedure, tblMstUserMaster.SP_Name, sqlParam);

                _objVal.UserCulture = sqlParam[6].Value.TrimString();
                _objVal.OutRes = int.Parse(sqlParam[5].Value.TrimString());
                _objVal.UserId = int.Parse(sqlParam[3].Value.TrimString());
                _objVal.RoleId = int.Parse(sqlParam[4].Value.TrimString());
                _objVal.UserEntryDate = Convert.ToDateTime(sqlParam[7].Value.TrimString());

                return _objVal;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Dispose();
            }

        }

        public void InsertUpdateUserLoginDetail(tblMstUserLoginDetail objUserLoginDetail)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    if (objUserLoginDetail != null)
                    {
                        var userLogindetail = _context.tblMstUserLoginDetails.Where(o => o.AuthId == objUserLoginDetail.AuthId).FirstOrDefault();
                        if (userLogindetail != null)
                        {
                            userLogindetail.LogoutTime = objUserLoginDetail.LogoutTime;
                            _context.SaveChanges();
                        }
                        else
                        {
                            tblMstUserLoginDetail objLogIntoSave = new tblMstUserLoginDetail();
                            objLogIntoSave.UserId = objUserLoginDetail.UserId;
                            objLogIntoSave.AuthId = objUserLoginDetail.AuthId;
                            objLogIntoSave.BrowserType = objUserLoginDetail.BrowserType;
                            objLogIntoSave.IPAddress = objUserLoginDetail.IPAddress;
                            objLogIntoSave.CityName = objUserLoginDetail.CityName;
                            objLogIntoSave.Latitude = objUserLoginDetail.Latitude;
                            objLogIntoSave.Longitude = objUserLoginDetail.Longitude;
                            objLogIntoSave.LoginTime = objUserLoginDetail.LoginTime;
                            _context.tblMstUserLoginDetails.Add(objLogIntoSave);
                            _context.SaveChanges();
                        }

                    }

                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Dispose();
            }
        }

        public tblMstUserCategoryMapping GetUserWorkCategoryMapping(int userId)
        {
            return _userCategory.Get(k => k.UserId == userId);
        }

        public void SaveUpdateUserDetail(tblMstUserMaster objUserMaster, tblMstUserDetail objUserDetail, tblMstUserBankDetail objUserBankDetail,
            tblMstUserCategoryMapping categoryMapping,
            tblMstUserTreeStructure userTreeStructure)
        {
            try
            {
                SaveUserMaster(objUserMaster);

                objUserDetail.UserId = objUserMaster.UserId;
                SaveUserDetail(objUserDetail);

                if (objUserBankDetail != null)
                {
                    objUserBankDetail.UserId = objUserMaster.UserId;
                    SaveBankDetail(objUserBankDetail);
                }

                if (categoryMapping != null)
                {
                    categoryMapping.UserId = objUserMaster.UserId;
                    SaveUserCategoryDetail(categoryMapping);

                    int roleId = UtilityMethods.GetRoleIdByCategory(categoryMapping.CategoryId.Value);

                    SaveUserRoleMapping(objUserMaster.UserId, roleId.TrimString(), 0);
                }
                if (userTreeStructure != null)
                {
                    userTreeStructure.UserId = objUserMaster.UserId;
                    SaveUserGenology(userTreeStructure);
                }


            }
            catch (Exception)
            {
                throw;
            }


        }

        private void SaveUserMaster(tblMstUserMaster objUserMaster)
        {
            try
            {
                if (objUserMaster != null)
                {
                    if (objUserMaster.UserId > 0)
                    {
                        _context.Entry(objUserMaster).State = System.Data.EntityState.Modified;
                        _context.SaveChanges();
                    }
                    else
                    {
                        using (_context = new SNPLCPDBEntities())
                        {
                            _context.tblMstUserMasters.Add(objUserMaster);
                            _context.SaveChanges();
                        }
                    }

                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        private void SaveUserDetail(tblMstUserDetail objUserDetail)
        {
            try
            {

                if (objUserDetail != null)
                {

                    if (objUserDetail.UserId > 0 && objUserDetail.Id > 0)
                    {
                        _context.Entry(objUserDetail).State = System.Data.EntityState.Modified;
                        _context.SaveChanges();
                    }
                    else
                    {
                        using (_context = new SNPLCPDBEntities())
                        {
                            _context.tblMstUserDetails.Add(objUserDetail);
                            _context.SaveChanges();
                        }


                    }

                }


            }
            catch (Exception)
            {
                throw;
            }
        }

        private void SaveBankDetail(tblMstUserBankDetail objBankDetail)
        {
            try
            {

                if (objBankDetail != null)
                {
                    if (objBankDetail.Id > 0)
                    {
                        _context.Entry(objBankDetail).State = System.Data.EntityState.Modified;
                        _context.SaveChanges();
                    }
                    else
                    {
                        using (_context = new SNPLCPDBEntities())
                        {
                            _context.tblMstUserBankDetails.Add(objBankDetail);
                            _context.SaveChanges();
                        }
                    }

                }

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void SaveUserCategoryDetail(tblMstUserCategoryMapping userCategory)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    if (userCategory != null)
                    {
                        userCategory.UserEntryDate = DateTime.Now;
                        _context.tblMstUserCategoryMappings.Add(userCategory);
                        _context.SaveChanges();
                    }
                }

            }
            catch (Exception)
            {
                throw;
            }
        }

        private void SaveUserGenology(tblMstUserTreeStructure userGenology)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    if (userGenology != null)
                    {
                        userGenology.EntryDate = DateTime.Now;
                        _context.tblMstUserTreeStructures.Add(userGenology);
                        _context.SaveChanges();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void SaveUserRoleMapping(int userId, string selectedItems, int createdBy)
        {
            _masterDal.SaveUserRoleMapping(userId, selectedItems, 0);
        }

        public string GetNextUserCode()
        {
            using (_context = new SNPLCPDBEntities())
            {
                var nextNumber = (from tblUser in _context.tblMstUserMasters
                                  select tblUser.UserId).DefaultIfEmpty().Max() + 1;

                return "SCP-" + nextNumber;
            }

        }

        public string DeleteFromUserMaster(int userId)
        {
            try
            {
                tblMstUserMaster obj = _userMaster.GetByID(userId);
                if (obj != null)
                {
                    obj.IsActive = false;
                    _context.Entry(obj).State = System.Data.EntityState.Modified;
                    _context.SaveChanges();
                }
                return "deleted";
            }
            catch (Exception)
            {
                throw;
            }
        }

        public tblMstUserMaster GetUserMasterById(int userId)
        {
            try
            {
                return _userMaster.GetByID(userId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public tblMstUserDetail GetUserDetailById(int userId)
        {
            try
            {
                return _userDetail.Get(o => o.UserId == userId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int GetUserIdByRefrrelCode(string refrrelCode)
        {
            try
            {
                var user = _userDetail.GetManyQueryable(o => o.SelfRefrelCode == refrrelCode).FirstOrDefault();
                return user != null ? (int)user.UserId : 1;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool IsRefrelCodeExist(string refrrelCode)
        {
            try
            {
                var user = _userDetail.GetManyQueryable(o => o.SelfRefrelCode == refrrelCode).FirstOrDefault();
                return user != null ? true : false;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public string ChangePassword(int userId, string password)
        {
            tblMstUserMaster obj = _context.tblMstUserMasters.Where(P => P.UserId == userId).FirstOrDefault();
            if (obj != null)
            {
                obj.ModifiedBy = userId;
                obj.ModifyDate = DateTime.Now;
                obj.Password = password;
                _context.tblMstUserMasters.Attach(obj);
                _context.Entry(obj).State = System.Data.EntityState.Modified;
                _context.SaveChanges();
                return "success";
            }
            return null;
        }

        /// <summary>
        /// To get userlist to show on UserListPage.aspx
        /// </summary>
        /// <returns></returns>
        public IList<UserListData> GetUserList()
        {
            return (from a in _context.tblMstUserMasters
                    join b in _context.tblMstUserDetails on a.UserId equals b.UserId into c
                    from d in c.DefaultIfEmpty()
                    where a.UserId > 0 && a.IsActive == true
                    select new UserListData
                    {
                        UserId = a.UserId,
                        ContactNo = d.ContactNo,
                        EmailId = d.EmailId,
                        FirstName = d.FirstName,
                        LastName = d.LastName,
                        UserCode = a.UserCode

                    }).ToList();

        }

        public UserData GetUserByEmail(string email)
        {
            UserData obj = (from a in _context.tblMstUserMasters
                            join b in _context.tblMstUserDetails on a.UserId equals b.UserId
                            where b.EmailId == email
                            select new UserData
                            {
                                FirstName = b.FirstName,
                                LastName = b.LastName,
                                Password = a.Password,
                                UserName = a.UserName,
                                EmailId = b.EmailId

                            }).FirstOrDefault();
            return obj;

        }


        public bool IsDuplicateMobileNo(string mobileNo, int userId = 0)
        {
            try
            {
                bool result = false;
                if (userId == 0)
                {
                    var isContectExist = (from master in _context.tblMstUserMasters
                                          join detail in _context.tblMstUserDetails on master.UserId equals detail.UserId
                                          where master.IsActive == true && detail.ContactNo == mobileNo
                                          select new UserData
                                          {
                                              ContactNo = detail.ContactNo

                                          }).FirstOrDefault();
                    result = isContectExist == null ? false : true;
                }
                else
                {
                    var isContectExist = (from master in _context.tblMstUserMasters
                                          join detail in _context.tblMstUserDetails on master.UserId equals detail.UserId
                                          where master.IsActive == true && detail.ContactNo == mobileNo && master.UserId != userId
                                          select new UserData
                                          {
                                              ContactNo = detail.ContactNo

                                          }).FirstOrDefault();

                    result = isContectExist == null ? false : true;
                }

                return result;

            }
            catch (Exception)
            {
                throw;
            }
        }


        public bool IsDuplicateEmailId(string emailId, int userId = 0)
        {
            try
            {
                bool result = false;
                if (userId == 0)
                {
                    var isUserExist = (from master in _context.tblMstUserMasters
                                          join detail in _context.tblMstUserDetails on master.UserId equals detail.UserId
                                          where master.IsActive == true && detail.EmailId == emailId
                                          select new UserData
                                          {
                                              EmailId = detail.EmailId

                                          }).FirstOrDefault();
                    result = isUserExist == null ? false : true;
                }
                else
                {
                    var isUserExist = (from master in _context.tblMstUserMasters
                                          join detail in _context.tblMstUserDetails on master.UserId equals detail.UserId
                                          where master.IsActive == true && detail.EmailId == emailId && master.UserId != userId
                                          select new UserData
                                          {
                                              EmailId = detail.EmailId

                                          }).FirstOrDefault();

                    result = isUserExist == null ? false : true;
                }

                return result;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<UserDashBoardMapper> GetDashBoardData(int userId)
        {
            try
            {

                IEnumerable<UserDashBoardMapper> lstUserDashBoardData = _context.Database.SqlQuery<UserDashBoardMapper>("USP_LoadDashBoard @UserId={0}", userId);

                return lstUserDashBoardData.ToList();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Dispose();
            }

        }
    }
}
