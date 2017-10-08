using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Effigy.Utility;

namespace Effigy.Web
{
    public partial class EffigyMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionWrapper.UserId == 0)
                {
                    Response.Redirect("../Login.aspx", false);
                }
                else
                {
                    if (!IsPostBack)
                    {
                        try
                        {

                            lblUserNameUpper.Text = lblUserName.Text = SessionWrapper.UserName.TrimString();
                            imgUserLoggedIn.ImageUrl = SessionWrapper.UserPhoto;
                            // objCommon.PopulateMainMenu(TopMenu, Convert.ToString(SessionWrapper.UserId));
                        }
                        catch (Exception ex)
                        {
                            Logger.Error(ex);
                            //ErrorModule.WriteErrorErrFile(Request.RawUrl.ToString(), ex.StackTrace.ToString() + "-->" + ex.Message.ToString());
                        }
                    }

                }
            }
        }
    }
}