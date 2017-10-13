using System;
using System.Collections.Generic;
using System.Data;
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_objVal"></param>
        /// <returns></returns>
        bool CheckLogin(tblMstUserMaster _objVal);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="objUserData"></param>
        /// <param name="objBankDetail"></param>
        void CreateNewUser(Entity.UserData objUserData, tblMstUserBankDetail objBankDetail = null);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="objVALLoginDetail"></param>
        void InsertUserLoginDetail(tblMstUserLoginDetail objVALLoginDetail);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        UserData GetUserDataById(int userId);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        string ChangePassword(int userId, string password);

        /// <summary>
        /// To get userlist to show on UserListPage.aspx
        /// </summary>
        /// <returns></returns>
        IList<UserListData> GetUserList();

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="predicate"></param>
        /// <returns></returns>
        T GetSingleRecord<T>(Expression<Func<T, bool>> predicate) where T : class;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        string DeleteFromUserMaster(int userId);

    }
}
