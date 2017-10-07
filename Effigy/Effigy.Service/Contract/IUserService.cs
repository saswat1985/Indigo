using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Effigy.Entity;
using Effigy.Entity.DBContext;

namespace Effigy.Service
{
    public interface IUserService
    {
        bool CheckLogin(tblMstUserMaster _objVal);

        void CreateNewUser(Entity.UserData objUserData, tblMstUserBankDetail objBankDetail = null);

        void InsertUserLoginDetail(tblMstUserLoginDetail objVALLoginDetail);

        UserData GetUserDataById(int userId);
        string ChangePassword(int userId, string password);

        /// <summary>
        /// To get userlist to show on UserListPage.aspx
        /// </summary>
        /// <returns></returns>
        IList<UserListData> GetUserList();
        T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class;
        string DeleteFromUserMaster(int userId);
    }
}
