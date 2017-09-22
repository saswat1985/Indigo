﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Entity;
using Effigy.Entity.DBContext;
using Effigy.Service;
using Effigy.Utility;

namespace Effigy.Web.DashBoard
{
    public partial class DashBoard : BasePage
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        [WebMethod]
        public static UserData CheckPayment()
        {
            IUserService objBal = new UserService();
            UserData user = objBal.GetUserDataById(SessionWrapper.UserId);
            int allowedHours = Convert.ToInt32(AppKeyCollection.PaymentHours);
            if (user != null)
            {
                TimeSpan difference = DateTime.Now.Subtract((DateTime)user.UserEntryDate);
                if (difference.TotalHours > 0)
                {
                    user.TimeRemaining = difference.TotalHours;
                }
            }
            return user;

        }

















        //private void CheckPayment(DateTime EntryDate)
        //{

        //        int allowedHours = Convert.ToInt32(AppKeyCollection.PaymentHours);                
        //        TimeSpan difference = DateTime.Now - EntryDate;
        //        if (difference.TotalHours > 0 && difference.TotalHours < allowedHours)
        //        {
        //            // User can Cross Pop up and do work
        //            RegisterScript(Page, "$(document).ready(function () { $('#modal_form_vertical').modal('show'); return false;});");
        //        }
        //        else
        //        {
        //            // disable pop up and user can not do any thing
        //            RegisterScript(Page, "$(document).ready(function () { $('#modal_form_vertical').modal('show'); return false;});");
        //        }

        //}
        //public void RegisterScript(Control control, string script)
        //{
        //    ScriptManager.RegisterStartupScript(control, control.GetType(), Guid.NewGuid().ToString(), script, true);
        //}
    }
}