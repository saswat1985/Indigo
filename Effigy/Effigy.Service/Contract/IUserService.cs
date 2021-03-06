﻿using System;
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
    public interface IUserService : IBaseContract
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
        /// <param name="userId"></param>
        /// <returns></returns>
        string DeleteFromUserMaster(int userId);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mobileNo"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        bool IsDuplicateMobileNo(string mobileNo, int userId = 0);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mobileNo"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        bool IsDuplicateEmailId(string emailId, int userId = 0);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        UserData GetUserByEmail(string email);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="refferalCode"></param>
        /// <returns></returns>
        bool IsRefferalCodeExist(string refferalCode);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fullName"></param>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        string GetForgetPasswordEmailBody(string fullName, string userName, string password);

        /// <summary>
        /// get dashboard Data
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        IList<UserDashBoardMapper> GetDashBoardData(int userId);
    }
}
