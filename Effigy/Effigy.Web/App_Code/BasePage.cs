using Effigy.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Effigy.Web
{
    public class BasePage : System.Web.UI.Page
    {
        public BasePage()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        protected override void OnInit(EventArgs e)
        {
            try
            {
                if (SessionWrapper.UserId == 0)
                {
                    Response.Redirect(@"~/Login.aspx", false);
                }
                
            }
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

        }
    }
}


