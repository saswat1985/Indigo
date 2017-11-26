using Effigy.Entity.DBContext;
using Effigy.Service;
using Effigy.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Services;

namespace Effigy.Web
{
    public partial class LogOut : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                tblMstUserLoginDetail objuserLoginDetail = new tblMstUserLoginDetail();
                objuserLoginDetail.AuthId = new Guid(SessionWrapper.AuthToken);
                objuserLoginDetail.LogoutTime = DateTime.Now;
                UserService objBal = new UserService();
                objBal.InsertUserLoginDetail(objuserLoginDetail);

                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();

                if (Request.Cookies["ASP.NET_SessionId"] != null)
                {
                    Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                    Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
                }

                if (Request.Cookies["AuthToken"] != null)
                {
                    Response.Cookies["AuthToken"].Value = string.Empty;
                    Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
                }

                Response.Redirect(@"~/Login.aspx", false);
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

        }
        [WebMethod]
        public static string GetMenuRender()
        {
            IMasterService objService = new MasterService();
            IList<MenuRenderByRole> objMenuRenderByRoleLst = objService.GetMenuRender(SessionWrapper.UserId);
            IList<MenuRenderByRole> objParentMenuLst = objMenuRenderByRoleLst.Where(P => P.ParentID == 0).OrderBy(k => k.OrderNo).ToList();

            StringBuilder strMenus = new StringBuilder();

            return GetSubMenu(objParentMenuLst, objMenuRenderByRoleLst, strMenus, true);

        }

        private static string GetSubMenu(IList<MenuRenderByRole> parentMenus, IList<MenuRenderByRole> menuList, StringBuilder strMenus, bool isRoot)
        {
            if (isRoot)
                strMenus.AppendLine(strMenus.Length > 0 ? "<ul>" : "<ul class=\"navigation navigation-main navigation-accordion\">");
            else
                strMenus.AppendLine("<ul>");


            // strMenus.AppendLine(strMenus.Length > 0 ? "<ul>" : "<ul>");

            if (parentMenus.Count > 0)
            {
                foreach (MenuRenderByRole parentMenu in parentMenus)
                {
                    string line = string.Empty;
                    string parentIcon = parentMenu.ParentID == 0 ? "<i class=\"icon-width\"></i>" : "";
                    if (parentMenu.NavigateURL.Equals("#"))
                    {
                        line = String.Format("<li><a href=\"{0}\" class=\"has-ul\">{1}<span>{2}</span></a>", parentMenu.NavigateURL, parentIcon, parentMenu.MenuText);
                    }
                    else
                    {
                        line = String.Format("<li><a href=\"{0}\">{1}<span>{2}</span></a>", parentMenu.NavigateURL, parentIcon, parentMenu.MenuText);
                    }

                    strMenus.Append(line);

                    IList<MenuRenderByRole> subMenuLst = menuList.Where(P => P.ParentID == parentMenu.MenuId).ToList();
                    if (subMenuLst.Count > 0)
                    {
                        var subMenuBuilder = new StringBuilder();
                        strMenus.Append(GetSubMenu(subMenuLst, menuList, subMenuBuilder, false));
                    }
                    strMenus.Append("</li>");
                }
            }

            strMenus.Append("</ul>");
            return strMenus.ToString();
        }
    }
}