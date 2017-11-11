using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity.DBContext;
using Effigy.DataObject.DataBase;
using System.Data.SqlClient;
using Effigy.Entity.Entity;
using System.Data.Entity;
using System.Data.Objects.DataClasses;
using System.Linq.Expressions;
using Effigy.Entity;

namespace Effigy.DataObject.UnitOfWork
{
    public class ClsDALMaster : ClsBaseDAL
    {
        #region private variables
        private SNPLCPDBEntities _context = null;
        private GenericRepository<MstUserWorkCategory> _product = null;
        private GenericRepository<MstCountry> _country = null;
        private GenericRepository<MstCity> _city = null;
        private GenericRepository<MstMenuMaster> _mstMenuMaster = null;
        private GenericRepository<aspnet_Roles> _aspnetRoles = null;
        #endregion

        public ClsDALMaster()
        {
            _context = new SNPLCPDBEntities();
            _country = new GenericRepository<MstCountry>(_context);
            _product = new GenericRepository<MstUserWorkCategory>(_context);
            _city = new GenericRepository<MstCity>(_context);
            _mstMenuMaster = new GenericRepository<MstMenuMaster>(_context);
            _aspnetRoles = new GenericRepository<aspnet_Roles>(_context);

        }

        #region  Masters Done By nitin

        public IEnumerable<MstCountry> GetCountry()
        {
            try
            {

                return _country.GetAll().Where(k => k.IsActive == true);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<MstState> GetState()
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    return _context.MstStates.ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<MstCity> GetCity()
        {
            try
            {
                return _city.GetAll().Where(o => o.IsActive == true);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<MstUserWorkCategory> GetUserCategoryMaster()
        {
            try
            {
                return _product.GetAll();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public MstUserWorkCategory GetUserCategoryMaster(int categoryId)
        {
            try
            {
                return _product.GetAll().Where(p => p.Id == categoryId).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        public void InsertCountryDetail(MstCountry objMstCountryDetail)
        {
            try
            {
                var country = _country.Get(k => k.CountryName == objMstCountryDetail.CountryName);
                if (country == null)
                {
                    _country.Insert(objMstCountryDetail);
                    _context.SaveChanges();
                }


            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertStateDetail(MstState objMstStateDetail)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    if (objMstStateDetail != null)
                    {
                        MstState objLogMstStateSave = new MstState();
                        objLogMstStateSave.StateName = objMstStateDetail.StateName;
                        objLogMstStateSave.CountryID = objMstStateDetail.CountryID;
                        objLogMstStateSave.IsActive = objMstStateDetail.IsActive;
                        objLogMstStateSave.CreatedBy = objMstStateDetail.CreatedBy;
                        objLogMstStateSave.CreatedDate = objMstStateDetail.CreatedDate;
                        _context.MstStates.Add(objLogMstStateSave);
                        _context.SaveChanges();
                    }

                }

            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertCityDetail(MstCity objMstCityDetail)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    if (objMstCityDetail != null)
                    {

                        MstCity objLogMstCitySave = new MstCity();
                        objLogMstCitySave.CityName = objMstCityDetail.CityName;
                        objLogMstCitySave.StateId = objMstCityDetail.StateId;
                        objLogMstCitySave.IsActive = objMstCityDetail.IsActive;
                        objLogMstCitySave.CreatedBy = objMstCityDetail.CreatedBy;
                        objLogMstCitySave.CreatedDate = objMstCityDetail.CreatedDate;
                        _context.MstCities.Add(objLogMstCitySave);
                        _context.SaveChanges();
                    }

                }

            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertProductDetal(MstUserWorkCategory objProduct)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    _context.MstUserWorkCategories.Add(objProduct);
                    _context.SaveChanges();

                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        #region Menu
        public IList<MenuRenderByRole> GetMenusByRoleId(int userId)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    object[] parameters = { userId, "BIND_MENU_CONTROL" };
                    return _context.Database.SqlQuery<MenuRenderByRole>("uspMenuMaster @CreatedBy={0}, @Type={1}", parameters).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string SaveMenuRoleMapping(MenuRoleMapper objMenuRoleMapper)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    var query = "EXEC uspMenuRoleMapper @RoleId=" + objMenuRoleMapper.RoleId + ", @SelectedMenus='" + objMenuRoleMapper.SelectedMenus + "'";
                    return _context.Database.ExecuteSqlCommand(query).ToString();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string SaveUserRoleMapping(int userId, string selectedItems, int createdBy)
        {
            try
            {
                using (_context = new SNPLCPDBEntities())
                {
                    var query = "EXEC uspUserRoleMapper @UserId=" + userId + ", @CreatedBy=" + createdBy + ", @SelectedItems='" + selectedItems + "'";
                    return _context.Database.ExecuteSqlCommand(query).ToString();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int?[] GetSelectedMenus(int roleId)
        {
            return _context.MstMenuRoleMasters.Where(P => P.AR_RoleId == roleId).Select(P => P.MM_MenuId).ToArray();


        }

        public int[] GetSelectedRoles(int userId)
        {
            return _context.aspnet_UsersInRoles.Where(P => P.UserId == userId).Select(P => P.RoleId).ToArray();
        }

        public IList<MenuDetails> GetMenuList()
        {
            return (from a in _context.MstMenuMasters
                    join b in _context.MstMenuMasters on a.ParentID equals b.MenuId into c
                    from d in c.DefaultIfEmpty()
                    where a.MenuId > 0 && a.IsActive == true
                    let parent = string.IsNullOrEmpty(d.MenuText) ? "None" : d.MenuText
                    select new MenuDetails
                    {
                        MenuId = a.MenuId,
                        MenuText = a.MenuText,
                        MenuDesc = a.MenuDesc,
                        ParentMenu = parent,
                        ParentID = a.ParentID,
                        NavigateURL = a.NavigateURL,
                        ApplicationID = a.ApplicationID,
                        OrderNo = a.OrderNo,
                        IsActive = a.IsActive

                    }).ToList();

        }

        public void InsertMstMenuMaster(MstMenuMaster objMstMenuMaster)
        {
            try
            {
                if (_context.MstMenuMasters.Any(P => P.MenuId == objMstMenuMaster.MenuId))
                {
                    _context.MstMenuMasters.Attach(objMstMenuMaster);
                    _context.Entry(objMstMenuMaster).State = System.Data.EntityState.Modified;

                }
                else
                {
                    _context.MstMenuMasters.Add(objMstMenuMaster);
                }
                _context.SaveChanges();

            }
            catch (Exception)
            {
                throw;
            }

        }



        public IList<MstBankData> GetAllBanks()
        {
            return _context.MstBankMasters.Select(P => new MstBankData { Id = P.Id, BankName = P.BankName }).ToList();
        }

        public void InsertBankMaster(MstBankMaster objMstBankMaster)
        {
            try
            {
                if (_context.MstBankMasters.Any(P => P.Id == objMstBankMaster.Id))
                {
                    _context.MstBankMasters.Attach(objMstBankMaster);
                    _context.Entry(objMstBankMaster).State = System.Data.EntityState.Modified;

                }
                else
                {
                    _context.MstBankMasters.Add(objMstBankMaster);
                }
                _context.SaveChanges();

            }
            catch (Exception)
            {
                throw;
            }

        }



        public MstMenuMaster GetMenuMaster(int menuId)
        {
            return _context.MstMenuMasters.Where(P => P.MenuId == menuId).FirstOrDefault();
        }
        #endregion

        #region User Roles
        public IList<UserRoleMaster> GetUserRoleList()
        {
            return _context.aspnet_Roles.Select(P => new UserRoleMaster
            {
                Description = P.Description,
                IsActive = P.IsActive,
                RoleId = P.RoleId,
                RoleName = P.RoleName
            }).ToList();

        }

        public void InsertUserRoleMaster(aspnet_Roles objAspnetRoles)
        {
            try
            {
                if (_context.aspnet_Roles.Any(P => P.RoleId == objAspnetRoles.RoleId))
                {
                    _context.aspnet_Roles.Attach(objAspnetRoles);
                    _context.Entry(objAspnetRoles).State = System.Data.EntityState.Modified;

                }
                else
                {
                    _context.aspnet_Roles.Add(objAspnetRoles);
                }
                _context.SaveChanges();

            }
            catch (Exception)
            {
                throw;
            }

        }

        public aspnet_Roles GetUserRoleMaster(int roleId)
        {
            return _context.aspnet_Roles.Where(P => P.RoleId == roleId).FirstOrDefault();
        }

        public IList<MstUserMaster> GetUsersBasicDetailList()
        {
            return (from a in _context.tblMstUserMasters
                    join b in _context.tblMstUserDetails on a.UserId equals b.UserId into temp
                    from t in temp.DefaultIfEmpty()
                    where a.UserId > 0
                    select new MstUserMaster { FirstName = t.FirstName, LastName = t.LastName, UserId = a.UserId, UserCode = a.UserCode }).ToList();
        }
        #endregion
    }
}
