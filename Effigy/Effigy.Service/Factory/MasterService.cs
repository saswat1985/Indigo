using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Effigy.DataObject.UnitOfWork;
using Effigy.Entity.DBContext;
using Effigy.Entity.Entity;

namespace Effigy.Service
{
    public class MasterService : IMasterService
    {
        private ClsDALMaster objMaster = null;

        public MasterService()
        {
            objMaster = new ClsDALMaster();
        }
        
        #region  Masters Done By nitin

        public IList<ProductMapper> GetUserCategory()
        {
            try
            {
                IList<ProductMapper> objLstProduct = objMaster.GetUserCategoryMaster().Select(item => new ProductMapper()
                {
                    Id = item.Id,
                    CategoryCode = item.CategoryCode,
                    CategoryName = item.CategoryName,
                    CategoryPrice = item.CategoryPrice,
                    CatIntroPercentage = item.CatIntroPercentage,
                    CatWorkPercentage = item.CatWorkPercentage,

                }).ToList();

                return objLstProduct;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<CountryMapper> GetCountry()
        {
            try
            {
                IList<CountryMapper> countryList = objMaster.GetCountry().Select(item => new CountryMapper()
                {
                    CountryId = item.CountryId,
                    CountryName = item.CountryName,
                    IsActive = (bool)item.IsActive

                }).ToList();

                return countryList;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<ClsStateMaster> GetState()
        {
            try
            {
                List<ClsStateMaster> stateList = (from state in objMaster.GetState()
                                                  join country in objMaster.GetCountry() on state.CountryID equals country.CountryId
                                                  select new ClsStateMaster
                                                  {
                                                      CountryID=country.CountryId,
                                                      StateID = state.StateID,
                                                      StateName = state.StateName,
                                                      CountryName = country.CountryName
                                                  }).ToList();

                return stateList;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<CityMapper> GetCities()
        {
            try
            {
                IList<CityMapper> cityList = (from country in objMaster.GetCountry()
                                              join state in objMaster.GetState() on country.CountryId equals state.CountryID
                                              join city in objMaster.GetCity() on state.StateID equals city.StateId
                                              select new CityMapper
                                              {
                                                  Cityid = city.CityId,
                                                  CityName = city.CityName,
                                                  StateName = state.StateName,
                                                  CountryName = country.CountryName

                                              }).ToList();
                return cityList;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region Insert in masters

        public void InsertCountryDetail(Entity.DBContext.MstCountry objMstCountry)
        {
            try
            {
                objMaster.InsertCountryDetail(objMstCountry);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertBankMaster(MstBankMaster objMstBankMaster) {
            try
            {
                objMaster.InsertBankMaster(objMstBankMaster);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<MstBankMaster> GetAllBanks() {
            try
            {
                return objMaster.GetAllBanks();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void InsertStateDetail(Entity.DBContext.MstState objMstState)
        {
            try
            {
                objMaster.InsertStateDetail(objMstState);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertCityDetail(Entity.DBContext.MstCity objMstCity)
        {
            try
            {
                objMaster.InsertCityDetail(objMstCity);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void InsertProductDetail(ProductMapper objMstProduct)
        {
            try
            {
                MstUserWorkCategory objProduct = new MstUserWorkCategory()
                {
                    CategoryCode = objMstProduct.CategoryCode,
                    CategoryName = objMstProduct.CategoryName,
                    CategoryPrice = objMstProduct.CategoryPrice,
                    CategoryDesc = objMstProduct.CategoryDesc,
                    CatIntroPercentage = objMstProduct.CatIntroPercentage,
                    CatWorkPercentage = objMstProduct.CatWorkPercentage,
                    UserEntryId = objMstProduct.ModifiedBy,
                    UserEntryDate = DateTime.Now

                };

                objMaster.InsertProductDetal(objProduct);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objMaster.GetSingleRecord<T>(predicate);
        }
        #endregion


            #region Menu
        public IList<MenuRenderByRole> GetMenuRender(int userId)
        {
            try
            {
              return  objMaster.GetMenusByRoleId(userId);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void InsertMenuMaster(Entity.DBContext.MstMenuMaster objMstMenuMaster)
        {
            try
            {
                objMaster.InsertMstMenuMaster(objMstMenuMaster);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public IList<MenuDetails> GetMenuList()
        {
            try
            {
               return objMaster.GetMenuList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MstMenuMaster GetMenuMaster(int menuId) {
            return objMaster.GetMenuMaster(menuId);
        }

        public void InsertUserRoleMaster(aspnet_Roles objAspnetRoles)
        {
            try
            {
                objMaster.InsertUserRoleMaster(objAspnetRoles);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IList<UserRoleMaster> GetUserRoleList()
        {
            return objMaster.GetUserRoleList();
        }

        public aspnet_Roles GetUserRoleMaster(int roleId)
        {
            return objMaster.GetUserRoleMaster(roleId);
        }

        public string SaveMenuRoleMapping(MenuRoleMapper objMenuRoleMapper)
        {
            return objMaster.SaveMenuRoleMapping(objMenuRoleMapper);
        }

        public IList<MstUserMaster> GetUsersBasicDetailList()
        {
           return objMaster.GetUsersBasicDetailList();
        }

        public string SaveUserRoleMapping(int userId, string selectedItems, int createdBy)
        {
           return objMaster.SaveUserRoleMapping(userId, selectedItems, createdBy);
        }

        public int?[] GetSelectedMenus(int roleId)
        {
            return objMaster.GetSelectedMenus(roleId);
        }

        public int[] GetSelectedRoles(int userId)
        {
            return objMaster.GetSelectedRoles(userId);
        }

        public IList<T> GetList<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            return objMaster.GetList<T>(predicate);
        }
        #endregion


    }
}
