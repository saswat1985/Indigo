using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity.DBContext;
using Effigy.Entity.Entity;

namespace Effigy.Service
{
    public interface IMasterService : IBaseContract
    {

        #region  Masters Done By nitin

        IList<ProductMapper> GetUserCategory();

        IList<CountryMapper> GetCountry();

        IList<ClsStateMaster> GetState();

        IList<ClsStateMaster> GetState(int countryId);

        IList<CityMapper> GetCities();

        #endregion
        void InsertCountryDetail(MstCountry _objVal);
        void InsertStateDetail(MstState _objVal);
        void InsertCityDetail(MstCity _objVal);
        void InsertProductDetail(ProductMapper objMstProduct);

        IList<MenuRenderByRole> GetMenuRender(int userId);
        void InsertMenuMaster(Entity.DBContext.MstMenuMaster objMstMenuMaster);
        IList<MenuDetails> GetMenuList();
        MstMenuMaster GetMenuMaster(int menuId);

        void InsertUserRoleMaster(Entity.DBContext.aspnet_Roles objAspnetRoles);
        IList<UserRoleMaster> GetUserRoleList();
        aspnet_Roles GetUserRoleMaster(int roleId);

        string SaveMenuRoleMapping(MenuRoleMapper objMenuRoleMapper);
        IList<MstUserMaster> GetUsersBasicDetailList();
        string SaveUserRoleMapping(int userId, string selectedItems, int createdBy);

        int?[] GetSelectedMenus(int roleId);
        int[] GetSelectedRoles(int userId);
        void InsertBankMaster(MstBankMaster objMstBankMaster);
        IList<MstBankData> GetAllBanks();
        IList<T> GetList<T>(Expression<Func<T, bool>> predicate) where T : class;

    }
}
