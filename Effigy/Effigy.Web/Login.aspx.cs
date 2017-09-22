﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Service;
using Effigy.Entity;
using Effigy.Utility;
using Effigy.Entity.DBContext;
using System.Configuration;

namespace Effigy.Web
{
    public partial class Login : System.Web.UI.Page
    {
        tblMstUserMaster objVAL = new tblMstUserMaster();
        IUserService objBal = new UserService();
        tblMstUserLoginDetail objVALLoginDetail = new tblMstUserLoginDetail();

        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                objVAL.UserName = txtUserName.Text.Trim();
                objVAL.Password = txtPwd.Text.Trim();
                if (objBal.CheckLogin(objVAL))
                {
                    Session["UserID"] = SessionWrapper.UserId = objVAL.UserId;
                    Session["RoleID"] = SessionWrapper.RoleId = objVAL.RoleId;
                    UserData user = objBal.GetUserDataById(objVAL.UserId);
                    Session["UserName"] = SessionWrapper.UserName = user.FirstName + " " + user.LastName;
                    Session["AuthToken"] = SessionWrapper.AuthToken = Guid.NewGuid().ToString();
                    Session["UserType"] = SessionWrapper.UserType = (int)user.UserType;

                    SessionWrapper.Culture = objVAL.UserCulture;
                              
                    objVALLoginDetail.UserId = SessionWrapper.UserId;
                    objVALLoginDetail.AuthId = new Guid(SessionWrapper.AuthToken);
                    objVALLoginDetail.BrowserType = Request.Browser.Browser;
                    objVALLoginDetail.IPAddress = GetUserIPAddress();
                    objVALLoginDetail.LoginTime = DateTime.Now;
                    objBal.InsertUserLoginDetail(objVALLoginDetail);
                    // now create a new cookie with this guid value
                    Response.Cookies.Add(new HttpCookie("AuthToken", SessionWrapper.AuthToken));                   
                    Response.Redirect(@"~/DashBoard/DashBoard.aspx");
                   

                }
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
        }

        private string GetUserIPAddress()
        {
            string ipaddress = string.Empty;
            try
            {
                ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (ipaddress == "" || ipaddress == null)
                    ipaddress = Request.ServerVariables["REMOTE_ADDR"];

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }
            return ipaddress;
        }

        private int CheckPayment(DateTime EntryDate, bool PaymentDone)
        {
            int ispaymentdone = 0;

            if (PaymentDone)
            {
                ispaymentdone = 2;
            }
            else
            {
                int allowedHours = Convert.ToInt32(AppKeyCollection.PaymentHours);
                // int allowedHours = Convert.ToInt32(ConfigurationManager.AppSettings["PaymentHours"]);
                TimeSpan difference = DateTime.Now - EntryDate;
                if (difference.TotalHours > 0 && difference.TotalHours < allowedHours)
                {
                    ispaymentdone = 1;
                }
                else
                {
                    ispaymentdone = 0;
                }
            }
            return ispaymentdone;

        }
        public void RegisterScript(Control control, string script)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), Guid.NewGuid().ToString(), script, true);
        }

    }
}