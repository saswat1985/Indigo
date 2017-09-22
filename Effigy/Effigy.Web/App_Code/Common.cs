using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Effigy.Web
{
    public class Common
    {

        public static void FillDDL(DropDownList ddl, DataTable DTFill, string strid, string strtext, bool bindZeroIndex = true)
        {
            ddl.DataSource = DTFill;
            ddl.DataValueField = strid;
            ddl.DataTextField = strtext;
            ddl.DataBind();
            if (bindZeroIndex)
                ddl.Items.Insert(0, new ListItem("--Please Select--", "0"));

        }
        public static void FillDDL(DropDownList ddl, DataSet DS, string strid, string strtext, bool bindZeroIndex = true)
        {
            ddl.DataSource = DS;
            ddl.DataValueField = strid;
            ddl.DataTextField = strtext;
            ddl.DataBind();
            if (bindZeroIndex)
                ddl.Items.Insert(0, new ListItem("--Please Select--", "0"));
        }

        public static void FillDDL<T>(DropDownList ddl, T listSource, string strid, string strtext, bool bindZeroIndex = true)
        {
            ddl.DataSource = listSource;
            ddl.DataValueField = strid;
            ddl.DataTextField = strtext;
            ddl.DataBind();
            if (bindZeroIndex)
                ddl.Items.Insert(0, new ListItem("--Please Select--", "0"));
        }
        public static void FillGridView<T>(GridView Grdv, T dataSource)
        {
            Grdv.DataSource = dataSource;
            Grdv.DataBind();
        }


    }
}