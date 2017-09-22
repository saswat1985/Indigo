using Effigy.DataObject.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Effigy.DataObject
{
    public class ClsBaseDAL : IDisposable
    {
        public SqlDataAccessLayer _objSql = null;
        public ClsBaseDAL()
        {
            _objSql = new SqlDataAccessLayer();
        }
        public void Dispose()
        {
            try { GC.SuppressFinalize(this); }
            catch (Exception ex)
            {
                throw ex;
            }

        }
     
    }
}
